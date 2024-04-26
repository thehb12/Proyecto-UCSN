from flask import Flask, render_template, request, redirect, url_for, session, flash, make_response
from flask_mysqldb import MySQL
from config import Config
import hashlib

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


@app.route('/iniciar_sesion', methods=['POST'])
def iniciar_sesion():
    usuario = request.form['usuario']
    contrasena = request.form['contrasena']

    hashed_password = hashlib.sha256(contrasena.encode()).hexdigest()

    conn = mysql.connection
    cursor = conn.cursor()

    # Buscar en la tabla de usuarios
    cursor.execute("SELECT id FROM usuarios WHERE id_documento = %s AND contraseña_hash = %s", (usuario, hashed_password))
    usuario_encontrado = cursor.fetchone()

    # Si el usuario se encuentra en la tabla de usuarios, es admin
    if usuario_encontrado:
        session['logged_in'] = True
        return redirect(url_for('admin'))
    else:
        # Si no se encuentra en la tabla de usuarios, buscar en la tabla de personalucsn
        cursor.execute("SELECT id FROM personalucsn WHERE correo = %s AND contraseña_hash = %s", (usuario, hashed_password))
        usuario_personal = cursor.fetchone()
        if usuario_personal:
            if usuario_personal[0] == hashed_password:
                session['logged_in'] = True
                return redirect(url_for('sesion'))
        
        flash('Usuario o contraseña incorrectos', 'error')
        return redirect(url_for('index'))

    cursor.close()
   
 

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
