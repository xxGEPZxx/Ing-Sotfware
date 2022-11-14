-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2022 a las 03:44:07
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `idMarcas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `Recibo_idRecibo` int(11) NOT NULL,
  `Tipo_P_O` varchar(45) NOT NULL,
  `Tipo_E_O` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL,
  `Serial_P` varchar(15) NOT NULL,
  `Precio_P` double(16,2) NOT NULL,
  `Color_P` varchar(45) NOT NULL,
  `Dispositivos_D_P` int(11) NOT NULL,
  `Modelo_P` varchar(15) NOT NULL,
  `Version_P` varchar(45) NOT NULL,
  `Productoscol` varchar(45) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Orden_idOrden` int(11) NOT NULL,
  `Marcas_idMarcas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE `recibo` (
  `idRecibo` int(11) NOT NULL,
  `F_C_R` date NOT NULL,
  `F_E_R` date NOT NULL,
  `Datos_R` varchar(100) NOT NULL,
  `Total_R` double(16,2) NOT NULL,
  `Codigo_R_R` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

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
-- Estructura de tabla para la tabla `usuario`
--

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
  `password_U` varchar(45) NOT NULL,
  `Rol_idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre_U`, `Apellido_U`, `CI_U`, `Phone_U`, `Sexo_U`, `F_N_U`, `Address_U`, `Email_U`, `password_U`, `Rol_idRol`) VALUES
(1, 'admin', 'Peña', '28103936', '04129268335', 'Masculino', '2001-07-25', 'El Placer', 'guillermop2507@gmail.com', 'G25llermo.', 1),
(2, 'admin', 'Benitez', '28582670', '04146680987', 'Masculino', '2000-10-05', 'El Soler', 'antonymanuelbenitez@gmail.com', 'Benitez.', 1),
(3, 'admin', 'Luzardo', '28252243', '04140379524', 'Masculino', '2000-07-17', 'Por URBE', 'Luzardo222@gmail.com', 'Luzardo.', 1);

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
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recibo`
--
ALTER TABLE `recibo`
  MODIFY `idRecibo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
