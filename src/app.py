from datetime import datetime
from flask import Flask, jsonify, render_template, request, redirect, url_for, session, flash, make_response
from werkzeug.security import generate_password_hash, check_password_hash
from flask_mysqldb import MySQL
from config import Config
import hashlib
from num2words import num2words
import locale
locale.setlocale(locale.LC_TIME, 'es_ES.UTF-8')

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
        correo = usuario[6]
        password = usuario[11]
    

        session['numero_id'] = numero_id_usuario
        session['nombres'] = nombre_usuario
        session['fecha_inicio'] = fecha_inicio
        session['cargo'] = cargo
        session['correo'] = correo
        session['password'] = password
        
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
            cursor.execute("SELECT nombres, tipo_id, numero_id, lugar_expedicion, cargo, fecha_i, saldo, auxt FROM personalucsn WHERE correo =  %s ", (correo_usuario,))
            datos_usuario  = cursor.fetchone()
            cursor.close()

            saldo_en_palabras = num2words(float(datos_usuario[6]), lang='es')  # Convertir el saldo a palabras
            saldo_aux = num2words(float(datos_usuario[7]), lang='es') 
            fecha_actual = datetime.now().strftime('%d de %B de %Y')

            response = make_response(render_template('sesion.html', nombre_usuario=nombre_usuario, datos_usuario=datos_usuario, saldo_aux=saldo_aux, saldo_en_palabras=saldo_en_palabras, fecha_actual=fecha_actual))
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


# @app.route('/add_trabajadores', methods=['POST'])
# def add_trabajadores():
#     if request.method == 'POST':
#         # Obtener datos del formulario
#         nombres = request.form['nombres']
#         tipo_de_id = request.form['tipo_id']
#         numero_de_id = request.form['numero_id']
#         cargo = request.form['cargo']
#         correo = request.form['correo']
#         fecha_inicial = request.form['fecha_inicio']
#         fecha_final = request.form.get('fecha_fin')  # fecha_fin puede ser opcional
#         saldo = request.form['saldo']
#         auxt = request.form['auxt']
#         estado = request.form['estado']

#         # Insertar en la base de datos
#         cur = mysql.connection.cursor()
#         cur.execute(
#             "INSERT INTO personalucsn (nombres, tipo_id, numero_id, cargo, correo, fecha_inicial, fecha_final, saldo, auxt, estado) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
#             (nombres, tipo_de_id, numero_de_id, cargo, correo, fecha_inicial, fecha_final, saldo, auxt, estado)
#         )

#         mysql.connection.commit()  # Corrige el error de 'cummit'
#         cur.close()  # Cierra el cursor después de usarlo
        
#         # Mensaje de confirmación y redireccionamiento
#         flash('Trabajador agregado con éxito', 'success')
#         return redirect(url_for('mostrartrabajadores'))  # Asegúrate de que la ruta existe y es correcta

#     # Si no es POST, redireccionar a otra ruta (seguridad)
#     return redirect(url_for('mostrartrabajadores'))
    
@app.route('/cambiopassword', methods=['POST'])
def cambiopassword():
    if request.method == 'POST':
        mensaje = ""  
        icon = ""
        id_usuario = session.get('numero_id')
        contrasena_nueva = request.form['password']
        contrasena_actual = request.form['current_password']
        password_actual = hashlib.sha256(contrasena_actual.encode()).hexdigest()
        
        hashed_password = hashlib.sha256(contrasena_nueva.encode()).hexdigest()
        if password_actual == session['password']:
            try:
                cur = mysql.connection.cursor()
                cur.execute("UPDATE personalucsn SET contraseña_hash = %s WHERE numero_id= %s", (hashed_password, id_usuario))
                mysql.connection.commit()
                cur.close()
                mensaje = "Contraseña cambiada con éxito"  
                icon = "success"
            except Exception as e: 
                mensaje = f"Error al actualizar la contraseña: {e}"  
                icon = "error"
        else:
            mensaje = "La contraseña actual no coincide"  
            icon = "error"
        
        return render_template('admin.html', mensaje=mensaje, icon=icon)
    return redirect('/')
            
if __name__ == '__main__':
    app.run(port=3000, debug=True)