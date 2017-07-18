CREATE DATABASE  IF NOT EXISTS `shopping` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shopping`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopping
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(45) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `display` varchar(45) DEFAULT NULL,
  `cpu` varchar(45) DEFAULT NULL,
  `memory` varchar(45) DEFAULT NULL,
  `camera` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`product_id`, `image`, `product_name`, `brand`, `display`, `cpu`, `memory`, `camera`, `price`) VALUES (1,'images/htc/desire-630.png','Desire 630','HTC','5\"','quad core','2gb/16gb','8mp/2mp','15000/-'),(2,'images/htc/desire-728.png','Desire 728','HTC','5\"','quad core','2gb/16gb','8mp/2mp','18000/-'),(3,'images/htc/desire-825.png','Desire 825','HTC','5\"','quad core','2gb/16gb','8mp/5mp','20000/-'),(4,'images/huawei/honor 4c.jpeg','Honor 4c','Huawei','5\"','quad core','3gb/16gb','13mp/5mp','12000/-'),(5,'images/huawei/honor 4x.jpg','Honor 4x','Huawei','5\"','quad core','3gb/32gb','13mp/5mp','14000/-'),(6,'images/huawei/hoonor 5x.jpg','Honor 5x','Huawei','5.5\"','quad core','3gb/32gb','16mp/5mp','16000/-'),(7,'images/lenovo/vibe k5.jpg','Vibe K5','Lenovo','5.5\"','octa core','3gb/32gb','13mp/5mp','11999/-'),(8,'images/lenovo/vibe p1.jpg','Vibe P1','Lenovo','5.5\"','octa core','4gb/32gb','13mp/5mp','13999/-'),(9,'images/lenovo/vibe x3.jpeg','Vibe X3','Lenovo','5.5\"','octa core','4gb/32gb','16p/8mp','18999/-'),(10,'images/motorola/moto g3.jpg','Moto G3','Moto','5\"','quad core','2gb/16gb','13mp/5mp','9999/-'),(11,'images/motorola/moto g turbo.jpeg','Moto G Turbo','Moto','5\"','octa core','2gb/16gb','13mp/5mp','9999/-'),(12,'images/motorola/moto x force.jpeg','Moto X Force','Moto','5.5\"','octa core','3gb/32gb','16mp/5mp','34999/-'),(13,'images/oneplus/OnePlus-One.jpg','Oneplus One','Oneplus','5\"','octa core','3gb/32gb','16mp/5mp','19999/-'),(14,'images/oneplus/oneplus-x-4.jpg','Oneplus X','Oneplus','5\"','octa core','2gb/16gb','13mp/5mp','18999/-'),(15,'images/oneplus/oneplus2-og.png','Oneplus Two','Oneplus','5.5\"','octa core','3gb/32gb','13mp/5mp','24999/-'),(16,'images/oppo/f1 plus.jpg','F1 Plus','Oppo','5.5\"','octa core','4gb/32gb','16mp/16mp','16999/-'),(17,'images/oppo/f1.jpg','F1','Oppo','5\"','octa core','3gb/32gb','16mp/8mp','14999/-'),(18,'images/oppo/r7 plus.png','R7 Plus','Oppo','5\"','octa core','3gb/32gb','13mp/5mp','12999/-'),(19,'images/samsung/a5.jpe','Galaxy A5','Samsung','4.7\"','octa core','3gb/32gb','13mp/5mp','15999/-'),(20,'images/samsung/a7.jpe','Galaxy A7 ','Samsung','5.5\"','octa core','4gb/64gb','16mp/8mp','18999/-'),(21,'images/samsung/j3.jpe','Galaxy J3','Samsung','5\"','quad core','2gb/16gb','13mp/8mp','8999/-'),(22,'images/sony/c5 ultra.png','Xperia C5 Ultra','Sony','5.5\"','octa core','3gb/32gb','16mp/8mp','23999/-'),(23,'images/sony/m5.png','Xperia M5','Sony','5.2\"','octa core','3gb/32gb','16mp/13mp','25999/-'),(24,'images/sony/z5 premium.png','Xperia Z5 Premium','Sony','5.5\"','octa core','4gb/64gb','23mp/13mp','39999/-'),(25,'images/vivo/v1.jpg','Vivo V1','Vivo','5\"','octa core','3gb/32gb','13mp/5mp','12999/-'),(26,'images/vivo/v1max.jpg','Vivo V1 Max','Vivo','5.5\"','octa core','3gb/32gb','13mp/5mp','14999/-'),(27,'images/vivo/y31.jpg','Vivo Y31','Vivo','5\"','octa core','2gb/16gb','13mp/2mp','9999/-'),(28,'images/xiaomi/mi4i.jpg','Mi4','Xiaomi','4.7\"','quad core','3gb/16gb','13mp/5mp','11999/-'),(29,'images/xiaomi/redmi 3.jpg','Redmi 3','Xiaomi','5\"','octa core','3gb/32gb','13mp/5mp','13999/-'),(30,'images/xiaomi/redmi note 3.jpg','Redmi Note 3','Xiaomi','5.5\"','hexa core','4gb/32gb','16mp/5mp','11999/-');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-15 13:10:14
