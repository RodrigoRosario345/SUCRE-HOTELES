from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
import bcrypt

app = Flask(__name__, static_url_path='/static')

# Configuración de la base de datos MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'bd_hoteles'

mysql = MySQL(app)

# Endpoints existentes
@app.route('/hoteles', methods=['GET'])
def get_hoteles():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM hoteles")
        rows = cur.fetchall()

        base_url = request.host_url
        hoteles = [
            {
                'id': row[0],
                'imagen_num_uno': base_url + "static/" + row[1],
                'imagen_num_dos': base_url + "static/" + row[2],
                'imagen_num_tres': base_url + "static/" + row[3],
                'imagen_num_cuatro': base_url + "static/" + row[4],
                'imagen_num_cinco': base_url + "static/" + row[5],
                'imagen_num_seis': base_url + "static/" + row[6],
                'imagen_num_siete': base_url + "static/" + row[7],
                'imagen_num_ocho': base_url + "static/" + row[8],
                'nombre': row[9],
                'lugar': row[10],
                'precio': row[11],
                'ubicacion': row[12],
                'Descripcion': row[13]
            }
            for row in rows
        ]

        return jsonify({'hoteles': hoteles})
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cur.close()

# Endpoint para registrar usuarios
@app.route('/register', methods=['POST'])
def register():
    try:
        data = request.json
        username = data.get('uname')
        email = data.get('mail')
        password = data.get('passw')

        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO usuarios (nombre_usuario, email, contrasena) VALUES (%s, %s, %s)",
                    (username, email, hashed_password.decode('utf-8')))
        mysql.connection.commit()

        return jsonify({'status': 'Usuario registrado con éxito'}), 201
    except Exception as e:
        return jsonify({'status': 'Error', 'message': str(e)}), 500
    finally:
        cur.close()

# Endpoint para login
@app.route('/login', methods=['POST'])
def login():
    try:
        data = request.json
        username = data.get('uname')
        password = data.get('passw')

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM usuarios WHERE nombre_usuario = %s", [username])
        user = cur.fetchone()

        if user and bcrypt.checkpw(password.encode('utf-8'), user[3].encode('utf-8')):
            return jsonify({'status': 'Inicio sesión con éxito'})
        else:
            return jsonify({'status': 'Usuario o contraseña incorrectos'}), 401
    except Exception as e:
        return jsonify({'status': 'Error', 'message': str(e)}), 500
    finally:
        cur.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
