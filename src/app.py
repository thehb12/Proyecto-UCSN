import re
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

# Ruta para restablecer contraseña solo estructura para editarla y usarla cuando este listos los html

@app.route('/update-profile', methods=['POST'])
def update_profile():
    if 'logged_in' not in session:
        flash("Debes iniciar sesión para cambiar tu contraseña.", 'error')
        return redirect(url_for('index'))

    # Obtiene los datos del formulario
    contrasena_actual = request.form.get('contrasena_actual')
    nueva_contrasena = request.form.get('password')
    confirmar_contrasena = request.form.get('confirmar_contrasena')

    # Aquí puedes agregar la lógica para validar y actualizar la contraseña
    # Vamos a asumir que tienes la información del usuario en la sesión o en una base de datos.
    conn = mysql.connection
    cursor = conn.cursor()

    # Supongamos que obtienes el usuario actual basado en la sesión
    correo = session['correo']

    # Comprueba la contraseña actual y compara con el hash almacenado en la base de datos
    cursor.execute("SELECT contraseña_hash FROM personalucsn WHERE correo = %s", (correo,))
    stored_hash = cursor.fetchone()[0]

    if hashlib.sha256(contrasena_actual.encode()).hexdigest() != stored_hash:
        flash("La contraseña actual es incorrecta.", 'error')
        return redirect(url_for('perfil'))

    if nueva_contrasena != confirmar_contrasena:
        flash("La nueva contraseña y su confirmación no coinciden.", 'error')
        return redirect(url_for('perfil'))

    # Si todo está bien, actualiza la contraseña en la base de datos
    new_hashed_password = hashlib.sha256(nueva_contrasena.encode()).hexdigest()
    cursor.execute(
        "UPDATE personalucsn SET contraseña_hash = %s WHERE correo = %s",
        (new_hashed_password, correo)
    )
    conn.commit()
    cursor.close()

    flash("Contraseña actualizada con éxito.", 'success')
    return redirect(url_for('perfil'))

@app.route('/add-worker', methods=['GET'])
def add_worker_form():
    # Solo usuarios con cargo "Admin" pueden acceder a esta ruta
    if 'cargo' in session and session['cargo'] == 'Admin':
        return render_template('add_worker.html')  # Formulario para agregar trabajadores
    else:
        flash("Acceso no autorizado.", 'error')
        return redirect(url_for('index'))


# Ruta para agregar trabajadores sin utilidad solo estructura para guiarse y luego si usar y editarla

# @app.route('/add-worker', methods=['GET'])
# def add_worker_form():
#     # Asegúrate de que solo usuarios autorizados tengan acceso
#     if 'cargo' in session and session['cargo'] == 'Admin':
#         # Devuelve el formulario para agregar trabajadores
#         return render_template('add_worker.html')  # Define tu plantilla HTML
#     else:
#         flash("Acceso no autorizado.", 'error')
#         return redirect(url_for('index'))

# @app.route('/add-worker', methods=['POST'])
# def add_worker():
#     # Verifica que solo los administradores tengan permiso
#     if 'cargo' in session and session['cargo'] == 'Admin':
#         # Obtener datos del formulario
#         nombres = request.form['nombres']
#         tipo_id = request.form['tipo_id']
#         numero_id = request.form['numero_id']
#         lugar_expedicion = request.form['lugar_expedicion']
#         cargo = request.form['cargo']
#         correo = request.form['correo']
#         fecha_i = request.form['fecha_i']  # Fecha de inicio
#         fecha_f = request.form['fecha_f']  # Fecha de finalización
#         saldo = float(request.form['saldo'])  # Saldo inicial
#         auxt = request.form['auxt']
#         contrasena = request.form['contrasena']
#         estado = request.form['estado']

#         # Validaciones básicas para el correo
#         if not re.match(r"[^@]+@[^@]+\.[^@]+", correo):
#             flash("Correo no válido.", 'error')
#             return redirect(url_for('add_worker_form'))

#         # Encriptar la contraseña para almacenamiento seguro
#         hashed_password = hashlib.sha256(contrasena.encode()).hexdigest()

#         # Insertar el nuevo trabajador en la base de datos
#         conn = mysql.connection
#         cursor = conn.cursor()
#         cursor.execute(
#             """
#             INSERT INTO personalucsn
#             (nombres, tipo_id, numero_id, lugar_expedicion, cargo, correo, fecha_i, fecha_f, saldo, auxt, contraseña_hash, estado)
#             VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
#             """,
#             (nombres, tipo_id, numero_id, lugar_expedicion, cargo, correo, fecha_i, fecha_f, saldo, auxt, hashed_password, estado)
#         )
#         conn.commit()
#         cursor.close()

#         flash("Trabajador agregado con éxito.", 'success')
#         return redirect(url_for('admin'))  # Redirige después del éxito
#     else:
#         flash("Acceso no autorizado.", 'error')
#         return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(port=3000, debug=True)
