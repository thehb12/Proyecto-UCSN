from flask import Flask, render_template, request, redirect, url_for, session, flash, make_response
from flask_mysqldb import MySQL
from config import Config
import hashlib
from flask_sweetalert2 import sweetalert2

app = Flask(__name__)
app.config.from_object(Config)

mysql = MySQL(app)

app.secret_key = 'tu_clave_secreta'

@app.route('/')
def index():
    if 'logged_in' in session:
       return redirect('/sesion')
    else:
        flash('Acceso no autorizado', 'error')
        return render_template('index.html')



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

    # Verificar si alguno de los campos está vacío
    if not usuario or not contrasena:
        flash('Por favor ingrese usuario y contraseña.', 'error')
        return redirect(url_for('index'))

    hashed_password = hashlib.sha256(contrasena.encode()).hexdigest()

    conn = mysql.connection
    cursor = conn.cursor()

    cursor.execute("SELECT id FROM usuarios WHERE id_documento = %s AND contraseña_hash = %s", (usuario, hashed_password))
    usuario_admin = cursor.fetchone()

    if usuario_admin:
        session['logged_in'] = True
        print('1')
        return redirect(url_for('admin'))
    else:
        cursor.execute("SELECT id FROM personalucsn WHERE correo = %s AND contraseña_hash = %s", (usuario, hashed_password))
        usuario_personal = cursor.fetchone()

        if usuario_personal:
            session['logged_in'] = True
            print('2')
            return redirect(url_for('sesion'))
        else:
            flash('Usuario o contraseña incorrectos', 'error')
            print('3')
            return redirect(url_for('index'))
        

    
 

@app.route('/admin')
def admin():
    if 'logged_in' in session:
        response = make_response(render_template('admin.html'))
        response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
        return response
    else:
        return redirect(url_for('index'))
    

@app.route('/sesion')
def sesion():
    if 'logged_in' in session:
        response = make_response(render_template('sesion.html'))
        response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # Deshabilitar la caché
        return response
    else:
        flash('Acceso no autorizado', 'error')
        return redirect(url_for('index'))

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
    session.pop('logged_in', None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(port=3000, debug=True)
