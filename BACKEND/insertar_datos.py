import mysql.connector

# Configuración de la conexión a la base de datos
config = {
  'user': 'root',
  'password': '',
  'host': 'localhost',
  'database': 'bd_Hoteles',
}

# Establecer la conexión a la base de datos
conexion = mysql.connector.connect(**config)

# Crear un cursor para ejecutar consultas
cursor = conexion.cursor()

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

# Preparar los datos para la inserción
datos_hoteles = [(hotel['imagen_num_uno'], hotel['imagen_num_dos'], hotel['imagen_num_tres'], hotel['imagen_num_cuatro'], hotel['imagen_num_cinco'], hotel['imagen_num_seis'], hotel['imagen_num_siete'], hotel['imagen_num_ocho'], hotel['nombre'], hotel['lugar'], hotel['precio'], hotel['ubicacion'], hotel['Descripcion']) for hotel in hoteles]

# Consulta de inserción
consulta = "INSERT INTO hoteles (imagen_num_uno, imagen_num_dos, imagen_num_tres, imagen_num_cuatro, imagen_num_cinco, imagen_num_seis, imagen_num_siete, imagen_num_ocho, nombre, lugar, precio, ubicacion, Descripcion) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s,%s,%s)"

# Insertar los datos de las personas en la base de datos
cursor.executemany(consulta, datos_hoteles)
conexion.commit()

# Cerrar la conexión
cursor.close()
conexion.close()
