-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: equipo-jugador
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `socios` int(11) DEFAULT NULL,
  `fundacion` int(4) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Real Ávila',70000,1923,'Ávila'),(2,'FC Barcelona',137514,1898,'Barcelona'),(3,'Real Madrid',95612,1902,'Madrid'),(4,'Atlético de Madrid',145638,1903,'Madrid'),(5,'Sevilla FC',45000,1890,'Sevilla'),(6,'Valencia CF',50000,1919,'Valencia'),(7,'Villarreal CF',25000,1923,'Villarreal'),(8,'Real Betis',60000,1907,'Sevilla'),(9,'Athletic Club',50000,1898,'Bilbao'),(10,'Real Sociedad',40000,1909,'San Sebastián'),(11,'Celta de Vigo',30000,1923,'Vigo'),(12,'RCD Espanyol',25000,1900,'Barcelona'),(13,'Getafe CF',15000,1983,'Getafe'),(14,'Granada CF',20000,1931,'Granada'),(15,'Levante UD',18000,1909,'Valencia'),(16,'CA Osasuna',22000,1920,'Pamplona'),(17,'Deportivo Alavés',19000,1921,'Vitoria'),(18,'SD Eibar',10000,1940,'Eibar'),(19,'Real Valladolid',25000,1928,'Valladolid'),(20,'Elche CF',23000,1923,'Elche'),(21,'Cádiz CF',15000,1910,'Cádiz'),(22,'Rayo Vallecano',18000,1924,'Madrid'),(23,'Girona FC',12000,1930,'Girona'),(24,'UD Las Palmas',20000,1949,'Las Palmas'),(25,'Málaga CF',25000,1904,'Málaga'),(26,'Real Zaragoza',30000,1932,'Zaragoza'),(27,'CD Leganés',12000,1928,'Leganés'),(28,'SD Huesca',8000,1960,'Huesca'),(29,'UD Almería',10000,1989,'Almería'),(30,'Real Oviedo',15000,1926,'Oviedo'),(31,'CD Tenerife',20000,1912,'Santa Cruz de Tenerife'),(32,'Racing de Santander',12000,1913,'Santander'),(33,'CD Numancia',5000,1945,'Soria'),(34,'AD Alcorcón',4000,1971,'Alcorcón'),(35,'CD Lugo',3000,1953,'Lugo'),(36,'Real Murcia',10000,1908,'Murcia'),(37,'Gimnàstic de Tarragona',8000,1914,'Tarragona'),(38,'CE Sabadell',6000,1903,'Sabadell'),(39,'CF Reus Deportiu',3000,1909,'Reus'),(40,'CD Mirandés',2000,1927,'Miranda de Ebro'),(41,'Cultural Leonesa',5000,1923,'León'),(42,'Ponferradina',4000,1922,'Ponferrada'),(43,'Albacete Balompié',7000,1940,'Albacete'),(44,'Extremadura UD',3000,1924,'Almendralejo'),(45,'UD Logroñés',2000,1940,'Logroño'),(46,'Lleida Esportiu',4000,1939,'Lleida'),(47,'FC Cartagena',6000,1995,'Cartagena'),(48,'CD Castellón',5000,1922,'Castellón de la Plana'),(49,'Hércules CF',8000,1922,'Alicante'),(50,'UD Salamanca',3000,1923,'Salamanca'),(51,'Xerez CD',2000,1947,'Jerez de la Frontera'),(52,'Córdoba CF',10000,1954,'Córdoba'),(53,'Recreativo de Huelva',5000,1889,'Huelva'),(54,'UE Llagostera',1000,1947,'Llagostera');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(2) DEFAULT NULL,
  `equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `jugador_FK` (`equipo`),
  CONSTRAINT `jugador_FK` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (19,'Pedri','González',20,2),(20,'Gavi','Páez',19,2),(21,'Ansu','Fati',20,2),(22,'Yeremy','Pino',20,7),(30,'Alexander','Isak',24,10),(61,'Alberto','Soro',25,26),(62,'Sergio','Bermudo',23,26),(63,'Miguel','De la Fuente',22,27),(66,'Dani','Escriche',23,28),(67,'Largie','Ramazani',23,29),(74,'Aritz','López Garai',25,32),(84,'Pol','Lozano',25,37),(89,'Álvaro','Peña',24,40),(118,'Javi','Ruiz',25,54),(143,'Julián','Alvarez',24,25),(159,'Yeremi','Pino',20,41),(169,'Dani','Vivian',24,51),(173,'Fede','Valverde',25,1),(175,'Fran','Beltran',24,3),(176,'Gonzalo','Villar',25,4),(181,'Jesús','Areso',24,9),(182,'Jorge','Cuenca',24,10),(193,'Óscar','Rodríguez',25,21),(196,'Pedro','Porro',24,24),(200,'Renan','Lodi',25,28),(209,'Víctor','Campos',24,37),(221,'Víctor','Gómez',24,49),(229,'Yeremi','Pino',20,3),(243,'Eduardo','Camavinga',20,17),(261,'Nahuel','Molina',25,35),(267,'Reinier','Jesus',22,41),(268,'Rodrygo','Goes',23,42),(269,'Ronald','Araújo',24,43),(273,'Víctor','Chust',23,47),(275,'Zidane','Fernández',20,49),(277,'Aitor','Bunuel',25,51),(278,'Álvaro','Aguirre',24,52),(279,'Ander','Barrenetxea',22,53);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'equipo-jugador'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 11:28:26
