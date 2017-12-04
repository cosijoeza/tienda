-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3307
-- Tiempo de generación: 04-12-2017 a las 11:14:52
-- Versión del servidor: 5.7.19-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id`, `nombre`) VALUES
(1, 'zapatos'),
(2, 'relojes'),
(3, 'camisas'),
(4, 'outfits');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `calle` varchar(20) DEFAULT NULL,
  `colonia` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cod_post` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `calle`, `colonia`, `estado`, `cod_post`) VALUES
(1, '10 de enero', 'La purisima', 'Oaxaca', 71250),
(2, 'Alarii', 'El niñp', 'Oaxaca', 71250),
(3, 'Alarii', 'El niño', 'Oaxaca', 71250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id`, `tipo`) VALUES
(1, 'debito'),
(2, 'credito'),
(3, 'deposito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `clasif_id` int(11) NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`, `clasif_id`, `marca`, `descripcion`, `imagen`) VALUES
(1, 'camisa0.jpg', 852, 3, 'levis', 'Blanca/Manga Larga/Mediana', 'img/camisas/'),
(2, 'camisa1.jpg', 550, 3, 'Drop', 'Azul/Manga Corta/Mediana', 'img/camisas/'),
(3, 'zapato0.jpg', 1250, 1, 'flexi', 'Cafes/28', 'img/zapatos/'),
(4, 'zapato1.jpg', 1670, 1, 'lacoste', 'Negro/28', 'img/zapatos/'),
(5, 'zapato2.jpg', 670, 1, 'flexi', 'Negro/28', 'img/zapatos/'),
(6, 'zapato3.jpg', 450, 1, 'flexi', 'Negro/28', 'img/zapatos/'),
(7, 'reloj0.jpg', 3340, 2, 'Rolex', 'Oro', 'img/relojes/'),
(8, 'reloj1.jpg', 3540, 2, 'Rolex', 'Perla', 'img/relojes/'),
(9, 'reloj2.jpg', 1540, 2, 'Rolex', 'Plata', 'img/relojes/'),
(10, 'reloj3.jpg', 2540, 2, 'Rolex', 'Plata', 'img/relojes/'),
(11, 'camisa2.jpg', 540, 3, 'levis', 'azul', 'img/camisas/'),
(12, 'camisa3.jpg', 540, 3, 'levis', 'blanca-negra', 'img/camisas/'),
(13, 'outfit0.jpg', 0, 4, '', '', 'img/outfits/'),
(14, 'outfit1.jpg', 0, 4, '', '', 'img/outfits/'),
(15, 'outfit2.jpg', 0, 4, '', '', 'img/outfits/'),
(16, 'outfit3.jpg', 0, 4, '', '', 'img/outfits/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(20) DEFAULT NULL,
  `direccion_id` int(11) NOT NULL,
  `correo` varchar(20) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `pago_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellidos`, `direccion_id`, `correo`, `usuario`, `password`, `pago_id`) VALUES
(1, 'Cosijoeza', 'Melchor Nolasco', 1, 'cosi@gmail.com', 'Cosi4', 'Holiwi:)', 1),
(2, 'Deborah', 'Aguilar Rodriguez', 2, 'debian@gmail.com', 'Deboritah', 'Morado:D', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clasif_id` (`clasif_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `direccion_id` (`direccion_id`),
  ADD KEY `pago_id` (`pago_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`clasif_id`) REFERENCES `clasificacion` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`pago_id`) REFERENCES `pago` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
