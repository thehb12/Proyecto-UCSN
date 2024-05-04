from flask import Flask, jsonify, render_template, request, redirect, url_for, session, flash, make_response
from werkzeug.security import generate_password_hash, check_password_hash
from flask_mysqldb import MySQL
from config import Config
import hashlib


app = Flask(__name__)
app.config.from_object(Config) 

mysql = MySQL(app)

app.secret_key = 'tu_clave_secreta'


@app.route('/')     
def index():
    if 'cargo' in session:
        cargo = session['cargo']
        if cargo == 'Admin':
            return redirect('/admin')
        else:
            return redirect('/sesion')
    return render_template('index.html')
    
@app.route('/iniciar_sesion', methods=['POST'])
def iniciar_sesion():
    usuario = request.form['usuario']
    contrasena = request.form['contrasena']
    hashed_password = hashlib.sha256(contrasena.encode()).hexdigest()
    mensaje = ""
    icon = ""

    conn = mysql.connection
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM personalucsn WHERE correo = %s AND contraseña_hash = %s", (usuario, hashed_password))
    usuario = cursor.fetchone()
    cursor.close()
    
    if usuario:
        numero_id_usuario = usuario[3]
        nombre_usuario = usuario[1]
        cargo = usuario[5]
        fecha_inicio = usuario[7]
        correo = usuario[0]
    

        session['numero_id'] = numero_id_usuario
        session['nombres'] = nombre_usuario
        session['fecha_inicio'] = fecha_inicio
        session['cargo'] = cargo
        session['correo'] = correo
        
        if cargo == 'Admin':
            return redirect(url_for('admin'))
        else:
            return redirect(url_for('sesion'))
    else:
        flash('Usuario o contraseña incorrectos', 'error')
        mensaje = "El usuario o contraseña son incorrectos"
        icon = "error"
        return render_template('index.html', mensaje=mensaje, icon=icon)

@app.route('/admin')
def admin():
    if 'cargo'  in session :
        cargo = session['cargo']
        if cargo == 'Admin':
            nombre_usuario = session.get('nombres')
            try:
                conn = mysql.connection
                cursor = conn.cursor()  
                cursor.execute("SELECT tipo_id,  numero_id, nombres, cargo, correo, fecha_i, fecha_f, estado FROM personalucsn")
                data = cursor.fetchall() 
                cursor.close()
                               
                response = make_response(render_template('admin.html', nombre_usuario=nombre_usuario, data=data))
                response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
                return response
            except mysql.connector.Error as err:
                print(f"Error: {err}")
                return []    
        else:
            return redirect('/')
    else:
        return redirect('/')

# @app.route('/coorpersonas')
# def coorpersonas():
#     if 'cargo' in session and session['cargo'] == 'Coordinador':
#         usuario_datos = session['usuario_nombre']
#         cur = mysql.connection.cursor()
#         cur.execute("SELECT id_persona, nombre, cargo FROM personas")
#         data = cur.fetchall()
#         cur.close()        

#         response = make_response(render_template('coorpersonas.html', usuario_nombre=usuario_datos, data = data))
#         response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
#         return response
#     else:
#         flash('Acceso no autorizado', 'error')
#         return redirect('/')

@app.route('/sesion')
def sesion():
    if 'cargo' in session:
        cargo = session['cargo']
        if cargo != 'Admin':
            correo_usuario = session.get('correo')
            nombre_usuario = session.get('nombres')
            
            conn = mysql.connection
            cursor = conn.cursor()
            print(correo_usuario)
            cursor.execute("SELECT * FROM personalucsn WHERE correo = %s ", (correo_usuario,))
            datos_usuario  = cursor.fetchone()
            cursor.close()
        
            response = make_response(render_template('sesion.html', datos=datos_usuario , nombre_usuario=nombre_usuario))
            response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
            return response
        else:
            return redirect('/')
    else:
        return redirect('/')


@app.route('/perfil')
def perfil():
    if 'logged_in' in session:
        response = make_response(render_template('editar.html'))
        response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
        return response
    else:
        flash('Acceso no autorizado', 'error')
        return redirect(url_for('index'))


@app.route('/cerrar_sesion')
def cerrar_sesion():
    session.clear()
    return redirect(url_for('index'))


@app.route('/add_trabajadores', methods=['POST'])
def add_trabajadores():
    if request.method == 'POST':
        nombres = request.form['nombres']
        tipo_de_id = request.form['tipo_de_id']
        numero_de_id = request.form['numero_de_id']
        lugar_expedicion = request.form['lugar_expedicion']
        cargo = request.form['cargo']
        correo = request.form['correo']
        fecha_inicial = request.form['fecha_inicial']
        fecha_final = request.form['fecha_final']
        saldo = request.form['saldo']
        auxt = request.form['auxt']
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO personalucsn (nombres, tipo_id, numero_id, lugar_expedicion, cargo, correo, fecha_inicial, fecha_final, saldo, auxt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',(nombres, tipo_de_id, numero_de_id, lugar_expedicion, cargo, correo, fecha_inicial, fecha_final, saldo, auxt))
        mysql.connection.cummit()
        flash('Trabajador agregado con exito')
        
        return redirect(url_for('Addtrabajadores'))
    
@app.route('/cambiopassword', methods=['POST'])
def cambiopassword():
    if request.method == 'POST':
        id_usuario = session.get('numero_id')
        contrasena_nueva = request.form['password']
        confirmar_contrasena_nueva = request.form['confirmpassword']
        hashed_password = hashlib.sha256(contrasena_nueva.encode()).hexdigest()
        
        print(id_usuario)
        
        if contrasena_nueva != confirmar_contrasena_nueva:
            flash("Las nuevas contraseñas no coinciden.", "error")
            print("diferentes")
            return redirect('/')
        try:
            cur = mysql.connection.cursor()
            cur.execute("UPDATE personalucsn SET contraseña_hash = %s WHERE id_usuario = %s", (hashed_password, id_usuario))
            mysql.connection.commit()
            print("password cambiada")
            cur.close()
        except Exception as e: 
            flash(f'Error al actualizar la contraseña: {e}', 'error')
            mysql.connection.rollback()
        return redirect('/')

            

if __name__ == '__main__':
    app.run(port=3000, debug=True)