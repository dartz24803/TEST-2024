-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 23:00:40
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tmp_volvo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `Nombre_Producto` varchar(255) DEFAULT NULL,
  `Marca` varchar(255) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Porcentaje_Descuento` decimal(5,2) DEFAULT NULL,
  `imagen_ruta` varchar(255) DEFAULT NULL,
  `Precio` varchar(255) DEFAULT NULL,
  `Precio_Descontado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`Nombre_Producto`, `Marca`, `Codigo`, `Porcentaje_Descuento`, `imagen_ruta`, `Precio`, `Precio_Descontado`) VALUES
('Forro de frenos', 'Camiones Volvo', 'VO 21534097', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_1.jpg', '$140.59', NULL),
('Kit de Filtro Secador de Aire', 'Camiones Volvo', 'VO 23690622', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_2.jpg', '$264.65', NULL),
('Juego de zapata de freno', 'Camiones Volvo', 'VO 3095196', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_3.jpg', '$356.63', NULL),
('Válvula de protección de circuito', 'Camiones Volvo', 'VO 21811707', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_4.jpg', '$565.95', NULL),
('Líquido de freno', 'Camiones Volvo', 'VO 23428377', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_5.jpg', '$16.00', NULL),
('Sensor de velocidad de la rueda', 'Camiones Volvo', 'VO 21247147', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_6.jpg', '$175.42', NULL),
('Sensor de velocidad de la rueda', '', 'VO 21247154', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_7.jpg', '$175.42', NULL),
('Juego de reparación de frenos', 'Buses Volvo, Camiones Volvo', 'VO 8550978', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_8.jpg', '$437.86', NULL),
('Piñón derecho', 'Buses Volvo, Camiones Volvo', 'VO 8550977', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_9.jpg', '$437.86', NULL),
('Cilindro de frenos', 'Camiones Volvo', 'VO 20533195', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_10.jpg', '$1,019.13', NULL),
('Forro de freno posterior', 'Camiones Volvo', 'VO 8127762', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_11.jpg', '$395.11', NULL),
('Juego De Pastillas', 'Camiones Volvo', 'VO 23149532', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_12.jpg', '$348.28', NULL),
('Juego De Pastillas', 'Camiones Volvo', 'VO 21352570', NULL, 'C:\\Users\\tpizarro\\Documents\\Drive\\producto_13.jpg', '$355.69', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
