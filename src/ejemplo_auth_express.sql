-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2023 at 09:01 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ejemplo_auth_express`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcargo`
--

CREATE TABLE `tblcargo` (
  `codigo` int NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcargo`
--

INSERT INTO `tblcargo` (`codigo`, `nombre`) VALUES
(1, 'Barbero principal'),
(2, 'Barbero asistente'),
(3, 'Recepcionista'),
(4, 'Estilista'),
(5, 'Barbero especializado en afeit');

-- --------------------------------------------------------

--
-- Table structure for table `tblcliente`
--

CREATE TABLE `tblcliente` (
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `PASSWORD` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcliente`
--

INSERT INTO `tblcliente` (`documento`, `nombre`, `apellido`, `correo`, `telefono`, `PASSWORD`) VALUES
('1038416890', 'Miguel', 'Isaza', 'migaisaza@hotmail.com\r\n', '6100645', 'ea260f0d0d196a0cacbbc72ed57e42f4'),
('112233', 'Paulina', 'Isaza', 'pauisazaa@hotmail.com\r\n', '610064554', 'c025396523b3d63bf031cba708b9dd32'),
('123456789', 'Juan', 'Pérez', 'juan@example.com', '1234567890', 'f9aae05f813d18583d5a00b63ad5ac3b'),
('1357911', 'Juliana', 'Parra', 'juparra@hotmail.com', '321887543123', 'f8202d790d2bf56ceeff4de7c47b34cd'),
('2468246', 'Daniel', 'Giraldo ', 'Daniel@hotmail.com', '3218663222', '99d58b7b2342ed151a35bd00f5202ebf');

-- --------------------------------------------------------

--
-- Table structure for table `tblprofesional`
--

CREATE TABLE `tblprofesional` (
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `cargo` int NOT NULL,
  `experiencia` varchar(200) NOT NULL,
  `PASSWORD` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblprofesional`
--

INSERT INTO `tblprofesional` (`documento`, `nombre`, `apellido`, `telefono`, `correo`, `cargo`, `experiencia`, `PASSWORD`) VALUES
('1038416890', 'Estefania', 'Medina', '5481245', 'estefa12@gmail.com', 4, '4 años', '$2a$10$K3Yu1V9cBId31aprOC1K7eDplZfxB/d2UiUewaPOAMCGazYAuLJqe'),
('11345678', 'Mateo', 'Gómez', '5481434', 'Mate@gmail.com', 2, ' 5 años', 'fd5d5f2aa0bf00882695481590d8aae1'),
('123456789', 'Euripides', 'Gómez', '67781434', 'Euripides23@gmail.com', 4, ' 2 años', 'f744d52cd640871ab6e067f8fd32faad'),
('2030507060', 'Gilberto', 'Jaramillo', '32181434', 'Gilber87@gmail.com', 3, ' 2 años', '0945e0caa826d1ecc8b70fc2324ce1e5'),
('246246246', 'Fabiana', 'Montoya', '22334455', 'Fabianamon12@hotmail.com', 5, ' 4 años', '068c950b83ad0bf61ec782ecef6b3d42'),
('987654321', 'Jefferson', 'Pérez', '555-123-4567', 'juan@example.com', 1, '5 años de experiencia', '014436b6640304b2cfad8a43f4aaad1a');

-- --------------------------------------------------------

--
-- Table structure for table `tblventa`
--

CREATE TABLE `tblventa` (
  `codigo` int NOT NULL,
  `fecha` date NOT NULL,
  `cliente` varchar(15) NOT NULL,
  `tipopago` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblventa`
--

INSERT INTO `tblventa` (`codigo`, `fecha`, `cliente`, `tipopago`) VALUES
(4, '2023-05-29', '1038416890', 13),
(6, '2023-05-30', '112233', 12),
(7, '2023-05-30', '123456789', 15),
(8, '2023-05-29', '1357911', 15),
(9, '2023-06-12', '2468246', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcargo`
--
ALTER TABLE `tblcargo`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tblcliente`
--
ALTER TABLE `tblcliente`
  ADD PRIMARY KEY (`documento`);

--
-- Indexes for table `tblprofesional`
--
ALTER TABLE `tblprofesional`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `fk_tblprofesional_tblcargo` (`cargo`);

--
-- Indexes for table `tblventa`
--
ALTER TABLE `tblventa`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_tblventa_tblcliente` (`cliente`),
  ADD KEY `fk_tblventa_tbltipopago` (`tipopago`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcargo`
--
ALTER TABLE `tblcargo`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblventa`
--
ALTER TABLE `tblventa`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblprofesional`
--
ALTER TABLE `tblprofesional`
  ADD CONSTRAINT `fk_tblprofesional_tblcargo` FOREIGN KEY (`cargo`) REFERENCES `tblcargo` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
