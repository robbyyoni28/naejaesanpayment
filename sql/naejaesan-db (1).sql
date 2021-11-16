CREATE DATABASE  IF NOT EXISTS `naejaesan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `naejaesan`;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: naejaesan
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_discount`
--

DROP TABLE IF EXISTS `tb_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_discount` (
  `id_discount` int NOT NULL AUTO_INCREMENT,
  `discount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_discount`
--

LOCK TABLES `tb_discount` WRITE;
/*!40000 ALTER TABLE `tb_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_harga`
--

DROP TABLE IF EXISTS `tb_harga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_harga` (
  `id_harga` int NOT NULL AUTO_INCREMENT,
  `harga` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_harga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_harga`
--

LOCK TABLES `tb_harga` WRITE;
/*!40000 ALTER TABLE `tb_harga` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_harga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jenis_pembayaran`
--

DROP TABLE IF EXISTS `tb_jenis_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_jenis_pembayaran` (
  `id_jenis_pembayaran` int NOT NULL AUTO_INCREMENT,
  `jenis_pembayaran` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_jenis_pembayaran`
--

LOCK TABLES `tb_jenis_pembayaran` WRITE;
/*!40000 ALTER TABLE `tb_jenis_pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jenis_pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kategori_makanan`
--

DROP TABLE IF EXISTS `tb_kategori_makanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_kategori_makanan` (
  `id_kategori_makanan` int NOT NULL AUTO_INCREMENT,
  `kategori_makanan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_makanan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kategori_makanan`
--

LOCK TABLES `tb_kategori_makanan` WRITE;
/*!40000 ALTER TABLE `tb_kategori_makanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kategori_makanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kategori_minuman`
--

DROP TABLE IF EXISTS `tb_kategori_minuman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_kategori_minuman` (
  `id_kategori_minuman` int NOT NULL AUTO_INCREMENT,
  `kategori minuman` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_minuman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kategori_minuman`
--

LOCK TABLES `tb_kategori_minuman` WRITE;
/*!40000 ALTER TABLE `tb_kategori_minuman` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kategori_minuman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_makanan`
--

DROP TABLE IF EXISTS `tb_makanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_makanan` (
  `id_makanan` int NOT NULL AUTO_INCREMENT,
  `nama_makanan` varchar(45) DEFAULT NULL,
  `id_harga` varchar(45) DEFAULT NULL,
  `id_kategori` varchar(45) DEFAULT NULL,
  `img_makanan` blob,
  PRIMARY KEY (`id_makanan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_makanan`
--

LOCK TABLES `tb_makanan` WRITE;
/*!40000 ALTER TABLE `tb_makanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_makanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_minuman`
--

DROP TABLE IF EXISTS `tb_minuman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_minuman` (
  `id_minuman` int NOT NULL AUTO_INCREMENT,
  `nama_minuman` varchar(45) DEFAULT NULL,
  `id_harga` varchar(45) DEFAULT NULL,
  `id_kategori` varchar(45) DEFAULT NULL,
  `img_minuman` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_minuman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_minuman`
--

LOCK TABLES `tb_minuman` WRITE;
/*!40000 ALTER TABLE `tb_minuman` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_minuman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pegawai`
--

DROP TABLE IF EXISTS `tb_pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pegawai` (
  `id_pegawai` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pegawai`
--

LOCK TABLES `tb_pegawai` WRITE;
/*!40000 ALTER TABLE `tb_pegawai` DISABLE KEYS */;
INSERT INTO `tb_pegawai` VALUES (1,'babang_ikip','929292','ikipkiwe','admin');
/*!40000 ALTER TABLE `tb_pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pembayaran`
--

DROP TABLE IF EXISTS `tb_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_pemesanan` varchar(45) DEFAULT NULL,
  `id_pegawai` varchar(45) DEFAULT NULL,
  `id_jenis_pembayaran` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pembayaran`
--

LOCK TABLES `tb_pembayaran` WRITE;
/*!40000 ALTER TABLE `tb_pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pemesanan`
--

DROP TABLE IF EXISTS `tb_pemesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pemesanan` (
  `id_pemesanan` int NOT NULL AUTO_INCREMENT,
  `id_minuman` varchar(45) DEFAULT NULL,
  `id_makanan` varchar(45) DEFAULT NULL,
  `id_harga` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pemesanan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pemesanan`
--

LOCK TABLES `tb_pemesanan` WRITE;
/*!40000 ALTER TABLE `tb_pemesanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pemesanan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-03 13:34:14
