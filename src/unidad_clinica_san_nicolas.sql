-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-04-2024 a las 20:16:58
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `unidad_clinica_san_nicolas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalucsn`
--

DROP TABLE IF EXISTS `personalucsn`;
CREATE TABLE IF NOT EXISTS `personalucsn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) NOT NULL,
  `tipo_id` varchar(10) NOT NULL,
  `numero_id` varchar(50) NOT NULL,
  `lugar_expedicion` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha_i` date DEFAULT NULL,
  `fecha_f` date DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `auxt` varchar(50) DEFAULT NULL,
  `contraseña_hash` varchar(255) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_id` (`numero_id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personalucsn`
--

INSERT INTO `personalucsn` (`id`, `nombres`, `tipo_id`, `numero_id`, `lugar_expedicion`, `cargo`, `correo`, `fecha_i`, `fecha_f`, `saldo`, `auxt`, `contraseña_hash`, `estado`) VALUES
(1, 'Fernandez  Serna Geraldine', 'CC', '1096255504', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'geriithaferser@gmail.com', '2024-01-20', '2024-07-18', 1300000.00, '162000', '365e74a9bdd42dfb0174ffeca9897ad0', NULL),
(2, 'Berrio Agamez Luis', 'CC', '91446618', 'Barrancabermeja', 'Enfermero', 'iberrioa_77@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'b022ff5eecfd959928da7812715da5bb', NULL),
(3, 'Quintero Angarita Jaime', 'CC', '80227701', 'Bogotá D.C.', '', 'jaimequinteroa@hotmail.com', '2012-09-01', '1900-01-00', 5494600.00, NULL, 'be2d14a0593711717a294f739c89b4c2', NULL),
(4, 'Garcia Campo Lid Julieth', 'CC', '1096229002', 'Barrancabermeja', 'Recepcionista', 'juliethcampo28@hotmail.com', '2022-10-01', '2024-09-30', 1300000.00, '162000', '635b2708576675e19a599a1cc0bfe1ca', NULL),
(5, 'Gutierrez Marulanda Jeinny Cristina', 'CC', '1082897023', 'Santa Marta', 'Recepcionista', 'jeinny8904@gmail.com', '2022-07-01', '2024-06-30', 1300000.00, '162000', '24713213af0a45d0119e92b70e4a3104', NULL),
(6, 'Jaimes Galeano Maylen Brigith', 'CC', '1096227782', 'Barrancabermeja', 'Recepcionista', 'maylen.jaimes@hotmail.com', '2023-07-17', '2024-01-16', 0.00, NULL, '0731970afc89895d1c7145ece4b14aaf', NULL),
(7, 'Jaimes Lopez Mireya', 'CC', '63468711', 'Barrancabermeja', 'Coordinador Administrativo', 'mireyajaimeslopez@hotmail.com', '2021-09-17', '2024-05-16', 1378000.00, '162000', '191edcce705e2b0e526b3d29e5e95f30', NULL),
(8, 'Jaimes Medina Elizabeth', 'CC', '37841315', 'Bucaramanga', 'Auxiliar de Facturación', 'eliza0912@hotmail.es', '2016-12-21', '2024-08-20', 1568000.00, '162000', '780ec0e6e0ff121d7a879459c756aec1', NULL),
(9, 'Lagares Armesto Ana Cristina', 'CC', '1005180916', 'Barrancabermeja', 'Recepcionista', 'lagaresana27@gmail.com', '2020-12-01', '2024-11-30', 1300000.00, '162000', '53df8aad26022b37c713b3685c61cd1e', NULL),
(10, 'Villabona Gomez Diana Maria', 'CC', '1096204406', 'Barrancabermeja', 'Recepcionista', 'dianavillabona-17@hotmail.com ', '0000-00-00', '0000-00-00', 0.00, NULL, '81e9aba2da45aa698c51a803afc35297', NULL),
(11, 'Martinez Sanchez Andry Julissa', 'CC', '1096250313', 'Barrancabermeja', 'Recepcionista', 'andrym41@gmail.com', '2022-06-01', '2024-05-30', 1300000.00, '162000', 'bc3ef27b3d76530a35a399778f4f76af', NULL),
(12, 'Medina Florez Tania Milena', 'CC', '1096211701', 'Barrancabermeja', 'Recepcionista', 'gabrielasm160209@gmail.com', '2023-10-17', '2024-04-16', 1300000.00, '162000', 'a0c06b648509ff87a88adc073e82c51e', NULL),
(13, 'Mendoza Merchan Lina Maria', 'CC', '1096237140', 'Barrancabermeja', 'Recepcionista', 'linamaria0113@hotmail.com', '2024-01-17', '2024-04-16', 1300000.00, '162000', '4d3061b2f9366e0b04ad1bb6454b12fa', NULL),
(14, 'Narvaez Serrano Monica Yasmin', 'CC', '65771838', 'Ibagué', 'Recepcionista', 'yasmin-narvaez@hotmail.com', '2022-02-24', '2024-02-23', 0.00, NULL, '748590124dacfad021b9961443a75c1a', NULL),
(15, 'Roa Chavez Sandra Patricia', 'CC', '28019945', 'Barrancabermeja', 'Recepcionista', 'osmaanme30@gmail.com', '2022-11-16', '2024-11-15', 1300000.00, '162000', '113bb96f8e8a8cc8e7749008f26276f9', NULL),
(16, 'Serrano Mora Carmen Tatiana', 'CC', '37581212', 'Barrancabermeja', 'Recepcionista', 'ctserranom@gmail.com', '2022-05-17', '2024-05-16', 1300000.00, '162000', '3a3de8e85c09aca0417ae4bf2ae8fdc3', NULL),
(17, 'Uribe Herrera Lizeth Tatiana', 'CC', '1096212899', 'Barrancabermeja', 'Recepcionista', 'lizethuribe050213@gmail.com', '2023-02-16', '2024-10-15', 1300000.00, '162000', 'ff9bb0e967de7a4f0d315a51c545a62f', NULL),
(18, 'Vasquez Velasquez Elia', 'CC', '63464260', 'Barrancabermeja', 'Recepcionista', 'eliavasquez2019@gmail.com', '2021-12-01', '2024-03-30', 1300000.00, '162000', 'bc9650eafca9a4f8ec3ba35900def858', NULL),
(19, 'Villalobos Arias Alexandra', 'CC', '1005189222', 'Barrancabermeja', 'Recepcionista', 'alexavillalobos.xd12@gmail.com', '2023-10-11', '2024-01-10', 0.00, NULL, '8e351d6b382591e80343ac911243d92e', NULL),
(20, 'Diaz Garcia Juan Heli', 'CC', '1096243272', 'Barrancabermeja', 'Aprendiz Lectiva - Tecnologo En Gestion Administrativa', 'juanhelid@gmail.com', '2023-02-15', '1900-01-00', 0.00, NULL, 'e8f8ca6656614c17339ae373d2dbea82', NULL),
(21, 'Madrid Lugo Dayana Lizeth', 'CC', '1193131236', 'Barrancabermeja', 'Aprendiz Lectiva - Tecnologo En Gestion Documental', 'madridliseth98@gmail.com', '2023-10-26', '1900-01-00', 0.00, NULL, '541f5c787bc4987c7d7bafee7b4b31ac', NULL),
(22, 'Martinez Solano Jesus', 'CC', '1096253427', 'Barrancabermeja', 'Aprendiz Lectiva - Tecnologo En Gestion Documental', 'jm957637@gmail.com', '2023-02-15', '1900-01-00', 0.00, NULL, '0d4ad51939bb4feb9e8d85d982f67fab', NULL),
(23, 'Reales Cuadrado Wendy Lorainy', 'CC', '1096184753', 'Barrancabermeja', 'Aprendiz Lectiva - Tecnologo En Gestion Documental', 'wendyrea23@gmail.com', '2023-02-15', '1900-01-00', 0.00, NULL, '2124054f1ff3b1aebd5e1912fd21047a', NULL),
(24, 'Rueda Heredia Diana Carolina', 'CC', '1005186112', 'Barrancabermeja', 'Aprendiz Lectiva - Tecnologo En Gestion Documental', 'dianaruedah21@gmail.com', '2023-02-15', '0000-00-00', 0.00, NULL, '7d16777ff207091b55cf613d1cf5ef8b', NULL),
(25, 'Gutierrez Lopez Adrian', 'CC', '1097182527', 'Barrancabermeja', ' Unioriente - Tecnico Administrativo Contabilidad y Finanzas', 'adrian.ryomen@gmail.com', '2023-09-29', '0000-00-00', 0.00, NULL, '9abad63130c6b243c322237dd9c48e10', NULL),
(26, 'Jaramillo Arroyo Paula Andrea', 'CC', '1005240394', 'Barrancabermeja', 'Tecnologo En Gestion Integrada de la Calidad, medio ambiente, Seguridad y Salud Ocupacional', 'paulajaramillo202002@gmail.com', '2023-10-25', '2024-04-22', 0.00, NULL, '1467912941e9836cd4d8e42f89e0484e', NULL),
(27, 'Vega Diaz Maribel', 'CC', '42157803', 'Pereira', 'Auditoria Interna', 'maribella-vd@hotmail.com', '2023-04-12', '2024-01-11', 1537000.00, '162000', '37df82a95ec0d7415637c254403f9938', NULL),
(28, 'Aguilar Arenilla Mayra Alejandra', 'CC', '1096199151', 'Barrancabermeja', 'Auxiliar de Archivo', 'alejandra.aguilar-123@hotmail.com', '2018-06-18', '2025-02-17', 1300000.00, '162000', '4c011f88e45529d524f10e3cbd039b12', NULL),
(29, 'Martinez Centeno Leonardo Jose', 'CC', '1098605673', 'Bucaramanga', 'Auxiliar de  Glosas', 'leonardojose@gmail.com', '2020-10-05', '2024-10-04', 1454400.00, '162000', '6181008ca56cb74496b60023d391e15b', NULL),
(30, 'Mier Ramirez Karen Marcela', 'CC', '1096235954', 'Barrancabermeja', 'Auxiliar de Facturacion', 'mierkaren@gmail.com', '2022-02-09', '2024-10-08', 1300000.00, '162000', '45646fb1630d7a5941cae19703641087', NULL),
(31, 'Ballesteros Maria del Carmen', 'CC', '63460808', '', 'Auxiliar de Facturacion', 'penaballesteroschristian@gmail.com', '2021-02-10', '2025-02-08', 1300000.00, '162000', '91e497aca4ded97a398f759914cad625', NULL),
(32, 'Perez Rangel Erika Johana', 'CC', '1096219448', 'Barrancabermeja', 'Recepcionista (Auxiliar de Cartera)', 'erikaperezrangel@gmail.com', '2015-02-23', '2024-07-16', 1785960.00, '162000', 'b0a415b8310e1027ffa355461ca5b4c9', NULL),
(33, 'Quintana Arroyo Yairis Vanessa', 'CC', '1118856709', 'Riohacha', 'Recepcionista /Auxiliar Contable', 'yquintanaarroyo@gmail.com', '2022-04-19', '2024-04-18', 1456000.00, '162000', '28b92758336e1df18874e1031e003ee8', NULL),
(34, 'De Sales Serrano Ana Soraya', 'CC', '28070222', 'Barrancabermeja', 'Auxiliar de Facturacion / Auxilar Contable', 'desalessoraya@gmail.com', '2023-05-01', '2024-04-30', 1378000.00, '162000', '95950621d058edc6f7d9a99ec203324a', NULL),
(35, 'Belaides Sandoval Gisela', 'CC', '1096189414', 'Barrancabermeja', 'Auxiliar de Cocina', 'giselabelaides@gmail.com', '2019-12-24', '2024-12-23', 1300000.00, '162000', 'beed97b75d81b45dc45df58632c3bb1f', NULL),
(36, 'Cepeda Jimenez Lina Marcela', 'CC', '1096250501', 'Barrancabermeja', 'Auxiliar de Cocina', 'linacepeda0722@gmail.com', '2023-02-03', '2024-10-02', 1300000.00, '162000', '5884fa1e754e7c7f32210b3016565529', NULL),
(37, 'Correa Gutierrez Luz Dary', 'CC', '63467897', 'Barrancabermeja', 'Auxiliar de Cocina', 'luzdaryc494@gmail.com', '2019-11-12', '2025-03-11', 1300000.00, '162000', 'd2e133cc613cb6d616307b85ddb85f87', NULL),
(38, 'Iguavita Rios Esperanza', 'CC', '1096200144', 'Barrancabermeja', 'Auxiliar de Cocina', 'esperanzaiguavita85@mail.com', '2023-08-06', '2024-05-06', 1300000.00, '162000', 'c9cdd5f34f7d53451844a592354f9f04', NULL),
(39, 'Medina Salguero Kenia Isabel', 'CC', '1096221131', 'Barrancabermeja', 'Auxiliar de Cocina', 'isabelmedinasalguero@gmail.com', '2023-09-12', '2024-06-11', 1300000.00, '162000', '73e394857b7e05606799c4f264380a03', NULL),
(40, 'Rodriguez Pulido Denis Yohana', 'CC', '28488395', 'Barrancabermeja', 'Auxiliar de Cocina', 'denisjohanapulido@gmail.com', '2018-07-18', '2025-03-18', 1300000.00, '162000', '07f3b94a81236b980ed393c63c86fc48', NULL),
(41, 'Acosta Centeno Paola Tatiana', 'CC', '1005181560', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'paolatatiana.26@gmail.com', '2021-06-25', '2024-06-24', 1300000.00, '162000', 'cffb343a583a6de6079b4c5c1cef7a07', NULL),
(42, 'Ardila Diaz Adriana Marcela', 'CC', '1096195005', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'marce2021@hotmail.com', '0000-00-00', '2025-02-05', 1300000.00, '162000', '6acf4c76a5803ba4f3cdf481e646ab0d', NULL),
(43, 'Arias Garnica Ingrid Carolina', 'CC', '1096197765', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'deivisshera29@gmail.com', '2023-06-01', '2024-06-30', 1300000.00, '162000', 'e78fac168b0e4c5e1e4dd41a33f9d5d1', NULL),
(44, 'Ariza Vesga Cristina Isabel', 'CC', '1096221995', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'crisarve.93@hotmail.com', '2019-12-21', '2024-12-20', 1300000.00, '162000', '9f9d50ff2be7c16ed6c247167ad39da2', NULL),
(45, 'Badillo Armesto Anahid', 'CC', '63457741', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'anahidbadillo@hotmail.com', '2015-11-28', '2024-04-09', 1300000.00, '162000', 'c59a0498d99b58752a328993c30ad6b7', NULL),
(46, 'Beleño Paez Hernan Jose', 'CC', '1096241274', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'herbeleno.paez@hotmail.com', '2018-07-01', '2025-02-28', 1300000.00, '162000', '6f4449db7c8a36f0bedf222a0cbb451d', NULL),
(47, 'Caballero Martinez Diego Armando', 'CC', '1097182397', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'diegoarmandocaballero2004@gmail.com', '2024-01-01', '2024-06-30', 1300000.00, '162000', 'a4756fda3a7502e51111df366ed36078', NULL),
(48, 'Calderon Garcia Alvaro Javier', 'CC', '1065660882', 'Valledupar', 'Auxiliar de Enfermeria', 'alvarojcalderongarcia@hotmail.com', '2023-07-13', '2024-11-12', 0.00, '162000', '43cbd6195229588ba39b5951304efafb', NULL),
(49, 'Camacho Brokate Giselle Patricia', 'CC', '1098806213', 'Bucaramanga', 'Auxiliar de Enfermeria', 'gisellecamacho.02@gmail.com', '2019-12-21', '2024-04-20', 1300000.00, '162000', 'a850c9ab5764988b269f67901c887095', NULL),
(50, 'Camacho Rodriguez Viviana', 'CC', '1096221445', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'vivianacamachorodriguez162@gamil.com', '2022-03-14', '2025-03-14', 1300000.00, '162000', '09a278de1e87fb858b81fee179a56cbd', NULL),
(51, 'Carvajal Prasca Mariam Andrea', 'CC', '1096224337', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'mariana-12_582@hotmail.com', '2021-05-15', '2024-05-14', 1300000.00, '162000', '6677e3574915926ce098c64d42c480e5', NULL),
(52, 'Castro Orozco Karen Lizeth', 'CC', '1006339225', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'karenperez5808@gmail.com', '2024-01-01', '2024-06-30', 1300000.00, '162000', '9c8320e3ebd1898206b179df6d59ff6c', NULL),
(53, 'Carrascal Meza Camilo Andres', 'CC', '1007183318', 'Corozal', 'Auxiliar de Enfermeria', 'carrascalmezacamiloandres57@gmail.com', '2024-01-08', '2024-04-07', 1300000.00, '162000', '1a231f9d2b56b2ac61f76236bfdc177b', NULL),
(54, 'Echeverri Amaya Zoraima', 'CC', '63468341', 'Barrancabermeja', 'Auxiliar de Enfermeria', NULL, '2021-06-01', '2024-05-30', 1300000.00, '162000', '5b6307166fd11bd7542d90221cf27838', NULL),
(55, 'Estor Morales Sylkin Dayana', 'CC', '1216963461', 'El Banco', 'Auxiliar de Enfermeria', 'dayanaestor5@gmail.com', '2020-08-01', '2024-07-30', 1300000.00, '162000', 'df7944a3fa6b93f799cabf62296a97d6', NULL),
(56, 'Galeano Amaya Rocio', 'CC', '37936438', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'rociogaleanoamaya@gmail.com', '2012-09-01', '2024-12-30', 1300000.00, '162000', 'b2300400baf5ba806f302ff592761dd4', NULL),
(57, 'Gonzalez Chavez Viannis', 'CC', '1096211539', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'omaryesidpacheco0@gmail.com', '2022-12-16', '2024-12-15', 1300000.00, '162000', '5eb36c8690690acc6911253bb9a1a9b5', NULL),
(58, 'Guayara Triana Yina Marcela', 'CC', '1007773692', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'guayara-@hotmail.com', '2022-10-03', '2024-10-02', 1300000.00, '162000', '1cf4a922f73eb3fda4d71fc0106af1be', NULL),
(59, ' Guerra Velasquez Erika Andrea', 'CC', '1098692917', 'Bucaramanga', 'Auxiliar de Enfermeria', 'erikaguerra215@gamail.com', '2022-06-10', '2024-06-09', 1300000.00, '162000', '784ed56f713ad827d25cfab874f31a55', NULL),
(60, 'Hernandez Diaz Ivan Andres', 'CC', '1096247902', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'ivanandresher_1998@hotmail.com', '2018-12-12', '2024-04-11', 1300000.00, '162000', 'effd75c4d4af1e0b3c99a3930a4aa186', NULL),
(61, 'Ibarra Rangel Irina Del Carmen', 'CC', '22494439', 'Barranquilla', 'Auxiliar de Enfermeria', 'ibarrairina64@gmail.com', '2012-09-01', '2024-08-30', 1300000.00, '162000', '16bcdd7e4429ab2d0bf0d66c996fed32', NULL),
(62, 'Jimenez Camargo Benita Crsitina', 'CC', '1096188446', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'cristinajinenez123@gmail.com', '2016-12-08', '2024-08-07', 1300000.00, '162000', 'f9a54ca3a10088d6e505b1ba043abab5', NULL),
(63, 'Jimenez Niño  Madeleyne', 'CC', '1096255109', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'madelei-9090@hotmail.com', '2019-08-24', '2024-04-23', 1300000.00, '162000', '4b94178b6977389f408d549571524540', NULL),
(64, 'Lopez Ibañez Maria Graciela', 'CC', '1096204064', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'lopezibanez270329@gmail.com', '2017-07-01', '2025-02-28', 1300000.00, '162000', '440566bcc718f87c09068579eca6c997', NULL),
(65, 'Lopez Vasquez Astrid Carolina', 'CC', '1096241441', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'astridcarolina_lopez@hotmail.com', '2021-12-15', '2024-12-14', 1300000.00, '162000', '4c0b68d91a4652408f9c37b31a35b1fb', NULL),
(66, 'Macias Jimenez Yadira', 'CC', '1096236403', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'yadira_macias95@hotmail.com', '2022-02-01', '2025-01-30', 1300000.00, '162000', '9f323d55e4e0037745f663b7b5628f28', NULL),
(67, 'Mejia Berbeci Sol Marina', 'CC', '63473865', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'sol-08@hotmail.com', '2013-01-01', '2024-12-30', 1300000.00, '162000', 'd8aa639322a56bea1f6a53707d7428f4', NULL),
(68, 'Mejia  Rodriguez Jennys', 'CC', '28020359', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'jennymej_5@hotmail.com', '2021-07-19', '2024-07-17', 1300000.00, '162000', '3f598ffc304b99ae4d265a7c47e90af3', NULL),
(69, ' Montes Serrano Hernando', 'CC', '80800117', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'montes.hernando7@gmail.com', '2018-06-14', '2024-02-13', 0.00, '162000', '1b1c2c35471a73be39c340619e787736', NULL),
(70, 'Moreno Vesga Andrea Karina', 'CC', '1097610851', 'El Carmen de Chucurí', 'Auxiliar de Enfermeria', 'paolavesga6@gmail.com', '2021-02-01', '2025-01-30', 1300000.00, '162000', 'de708b350d58af7fa78118cd07548421', NULL),
(71, 'Ortiz Rueda Leydy Tatiana', 'CC', '1098779419', 'Bucaramanga', 'Auxiliar de Enfermeria', 'tatizortiz.2795@hotmail.com', '2019-12-10', '2024-12-08', 1300000.00, '162000', '3f62aaa11bae6a7b2a6d8627106556d8', NULL),
(72, 'Plazas Sarria Yurema Lineth', 'CC', '1084867724', 'Iquira', 'Auxiliar de Enfermeria', 'yplazas1@udi.edu.co', '2012-09-01', '2024-12-30', 1537000.00, '162000', 'a29b5918e5b3b655e74525da76581996', NULL),
(73, 'Pacheco Lopez Mayra Soraya', 'CC', '37391696', '', 'Auxiliar de Enfermeria', 'pachecolopezmayrasoraya@gmail.com', '2023-08-09', '2024-05-08', 1300000.00, '162000', '8a3bcdd28824fc0acea764093642510e', NULL),
(74, 'Pacheco Mora Jessica', 'CC', '1096202544', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'jessicapacheco031@gmail.com', '2017-07-25', '2025-03-24', 1300000.00, '162000', '8b46bb547c2bac982c327c2f84970c2f', NULL),
(75, 'Parada Otalvarez Aida Cecilia', 'CC', '1096185484', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'aczumi@gmail.com', '2023-08-01', '2024-04-30', 1300000.00, '162000', '920f3e2caba9d37fafd8474c16f43cf8', NULL),
(76, 'Peña Coley Karen Paola', 'CC', '1005182206', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'karen012317@gmail.com', '2022-09-14', '2024-09-13', 1300000.00, '162000', '19df73107b30baf7e995333ff9cdff4e', NULL),
(77, 'Pineda Infante Luz Elena', 'CC', '1099543772', 'Cimitarra', 'Auxiliar de Enfermeria', 'lucinfante2016@gmail.com', '2023-01-11', '2024-04-10', 1300000.00, '162000', '87990973cfa034e310064569c451539a', NULL),
(78, 'Puentes Olaya Nicole Dayana', 'CC', '1005240203', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'puentes0915@gmail.com', '2024-02-02', '2024-05-01', 1300000.00, '162000', '6b607e46e2937b185ecc27853823c72e', NULL),
(79, 'Rincon Ramos Hendrick Heisen', 'CC', '1096199014', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'hendrick.rincon27@gmail.com', '2023-07-10', '2024-04-09', 1300000.00, '162000', '012c180ea66a6230fce7c5d787790dfe', NULL),
(80, 'Rivera Osorio Sandra Liliana', 'CC', '1055917742', 'Marquetalia', 'Auxiliar de Enfermeria', 'sanliliana1991@gmail.com', '2017-07-12', '2025-03-11', 1300000.00, '162000', '34261e4252d2988f2cbbc5f678eefceb', NULL),
(81, 'Rodelo Neira Eliana Victoria', 'CC', '1096200953', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'elianarodelo1989@gmail.com', '2022-04-01', '2024-11-30', 1300000.00, '162000', '2ff7e250527f5c5f19f6424cf417e75b', NULL),
(82, 'Romero Vargas Paola Andrea', 'CC', '1005178493', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'paolaromero.parv@gmail.com', '2023-10-14', '2024-04-12', 1300000.00, '162000', '83835946748c39fa5b75ccb51c89a218', NULL),
(83, 'Rueda Gonzales Wendy Vanessa', 'CC', '1090506075', 'Cúcuta', 'Auxiliar de Enfermeria', 'vanessagonzalez1096@gmail.com', '2021-02-20', '2025-02-19', 1300000.00, '162000', '62f92791b039f84d9c30409c81697ff3', NULL),
(84, 'Ruiz Figueroa Esmeralda', 'CC', '63465097', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'factoryxtreme2014@gmail.com', '2018-01-11', '2024-09-10', 1300000.00, '162000', '1efb744fc4e75761261c6f4316cbaf9a', NULL),
(85, 'Salas Peñaloza Mayerlis', 'CC', '37687040', 'Puerto Wilches', 'Auxiliar de Enfermeria', 'mayerlissalaspenaloza@hotmail.com', '2015-01-03', '2024-09-02', 1300000.00, '162000', 'be4432bb92bf13633a26cd23f534d0d6', NULL),
(86, 'Sandoval Martinez Wendy Lucia', 'CC', '1005240050', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'wendyluciasandoval@gmail.com', '2023-08-10', '2025-01-09', 1300000.00, '162000', '0ab2bf309b9c658faee72313c399a503', NULL),
(87, 'Santos Flores Julieth Paola', 'CC', '1096213514', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'paolasantos1234567890santos@gmail.com', '2021-11-04', '2024-11-03', 1300000.00, '162000', '9a424b033aca8a266d074a48ea060da1', NULL),
(88, 'Silva Cuadros Lina Maria', 'CC', '1096241588', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'linamars96@outlook.com', '2019-08-01', '2024-07-30', 1300000.00, '162000', 'c2c993858810a8577054ce25bfa6490b', NULL),
(89, 'Soto Henao Lizeth Alejandra', 'CC', '1057095221', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'lizethalejandrasotohenao@gmail.com', '2023-08-01', '2024-07-30', 1300000.00, '162000', 'f311b7a81a52cf6bb38a845d350a825a', NULL),
(90, 'Suarez Gaviria Viviana Jazmin', 'CC', '1098748336', 'Bucaramanga', 'Auxiliar de Enfermeria', 'vivisanty.0713@gmail.com', '2024-01-15', '2024-04-14', 1300000.00, '162000', '0af0c1d719c4a7e87e4452112288184f', NULL),
(91, 'Torres Simanca Jenniffer ', 'CC', '1096206742', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'jennexyardila@gmail.com', '2016-01-18', '2024-09-17', 1300000.00, '162000', 'ab802a2f15afef0ce55840a8d7dc8df0', NULL),
(92, 'Trillos Rodriguez Diana Cecilia', 'CC', '28483928', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'dianatrillos01@gmail.com', '2022-06-26', '2024-06-25', 1300000.00, '162000', '1c230d27557020948d8d289390f113a9', NULL),
(93, 'Torres Florez Liney', 'CC', '1096184752', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'torresolvidonaliney@gmail.com', '2024-02-06', '2024-05-05', 1300000.00, '162000', '6947b9d6991d0b50db98eacf76866fe4', NULL),
(94, 'Vargas Polanco Lisbey Valentina', 'CC', '1005178252', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'vv4253106@gmail.com', '2023-09-06', '2024-06-05', 1300000.00, '162000', '4ec7ba22d1df6bb306d8addc9d53b7a9', NULL),
(95, 'Villarreal Murillo Jessica Paola', 'CC', '1096240193', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'paovillareal15@gmail.com', '2019-11-25', '2024-11-24', 1300000.00, '162000', 'ca1bed2ac3325390d9871aea0d619e65', NULL),
(96, 'Vivero Rojas Sarai Susana', 'CC', '1098790887', 'Bucaramanga', 'Auxiliar de Enfermeria', 'sarai_vevero@hotmail.com', '2017-11-18', '2025-07-17', 1300000.00, '162000', 'b6ba92a0209a73501188b4abe3de21eb', NULL),
(97, 'Zarate Peñaloza Diana Margarita', 'CC', '37575601', 'Barrancabermeja', 'Auxiliar de Farmacia / Auxiliar Administrativo en Salud', 'dimarzarate@hotmail.com', '2012-09-01', '0000-00-00', 1300000.00, '162000', 'f97a1ab2ef6dffacce1f2facff6cf465', NULL),
(98, 'Arciniegas Gutierrez Irene', 'CC', '1095828558', 'Floridablanca', 'Auxiliar de Facturación', 'irene30151@hotmail.com', '2021-12-17', '2024-12-16', 1563200.00, '162000', 'e169949d3054692ea87bb2f9924efba9', NULL),
(99, 'Morales Bustos Maria Constanza', 'CC', '37581006', 'Barrancabermeja', 'Recepcionista ', 'mavilu14@gmail.com', '2015-09-01', '2024-09-29', 1563200.00, '162000', '04c23c7e12e666f93e797347040b0847', NULL),
(100, 'Jimenez Bohorquez Jenifer', 'CC', '1104125376', 'Puerto Wilches', 'Auxiliar de Farmacia', 'jeniferjimenez86@hotmail.com', '2023-10-01', '2024-06-30', 1300000.00, '162000', 'faa62a6a06a3418f9dc483b081483461', NULL),
(101, 'Ardila Plata Edgar', 'CC', '91234538', 'Bucaramanga', 'Mantenimiento', 'plataardilaedgar@mail.com', '2017-01-02', '2024-09-29', 1563200.00, '162000', 'ed5b678f889cd9abbf6403ccd868679b', NULL),
(102, 'Navarro Forero John Jairo', 'CC', '91157025', 'Floridablanca', 'Tecnico en Refrigeracion y Mantenimiento', 'jojanaf1976@yahoo.es', '2018-10-01', '2024-09-29', 1390500.00, '162000', 'd1ee95d15af5d93cbac25f18c118841f', NULL),
(103, 'Prada Rodriguez Domingo', 'CC', '91204679', 'Bucaramanga', 'Mantenimiento', 'domingoprada192@mail.com', '2017-05-02', '2025-01-01', 1431000.00, '162000', 'bb107bb6238f8c98e5ad3ebd454724d6', NULL),
(104, 'Rodelo Otalvarez Israel', 'CC', '13889827', 'Barrancabermeja', 'Mantenimiento', 'israelrodelo109@mail.com', '2018-04-16', '1900-01-00', 1390500.00, '162000', '29ef575026e6ee7748593dd494d726a0', NULL),
(105, 'Reinel Espinosa Leidi Johana', 'CC', '1127946484', 'Venezuela', 'Axiliar Servicios Generales', 'johanareinel1985@gmail.com', '2023-08-04', '2024-05-03', 1300000.00, '162000', 'e84e39b4c78ac51c5020238d8a075d0f', NULL),
(106, 'Rodriguez Villarreal Ely Johana', 'CC', '1085043771', 'El Banco', 'Axiliar Servicios Generales', 'ely50334@gmail.com', '2021-11-13', '2024-11-12', 1300000.00, '162000', '6cc3b5f4491569e218b26137d86f062e', NULL),
(107, 'Soteldo Silva Irma Pastora', 'PPT', '6277808', 'Bogotá D.C.', 'Axiliar Servicios Generales', 'soteldoirmapastora@gmail.com', '2023-09-27', '2024-06-26', 1300000.00, '162000', '928fa510058c007cc5b54e590ea35b65', NULL),
(108, 'Soto Cosme Gladys Amparo', 'CC', '65709031', 'Espinal', 'Axiliar Servicios Generales', 'sotogladys292@gmail.com', '2017-09-02', '2024-05-01', 1300000.00, '162000', '3a62862a6ebbc7a42f48d78eb148cca2', NULL),
(109, 'Tarifa Sierra Yeimy Estefany', 'CC', '1096223804', 'Barrancabermeja', 'Axiliar Servicios Generales', 'yeimytarifa628@gmail.com', '2022-11-22', '2024-11-21', 1300000.00, '162000', '7fe86d96464205446fab86946e6b5d7e', NULL),
(110, 'Uribe Gomez Rosabel', 'CC', '28488237', 'Barrancabermeja', 'Axiliar Servicios Generales', 'rosabel1@gmail.com', '2023-09-14', '2024-03-13', 1300000.00, '162000', 'bf0f1cd78c94ad8b4f00d63a7ff8f352', NULL),
(111, 'Acero Zuluaica Emilsen', 'CC', '28020971', 'Barrancabermeja', 'Axiliar Servicios Generales', 'edidelar16@gmail.com', '2021-12-17', '2024-12-16', 1300000.00, '162000', '22d0d2bbddcc602f6f076b058cbb4ac5', NULL),
(112, 'Cala Rincon Sandra Milena', 'CC', '1096195183', 'Barrancabermeja', 'Axiliar Servicios Generales', 'sandramilena01@gmail.com', '2021-12-08', '2024-12-07', 1300000.00, '162000', '38e053f6b3f785beea32324e5fa53548', NULL),
(113, 'Gaviria Isaza Liliana Andrea', 'CC', '1042210359', 'Barrancabermeja', 'Axiliar Servicios Generales', '', '2018-07-18', '2024-05-09', 1300000.00, '162000', '22dcb77ff87fcd3a9fd1b9e55736f1eb', NULL),
(114, 'Gonzalez Medina Yesenia', 'CC', '28216596', 'Landázuri', 'Axiliar Servicios Generales', 'yeseniamedina72@gmail.com', '2017-12-27', '2024-08-26', 1300000.00, '162000', '2650eec1234d61d69a6977738b903b0e', NULL),
(115, 'Lindado Tovar Maria Concepción', 'CC', '63456650', 'Barrancabermeja', 'Axiliar Servicios Generales', 'marcolin1970@gmail.com', '2012-09-01', '2024-09-29', 1300000.00, '162000', '6d9912a65fdde0632b05ea7b0b08bba3', NULL),
(116, 'Martinez Madrid Yanith', 'CC', '63514714', 'Bucaramanga', 'Axiliar Servicios Generales', 'cleidermartinez2017@gmail.com', '2022-01-18', '2025-01-17', 1300000.00, '162000', 'd472dc57cc3a4adf75d3dcf3b20b09d7', NULL),
(117, 'Martinez Mora Yesenia', 'CC', '1096206351', 'Barrancabermeja', 'Axiliar Servicios Generales', 'yesemm1990@gmail.com', '2021-12-08', '2024-12-07', 1300000.00, '162000', '2970970746dc99a0aed79dc49aac63f2', NULL),
(118, 'Moncada Herrera Nohemy', 'CC', '28070062', 'Barrancabermeja', 'Axiliar Servicios Generales', 'moncadaherreranohemi@gmail.com', '2021-12-23', '2024-12-22', 1300000.00, '162000', '69168fb35081133ef501a69602adae62', NULL),
(119, 'Parada Arrieta Yaneth', 'CC', '51884551', 'Bogotá D.C.', 'Axiliar Servicios Generales', 'paradayaneth78@gmail.com', '2017-11-18', '2024-09-17', 1300000.00, '162000', 'f0990402e35f0c65c01f1cda0138fef4', NULL),
(120, 'Perdomo Montoya Angie Lisseth', 'CC', '1096249489', 'Barrancabermeja', 'Axiliar Servicios Generales', 'angielissethperdomo@gmail.com', '2022-05-14', '2024-05-13', 1300000.00, '162000', '8659c55394324da2049b18ddf854ebfd', NULL),
(121, 'Castro Navarro Freddy Alexander', 'CC', '1005220708', 'Barrancabermeja', 'Auxiliar de Sistemas', 'freddyalexandercastronavarro@gmail.com', '2023-07-11', '2024-02-10', 0.00, '162000', 'e9025af31f252e3623cfdf72fd34098c', NULL),
(122, ' Diaz Fonseca Sergio Andres', 'CC', '1073691033', 'Soacha', 'Auxiliar de Sistemas', '26081991sergiodiaz@gmail.com', '2022-02-05', '2025-02-04', 1484000.00, '162000', 'c2a9daee162725f096607fbfb5917023', NULL),
(123, ' Angarita Galvis Wilson', 'CC', '8748707', 'Barranquilla', 'Conductor', 'wilson_angarita10@hotmail.com', '2022-12-03', '2024-12-02', 1596018.00, '162000', 'be537f7d2419679868bc9ef589cc1b7a', NULL),
(124, 'Cardona Perez Magliony', 'CC', '91299008', 'Bucaramanga', 'Conductor', 'maglionyc@hotmail.com', '2020-03-01', '2024-10-30', 1300000.00, '162000', '8ddb4c23c8caf394cb83bd336eea6f33', NULL),
(125, ' Cardona Perez Leonel', 'CC', '91437567', 'Bucaramanga', 'Conductor', 'l.cardona7@outlook.com', '2020-09-01', '2025-02-28', 1300000.00, '162000', '652ff8c08bc860608aaf165697784f52', NULL),
(126, ' Diaz Hernandez Jeisson Javier', 'CC', '1096247013', 'Barrancabermeja', 'Conductor', 'jeylisaray20@gmail.com', '2023-09-29', '2024-01-28', 0.00, '162000', '79f5b226bdda3d3c0a9344ea47c3b3ed', NULL),
(127, ' Fonseca Ardila Jhon Jairo', 'CC', '13852529', 'Barrancabermeja', 'Conductor', 'jo628234@gmail.com', '2024-01-18', '2024-04-17', 1300000.00, '162000', 'c33a27a0b2b4b2f671af145a6fecd5d2', NULL),
(128, '  Esparza Benavides Juan Carlos', 'CC', '1096205483', 'Barrancabermeja', 'Auxiliar Contable / Cartera y Contratacion / Contador', 'juank.910@hotmail.com', '2019-12-02', '2024-12-01', 3261000.00, NULL, '916c43a2fada1369128b1a343554c64f', NULL),
(129, 'Cajar Rojas Jerson', 'CC', '1002448582', 'Barrancabermeja', 'Control Cliente Intero y Externo', 'jersoncajar385@gmail.com', '2022-03-17', '2024-03-16', 1300000.00, '162000', 'fe262ef751efdeb0510335576965e8ce', NULL),
(130, 'Montes Vargas Alexys Daniel', 'CC', '1096230128', 'Barrancabermeja', 'Control Cliente Intero y Externo', 'alex1994.danilo@gmail.com', '2023-10-01', '2024-06-30', 1300000.00, '162000', 'a62dff1ddf27c2596efce26f8182f7e1', NULL),
(131, 'Quintero Echavarria Alexis', 'CC', '91158135', 'Floridablanca', 'Control Cliente Intero y Externo', 'crisvaldu78@hotmail.com', '2016-07-01', '2025-02-28', 1300000.00, '162000', '47149a666da6cc3bbd147f66ae8e876c', NULL),
(132, ' Rincon Arrieta Jesus Hernando', 'CC', '5594221', 'Barrancabermeja', 'Control Cliente Intero y Externo', 'rinconjesus802@gmail.com', '2024-01-13', '2024-04-12', 1300000.00, '162000', '5951b1f71034dfd417c86740321cc852', NULL),
(133, ' Torres Alcocer Humberto', 'CC', '91326952', 'Puerto Wilches', 'Control Cliente Intero y Externo', 'elconde_685@hotmail.com', '2019-08-01', '2025-03-30', 1300000.00, '162000', '0b8c9365f7579a616596131718c3f0f5', NULL),
(134, ' Ulloque Diaz Julio Alberto', 'CC', '1096226650', 'Barrancabermeja', 'Control Cliente Intero y Externo', 'julioulloque800@gmail.com', '2020-02-13', '2024-02-12', 1300000.00, '162000', '8bf8585fa9cded83df88608838094cf9', NULL),
(135, ' Carrillo Lizarazo Sandra Milena', 'CC', '1096226735', 'Barrancabermeja', 'Coordinador Sistema de Gestion De Seguridad y Salud en el Trabajo', 's.carriliza@gmail.com', '2023-08-01', '2024-04-30', 1860000.00, '162000', '0faa5dfa147461a919184110f87da811', NULL),
(136, ' Angarita Madera Silvia Carolina', 'CC', '1098725992', 'Bucaramanga', 'Coordinador Siau', 'silviangaritam29@gmail.com', '2019-04-09', '2024-08-08', 1780600.00, '162000', '841cafc57fc4aa010be219ed8b318e52', NULL),
(137, ' Zapa Plata Indira Marcela', 'CC', '37579548', 'Barrancabermeja', 'Enfermera Profesional', 'indimarce6@hotmail.com', '2023-07-04', '2024-07-03', 3261000.00, NULL, '5f11a6eb1f2d3d1c2664f79a6be633dd', NULL),
(138, ' Villada Parada  Rooderi', 'CC', '63474273', 'Barrancabermeja', 'Auxiliar Administrativa en Salud', 'rooderivillada@gmail.com', '2018-10-01', '1900-01-00', 2006000.00, '162000', 'c4297bb997ed7774317a323eba9af27e', NULL),
(139, ' Ballesteros Maria Del Pilar', 'CC', '37933208', 'Barrancabermeja', 'Coordinadora de Facturación', 'mapiba04@hotmail.com', '2018-10-01', '2024-09-29', 1802000.00, '162000', '532fed423502e7edc7653c50ed1e3375', NULL),
(140, 'Rodirguez Maldonado Miguel', 'CC', '1098683695', 'Bucaramanga', 'JEFE P&P', 'miguelenf 7@gmail.com', '2021-06-11', '2024-06-09', 2544000.00, '162000', '99457bf770fa62f893c346cbad582982', NULL),
(141, ' Pineda Rangel Valentina', 'CC', '1000156250', 'Barrancabermeja', 'Coordinador de Calidad / Medico General Servicio Social Obligatorio (S.SO)', 'valentinapineda1105@gmail.com', '2023-07-28', '2024-07-27', 3804400.00, NULL, 'bb1dfb11882463cac07ce37edcd1e2e5', NULL),
(142, ' Quintero Vega Juan Carlos', 'CC', '1000502202', 'Bogotá D.C.', 'Gerente / Medico General Servicio Social Obligatorio (S.SO)', 'juank1499@hotmail.com', '2023-07-28', '2024-07-27', 3804400.00, NULL, '159ee157f52e90981a13041e31cfb52b', NULL),
(143, ' Vega Diaz Rosalba', 'CC', '52411709', 'Bogotá D.C.', 'Director Tecnico Del Servicio  Farmaceutico', 'rosavegadiaz@hotmail.com', '2017-08-14', '2024-08-13', 2717400.00, NULL, '3d44d34651710a66099179583c1ba2f1', NULL),
(144, 'Leal Lina Liseth', 'CC', '1096237677', 'Barrancabermeja', 'Auxiliar En Glosas', 'lina.leal6@gmail.com', '2022-03-24', '2025-03-23', 1470000.00, '162000', '832afe860c685019f3e079aa2b01f95f', NULL),
(145, 'Sepulveda Arenilla Silvia Juliana', 'CC', '1098719181', 'Bucaramanga', 'Rr Hh', 'julianasa0392@gmail.com', '2023-10-10', '2024-01-09', 1454400.00, '162000', 'd213d40d71d20808d72f9135e22b36fb', NULL),
(146, '  Machacon Cantillo Brayan Antonio', 'CC', '1042973665', 'Manatí', 'Tecnologo En Radiología E imagenes Diagnosticas', 'briam0109@gmail.com', '2023-11-01', '2024-04-30', 2811774.00, NULL, 'de141e3b3f1a6a12124763e780002dc3', NULL),
(147, ' Arango Mahecha Emenso Manuel', 'CC', '1065627681', 'Valledupar', 'Tecnologo En Radiología E imagenes Diagnosticas', 'he.chief@hotmail.com', '2023-05-23', '2024-02-22', 0.00, '162000', '0c12a987eb12f15574dc8578c0c44782', NULL),
(148, ' Chamorro Abdo Julio Carlos', 'CC', '1143453455', 'Barranquilla', 'Tecnologo En Radiología E imagenes Diagnosticas', 'julio_abdo13@hotmail.com', '2018-01-16', '2024-09-15', 2811774.00, NULL, '8460af703b8cc57e760ee145fe7e66a2', NULL),
(149, ' Ortiz Arias Nando Farid', 'CC', '1001865654', 'Barranquilla', 'Tecnologo En Radiología E imagenes Diagnosticas', 'nandoortizarias@gmail.com', '2021-03-15', '2024-03-14', 0.00, '162000', 'a837ab78243b180d38566e3715cd2ae0', NULL),
(150, ' Sierra Fragozo Jose Carlos', 'CC', '1122817107', 'Barrancas', 'Tecnologo En Radiología E imagenes Diagnosticas', 'josecarlo05@hotmail.com', '2020-03-01', '2025-02-28', 2811774.00, NULL, 'a394993f6ff921b1ceb60159db205ad4', NULL),
(151, 'Niebles Sandoval Juan Aldair', 'CC', '1042451314', 'Soledad', 'Tecnologo En Radiología E imagenes Diagnosticas', 'Jans-_1994 @hotmail.com', '2024-02-01', '2024-04-30', 2811774.00, NULL, 'fb71ae07bf507d17a8a94bbf94642a9f', NULL),
(152, 'Noriega Silva Oriel', 'CC', '13850361', 'Barrrancabermeja', 'Enfermero', 'orielnoriegaSilva@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '5bdda1af30f3977e5790b9a3d7a1aeb3', NULL),
(153, 'Caceres Morillo Gloria Xiomara', 'CC', '63462822', 'Barrancabermeja', 'Enfermero', 'gloriaxc@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'dbdf8f39d4ea29711af41668d449ec1f', NULL),
(154, 'Pedrozo Castro Katherine Andrea', 'CC', '1098753213', 'Bucaramanga', 'Enfermero', 'castrokatherineandrea@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '84be48d2e7d443f87059159a6806209b', NULL),
(155, 'Morales Mujica Leidy Dariana', 'CC', '1096255515', 'Barrancabermeja', 'Enfermero', 'darianamm94@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '8ce42a29897a555bfa447456526b5d5c', NULL),
(156, 'Pava Leon Norleibis Andrea', 'CC', '1095788389', 'Floridablanca', 'Enfermero', 'norleibispava@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'cf12fb8753d7c47396a4f79d08932a8c', NULL),
(157, 'Lopez Quintero Yezenia', 'CC', '1095804048', 'Floridablanca', 'Enfermero', 'yeze_lopez0312@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'a4c8e50ccf27af351195ff8628a2d2fb', NULL),
(158, 'Torres Ramirez Yiseth Maria', 'CC', '1098751469', 'Bucaramanga', 'Enfermero', 'yisethmaria@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '891647cf6fae6fd14739e5d9f42f5d36', NULL),
(159, 'Herazo Dean Mirlay', 'CC', '1042350535', 'Sabanagrande', 'Enfermero', 'Herazomirlay@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '24451c2b7f753b6108977baa31421d8e', NULL),
(160, 'Garcia Barragan Katherine', 'CC', '1096207465', 'Barrancabermeja', 'Enfermero', 'kate_2925@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '57be0b5b5b9b9c5ab3f5ff4e3027dd23', NULL),
(161, 'Ulloque Lopez Victor Andres', 'CC', '72297171', 'Barranquilla', 'Medico General', 'vaulaulg@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'bd0894097aee61dd4a28b5fac3b7b257', NULL),
(162, 'Galvan Mena Angel Mauricio', 'CC', '13850362', 'Barrancabermeja', 'Medico General', 'angelgalvanmena@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '4c567787f1e8f52afcfca03a2486d4bf', NULL),
(163, 'Alcalde Duran Eliander Ysbel', 'CC', '1232594416', 'Venezuela', 'Medico General', 'alcaldeeliander@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '37ce4ee46adee59eb18928699a603e81', NULL),
(164, 'Mora Osuna Francisco Javier', 'PPT', '5361780', 'Bogotá D.C.', 'Medico General', 'fran01mora@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '894b8ee46560c2c846a1002bd42ef500', NULL),
(165, 'Briceño Hernandez Genesis Marianny', 'PPT', '1172904', 'Bogotá D.C.', 'Medico General', 'bricenogenesis333@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '1ac512f4406879079d7f066924b0e8bd', NULL),
(166, 'Piñero Fernandez Irian', 'PPT', '5486047', 'Bogotá D.C.', 'Medico General', 'irianpf@yahoo.es', '0000-00-00', '0000-00-00', 0.00, NULL, '5f2a40cfc727369340f22468fa5f27bf', NULL),
(167, 'Pico Villamizar Lenin', 'CC', '1092016069', 'Cúcuta', 'Medico General', 'lenin_pico@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'afa11fa7187e94bc34a83748f2c628ba', NULL),
(168, 'Valdes Iznaga Reinaldo ', 'CE', '511066', '', 'Medico General', 'rey9791abuc@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '0ee8f9f4319721f08110381190b293a7', NULL),
(169, 'Rico Sanchez Stheffany Nichelle', 'PPT', '6584852', 'Bogotá D.C.', 'Medico General', 'steheffanymichelle23@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '6889a61fc60afd37be93582a775fb165', NULL),
(170, 'Diaz Hoyos Victor Manuel ', 'PPT', '3770945', 'Bogotá D.C.', 'Medico General', 'drvictordiaz10@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '1dab14de99b0fd34be02942e465183cd', NULL),
(171, 'Cegarra Henriquez Yaimerlis Victoria', 'PPT', '4912245', 'Bogotá D.C.', 'Medico General', 'yail5685@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '2edd4e5e6f8d539a5466d85e945c943f', NULL),
(172, 'Hernandez Caceres Cesar', 'CC', '1098801612', 'Bucaramanga', 'Medico General', 'cesar-23-97@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'fc3b9294372eb9428af24c595fb4e76b', NULL),
(173, 'Guette Herrera Ligia Elena', 'CC', '22699249', 'Suan', 'Medico General', 'makabra1809@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '6e31a6705b21bef47784a9a70fcff0e5', NULL),
(174, 'Arrieta Hernandez Delfida Maria', 'CC', '1096202701', 'Barrancabermeja', 'Medico General', 'drdelfidarrieta42@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '3d65ae809f82c3300e6b1179ff99c40b', NULL),
(175, 'Palacio Cobo Jeferson Andres', 'CC', '1042978390', 'Manatí', 'Medico General', 'jefer9707@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'c6d6c3badb05ba961a5ac244c01cc2c5', NULL),
(176, 'Cepeda Nieto Erick Luis', 'CC', '1045750861', 'Barranquilla', 'Medico General', 'ERICK.CEPEDA@HOTMAIL.COM\n', '0000-00-00', '0000-00-00', 0.00, NULL, 'b00169e6fe028ed66d937902d01a3013', NULL),
(177, 'Ospina Arrieta Edilsa Esther', 'CC', '1140839346', '', 'Medico General', 'Edilsaospino0426@hotmail.com ', '0000-00-00', '0000-00-00', 0.00, NULL, '830a22cbde88df753949096ce0ba8157', NULL),
(178, 'Romero Torres Luis Alfredo', 'CC', '1083011299', 'Santa Marta', 'Medico General', 'alfredoromerot.medicoucc@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '35c9e914076d4807b071c869b03a573f', NULL),
(179, 'Marrugo Perez Adan Del Cristo', 'CC', '9263298', 'Mompós', 'Especialista en Gastroenterologia', 'adandelcristo@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '6ed591648903afb83fd1783c33b4ff0e', NULL),
(180, 'Cardenas Peluffo Alberto Ignacio', 'CC', '73434151', 'El Carmen de Bolívar', 'Especialista En Urologia', 'Alberto_cardenasl0@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '05273451c06eb1c4ca484d510d034507', NULL),
(181, 'Mujica Reyes Gustavo Adolfo', 'CC', '91440768', '', '', '', '0000-00-00', '0000-00-00', 0.00, NULL, 'bfc558505e34d68bfc97ab1ba7cea34a', NULL),
(182, 'Oropeza Leon Ana Andreina', 'CE', '571514', '', 'Especialista En pediatria', 'ana.oropezaleon@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '15e37e4fbf8d4444cbe4a5d827855211', NULL),
(183, 'Viveros Suarez Sara Esther', 'CC', '1126254360', 'Venezuela', 'Especialista En pediatria', 'saraviveros1@yahoo.com', '0000-00-00', '0000-00-00', 0.00, NULL, '4bb75c1be11d3a09a2748a2f105c6475', NULL),
(184, 'Verbel Perez Ana de Jesus', 'CC', '37933464', 'Barrancabermeja', 'Tecnologo en Terapia respiratorio', 'ana19verbel@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'd5348ee0755f42eecd9aebc42ff6890a', NULL),
(185, 'Meyendorrff Muñoz Cindy Belkis', 'CC', '1090415764', '', 'Radiologia', 'meyendorff88@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '78b582cc4a64c9a32c9e897882c67747', NULL),
(186, 'Gonzalez Salcedo Yesenia', 'CC', '1098604254', 'Bucaramanga', 'Radiologia', 'yesegonza@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '1eb4c5eb84bd0cd721979692fa96af0b', NULL),
(187, 'Echeverri Villa  Lina Maria', 'CC', '1088241164', 'Pereira', 'Radiologia', 'linamariaev@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'aa7233f2b5a9baf5bd3a31bbe9ebab68', NULL),
(188, 'Zurita Cano Jairo Rafael', 'CC', '80422009', 'Bogotá D.C.', 'Radiologia', 'jairozurita@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '2f09928fb6dcc93bc80d08ba134d0274', NULL),
(189, 'Camargo Rivera Eliseo', 'CC', '91291375', 'Bucaramanga', 'Especialista Medicina Interna', 'coordinadorsantander@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '4fab6c67aabd0bd60d55c9e3a4160c65', NULL),
(190, 'Antunez Garcia Moraima Lisette', 'CC', '1098825089', 'Santiago', 'Especialista Medicina Interna', 'dramorita2909@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'bcef70192fad678ffdf3c9277fb1cba8', NULL),
(191, 'Herrera Diaz Helen Beatriz', 'CC', '1129508804', 'Barranquilla', 'Especialista Nutricionista Dietista', '', '0000-00-00', '0000-00-00', 0.00, NULL, '8daeb153b3719ae49022aca4444bdbe2', NULL),
(192, 'Gutierrez Rodriguez Iader', 'CC', '91431010', 'Barrancabermeja', 'Quimico Farmaceutico', 'igurod@yahoo.es', '0000-00-00', '0000-00-00', 0.00, NULL, 'ff8abd0c3b2f5af5581e2f936f230898', NULL),
(193, 'Galeano Zambrano Janio', 'CC', '91441185', 'Barrancabermeja', 'Especialista Fonoaudiologia', 'jgaleano2010@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '93bb6119f0f0c419ff0d33d9cc9558e8', NULL),
(194, 'Vergara Duran Jose Alfredo', 'CC', '1118805562', 'Riohacha', 'Especialista en Ortopedia', 'josevergara1286@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'c2eec868fa58c39c4f137ad15e65aece', NULL),
(195, 'Vertel Jaramillo Ramon Jose', 'CC', '1098630185', 'Bucaramanga', 'Especialista en Ortopedia', 'Ramonvertel@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '1a5b9a35823bc1595e54449a640f9aac', NULL),
(196, 'Lara Alvarez Jose Antonio', 'CC', '13893714', 'Barrancabermeja', 'Especialista en Ginecologia y Obstetricia', 'laraantoni@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '283f065083288a7b78a67312e71b518d', NULL),
(197, 'Bernal Garcia Juan Carlos ', 'CC', '79557921', 'Bogotá D.C.', 'Especialista en Ginecologia y Obstetricia', '', '0000-00-00', '0000-00-00', 0.00, NULL, 'b4fc963db8b8e4d22a5f40669527822f', NULL),
(198, 'Silva Villamil Jose Tomas', 'CC', '13511603', 'Bucaramanga', 'Especialista en Cirugia General', 'drjosetom24@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '58f0fbb403d85faa98333529e0507c0a', NULL),
(199, 'Carrillo Villamizar Luisana Marina', 'CC', '1094288705', 'Pamplona', 'Especialista en Cirugia General', 'luisanacarrillo1201@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'c9e3fbc3aeaf8223b3165db8e20300b5', NULL),
(200, 'Velasquez Parra Milena Pastora', 'CC', '1128266140', 'Medellín', 'Especialista en Dermatologia', 'milev@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '1765824ed1b42ad2c19651eda85170da', NULL),
(201, 'Amaya Montero Maria Rosa', 'CC', '56098387', 'Villanueva', 'Especialista en Anetesiologia', 'maryn0611@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'ad7d5565949f5e664f1408052699f79c', NULL),
(202, 'Mendoza Cuello Harolt Andres', 'CC', '5166077', 'San Juan del Cesar', '', 'harolthmendoza@gmail.co', '0000-00-00', '0000-00-00', 0.00, NULL, '68076c64ba48ec1469f32bae5394f90c', NULL),
(203, 'Rojas Porras Leonardo Alcides', 'CC', '91449321', 'Barrancabermeja', 'Ingeniero Electronico', 'lealropo126@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '8fb1c070e02c4b97bccc179d08e93840', NULL),
(204, 'Montoya Ardila Magda Lorena', 'CC', '52425816', 'Bogotá D.C.', 'Bacteriologa', 'lorenamontoya0509@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '14e1e6ccadcd88b4e33c2d829b81d9bf', NULL),
(205, 'Mejia Ortega Yomara Isabel', 'CC', '37577938', 'Barrancabermeja', 'Bacteriologa', 'isabelita3912@hotmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '236ebe5024cb9a3b5024da0875c4711f', NULL),
(206, 'Duran Pastrana Maria Camila', 'CC', '1098683815', 'Bucaramanga', 'Bacteriologa', 'cammiduran@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'bd869faec75158ba16c5dae5b120346a', NULL),
(207, 'Cardenas Garcia Paola Ines', 'CC', '1140901000', 'Barranquilla', 'Instrumentadora Quirurgica', 'paolac22@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'e23fc663e9aa6bf630ba0c65dd5462e2', NULL),
(208, 'Solano Pinto Yelitza Maria', 'CC', '26985525', 'Barrancabermeja', 'Instrumentadora Quirurgica', '', '0000-00-00', '0000-00-00', 0.00, NULL, '01198a708d125dea24b93018a6f2de2f', NULL),
(209, 'Duarte Rodriguez Alexa Andrea', 'CC', '1098790537', 'Bucaramanga', 'Fisioterapeuta', 'aduarodriguez@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, 'd088da702f5583572123e498339a4d98', NULL),
(210, 'Jimenez Pedrozo Javier', 'CC', '79424006', 'Bogotá D.C.', 'Optometria', '', '0000-00-00', '0000-00-00', 0.00, NULL, 'f8e54d07a75ddbd3ab7d914fe0bfe0c7', NULL),
(211, 'Garcia Herrera Juan Carlos ', 'CC', '91426595', 'Barrancabermeja', 'Cirujano Oral', 'juan.ka0715@gmail.com', '0000-00-00', '0000-00-00', 0.00, NULL, '12d3ec765d1ab2a2f288fd9cc2b7b539', NULL),
(212, 'Parra Baron Jesus David', 'CC', '1093889256', 'Salazar', 'Cardiologo', 'JDCARDIO.23@GMAIL.COM', '0000-00-00', '0000-00-00', 0.00, NULL, 'f91777cc58bca431d78a8f34cb26f3ba', NULL),
(213, 'Salazar Guerra Kenner Andres', 'CC', '1096254989', 'Barrancabermeja', 'Auxiliar de Sistemas', 'kenner072009@hotmail.com', '2024-02-12', '2024-05-11', 1300000.00, '162000', '60b19ca31d9d04226c87dead99824944', NULL),
(214, 'Cardenas Delgado Mery Johana', 'CC', '37899487', '', 'Axiliar Servicios Generales', 'merycardenas1980@gmail.com', '2024-02-07', '2024-05-06', 1300000.00, '162000', '524b5d46aed823ba1cef24f1f7c03573', NULL),
(215, 'Salcedo Muñoz Yeni Paola', 'CC', '37581430', 'Barrancabermeja', 'Axiliar Servicios Generales', 'yenisdalcedo67@gmail.com', '2024-02-24', '2024-05-23', 1300000.00, '162000', '51b8515236b93ac6b48cfaf08efb3518', NULL),
(216, ' acome Gelves Rosa Angelica', 'CC', '1096235560', 'Barrancabermeja', 'Recepcionista', 'anjage2425@hotmail.com', '2024-02-05', '2024-05-04', 1300000.00, '162000', '8a69d49b71aa9bd9ae8afd5b58d1243e', NULL),
(217, 'Romero Orozco Mariana Alejandra', 'CC', '1005183263', 'Barrancabermeja', 'Recepcionista', 'marianaalejandraromeroorozco@gmail.com', '2024-02-16', '2024-05-15', 1300000.00, '162000', 'a1faff24bf1906dffba6f6e952b8d537', NULL),
(218, 'Camelo Pereira Ana Mileidy', 'CC', '1005190625', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'mileidyspereira71@gmail.com', '2024-03-01', '2024-05-30', 1300000.00, '162000', 'f271cfb37650424c41a11035f1ba644a', NULL),
(219, 'Orozco Hernandez Gerardo Anibal', 'CC', '13570159', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'enfermeriaenaccion2018@gmail.com', '2024-03-01', '2024-05-30', 1300000.00, '162000', '33712446fe67062cd3a09a5c8dbf24fc', NULL),
(220, 'Molina Duran Emerson Danilo', 'CC', '13567010', 'Barrancabermeja', 'Conductor', 'edanilomolina@hotmail.com', '2024-03-01', '2024-05-30', 1300000.00, '162000', '07aa7b689508b63f37fda21638d4647d', NULL),
(221, 'Vargas Forero Gladys', 'CC', '37844130', 'Bucaramanga', 'Axiliar Servicios Generales', 'gvargasforero@gmail.com', '2024-03-05', '2024-06-04', 1300000.00, '162000', '311b8821538d65c5aaf17a6bdfbbc1f6', NULL),
(222, 'Rodriguez Hinestroza Danis Jurely', 'CC', '1096235963', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'danisyrh_2016@hotmail.com', '2024-03-12', '2024-06-11', 1300000.00, '162000', '0e72f0e7f9bd967e4cadb510193d21aa', NULL),
(223, 'Diaz Cardona Erika', 'CC', '1005186404', 'Barrancabermeja', 'Axiliar Servicios Generales', 'erikadiazcardona20@gmail.com', '2024-03-08', '2024-06-07', 1300000.00, '162000', '157ef79588a5964bd4d3dadb8c2bdf37', NULL),
(224, 'Martinez Esteban Erly Tatiana', 'CC', '1005178868', 'Floridablanca', 'Axiliar Servicios Generales', 'martineztatiana766@gmail.com', '2024-03-05', '2024-06-04', 1300000.00, '162000', '9796c5394c019fabe889c8fb17a20998', NULL),
(225, 'Monsalve Osorio Maria Luisa', 'CC', '1096200316', 'Barrancabermeja', 'Axiliar Servicios Generales', 'hcbangelitos21@gmail.com', '2024-03-13', '2024-06-12', 1300000.00, '162000', '875e17c83ae979db1c816aa2a5ff349a', NULL),
(226, 'Perez Barragan Maria Del Carmen', 'CC', '1103672683', 'Puerto Parra', 'Auxiliar de Enfermeria', 'mariperezb001@gmail.com', '2024-03-20', '2024-06-19', 1300000.00, '162000', 'd3d2de1663360c0995692748817e496a', NULL),
(227, 'Macia Diaz Isaac', 'CC', '1005182523', 'Barrancabermeja', '', 'isaac13890640@gmail.com', '0000-00-00', '1900-03-30', 1300000.00, '162000', 'c8b45a94fa221e36599c5392a15eb770', NULL),
(228, 'Lopez Alfonzo Deisy Tatiana', 'CC', '1005272044', 'Barrancabermeja', 'Auxiliar de Enfermeria', 'tl563136@gmail.com', '2024-04-01', '2024-06-30', 1300000.00, '162000', 'caa75da339655d041d4dc7209d90b3d8', NULL),
(229, 'Rodriguez Fierro Dayana del  Carmen', 'CC', '1080570221', 'Plato', 'Auxiliar Contable', 'rodriguezfierrodayana@mail.com', '2024-04-01', '2024-06-30', 1300000.00, '162000', '454b3de4f5cc767aef20f003802fcabc', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` varchar(50) DEFAULT NULL,
  `contraseña_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_documento`, `contraseña_hash`) VALUES
(1, 'admin', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
