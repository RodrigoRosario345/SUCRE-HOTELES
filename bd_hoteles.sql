-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2024 a las 22:41:55
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_hoteles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles`
--

CREATE TABLE `hoteles` (
  `id` int(11) NOT NULL,
  `imagen_num_uno` varchar(200) NOT NULL,
  `imagen_num_dos` varchar(200) NOT NULL,
  `imagen_num_tres` varchar(200) NOT NULL,
  `imagen_num_cuatro` varchar(200) NOT NULL,
  `imagen_num_cinco` varchar(200) NOT NULL,
  `imagen_num_seis` varchar(200) NOT NULL,
  `imagen_num_siete` varchar(200) NOT NULL,
  `imagen_num_ocho` varchar(200) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `lugar` varchar(500) NOT NULL,
  `precio` int(100) NOT NULL,
  `ubicacion` varchar(500) NOT NULL,
  `Descripcion` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hoteles`
--

INSERT INTO `hoteles` (`id`, `imagen_num_uno`, `imagen_num_dos`, `imagen_num_tres`, `imagen_num_cuatro`, `imagen_num_cinco`, `imagen_num_seis`, `imagen_num_siete`, `imagen_num_ocho`, `nombre`, `lugar`, `precio`, `ubicacion`, `Descripcion`) VALUES
(1, 'On_Hotel_Boutique1.png', 'On_Hotel_Boutique2.png', 'On_Hotel_Boutique3.jpg', 'On_Hotel_Boutique4.png', 'On_Hotel_Boutique5.png', 'On_Hotel_Boutique6.png', 'On_Hotel_Boutique7.png', 'On_Hotel_Boutique8.png', 'On Hotel Boutique', 'Sucre, Bolivia', 799, 'Calle Potosi 300 esquina grau, Chuquisaca, 2000 Sucre, Bolivia', 'El On Hotel Boutique se encuentra en Sucre y ofrece jardín. Cuenta con restaurante, recepción 24 horas, salón compartido y WiFi gratuita. El establecimiento cuenta con centro de negocios, salas de reuniones, mostrador de información turística y servicio de planchado.'),
(2, 'Capital_Plaza_Hotel1.png', 'Capital_Plaza_Hotel2.png', 'Capital_Plaza_Hotel3.jpg', 'Capital_Plaza_Hotel4.png', 'Capital_Plaza_Hotel5.png', 'Capital_Plaza_Hotel6.png', 'Capital_Plaza_Hotel7.png', 'Capital_Plaza_Hotel8.png', 'Capital Plaza Hotel', 'Sucre, Bolivia', 466, 'Plaza 25 De Mayo Nº 29, 0000 Sucre, Bolivia', 'El Capital Plaza ocupa una elegante mansión decorada con muebles antiguos en el centro de Sucre. Ofrece vistas a la plaza 25 de Mayo. En el vestíbulo al aire libre hay una majestuosa escalera y una pintoresca fuente.'),
(3, 'Mi_Pueblo_Samary_Hotel_Boutique1.png', 'Mi_Pueblo_Samary_Hotel_Boutique2.png', 'Mi_Pueblo_Samary_Hotel_Boutique3.jpg', 'Mi_Pueblo_Samary_Hotel_Boutique4.png', 'Mi_Pueblo_Samary_Hotel_Boutique5.png', 'Mi_Pueblo_Samary_Hotel_Boutique6.png', 'Mi_Pueblo_Samary_Hotel_Boutique7.png', 'Mi_Pueblo_Samary_Hotel_Boutique8.png', 'Mi Pueblo Samary Hotel Boutique', 'Sucre, Bolivia', 652, 'Dalence 349, 91 Sucre, Bolivia', 'Este hotel, situado en una mansión colonial decorada con obras de arte local, a 4 calles del centro de Sucre, ofrece habitaciones con balcón privado, vistas a los patios interiores con encanto y a las galerías españolas y conexión WiFi gratuita.'),
(4, 'Hotel_Monasterio1.png', 'Hotel_Monasterio2.png', 'Hotel_Monasterio3.jpg', 'Hotel_Monasterio4.png', 'Hotel_Monasterio5.png', 'Hotel_Monasterio6.png', 'Hotel_Monasterio7.png', 'Hotel_Monasterio8.png', 'Hotel Monasterio', 'Sucre, Bolivia', 484, 'Calle Calvo Número 140, 0591 Sucre, Bolivia', 'El Hotel Monasterio ofrece alojamiento de 4 estrellas en Sucre, a 1,2 km del parque Bolívar y a 1,4 km del parque Surapata. Este hotel de 4 estrellas cuenta con WiFi gratuita, salón compartido y terraza. Hay servicio de habitaciones, recepción 24 horas y servicio de cambio de divisa.'),
(5, 'Hostal_CasArte_Takubamba1.png', 'Hostal_CasArte_Takubamba2.png', 'Hostal_CasArte_Takubamba3.jpg', 'Hostal_CasArte_Takubamba4.png', 'Hostal_CasArte_Takubamba5.png', 'Hostal_CasArte_Takubamba6.png', 'Hostal_CasArte_Takubamba7.png', 'Hostal_CasArte_Takubamba8.png', 'Hostal CasArte Takubamba', 'Sucre, Bolivia', 634, 'Calle J.M. Serrano Nro 256, 0001 Sucre, Bolivia', 'El Hostal casarte Takubamba ofrece alojamiento en el centro de Sucre y cuenta con cocina común con horno de piedra andina, patio y galería de arte.'),
(6, 'San_Marino_Royal_Hotel1.png', 'San_Marino_Royal_Hotel2.png', 'San_Marino_Royal_Hotel3.jpg', 'San_Marino_Royal_Hotel4.png', 'San_Marino_Royal_Hotel5.png', 'San_Marino_Royal_Hotel6.png', 'San_Marino_Royal_Hotel7.png', 'San_Marino_Royal_Hotel8.png', 'San Marino Royal Hotel', 'Sucre, Bolivia', 346, 'Calle Arenales 13, 0591 Sucre, Bolivia', 'El San Marino Royal Hotel, situado en un encantador edificio de estilo colonial a solo 1,5 km de la Corte Suprema de Bolivia, ofrece habitaciones con conexión Wi-Fi gratuita y desayuno. Las instalaciones incluyen una bañera de hidromasaje y una sauna.'),
(7, 'Glorieta_Hotel1.png', 'Glorieta_Hotel2.png', 'Glorieta_Hotel3.jpg', 'Glorieta_Hotel4.png', 'Glorieta_Hotel5.png', 'Glorieta_Hotel6.png', 'Glorieta_Hotel7.png', 'Glorieta_Hotel8.png', 'Glorieta Hotel', 'Sucre, Bolivia', 311, 'Bolivar Nº 128, 0000 Sucre, Bolivia', 'Este hotel está situado en Sucre, la capital histórica de Bolivia, y ofrece vistas panorámicas al casco antiguo y a las montañas de los alrededores, terraza y restaurante. Hay conexión Wi-Fi gratuita.'),
(8, 'Ajayu_Sucre1.png', 'Ajayu_Sucre2.png', 'Ajayu_Sucre3.jpg', 'Ajayu_Sucre4.png', 'Ajayu_Sucre5.png', 'Ajayu_Sucre6.png', 'Ajayu_Sucre7.png', 'Ajayu_Sucre8.png', 'Ajayu Sucre', 'Sucre, Bolivia', 242, 'Juan Jose Perez 426, 1111 Sucre, Bolivia', 'El Ajayu Sucre se encuentra en Sucre, a 1,5 km del parque Bolívar y a 1,8 km del parque Surapata, y ofrece alojamiento con jardín y WiFi gratuita en todas las instalaciones. El establecimiento ofrece habitaciones familiares.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `email`, `contrasena`) VALUES
(1, 'rodrigo15', 'rodrigo15@gmail.com', '$2b$12$H4P3t4R6llH7gJmkRBrTaevbzH4ACsiJ8gTsTXJNQC1NsvyLEzTJC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
