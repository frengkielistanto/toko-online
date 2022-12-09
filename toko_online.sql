-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 09:44 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(15, 'celana panjang', 'Zara Striped Blouse1', 'pria', 10000, 9, '119001837_2699374980329125_5281149540939886656_n2.jpg'),
(16, 'baju bekas', 'Massimo Dutti Slim Fit Floral Print Shirt MDKLG003G11', 'pria', 9000, 47, '118367464_3416283315096003_3253125216870166075_n.jpg'),
(17, 'dress12', 'Zara Striped Blouse', 'wanita', 10000, 9, '118696892_169037111462948_2168984875953627892_n.jpg'),
(18, 'baju anak', 'Massimo Dutti Slim Fit Floral Print Shirt MDKLG003G11', 'anak', 12000, 50, '119383744_1223258104741147_6365677537758194019_n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(9, 'Frengki Elistanto', 'LUMAJANG', '2020-10-31 16:17:21', '2020-11-01 16:17:21'),
(10, 'udin', 'jalan pakisan desa bataan tenggarang bondowoso', '2020-10-31 16:19:41', '2020-11-01 16:19:41'),
(11, 'udin', 'jalan pakisan desa bataan tenggarang bondowoso', '2020-10-31 16:31:57', '2020-11-01 16:31:57'),
(12, '', '', '2020-11-01 23:19:51', '2020-11-02 23:19:51'),
(13, 'roza', 'LUMAJANG', '2020-11-02 20:47:59', '2020-11-03 20:47:59'),
(14, 'roza nuril', 'jember', '2020-11-02 21:13:32', '2020-11-03 21:13:32'),
(15, 'FRENGKImalam', 'jalan pakisan desa bataan tenggarang bondowoso', '2020-11-06 23:51:56', '2020-11-07 23:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(7, 9, 16, 'baju bekas', 1, 9000, ''),
(8, 10, 4, 'kemeja', 1, 500000, ''),
(9, 10, 15, 'celana panjang', 1, 10000, ''),
(10, 12, 16, 'baju bekas', 1, 9000, ''),
(11, 13, 4, 'kemeja', 1, 500000, ''),
(12, 13, 16, 'baju bekas', 1, 9000, ''),
(13, 14, 16, 'baju bekas', 1, 9000, ''),
(14, 14, 17, 'dress12', 1, 10000, ''),
(15, 14, 15, 'celana panjang', 1, 10000, ''),
(16, 15, 15, 'celana panjang', 1, 10000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', 'admin', 1),
(2, 'user', 'user', 'user', 2),
(3, 'FRENGKI', 'frengkie', '1', 2),
(4, 'udin', 'udin', '1', 2),
(5, 'frengki', 'frengki', '1', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
