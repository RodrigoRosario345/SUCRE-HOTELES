import firebase_admin
from firebase_admin import credentials, db, storage
import os

# Ruta a tu archivo JSON de credenciales para poder acceder a Firebase
ruta_admin_sdk = 'C:/Users/HP/Desktop/admin_sdk/hoteles-sucre-firebase-adminsdk-l9hkr-fe4df72541.json'

# Inicializar Firebase con las credenciales
cred = credentials.Certificate(ruta_admin_sdk)
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://hoteles-sucre-default-rtdb.firebaseio.com/',
    'storageBucket': 'hoteles-sucre.appspot.com'  # No necesitas 'gs://'
})

# Referencia a la base de datos y al bucket de almacenamiento de Firebase
ref = db.reference('hoteles')
bucket = storage.bucket()

# Función para subir una imagen y obtener su URL
def upload_image(local_path, cloud_path):
    blob = bucket.blob(cloud_path)
    blob.upload_from_filename(local_path)
    blob.make_public()
    return blob.public_url

# Datos de las personas a insertar
hoteles = [
    {
        'imagen_num_uno': 'On_Hotel_Boutique1.png',
        'imagen_num_dos': 'On_Hotel_Boutique2.png',
        'imagen_num_tres': 'On_Hotel_Boutique3.jpg',
        'imagen_num_cuatro': 'On_Hotel_Boutique4.png',
        'imagen_num_cinco': 'On_Hotel_Boutique5.png',
        'imagen_num_seis': 'On_Hotel_Boutique6.png',
        'imagen_num_siete': 'On_Hotel_Boutique7.png',
        'imagen_num_ocho': 'On_Hotel_Boutique8.png',
        'nombre': 'On Hotel Boutique',
        'lugar': 'Sucre, Bolivia',
        'precio': 799,
        'ubicacion': 'Calle Potosi 300 esquina grau, Chuquisaca, 2000 Sucre, Bolivia',
        'Descripcion': 'El On Hotel Boutique se encuentra en Sucre y ofrece jardín. Cuenta con restaurante, recepción 24 horas, salón compartido y WiFi gratuita. El establecimiento cuenta con centro de negocios, salas de reuniones, mostrador de información turística y servicio de planchado.'
    },
    {
        'imagen_num_uno': 'Capital_Plaza_Hotel1.png',
        'imagen_num_dos': 'Capital_Plaza_Hotel2.png',
        'imagen_num_tres': 'Capital_Plaza_Hotel3.jpg',
        'imagen_num_cuatro': 'Capital_Plaza_Hotel4.png',
        'imagen_num_cinco': 'Capital_Plaza_Hotel5.png',
        'imagen_num_seis': 'Capital_Plaza_Hotel6.png',
        'imagen_num_siete': 'Capital_Plaza_Hotel7.png',
        'imagen_num_ocho': 'Capital_Plaza_Hotel8.png',
        'nombre': 'Capital Plaza Hotel',
        'lugar': 'Sucre, Bolivia',
        'precio': 466,
        'ubicacion': 'Plaza 25 De Mayo Nº 29, 0000 Sucre, Bolivia',
        'Descripcion': 'El Capital Plaza ocupa una elegante mansión decorada con muebles antiguos en el centro de Sucre. Ofrece vistas a la plaza 25 de Mayo. En el vestíbulo al aire libre hay una majestuosa escalera y una pintoresca fuente.'
    },
    {
        'imagen_num_uno': 'Mi_Pueblo_Samary_Hotel_Boutique1.png',
        'imagen_num_dos': 'Mi_Pueblo_Samary_Hotel_Boutique2.png',
        'imagen_num_tres': 'Mi_Pueblo_Samary_Hotel_Boutique3.jpg',
        'imagen_num_cuatro': 'Mi_Pueblo_Samary_Hotel_Boutique4.png',
        'imagen_num_cinco': 'Mi_Pueblo_Samary_Hotel_Boutique5.png',
        'imagen_num_seis': 'Mi_Pueblo_Samary_Hotel_Boutique6.png',
        'imagen_num_siete': 'Mi_Pueblo_Samary_Hotel_Boutique7.png',
        'imagen_num_ocho': 'Mi_Pueblo_Samary_Hotel_Boutique8.png',
        'nombre': 'Mi Pueblo Samary Hotel Boutique',
        'lugar': 'Sucre, Bolivia',
        'precio': 652,
        'ubicacion': 'Dalence 349, 91 Sucre, Bolivia',
        'Descripcion': 'Este hotel, situado en una mansión colonial decorada con obras de arte local, a 4 calles del centro de Sucre, ofrece habitaciones con balcón privado, vistas a los patios interiores con encanto y a las galerías españolas y conexión WiFi gratuita.'
    },
    {
        'imagen_num_uno': 'Hotel_Monasterio1.png',
        'imagen_num_dos': 'Hotel_Monasterio2.png',
        'imagen_num_tres': 'Hotel_Monasterio3.jpg',
        'imagen_num_cuatro': 'Hotel_Monasterio4.png',
        'imagen_num_cinco': 'Hotel_Monasterio5.png',
        'imagen_num_seis': 'Hotel_Monasterio6.png',
        'imagen_num_siete': 'Hotel_Monasterio7.png',
        'imagen_num_ocho': 'Hotel_Monasterio8.png',
        'nombre': 'Hotel Monasterio',
        'lugar': 'Sucre, Bolivia',
        'precio': 484,
        'ubicacion': 'Calle Calvo Número 140, 0591 Sucre, Bolivia',
        'Descripcion': 'El Hotel Monasterio ofrece alojamiento de 4 estrellas en Sucre, a 1,2 km del parque Bolívar y a 1,4 km del parque Surapata. Este hotel de 4 estrellas cuenta con WiFi gratuita, salón compartido y terraza. Hay servicio de habitaciones, recepción 24 horas y servicio de cambio de divisa.'

    },
    {
        'imagen_num_uno': 'Hostal_CasArte_Takubamba1.png',
        'imagen_num_dos': 'Hostal_CasArte_Takubamba2.png',
        'imagen_num_tres': 'Hostal_CasArte_Takubamba3.jpg',
        'imagen_num_cuatro': 'Hostal_CasArte_Takubamba4.png',
        'imagen_num_cinco': 'Hostal_CasArte_Takubamba5.png',
        'imagen_num_seis': 'Hostal_CasArte_Takubamba6.png',
        'imagen_num_siete': 'Hostal_CasArte_Takubamba7.png',
        'imagen_num_ocho': 'Hostal_CasArte_Takubamba8.png',
        'nombre': 'Hostal CasArte Takubamba',
        'lugar': 'Sucre, Bolivia',
        'precio': 634,
        'ubicacion': 'Calle J.M. Serrano Nro 256, 0001 Sucre, Bolivia',
        'Descripcion': 'El Hostal casarte Takubamba ofrece alojamiento en el centro de Sucre y cuenta con cocina común con horno de piedra andina, patio y galería de arte.'
    },
    {
        'imagen_num_uno': 'San_Marino_Royal_Hotel1.png',
        'imagen_num_dos': 'San_Marino_Royal_Hotel2.png',
        'imagen_num_tres': 'San_Marino_Royal_Hotel3.jpg',
        'imagen_num_cuatro': 'San_Marino_Royal_Hotel4.png',
        'imagen_num_cinco': 'San_Marino_Royal_Hotel5.png',
        'imagen_num_seis': 'San_Marino_Royal_Hotel6.png',
        'imagen_num_siete': 'San_Marino_Royal_Hotel7.png',
        'imagen_num_ocho': 'San_Marino_Royal_Hotel8.png',
        'nombre': 'San Marino Royal Hotel',
        'lugar': 'Sucre, Bolivia',
        'precio': 346,
        'ubicacion': 'Calle Arenales 13, 0591 Sucre, Bolivia',
        'Descripcion': 'El San Marino Royal Hotel, situado en un encantador edificio de estilo colonial a solo 1,5 km de la Corte Suprema de Bolivia, ofrece habitaciones con conexión Wi-Fi gratuita y desayuno. Las instalaciones incluyen una bañera de hidromasaje y una sauna.'
    },
    {
        'imagen_num_uno': 'Glorieta_Hotel1.png',
        'imagen_num_dos': 'Glorieta_Hotel2.png',
        'imagen_num_tres': 'Glorieta_Hotel3.jpg',
        'imagen_num_cuatro': 'Glorieta_Hotel4.png',
        'imagen_num_cinco': 'Glorieta_Hotel5.png',
        'imagen_num_seis': 'Glorieta_Hotel6.png',
        'imagen_num_siete': 'Glorieta_Hotel7.png',
        'imagen_num_ocho': 'Glorieta_Hotel8.png',
        'nombre': 'Glorieta Hotel',
        'lugar': 'Sucre, Bolivia',
        'precio': 311,
        'ubicacion': 'Bolivar Nº 128, 0000 Sucre, Bolivia',
        'Descripcion': 'Este hotel está situado en Sucre, la capital histórica de Bolivia, y ofrece vistas panorámicas al casco antiguo y a las montañas de los alrededores, terraza y restaurante. Hay conexión Wi-Fi gratuita.'
    },
    {
        'imagen_num_uno': 'Ajayu_Sucre1.png',
        'imagen_num_dos': 'Ajayu_Sucre2.png',
        'imagen_num_tres': 'Ajayu_Sucre3.jpg',
        'imagen_num_cuatro': 'Ajayu_Sucre4.png',
        'imagen_num_cinco': 'Ajayu_Sucre5.png',
        'imagen_num_seis': 'Ajayu_Sucre6.png',
        'imagen_num_siete': 'Ajayu_Sucre7.png',
        'imagen_num_ocho': 'Ajayu_Sucre8.png',
        'nombre': 'Ajayu Sucre',
        'lugar': 'Sucre, Bolivia',
        'precio': 242,
        'ubicacion': 'Juan Jose Perez 426, 1111 Sucre, Bolivia',
        'Descripcion': 'El Ajayu Sucre se encuentra en Sucre, a 1,5 km del parque Bolívar y a 1,8 km del parque Surapata, y ofrece alojamiento con jardín y WiFi gratuita en todas las instalaciones. El establecimiento ofrece habitaciones familiares.'
    },
    # Agrega más personas según tus necesidades
]

list_numeros = ["uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"] # cambiar numeros por letras

# Iterar sobre los hoteles y subirlos a Firebase
for i, hotel in enumerate(hoteles, start=1):
    hotel_data = {
        'id': f'hotel{i}',
        'nombre': hotel['nombre'],
        'lugar': hotel['lugar'],
        'precio': hotel['precio'],
        'ubicacion': hotel['ubicacion'],
        'Descripcion': hotel['Descripcion'],
        'imagenes': {}
    }
    # print(f"Subiendo hotel {i}: {hotel}")
    # Subir imágenes y obtener URLs para las imagenes de lso hoteles
    for j in range(1, 9):
        image_key = f'imagen_num_{list_numeros[j-1]}'
        if image_key in hotel:
            local_image_path = os.path.join(os.getcwd(), 'static', hotel[image_key])
            print(f"Local image path: {local_image_path}")
            cloud_image_path = f"hoteles/hotel{i}/{hotel[image_key]}"
            print(f"Verificando la existencia de: {local_image_path}")
            if os.path.exists(local_image_path):
                try:
                    image_url = upload_image(local_image_path, cloud_image_path)
                    hotel_data['imagenes'][f'imagen{j}'] = image_url
                    print(f"Imagen subida: {image_url}")
                except Exception as e:
                    print(f"Error al subir {local_image_path}: {e}")
            else:
                print(f"Imagen no encontrada: {local_image_path}")

    # Guardar datos del hotel en Realtime Database
    ref.child(f'hotel{i}').set(hotel_data)

print("Datos subidos exitosamente a Firebase")