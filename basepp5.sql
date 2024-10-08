-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-10-2024 a las 20:45:26
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basepp5`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `tipo_actividad` int(11) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `observaciones` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_04` (`tipo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre`, `apellido`, `dni`, `correo`, `fecha_registro`, `tipo_actividad`, `telefono`, `direccion`, `nacimiento`, `observaciones`) VALUES
(1, 'Sebastian', 'Gutierrez', 41543765, 'sebagutierrez@gmail.com', '2024-09-15', 4, '2644567876', 'Ruta 20 Caucete', '2000-06-20', NULL),
(2, 'Jorge', 'Aguero', 34576871, 'jorgeaguero@gmail.com', '2024-09-16', 4, '2614561231', 'Ruta 20 Caucete M/4 C/11', '1980-11-20', ''),
(16, 'federico', 'moran', 42809162, 'federicojmoran@gmail.com', '2024-09-25', 2, '2644002626', 'CASTRO 2 M/J C/5 CAUCETE', '2000-08-22', 'usa lentes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imc`
--

DROP TABLE IF EXISTS `imc`;
CREATE TABLE IF NOT EXISTS `imc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `calculo` float DEFAULT NULL,
  `fecha_calculo` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno` (`alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imc`
--

INSERT INTO `imc` (`id`, `alumno`, `peso`, `altura`, `calculo`, `fecha_calculo`, `fecha_modificacion`) VALUES
(3, 2, 74, 1.74, 24.4418, '2024-09-20', '2024-09-25'),
(5, 1, 71, 1.85, 20.7451, '2024-09-23', '2024-09-26'),
(11, 16, 74, 1.74, 24.4418, '2024-09-30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

DROP TABLE IF EXISTS `instructores`;
CREATE TABLE IF NOT EXISTS `instructores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `rutina` int(11) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_07` (`rutina`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`id`, `nombre`, `apellido`, `rutina`, `telefono`, `mail`) VALUES
(1, 'Luis', 'Gomez', 1, '2144002683', 'luisgomez@gmail.com'),
(3, 'flaco rolando', 'schiavi', 1, '11924302', 'schiaviflaco@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

DROP TABLE IF EXISTS `membresias`;
CREATE TABLE IF NOT EXISTS `membresias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_actividad` int(11) DEFAULT NULL,
  `precio` varchar(255) DEFAULT NULL,
  `clases` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `turnos` int(11) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `alumno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_actividad` (`tipo_actividad`),
  KEY `turnos` (`turnos`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`id`, `tipo_actividad`, `precio`, `clases`, `fecha_alta`, `fecha_baja`, `turnos`, `estado`, `alumno`) VALUES
(7, 1, '12000', 'Pase Libre', '2024-09-30', '2024-10-02', 1, 'Activo', 16),
(3, 1, '12000', 'Pase Libre', '2024-09-23', '2024-10-04', 1, 'Activo', 2),
(4, 2, '12000', '4', '2024-09-23', '2024-10-22', 1, 'Activo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

DROP TABLE IF EXISTS `rutinas`;
CREATE TABLE IF NOT EXISTS `rutinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) DEFAULT NULL,
  `tipo_actividad` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(350) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno` (`alumno`),
  KEY `tipo_actividad` (`tipo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutinas`
--

INSERT INTO `rutinas` (`id`, `alumno`, `tipo_actividad`, `titulo`, `descripcion`, `archivo`) VALUES
(1, 1, 1, 'Aeróbico', 'Entrenamiento para grupo de personas que hacen cardio.', '1727280839_9747e6ce4818a1b8c4be.pdf'),
(28, 2, 6, 'RELAX 2.0', '-', '1727695075_ebf6c57edc357894901e.pdf'),
(27, NULL, 4, 'INTENSIDAD 2.0', 'Rutina para ganar musculo y perder grasa.', '1727695247_b2a584755bc63239f088.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_actividad`
--

DROP TABLE IF EXISTS `tipo_actividad`;
CREATE TABLE IF NOT EXISTS `tipo_actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_actividad`
--

INSERT INTO `tipo_actividad` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Funcional', 'Entrenamiento de aeróbico para perder grasa, clases genericas para todos.'),
(2, 'Crossfit', 'Entrenamiento personalizado para personas que buscan una definición.'),
(4, 'Musculación', 'Entrenamiento de fuerza para ganar masa muscular.'),
(6, 'Yoga', 'Entrenamiento especializado en relajamiento de full body.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

DROP TABLE IF EXISTS `turnos`;
CREATE TABLE IF NOT EXISTS `turnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_actividad` int(11) DEFAULT NULL,
  `instructor` int(11) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor` (`instructor`),
  KEY `tipo_actividad` (`tipo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id`, `tipo_actividad`, `instructor`, `horario`) VALUES
(1, 1, 1, '8.00 a 12.00'),
(4, 2, 3, '12.00 a 16.00'),
(5, 2, 1, '18.00 a 20.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `usuario`, `pass`) VALUES
(1, 'fede', 'moran', 'fede', '123456'),
(4, 'facundo', 'simeoni', 'facu12', '1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
