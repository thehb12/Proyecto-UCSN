from flask import Flask, jsonify, render_template, request, redirect, url_for, session, flash, make_response
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
# @app.route('/')
# def index():
#     if 'logged_in' in session:
#        return redirect('/sesion')
#     else:
#         flash('Acceso no autorizado', 'error')
#         return render_template('index.html')

# @app.route('/iniciar_sesion', methods=['POST'])
# def iniciar_sesion():
#     usuario = request.form['usuario']
#     contrasena = request.form['contrasena']
#     hashed_password = hashlib.sha256(contrasena.encode()).hexdigest()

#     conn = mysql.connection
#     cursor = conn.cursor()

#     cursor.execute("SELECT id FROM personalucsn WHERE correo = %s AND contraseña_hash = %s", (usuario, hashed_password))
#     usuario_personal = cursor.fetchone()

#     if usuario_personal:
#         session['logged_in'] = True
#         print('2')
#         return redirect(url_for('sesion'))
#     else:
#         # Si no es ni administrador ni usuario regular, redirige al index
#         flash('Usuario o contraseña incorrectos', 'error')
#         print('3')
#         return redirect(url_for('index'))




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
        numero_id_usuario = usuario[2]
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
        nombre_usuario = session.get('nombres')
        if cargo == 'Admin':
            response = make_response(render_template('admin.html', nombre_usuario=nombre_usuario))
            response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
            return response
        else:
            return redirect('/')
    else:
        return redirect('/')

@app.route('/sesion')
def sesion():
    if 'cargo' in session:
        cargo = session['cargo']
        nombre_usuario = session.get('nombres')
        if cargo != 'Admin':
            response = make_response(render_template('sesion.html', nombre_usuario=nombre_usuario))
            response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
            return response
        else:
            return redirect('/')
    else:
        return redirect('/')


# @app.route('/certificado')
# def certificado():
#     if 'cargo'  in session :
#         cargo = session['cargo']
#         nombre_usuario = session.get('nombres')
#         if cargo != 'Admin':



#             response = make_response(render_template('certificados.html', nombre_usuario=nombre_usuario))
#             response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  
#             return response
#         else:
#             return redirect('/')
#     else:
#         return redirect('/')


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

if __name__ == '__main__':
    app.run(port=3000, debug=True)
