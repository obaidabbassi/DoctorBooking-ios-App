-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 09, 2023 at 04:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_doctor`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `AppointmentID` int(50) NOT NULL,
  `Docid` varchar(50) NOT NULL,
  `Docname` varchar(50) NOT NULL,
  `Docspe` varchar(50) NOT NULL,
  `Pid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`AppointmentID`, `Docid`, `Docname`, `Docspe`, `Pid`) VALUES
(31, '2', 'Dr Aleena', 'Heart Speacialist', '1'),
(32, '2', 'Dr Aleena', 'Heart Speacialist', '1'),
(33, '9', 'Dr shams', 'Liver Specialist', '1'),
(34, '3', 'Dr Saman', 'General', '1'),
(35, '3', 'Dr Saman', 'General', '1'),
(36, '2', 'Dr Aleena', 'Heart Speacialist', '1'),
(37, '3', 'Dr Saman', 'General', '1'),
(38, '3', 'Dr Saman', 'General', '1'),
(39, '9', 'Dr shams', 'Liver Specialist', '1'),
(40, '2', 'Dr Aleena', 'Heart Speacialist', '1'),
(41, '3', 'Dr Saman', 'General', '1'),
(42, '1', 'Dr Ali', 'Child Specialist', '1'),
(43, '1', 'Dr Ali', 'Child Specialist', '8'),
(44, '36', 'Dr Irfan', 'Hair', '8');

-- --------------------------------------------------------

--
-- Table structure for table `doctorData`
--

CREATE TABLE `doctorData` (
  `DocID` int(20) NOT NULL,
  `DocName` varchar(50) NOT NULL,
  `DocEmail` varchar(50) NOT NULL,
  `DocPassword` varchar(50) NOT NULL,
  `DocSpeciality` varchar(50) NOT NULL,
  `DocFee` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctorData`
--

INSERT INTO `doctorData` (`DocID`, `DocName`, `DocEmail`, `DocPassword`, `DocSpeciality`, `DocFee`) VALUES
(1, 'Dr Ali', 'ali@gmail.com', '12345', 'Child Specialist', 1000),
(2, 'Dr Aleena', 'aleena@mail.com', '5632', 'Heart Speacialist', 1500),
(3, 'Dr Saman', 'saman@mail.com', '45678', 'General', 1200),
(9, 'Dr shams', 'shams@mail.com', '89788', 'Liver Specialist', 1000),
(36, 'Dr Irfan', 'irfan@yahoo.com', '12345', 'Hair', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `patientData`
--

CREATE TABLE `patientData` (
  `PID` int(30) NOT NULL,
  `PName` varchar(50) NOT NULL,
  `PEmail` varchar(50) NOT NULL,
  `PPassword` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `PAge` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patientData`
--

INSERT INTO `patientData` (`PID`, `PName`, `PEmail`, `PPassword`, `Phone`, `PAge`) VALUES
(1, 'aimen', 'aimen@gmail.com', '12345', '03001234567', 23),
(3, 'Ali', 'ali@mail.com', '12354', '032145678', 36),
(4, 'Hijra', 'hajra@mail.com', '1245687', '0321478564', 23),
(5, 'Kareem', 'kaleem@mail.com', '5632', '03214125641', 36),
(6, 'ahmed', 'ahmed@gmail.com', '5555', '0321547412', 30),
(8, 'shaman', 'sh@yahoo.com', '123', '03214567885', 2),
(9, 'Malik a', 'malka@icloud.com', '3333', '032145687', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppointmentID`);

--
-- Indexes for table `doctorData`
--
ALTER TABLE `doctorData`
  ADD PRIMARY KEY (`DocID`);

--
-- Indexes for table `patientData`
--
ALTER TABLE `patientData`
  ADD PRIMARY KEY (`PID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `AppointmentID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `doctorData`
--
ALTER TABLE `doctorData`
  MODIFY `DocID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `patientData`
--
ALTER TABLE `patientData`
  MODIFY `PID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
