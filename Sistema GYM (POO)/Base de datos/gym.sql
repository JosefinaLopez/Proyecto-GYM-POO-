-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2022 at 06:04 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividad`
--

CREATE TABLE `actividad` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `SalaId` int(4) NOT NULL,
  `HorarioId` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actividad`
--

INSERT INTO `actividad` (`Id`, `Nombre`, `Tipo`, `SalaId`, `HorarioId`) VALUES
(1, 'Musculacion', 'Deporte', 1, 1),
(2, 'Yoga', 'Libre', 3, 2),
(3, 'Natacion', 'Deporte', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  `EstadoClienteId` int(4) NOT NULL,
  `SucursalId` int(4) NOT NULL,
  `TarifaId` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`Id`, `Nombre`, `Apellido`, `Edad`, `Sexo`, `Contrasena`, `EstadoClienteId`, `SucursalId`, `TarifaId`) VALUES
(1, 'Josefina', 'Lopez', 19, 'F', '123456', 1, 1, 2),
(2, 'Danellson', 'Miranda', 19, 'M', '5465235', 1, 1, 2),
(3, 'Ariel', 'Perez', 21, 'M', '12345678', 2, 3, 1),
(4, 'Angela Maria', 'Cruz', 22, 'F', '123456', 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contrato`
--

CREATE TABLE `contrato` (
  `Id` int(4) NOT NULL,
  `FechaInicio` varchar(50) NOT NULL,
  `FechaFinal` varchar(50) DEFAULT NULL,
  `TarifaId` int(4) NOT NULL,
  `SucursalId` int(4) NOT NULL,
  `ClienteId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contrato`
--

INSERT INTO `contrato` (`Id`, `FechaInicio`, `FechaFinal`, `TarifaId`, `SucursalId`, `ClienteId`) VALUES
(1, '30/08/2020', NULL, 2, 1, 1),
(2, '20/08/2021', NULL, 2, 1, 2),
(3, '20/05/2020', '12/12/2021', 1, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Salario` double NOT NULL,
  `Ocupacion` text NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  `SucursalId` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`Id`, `Nombre`, `Apellido`, `Salario`, `Ocupacion`, `Contrasena`, `SucursalId`) VALUES
(1, 'Alex', 'Perez', 50000, 'Entrenador', '123469', 1),
(2, 'Juan', 'Ramos', 7000, 'Entrenador', '4546584', 3),
(3, 'Cristian', 'Lara', 8000, 'Administrador', '549523659', 1),
(4, 'Angel', 'Gaitan', 7800, 'Entrenador', '1234567', 1);

-- --------------------------------------------------------

--
-- Table structure for table `estadocliente`
--

CREATE TABLE `estadocliente` (
  `Id` int(4) NOT NULL,
  `NombreEstado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estadocliente`
--

INSERT INTO `estadocliente` (`Id`, `NombreEstado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `Id` int(4) NOT NULL,
  `Modalidad` varchar(50) NOT NULL,
  `Periodo` varchar(50) NOT NULL,
  `TarifaId` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horario`
--

INSERT INTO `horario` (`Id`, `Modalidad`, `Periodo`, `TarifaId`) VALUES
(1, 'Matutino', '7:00 a.m - 12:00 p.m', 2),
(2, 'Vespertino', '1:00 p.m - 5:00 p.m', 2),
(3, 'Mixta', '7:00 a.m - 5:00 p.m', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sala`
--

CREATE TABLE `sala` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `SucursalId` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sala`
--

INSERT INTO `sala` (`Id`, `Nombre`, `SucursalId`) VALUES
(1, 'Pesas', 2),
(2, 'Natacion', 1),
(3, 'Yoga', 3),
(4, 'Cardio', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sucursal`
--

CREATE TABLE `sucursal` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Ubicacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sucursal`
--

INSERT INTO `sucursal` (`Id`, `Nombre`, `Ubicacion`) VALUES
(1, 'GYM OLIMPO', 'Barrio Clase Alta'),
(2, 'GYM ', 'Barrio Clase Media'),
(3, 'GYM OMN', 'Barrio Clase Baja'),
(4, 'OLIMPIA', 'Barrio clase alta');

-- --------------------------------------------------------

--
-- Table structure for table `tarifa`
--

CREATE TABLE `tarifa` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio` double NOT NULL,
  `Descuento` varchar(30) NOT NULL,
  `FechaCompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarifa`
--

INSERT INTO `tarifa` (`Id`, `Nombre`, `Precio`, `Descuento`, `FechaCompra`) VALUES
(1, 'Plan Premium', 1000, '10%', '2012-07-12'),
(2, 'Plan Basico', 500, '0%', '2015-07-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SalaId` (`SalaId`),
  ADD KEY `HorarioId` (`HorarioId`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SucursalId` (`SucursalId`),
  ADD KEY `TarifaId` (`TarifaId`),
  ADD KEY `EstadoClienteId` (`EstadoClienteId`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `TarifaId` (`TarifaId`),
  ADD KEY `SucursalId` (`SucursalId`),
  ADD KEY `ClienteId` (`ClienteId`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SucursalId` (`SucursalId`);

--
-- Indexes for table `estadocliente`
--
ALTER TABLE `estadocliente`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `TarifaId` (`TarifaId`);

--
-- Indexes for table `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SucursalId` (`SucursalId`);

--
-- Indexes for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actividad`
--
ALTER TABLE `actividad`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `estadocliente`
--
ALTER TABLE `estadocliente`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `horario`
--
ALTER TABLE `horario`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sala`
--
ALTER TABLE `sala`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`SalaId`) REFERENCES `sala` (`Id`),
  ADD CONSTRAINT `actividad_ibfk_2` FOREIGN KEY (`HorarioId`) REFERENCES `horario` (`Id`);

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`SucursalId`) REFERENCES `sucursal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`TarifaId`) REFERENCES `tarifa` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`EstadoClienteId`) REFERENCES `estadocliente` (`Id`);

--
-- Constraints for table `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`TarifaId`) REFERENCES `tarifa` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`SucursalId`) REFERENCES `sucursal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrato_ibfk_3` FOREIGN KEY (`ClienteId`) REFERENCES `cliente` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`SucursalId`) REFERENCES `sucursal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`TarifaId`) REFERENCES `tarifa` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`SucursalId`) REFERENCES `sucursal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
