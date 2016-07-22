-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: vacancy2
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(4096) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (16,'Стул','Деревянный стул'),(17,'iphone','Смартфон от Apple'),(18,'Клавиатура','Клавиатура беспроводная');
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_photos`
--

DROP TABLE IF EXISTS `good_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_photos` (
  `good_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`good_id`,`photo_id`),
  KEY `IDX_89D655BA1CF98C70` (`good_id`),
  KEY `IDX_89D655BA7E9E4C8C` (`photo_id`),
  CONSTRAINT `FK_89D655BA1CF98C70` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_89D655BA7E9E4C8C` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_photos`
--

LOCK TABLES `good_photos` WRITE;
/*!40000 ALTER TABLE `good_photos` DISABLE KEYS */;
INSERT INTO `good_photos` VALUES (16,5),(16,6),(17,7),(17,8),(18,9),(18,10);
/*!40000 ALTER TABLE `good_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `originalName` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `dirname` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (5,'57915c2d4ad3e.jpg','57915c2d4ad3e.jpg','/upload','jpg','image/jpeg'),(6,'57915c5b01821.jpg','57915c5b01821.jpg','/upload','jpg','image/jpeg'),(7,'57915ca16c1a5.jpg','57915ca16c1a5.jpg','/upload','jpg','image/jpeg'),(8,'57915ca16cc3d.jpg','57915ca16cc3d.jpg','/upload','jpg','image/jpeg'),(9,'57915ce9350fa.jpg','57915ce9350fa.jpg','/upload','jpg','image/jpeg'),(10,'57915ce935b1d.jpg','57915ce935b1d.jpg','/upload','jpg','image/jpeg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_type_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `good_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CAC822D91CF98C70` (`good_id`),
  CONSTRAINT `FK_CAC822D91CF98C70` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,20,NULL),(2,10,10,NULL),(3,20,10,NULL),(4,10,10,NULL),(5,9090,90090,NULL),(6,90,90,NULL),(7,8,8,NULL),(8,90,90,NULL),(9,90,90,NULL),(10,90,90,NULL),(11,90,90,NULL),(12,90,90,NULL),(13,90,90,NULL),(14,90,90,NULL),(16,1,500,16),(17,2,33,16),(18,1,50000,17),(19,2,700,17),(20,1,1200,18),(21,2,50,18);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-22  4:12:03
