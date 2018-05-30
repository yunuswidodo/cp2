-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: toko_elektronik
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `toko_elektronik`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toko_elektronik` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `toko_elektronik`;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang` (
  `Kode_Barang*` char(6) NOT NULL,
  `Nama_Barang` text NOT NULL,
  `Satuan` int(11) NOT NULL,
  `Harga_Distributor` int(11) NOT NULL,
  `Harga_Retail` int(11) NOT NULL,
  `Stok` int(11) NOT NULL,
  PRIMARY KEY (`Kode_Barang*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `Kode_Pelanggan*` varchar(6) NOT NULL,
  `Nama_Pelanggan` text NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telepon` text NOT NULL,
  PRIMARY KEY (`Kode_Pelanggan*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemasok`
--

DROP TABLE IF EXISTS `pemasok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemasok` (
  `kode_Pemasok` varchar(6) NOT NULL,
  `Nama_Pemasok` text NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telepon` varchar(12) NOT NULL,
  PRIMARY KEY (`kode_Pemasok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemasok`
--

LOCK TABLES `pemasok` WRITE;
/*!40000 ALTER TABLE `pemasok` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemasok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembelian`
--

DROP TABLE IF EXISTS `pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembelian` (
  `No_Nota_Beli*` int(6) NOT NULL,
  `Tgl_Nota_Beli` char(6) NOT NULL,
  `No_Nota_Pesan**` char(6) NOT NULL,
  `Cara_Bayar` text NOT NULL,
  `Tgl_Bayar` char(6) NOT NULL,
  `Total_Bayar` int(11) NOT NULL,
  `Status_Bayar` int(11) NOT NULL,
  `UserID**` char(6) NOT NULL,
  PRIMARY KEY (`No_Nota_Beli*`),
  KEY `No_Nota_Pesan**` (`No_Nota_Pesan**`),
  KEY `UserID**` (`UserID**`),
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`No_Nota_Pesan**`) REFERENCES `pemesanan` (`No_Nota_Pesan*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembelian`
--

LOCK TABLES `pembelian` WRITE;
/*!40000 ALTER TABLE `pembelian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesanan`
--

DROP TABLE IF EXISTS `pemesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemesanan` (
  `No_Nota_Pesan*` char(6) NOT NULL,
  `Tgl_Masuk` char(6) NOT NULL,
  `Kode_Pemasok**` char(6) NOT NULL,
  `Cara_Bayar` int(11) NOT NULL,
  `Tgl_Bayar` int(11) NOT NULL,
  `Status_Bayar` int(11) NOT NULL,
  `UserID**` char(6) NOT NULL,
  PRIMARY KEY (`No_Nota_Pesan*`),
  KEY `Kode_Pemasok**` (`Kode_Pemasok**`),
  KEY `UserID**` (`UserID**`),
  CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`Kode_Pemasok**`) REFERENCES `pemasok` (`kode_Pemasok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesanan`
--

LOCK TABLES `pemesanan` WRITE;
/*!40000 ALTER TABLE `pemesanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesanan_detail`
--

DROP TABLE IF EXISTS `pemesanan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemesanan_detail` (
  `No_Nota_Pesan**` char(6) NOT NULL,
  `Kode_Barang**` char(6) NOT NULL,
  `Harga_Distributor` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Diskon` int(11) NOT NULL,
  `SubTotal` int(11) NOT NULL,
  KEY `Kode_Barang**` (`Kode_Barang**`),
  KEY `No_Nota_Pesan**` (`No_Nota_Pesan**`),
  CONSTRAINT `pemesanan_detail_ibfk_1` FOREIGN KEY (`Kode_Barang**`) REFERENCES `barang` (`Kode_Barang*`),
  CONSTRAINT `pemesanan_detail_ibfk_2` FOREIGN KEY (`No_Nota_Pesan**`) REFERENCES `pemesanan` (`No_Nota_Pesan*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesanan_detail`
--

LOCK TABLES `pemesanan_detail` WRITE;
/*!40000 ALTER TABLE `pemesanan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemesanan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengguna` (
  `UserID*` char(6) NOT NULL,
  `PassID` int(11) NOT NULL,
  `Nama` text NOT NULL,
  PRIMARY KEY (`UserID*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjualan`
--

DROP TABLE IF EXISTS `penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penjualan` (
  `No_Nota*` varchar(6) NOT NULL,
  `Tgl_Nota` char(6) NOT NULL,
  `Kode_Pelanggan**` varchar(6) NOT NULL,
  `UserID**` char(6) NOT NULL,
  PRIMARY KEY (`No_Nota*`),
  KEY `Kode_Pelanggan**` (`Kode_Pelanggan**`),
  KEY `UserID**` (`UserID**`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`Kode_Pelanggan**`) REFERENCES `pelanggan` (`Kode_Pelanggan*`),
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`UserID**`) REFERENCES `pengguna` (`UserID*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjualan`
--

LOCK TABLES `penjualan` WRITE;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjualan_detail`
--

DROP TABLE IF EXISTS `penjualan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penjualan_detail` (
  `No_Nota**` varchar(6) NOT NULL,
  `Kode_Barang**` char(6) NOT NULL,
  `Harga_Retail` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Diskon` int(11) NOT NULL,
  `Subtotal` int(11) NOT NULL,
  KEY `Kode_Barang**` (`Kode_Barang**`),
  KEY `No_Nota**` (`No_Nota**`),
  CONSTRAINT `penjualan_detail_ibfk_1` FOREIGN KEY (`Kode_Barang**`) REFERENCES `barang` (`Kode_Barang*`),
  CONSTRAINT `penjualan_detail_ibfk_2` FOREIGN KEY (`No_Nota**`) REFERENCES `penjualan` (`No_Nota*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjualan_detail`
--

LOCK TABLES `penjualan_detail` WRITE;
/*!40000 ALTER TABLE `penjualan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `penjualan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retur_penjualan`
--

DROP TABLE IF EXISTS `retur_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retur_penjualan` (
  `No_Retur` varchar(6) NOT NULL,
  `Tgl_Retur` date NOT NULL,
  `Kode_Pelanggan**` char(6) NOT NULL,
  `Kode_Barang**` char(6) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Harga_Retail` int(11) NOT NULL,
  `Bentuk_Retur` text NOT NULL,
  `Kondisi_Barang` text NOT NULL,
  `UserID**` char(6) NOT NULL,
  KEY `Kode_Barang` (`Kode_Barang**`),
  KEY `Kode_Pelanggan**` (`Kode_Pelanggan**`),
  KEY `UserId**` (`UserID**`),
  CONSTRAINT `retur_penjualan_ibfk_1` FOREIGN KEY (`Kode_Barang**`) REFERENCES `barang` (`Kode_Barang*`),
  CONSTRAINT `retur_penjualan_ibfk_2` FOREIGN KEY (`Kode_Pelanggan**`) REFERENCES `pelanggan` (`Kode_Pelanggan*`),
  CONSTRAINT `retur_penjualan_ibfk_3` FOREIGN KEY (`UserId**`) REFERENCES `pengguna` (`UserID*`),
  CONSTRAINT `retur_penjualan_ibfk_4` FOREIGN KEY (`UserID**`) REFERENCES `pengguna` (`UserID*`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retur_penjualan`
--

LOCK TABLES `retur_penjualan` WRITE;
/*!40000 ALTER TABLE `retur_penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `retur_penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_pembelian`
--

DROP TABLE IF EXISTS `return_pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_pembelian` (
  `No_Return` varchar(11) NOT NULL,
  `Tgl_Return` char(6) NOT NULL,
  `Kode_Pemasok**` char(6) NOT NULL,
  `Kode_Barang**` char(6) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Distributor` int(11) NOT NULL,
  `UserID` char(6) NOT NULL,
  KEY `Kode_Barang**` (`Kode_Barang**`),
  KEY `Kode_Pemasok**` (`Kode_Pemasok**`),
  CONSTRAINT `return_pembelian_ibfk_1` FOREIGN KEY (`Kode_Barang**`) REFERENCES `barang` (`Kode_Barang*`),
  CONSTRAINT `return_pembelian_ibfk_2` FOREIGN KEY (`Kode_Pemasok**`) REFERENCES `pemasok` (`kode_Pemasok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_pembelian`
--

LOCK TABLES `return_pembelian` WRITE;
/*!40000 ALTER TABLE `return_pembelian` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_pembelian` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-30 10:47:24
