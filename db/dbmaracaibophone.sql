-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2022 a las 18:27:09
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbmaracaibophone`
--
CREATE DATABASE IF NOT EXISTS `dbmaracaibophone` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbmaracaibophone`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `idMarcas` int(11) NOT NULL,
  `MarcasNombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`idMarcas`, `MarcasNombre`) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Xiaomi'),
(4, 'Huawei'),
(5, 'Motorola'),
(6, 'Realme'),
(7, 'Honor'),
(8, 'Infinix'),
(9, 'Tecno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `Recibo_idRecibo` int(11) NOT NULL,
  `Tipo_P_O` varchar(45) DEFAULT NULL,
  `Tipo_E_O` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`idOrden`, `Recibo_idRecibo`, `Tipo_P_O`, `Tipo_E_O`) VALUES
(1, 1, 'Efectivo', 'Local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL,
  `Nombre_P` varchar(50) NOT NULL,
  `Serial_P` varchar(15) NOT NULL,
  `Precio_P` double(16,2) NOT NULL,
  `Color_P` varchar(45) NOT NULL,
  `Dispositivos_D_P` int(11) DEFAULT NULL,
  `Modelo_P` varchar(15) NOT NULL,
  `Version_P` varchar(45) NOT NULL,
  `Ram_P` varchar(45) NOT NULL,
  `Rom_P` varchar(45) NOT NULL,
  `Pantalla_P` varchar(45) NOT NULL,
  `Camara_S_P` varchar(45) NOT NULL,
  `Camara_P_P` varchar(45) NOT NULL,
  `Bateria_P` varchar(45) NOT NULL,
  `Sensor_P` tinyint(1) NOT NULL,
  `V_Android` int(10) NOT NULL,
  `Procesador_P` varchar(45) NOT NULL,
  `Imagen_P` varchar(50) NOT NULL,
  `Orden_idOrden` int(11) NOT NULL DEFAULT 1,
  `Cliente_idCliente` int(11) NOT NULL DEFAULT 1,
  `Marcas_idMarcas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosalmacen`
--

DROP TABLE IF EXISTS `productosalmacen`;
CREATE TABLE `productosalmacen` (
  `idProductosalmacen_A` int(11) NOT NULL,
  `Nombre_A` varchar(50) NOT NULL,
  `Serial_A` varchar(15) NOT NULL,
  `Precio_A` double(16,2) NOT NULL,
  `Color_A` varchar(45) NOT NULL,
  `Dispositivos_D_A` int(11) DEFAULT NULL,
  `Modelo_A` varchar(15) NOT NULL,
  `Version_A` varchar(45) NOT NULL,
  `Ram_A` varchar(45) NOT NULL,
  `Rom_A` varchar(45) NOT NULL,
  `Pantalla_A` varchar(45) NOT NULL,
  `Camara_S_A` varchar(45) NOT NULL,
  `Camara_P_A` varchar(45) NOT NULL,
  `Bateria_A` varchar(45) NOT NULL,
  `Sensor_A` tinyint(1) NOT NULL,
  `V_Android_A` int(10) NOT NULL,
  `Procesador_A` varchar(45) NOT NULL,
  `Imagen_A` varchar(100) NOT NULL,
  `Marcas_idMarcas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productosalmacen`
--

INSERT INTO `productosalmacen` (`idProductosalmacen_A`, `Nombre_A`, `Serial_A`, `Precio_A`, `Color_A`, `Dispositivos_D_A`, `Modelo_A`, `Version_A`, `Ram_A`, `Rom_A`, `Pantalla_A`, `Camara_S_A`, `Camara_P_A`, `Bateria_A`, `Sensor_A`, `V_Android_A`, `Procesador_A`, `Imagen_A`, `Marcas_idMarcas`) VALUES
(9, 'Infinix Hot 11 Play ', '#dfsf451', 140.00, 'Negro', NULL, '1', '2', '4', '128', '6.8', '8', '13', '6000', 1, 12, 'Octa-core', 'https://res.cloudinary.com/xxgepzxx/image/upload/v1669563763/Infinix-Hot-11-Play_pzarnf.png', 8),
(10, 'Poco X4 Pro', '#fds4545', 290.00, 'Amarillo', NULL, '1', '3', '6', '128', '6.6', '16', '108', '5000', 1, 12, 'Octa-core', 'https://res.cloudinary.com/xxgepzxx/image/upload/v1669563763/Poco-x4-Pro-5G_jcldit.png', 3),
(12, 'Tecno Spark 8c', '#dfs454', 140.00, 'Turquesa', NULL, '2', '1', '4', '128', '6.6', '8', '50', '5000', 1, 12, 'Octa-core', 'https://res.cloudinary.com/xxgepzxx/image/upload/v1669563763/Tecno-Spark-8T_qbpdab.png', 9),
(13, 'Infinix Note 12', '#fds4545', 210.00, 'Blanco', NULL, '2', '1', '8', '128', '6.7', '16', '50', '5000', 1, 12, 'Octa-core', 'https://res.cloudinary.com/xxgepzxx/image/upload/v1669563763/Infinix-Note-12_i8mjfl.png', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

DROP TABLE IF EXISTS `recibo`;
CREATE TABLE `recibo` (
  `idRecibo` int(11) NOT NULL,
  `F_C_R` date NOT NULL,
  `F_E_R` date NOT NULL,
  `Datos_R` varchar(100) NOT NULL,
  `Total_R` double(16,2) NOT NULL,
  `Codigo_R_R` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recibo`
--

INSERT INTO `recibo` (`idRecibo`, `F_C_R`, `F_E_R`, `Datos_R`, `Total_R`, `Codigo_R_R`) VALUES
(1, '2022-11-01', '2022-11-03', 'Prueba', 0.00, '#4545');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('XryDBHWlmDu0fjYp2KuAOmZaQIw-KiTp', 1669742755, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":10},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nombre_U` varchar(45) NOT NULL,
  `Apellido_U` varchar(45) NOT NULL,
  `CI_U` varchar(45) NOT NULL,
  `Phone_U` varchar(14) NOT NULL,
  `Sexo_U` varchar(11) NOT NULL,
  `F_N_U` date NOT NULL,
  `Address_U` tinytext NOT NULL,
  `Email_U` varchar(320) NOT NULL,
  `password_U` varchar(60) NOT NULL,
  `Rol_idRol` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre_U`, `Apellido_U`, `CI_U`, `Phone_U`, `Sexo_U`, `F_N_U`, `Address_U`, `Email_U`, `password_U`, `Rol_idRol`) VALUES
(1, 'admin', 'Peña', '28103936', '04129268335', 'Masculino', '2001-07-25', 'El Placer', 'guillermop2507@gmail.com', 'G25llermo.', 1),
(2, 'admin', 'Benitez', '28582670', '04146680987', 'Masculino', '2000-10-05', 'El Soler', 'antonymanuelbenitez@gmail.com', 'Benitez.', 1),
(3, 'admin', 'Luzardo', '28252243', '04140379524', 'Masculino', '2000-07-17', 'Por URBE', 'Luzardo222@gmail.com', 'Luzardo.', 1),
(8, 'Luis', 'Chirino', '25645', '45646', 'Masculino', '2012-02-01', 'fghf', 'ddfgdf@gos.cs', '$2a$10$hU8Q2hX6OqrH5HXrRLaEIewvi0R.97Y95FipCU.H5gWNWKPEb7SpO', 2),
(10, 'Palmar', 'Palmar', '7150451', '54', 'Femenino', '2022-11-03', 'dsf', 'palmar@gmail.com', '$2a$10$LeQ1AoqcGKUYeUbZGDWAZ.qnvTXCJ/4k/tX8uoRj.1P76FKY4WP3m', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`idMarcas`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`,`Recibo_idRecibo`),
  ADD KEY `fk_Orden_Recibo1_idx` (`Recibo_idRecibo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`,`Cliente_idCliente`,`Orden_idOrden`,`Marcas_idMarcas`),
  ADD KEY `fk_Productos_Cliente1_idx` (`Cliente_idCliente`),
  ADD KEY `fk_Productos_Orden1_idx` (`Orden_idOrden`),
  ADD KEY `fk_Productos_Marcas1_idx` (`Marcas_idMarcas`);

--
-- Indices de la tabla `productosalmacen`
--
ALTER TABLE `productosalmacen`
  ADD PRIMARY KEY (`idProductosalmacen_A`,`Marcas_idMarcas`) USING BTREE,
  ADD KEY `fk_Productos_Marcas1_idx` (`Marcas_idMarcas`) USING BTREE;

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`idRecibo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`,`Rol_idRol`),
  ADD KEY `fk_Usuario_Rol1_idx` (`Rol_idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `productosalmacen`
--
ALTER TABLE `productosalmacen`
  MODIFY `idProductosalmacen_A` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `recibo`
--
ALTER TABLE `recibo`
  MODIFY `idRecibo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_Orden_Recibo1` FOREIGN KEY (`Recibo_idRecibo`) REFERENCES `recibo` (`idRecibo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Productos_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Marcas1` FOREIGN KEY (`Marcas_idMarcas`) REFERENCES `marcas` (`idMarcas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Orden1` FOREIGN KEY (`Orden_idOrden`) REFERENCES `orden` (`idOrden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productosalmacen`
--
ALTER TABLE `productosalmacen`
  ADD CONSTRAINT `productosalmacen_ibfk_1` FOREIGN KEY (`Marcas_idMarcas`) REFERENCES `marcas` (`idMarcas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
