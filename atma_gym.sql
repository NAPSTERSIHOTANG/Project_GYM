-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 03:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atma_gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` int(5) NOT NULL,
  `noTelepon` varchar(255) NOT NULL,
  `jenisKelamin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama`, `umur`, `noTelepon`, `jenisKelamin`) VALUES
(3, 'bobyyy', 22, '08213124', 'male'),
(4, 'Marshel', 22, '08214131', 'female'),
(5, 'Ce', 22, '083123123', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` int(100) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `noTelepon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id_employee`, `nama`, `umur`, `jabatan`, `noTelepon`) VALUES
(4, 'Polinn', 22, 'BOSS', '0812312312'),
(5, 'piww', 44, 'CEO', '0821312'),
(6, 'dodo', 33, 'karyawan', '0823131'),
(7, 'supri', 23, 'karyawan', '08231312312');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id_membership` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `paketMembership` varchar(255) NOT NULL,
  `tanggalDaftar` varchar(255) NOT NULL,
  `tanggalAkhir` varchar(255) NOT NULL,
  `kontrak` int(20) NOT NULL,
  `nomorKartu` varchar(255) NOT NULL,
  `hargaMembership` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id_membership`, `id_customer`, `paketMembership`, `tanggalDaftar`, `tanggalAkhir`, `kontrak`, `nomorKartu`, `hargaMembership`) VALUES
(12, 4, 'A', '12-22-2322', '12-23-2323', 1, 'A11-2423', 200000),
(13, 3, 'B', '23-23-2312', '33-23-2444', 12, 'B22-232', 250000),
(14, 5, 'B', '12-12-2343', '25-25-2522', 12, 'B22-2031', 250000);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id_payments` int(11) NOT NULL,
  `id_membership` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `totalHarga` double NOT NULL,
  `metodePembayaran` varchar(255) NOT NULL,
  `statusPembayaran` varchar(255) NOT NULL,
  `tanggalPembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id_payments`, `id_membership`, `id_employee`, `id_customer`, `totalHarga`, `metodePembayaran`, `statusPembayaran`, `tanggalPembayaran`) VALUES
(9, 12, 7, 4, 200000, 'debit', 'lunas', '23-23-2332'),
(18, 13, 5, 4, 250000, 'credit', 'lunas', '11-11-1111'),
(21, 12, 4, 3, 200000, 'credit', 'lunas', '12-23-2323'),
(22, 13, 4, 4, 250000, 'debit', 'lunas', '12-23-4244'),
(26, 14, 6, 5, 250000, 'credit', 'lunas', '11-11-2222');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id_membership`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_payments`),
  ADD KEY `id_membership` (`id_membership`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `payments_ibfk_1` (`id_employee`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id_membership` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id_payments` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`id_membership`) REFERENCES `membership` (`id_membership`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
