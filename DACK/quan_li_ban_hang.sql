-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2018 at 10:54 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quan_li_ban_hang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `MaHD` int(11) NOT NULL,
  `SanPham` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `TongTien` int(11) NOT NULL,
  `KhachHang` int(11) NOT NULL,
  `TrangThai` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`MaHD`, `SanPham`, `TongTien`, `KhachHang`, `TrangThai`, `Date`) VALUES
(1, 'Túi sách Châu Âu\r\nTúi sách hàng hiệu ', 4990000, 1, 'Chưa giao', '2018-05-23 03:37:50'),
(2, 'Túi sách Châu Âu\r\nTúi sách hàng hiệu ', 4990000, 1, 'Chưa giao', '2018-05-23 03:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `MaLoai` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenLoai` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `MaNSX` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenNSX` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `MaSP` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenSP` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `HinhAnh` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `Gia` int(11) NOT NULL,
  `MoTa` text COLLATE utf8_vietnamese_ci NOT NULL,
  `XuatXu` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `MaLoai` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `NSX` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `MaKH` int(11) NOT NULL,
  `TenKH` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `SDT` varchar(11) COLLATE utf8_vietnamese_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`MaHD`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`MaLoai`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`MaNSX`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`MaSP`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`MaKH`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
