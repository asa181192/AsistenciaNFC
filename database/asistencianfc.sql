-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 19-04-2015 a las 18:23:06
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `asistencianfc`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `asistencia`
-- 

CREATE TABLE `asistencia` (
  `idtag` bigint(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY  (`idtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `asistencia`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `materias`
-- 

CREATE TABLE `materias` (
  `idmaterias` int(20) NOT NULL auto_increment,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY  (`idmaterias`),
  KEY `nombre` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `materias`
-- 

INSERT INTO `materias` VALUES (3, 'android');
INSERT INTO `materias` VALUES (5, 'circuitos');
INSERT INTO `materias` VALUES (2, 'Java');
INSERT INTO `materias` VALUES (4, 'matematicas');
INSERT INTO `materias` VALUES (1, 'programacion');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `rol`
-- 

CREATE TABLE `rol` (
  `idrol` int(5) NOT NULL auto_increment,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY  (`idrol`),
  KEY `nombre` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `rol`
-- 

INSERT INTO `rol` VALUES (1, 'administrador');
INSERT INTO `rol` VALUES (3, 'alumno');
INSERT INTO `rol` VALUES (2, 'maestro');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `sesion`
-- 

CREATE TABLE `sesion` (
  `idsesion` int(20) NOT NULL auto_increment,
  `usuario` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `idtag` bigint(50) NOT NULL,
  PRIMARY KEY  (`idsesion`,`idtag`),
  KEY `idtag` (`idtag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `sesion`
-- 

INSERT INTO `sesion` VALUES (1, '1498278', '1498278', 1498278);
INSERT INTO `sesion` VALUES (2, 'admin', 'admin', 55555);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `usuario`
-- 

CREATE TABLE `usuario` (
  `idtag` bigint(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) default NULL,
  `idrol` int(5) NOT NULL,
  PRIMARY KEY  (`idtag`,`idrol`),
  KEY `nombre` (`nombre`),
  KEY `idrol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `usuario`
-- 

INSERT INTO `usuario` VALUES (55555, 'admin', 'admin', 1);
INSERT INTO `usuario` VALUES (1498278, 'Alfredo', 'Santiago', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `usuariomaterias`
-- 

CREATE TABLE `usuariomaterias` (
  `idtag` bigint(50) NOT NULL,
  `idmaterias` int(20) NOT NULL,
  PRIMARY KEY  (`idtag`,`idmaterias`),
  KEY `idmaterias` (`idmaterias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `usuariomaterias`
-- 


-- 
-- Filtros para las tablas descargadas (dump)
-- 

-- 
-- Filtros para la tabla `asistencia`
-- 
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`idtag`) REFERENCES `usuario` (`idtag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `sesion`
-- 
ALTER TABLE `sesion`
  ADD CONSTRAINT `sesion_ibfk_1` FOREIGN KEY (`idtag`) REFERENCES `usuario` (`idtag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `usuario`
-- 
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `usuariomaterias`
-- 
ALTER TABLE `usuariomaterias`
  ADD CONSTRAINT `usuariomaterias_ibfk_2` FOREIGN KEY (`idmaterias`) REFERENCES `materias` (`idmaterias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuariomaterias_ibfk_1` FOREIGN KEY (`idtag`) REFERENCES `usuario` (`idtag`) ON DELETE NO ACTION ON UPDATE NO ACTION;
