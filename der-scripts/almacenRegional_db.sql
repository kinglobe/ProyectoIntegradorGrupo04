-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: almacen_regional_db
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,NULL,NULL,NULL,3,'2023-12-19 02:56:32','2023-12-19 02:56:32'),(2,NULL,NULL,NULL,4,'2023-12-20 00:36:08','2023-12-20 00:36:08'),(3,NULL,NULL,NULL,5,'2023-12-20 10:45:35','2023-12-20 10:45:35');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Guaymayen','Buenos Aires',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(2,'Cachafaz','Buenos Aires',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(3,'La Quinta','Córdoba',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(4,'Havanna','Mar del Plata',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(5,'Maimara','Tucuman',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(6,'Riccitelli','Mendoza',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(7,'Felipe Rutini','Mendoza',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(8,'Bodega Colomé','Salta',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(9,'Parral de Famatina','La Rioja',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(10,'Viña Cobos','Mendoza',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(11,'Origen','Misiones',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(12,'La Buena','Misiones',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(13,'Cachamai','Santa Fé',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(14,'Cooperativa Andresito','Misiones',NULL,'2023-10-30 05:08:14','2023-10-30 05:08:14');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Alfajores','2023-10-30 05:08:14','2023-10-30 05:08:14'),(2,'Vinos','2023-10-30 05:08:14','2023-10-30 05:08:14'),(3,'Yerbas','2023-10-30 05:08:14','2023-10-30 05:08:14');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `productId` (`productId`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'1698642970286_products_.webp',1,1,'2023-10-30 05:16:10','2023-10-30 05:16:10'),(2,'1698642970286_products_.webp',0,1,'2023-10-30 05:16:10','2023-10-30 05:16:10'),(3,'1698643237547_products_.jpg',1,2,'2023-10-30 05:20:37','2023-10-30 05:20:37'),(4,'1698643805549_products_.jpg',1,3,'2023-10-30 05:30:05','2023-10-30 05:30:05'),(5,'1698643805549_products_.jpg',0,3,'2023-10-30 05:30:05','2023-10-30 05:30:05'),(6,'1698643805549_products_.webp',0,3,'2023-10-30 05:30:05','2023-10-30 05:30:05'),(7,'1698644201829_products_.webp',1,4,'2023-10-30 05:36:41','2023-10-30 05:36:41'),(8,'1698644427673_products_.jpg',1,5,'2023-10-30 05:40:27','2023-10-30 05:40:27'),(9,'1698884494152_products_.jpeg',1,6,'2023-11-02 00:21:34','2023-11-02 00:21:34'),(10,'1698884494152_products_.jpg',0,6,'2023-11-02 00:21:34','2023-11-02 00:21:34'),(11,'1698884944762_products_.jpg',1,7,'2023-11-02 00:29:04','2023-11-02 00:29:04'),(12,'1698885977644_products_.webp',1,8,'2023-11-02 00:46:17','2023-11-02 00:46:17'),(13,'1698885977645_products_.webp',0,8,'2023-11-02 00:46:17','2023-11-02 00:46:17'),(14,'1698886735046_products_.webp',1,9,'2023-11-02 00:58:55','2023-11-02 00:58:55'),(15,'1698886735046_products_.webp',0,9,'2023-11-02 00:58:55','2023-11-02 00:58:55'),(16,'1698886735046_products_.webp',0,9,'2023-11-02 00:58:55','2023-11-02 00:58:55'),(17,'1698890314430_products_.png',1,10,'2023-11-02 01:58:34','2023-11-02 01:58:34'),(18,'1698891844323_products_.jpg',1,11,'2023-11-02 02:24:04','2023-11-02 02:24:04'),(19,'1698893413697_products_.webp',1,12,'2023-11-02 02:50:13','2023-11-02 02:50:13'),(20,'1698893595122_products_.webp',1,13,'2023-11-02 02:53:15','2023-11-02 02:53:15'),(21,'1698894026815_products_.png',1,14,'2023-11-02 03:00:26','2023-11-02 03:00:26'),(22,'1698894598434_products_.jpg',1,15,'2023-11-02 03:09:58','2023-11-02 03:09:58'),(23,'1698895017222_products_.jpg',1,16,'2023-11-02 03:16:57','2023-11-02 03:16:57'),(24,'1698964740919_products_.jpeg',0,19,'2023-11-02 22:39:00','2023-11-02 22:39:00'),(25,'1698964740919_products_.jpeg',0,19,'2023-11-02 22:39:00','2023-11-02 22:39:00'),(26,'1699001868272_products_.jpeg',0,20,'2023-11-03 08:57:48','2023-11-03 08:57:48'),(27,'1699001868273_products_.jpeg',0,20,'2023-11-03 08:57:48','2023-11-03 08:57:48'),(28,'1699116427548_products_.jpg',0,21,'2023-11-04 16:47:07','2023-11-04 16:47:07');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,1,9,'2023-12-19 01:03:50','2023-12-19 01:03:50'),(2,1,1,8,'2023-12-19 01:09:19','2023-12-19 01:09:19');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,4,1,'2023-12-20 00:36:15','2023-12-20 00:36:15'),(2,0,5,1,'2023-12-20 10:45:42','2023-12-20 10:45:42'),(3,0,1,1,'2023-12-20 11:15:15','2023-12-20 11:15:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int unsigned NOT NULL,
  `discount` int unsigned DEFAULT '0',
  `categoryId` int DEFAULT '1',
  `sectionId` int DEFAULT '1',
  `brandId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Alfajor Triple Guaymallen Fruta Membrillo Caja X24U','Alfajor Triple Membrillo Guaymallen.\r\n\r\nAlfajor relleno con mermelada de membrillo cubierto con baño de repostería fantasía blanco.\r\n\r\nEspecificaciones:\r\n• Marca: Guaymallen.\r\n• Tipo: Triple\r\n• Sabor: Membrillo\r\n• Contenido neto: 70g\r\n• Cantidad: 24 Alfajores',2800,10,1,1,1,'2023-10-30 05:16:10','2023-11-03 20:43:06','1699006794286_products_.webp'),(2,'Alfajor Musse','Descubra el encanto y la sofisticación del Alfajor Cachafaz Chocolate Blanco con Dulce de Leche, una caja de 12 unidades que deleitará su paladar. De origen argentino y avalado por la reconocida marca Cachafaz, este exquisito alfajor fusiona la suavidad del chocolate blanco con el dulce de leche, creando una experiencia única.',3600,0,1,1,2,'2023-10-30 05:20:37','2023-11-03 21:02:22','1699006965159_products_.jpg'),(3,'Alfajor Havanna - Frustos secos','Dos galletitas rellenas con mucho dulce de leche y una exquisita cobertura de merengue italiano.\r\n\r\nPresentación:\r\nIndividual - Caja x6 / x12',1500,0,1,2,4,'2023-10-30 05:30:05','2023-11-03 10:37:56','1699007876334_products_.webp'),(4,'Malbec Felipe Rutini 1989','Es el vino ultra premium de la bodega, elegido entre los 50 Top Wines de América del Sur y es el mejor puntuado entre los vinos argentinos de bodegas tradicionales. Su producción se inició en 1985, como homenaje a Don Felipe Rutini y al centenario de labor de la bodega que él fundara. Fue el primer vino argentino en llevar un nombre propio en la etiqueta. Constituye la quintaesencia de la más alta calidad que Rutini Wines puede ofrecer en la creación de vinos considerados extraordinarios.',435000,0,2,1,7,'2023-10-30 05:36:41','2023-11-03 21:01:45','1699045305760_products_.webp'),(5,'MALBEC 2019','Tono violeta brillante, tintado y vibrante. Aromas a grosella madura, higo y hierba de romero. En boca estalla con notas de grosellas rojas y arándanos recién recogidos que conducen a una profunda complejidad que persiste a través de un largo final de grano fino. Este es un vino de múltiples capas, bien redondeado, con mucho cuerpo y excepcional equilibrio, potencia y delicadeza.',35000,12,2,3,10,'2023-10-30 05:40:27','2023-11-05 20:00:01','1699214401039_products_.webp'),(6,'Vino Republica del Malbec','Este Malbec presenta un intenso bouquet, lleno de frutos negros, especias como regaliz y especias. En el paladar muestra un notable equilibrio, taninos elegantes, sedosos y envolventes.',32000,0,2,1,6,'2023-11-02 00:21:34','2023-11-03 21:01:10','1699045270518_products_.jpg'),(7,'Kit Matero Origen','El Kit Matero Origen incluye un mate térmico de acero inoxidable, una bombilla plana de acero inoxidable y un paquete de Yerba Mate Origen x 500g.',15000,0,3,1,11,'2023-11-02 00:29:04','2023-11-03 20:51:12','1699044672468_products_.jpg'),(8,'GUAYMALLEN ALFAJOR TRIPLE','Alfajor Guaymallen Membrillo Dulce De Fruta Caja 40 Unidades',5600,0,1,1,1,'2023-11-02 00:46:17','2023-11-03 20:57:15','1699045035029_products_.webp'),(9,'Vino Rutini Sauvignon Blanc','Apto para guarda de unos 4 años. La temperatura adecuada para disfrutar este vino es entre 10º y 12º C. Este vino es ideal para combinarlo con carpaccio, tartas de verdura y hortalizas, frutos del mar, pescados, alcauciles, queso de cabra.\r\n\r\n• Notas de Cata:\r\n• Vista. Amarillo dorado verdoso.\r\n• Nariz: Intenso, en sus fragantes notas cítricas (pomelo rosado) y características de la variedad (hierbas, pasto recién cortado, mineral)\r\n•Boca: Tiene un equilibrado parangón azúcar-acidez en el que además tiene cabida un dejo a vainilla, recreado por el discreto tiempo de crianza en roble.\r\n\r\nEspecificaciones:\r\n• Bodega: Rutini Wines.\r\n• Tipo: Blanco.\r\n• Variedad: Sauvignon Blanc.\r\n• Corte: 100% Sauvignon Blanc.\r\n• Grado de alcohol: 13,4%.\r\n• Origen: Tupungato. Provincia de Mendoza, Argentina.\r\n• Contenido neto: 750ml.\r\n• Cantidad: 1 Botella.',18000,0,2,1,7,'2023-11-02 00:58:55','2023-11-03 20:46:17','1699044377842_products_.webp'),(10,'Yerba Mate Hierbas Serranas','Una yerba suave, fresca y de agradable sabor, ideal para el primer mate del día. Los beneficios de la menta junto a la clásica hierba serrana, la peperina, ofrecen una frescura que despeja las vías respiratorias.',2800,0,3,2,13,'2023-11-02 01:58:34','2023-11-03 20:36:46','1699043806131_products_.webp'),(11,'Andresito Yerba Mate','Producto único de alta calidad, suavidad y persistencia del sabor en cada mateada!\r\n\r\nLa Yerba Mate de la Cooperativa Yerbatera Andresito, en la provincia de Misiones; es producida, elaborada y procesada en forma natural por los productores rurales de la zona',2500,40,3,3,14,'2023-11-02 02:24:04','2023-11-03 20:55:45','1699044945608_products_.jpg'),(12,'Vino Parrales Riojanos','CARACTERÍSTICAS:\r\n• Altura del Viñedo: 1250 m.s.n.m.\r\n• 12 meses en barrica de roble francés\r\n• De color rojo intenso, los matices violáceos, negros y azulados. Su aromas ofrece una pronunciada intensidad, notas de ciruelas maduras, floral, toques especiados de pimienta negra. En boca tiene una gran concentración de sabores y una textura envolvente y sedosa, un vino de gran complejidad de aromas y sabores, intenso, balanceado y fresco a la vez.',2999,12,2,3,9,'2023-11-02 02:50:13','2023-11-03 21:00:22','1699045222640_products_.webp'),(13,'Yerba Mate La Buena','Yerba Mate  HIERBAS CALIDAD PREMIUM\r\nCompuesta con hierbas agroecológicas de Traslasierra Córdoba\r\nIngredientes: Yerba Mate tradicional, menta, poleo, burrito y melisa',1600,10,3,3,12,'2023-11-02 02:53:15','2023-11-05 19:57:39','1699214182129_products_.jpeg'),(14,'Yerba mate La Buena - Artesanal','Se realiza y se envasa artesanalmente realzando su aroma y sabor, seleccionando las hojas más verdes y con dos años de maduración.\r\n\r\nSu secado es artesanal a leña, siendo la madera bien dura y cuidadosamente elegida. Es suave',2080,0,3,2,12,'2023-11-02 03:00:26','2023-11-03 20:45:04','1699044304740_products_.png'),(15,'Vino Rosado - MENDEL ROSADÍA 2020/22','MENDEL ROSADÍA 2020/22 - Corte de Merlot - Pinot Noir  Vino Rosado',11800,0,2,2,5,'2023-11-02 03:09:58','2023-11-03 20:45:29','1699044329404_products_.jpg'),(16,'Alfajor Surtido Havanna','Alfajores Havanna Mixtos de Chocolate con leche y Merengue italiano',9500,20,1,3,4,'2023-11-02 03:16:57','2023-11-03 20:44:21','1699044261653_products_.jpg'),(20,'Colomé Torrontés','Excelente vino pa chupar',20000,0,2,2,8,'2023-11-03 08:57:48','2023-11-03 08:57:48','1699001868267_products_.png'),(21,'COBOS MALBEC 2018','Cobos Malbec nos seduce con su extraordinaria riqueza aromática, es un vino intenso y elegante, en el que se destaca su gran frescura. Muestra un excelente color rojo intenso con tonos violáceos. Encontramos fruta roja, cassis, ciruela, especias, tabaco rubio, coco, pimienta blanca, chocolate y notas sutiles a cardamomo. La riqueza en nariz, se repite en boca de una manera exquisita. Es largo y dulce, con taninos suaves. Un vino carnoso y complejo, con un prolongado final.',345000,0,2,1,10,'2023-11-04 16:47:07','2023-11-05 19:58:29','1699116427547_products_.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2023-10-30 05:08:14','2023-10-30 05:08:14'),(2,'user','2023-10-30 05:08:14','2023-10-30 05:08:14');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'Productos Destacados','2023-10-30 05:08:14','2023-10-30 05:08:14'),(2,'Más Vendidos','2023-10-30 05:08:14','2023-10-30 05:08:14'),(3,'Ofertas','2023-10-30 05:08:14','2023-10-30 05:08:14');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20231015160734-create-section.js'),('20231015161947-create-category.js'),('20231015161948-create-brand.js'),('20231015163324-create-product.js'),('20231016160513-create-image.js'),('20231016160949-create-role.js'),('20231016161214-create-user.js'),('20231016170009-create-address.js'),('20231016192317-create-order.js'),('20231016204316-create-cart.js'),('20231102213553-add-column-image-products.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'open','2023-11-03 22:45:40','2023-11-03 22:45:40'),(2,'close','2023-10-03 22:45:40','2023-10-03 22:45:40');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `about` text,
  `roleId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Almacen','admin@gmail.com','$2a$10$rp6kJ76QSkFRDR7OhE6Gse.HTXWTD9q2lbnuv//Ag6TbG//MjJ1Mi',NULL,NULL,NULL,NULL,1,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(2,'User','Almacen','user@gmail.com','$2a$10$ITSbKT5b8t96EUNxpE9nxOIXPvHZMqZddWy4mTjQkVlul0uqN/ezW',NULL,NULL,NULL,NULL,2,'2023-10-30 05:08:14','2023-10-30 05:08:14'),(5,'Hugo Hernan','Avallay','h40hugo@gmail.com','$2a$10$jqpW.lbJP.5yc.4shUwOmOYdPsy6VUkw7Ppd7ACv1iNtdPp/9sOtS',NULL,NULL,NULL,NULL,2,'2023-12-20 10:45:35','2023-12-20 10:45:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-20  9:57:54
