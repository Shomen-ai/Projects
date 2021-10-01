CREATE DATABASE  IF NOT EXISTS `Mediateka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Mediateka`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Mediateka
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `Actors`
--

DROP TABLE IF EXISTS `Actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actors` (
  `idActors` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idActors`),
  UNIQUE KEY `idActors_UNIQUE` (`idActors`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actors`
--

LOCK TABLES `Actors` WRITE;
/*!40000 ALTER TABLE `Actors` DISABLE KEYS */;
INSERT INTO `Actors` VALUES (1,'Винни','Джонс'),(2,'Эдриан','Броуди'),(3,'Сами','Гейл'),(4,'Кристина','Хендрикс'),(5,'Брайан','Крэнстон'),(6,'Аарон','Пол'),(7,'Боб','Оденкёрк'),(8,'Джейсон','Стэйтхем');
/*!40000 ALTER TABLE `Actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actors_has_Movies_Serials`
--

DROP TABLE IF EXISTS `Actors_has_Movies_Serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actors_has_Movies_Serials` (
  `Actors_idActors` int NOT NULL,
  `Movies_Serials_idMovies_Serials` int NOT NULL,
  PRIMARY KEY (`Actors_idActors`,`Movies_Serials_idMovies_Serials`),
  KEY `fk_Actors_has_Movies_Serials_Movies_Serials1_idx` (`Movies_Serials_idMovies_Serials`),
  KEY `fk_Actors_has_Movies_Serials_Actors1_idx` (`Actors_idActors`),
  CONSTRAINT `fk_Actors_has_Movies_Serials_Actors1` FOREIGN KEY (`Actors_idActors`) REFERENCES `Actors` (`idActors`),
  CONSTRAINT `fk_Actors_has_Movies_Serials_Movies_Serials1` FOREIGN KEY (`Movies_Serials_idMovies_Serials`) REFERENCES `Movies_Serials` (`idMovies_Serials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actors_has_Movies_Serials`
--

LOCK TABLES `Actors_has_Movies_Serials` WRITE;
/*!40000 ALTER TABLE `Actors_has_Movies_Serials` DISABLE KEYS */;
INSERT INTO `Actors_has_Movies_Serials` VALUES (2,13),(3,13),(4,13),(5,15),(6,15),(7,15),(1,17),(8,17);
/*!40000 ALTER TABLE `Actors_has_Movies_Serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `idAuthor` int NOT NULL AUTO_INCREMENT,
  `Authorcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAuthor`),
  UNIQUE KEY `idAuthor_UNIQUE` (`idAuthor`),
  UNIQUE KEY `Authorcol_UNIQUE` (`Authorcol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (3,'Red Hot Chili Peppers'),(1,'The Dave Brubeck Quartet'),(4,'The Killers'),(2,'Дайте танк(!)'),(6,'Каста'),(5,'Король и Шут');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Author_has_Music`
--

DROP TABLE IF EXISTS `Author_has_Music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author_has_Music` (
  `Author_idAuthor` int NOT NULL,
  `Music_idMusic` int NOT NULL,
  PRIMARY KEY (`Author_idAuthor`,`Music_idMusic`),
  KEY `fk_Author_has_Music_Music1_idx` (`Music_idMusic`),
  KEY `fk_Author_has_Music_Author1_idx` (`Author_idAuthor`),
  CONSTRAINT `fk_Author_has_Music_Author1` FOREIGN KEY (`Author_idAuthor`) REFERENCES `Author` (`idAuthor`),
  CONSTRAINT `fk_Author_has_Music_Music1` FOREIGN KEY (`Music_idMusic`) REFERENCES `Music` (`idMusic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author_has_Music`
--

LOCK TABLES `Author_has_Music` WRITE;
/*!40000 ALTER TABLE `Author_has_Music` DISABLE KEYS */;
INSERT INTO `Author_has_Music` VALUES (1,9),(2,10),(3,11),(4,12),(5,13),(6,14);
/*!40000 ALTER TABLE `Author_has_Music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `idCountry` int NOT NULL AUTO_INCREMENT,
  `Countrycol` varchar(45) NOT NULL,
  PRIMARY KEY (`idCountry`),
  UNIQUE KEY `idCountry_UNIQUE` (`idCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'США'),(2,'Великобритания');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Device`
--

DROP TABLE IF EXISTS `Device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Device` (
  `idDevice` int NOT NULL AUTO_INCREMENT,
  `Name_of_device` varchar(45) NOT NULL,
  `Date_add_to_base` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`idDevice`),
  UNIQUE KEY `idDevice_UNIQUE` (`idDevice`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `User_of_device` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Device`
--

LOCK TABLES `Device` WRITE;
/*!40000 ALTER TABLE `Device` DISABLE KEYS */;
INSERT INTO `Device` VALUES (11,'Macbook Air 2017','2019-09-01',1),(12,'Samsung Galaxy A9','2019-09-02',1),(13,'Honor Lite 20','2018-08-03',2),(14,'PC_Acer','2018-07-04',2),(15,'IPhone SE','2017-06-05',3),(16,'PC_MSI_NightBlade','2017-05-06',3);
/*!40000 ALTER TABLE `Device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Director`
--

DROP TABLE IF EXISTS `Director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Director` (
  `idDirector` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idDirector`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Director`
--

LOCK TABLES `Director` WRITE;
/*!40000 ALTER TABLE `Director` DISABLE KEYS */;
INSERT INTO `Director` VALUES (1,'Тони','Кей'),(2,'Мишель','МакЛарен'),(3,'Гай','Ричи');
/*!40000 ALTER TABLE `Director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre_has_Movies_Serials`
--

DROP TABLE IF EXISTS `Genre_has_Movies_Serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre_has_Movies_Serials` (
  `Genre_idGenre` int NOT NULL,
  `Movies_Serials_idMovies_Serials` int NOT NULL,
  PRIMARY KEY (`Genre_idGenre`,`Movies_Serials_idMovies_Serials`),
  KEY `fk_Genre_has_Movies_Serials_Movies_Serials1_idx` (`Movies_Serials_idMovies_Serials`),
  KEY `fk_Genre_has_Movies_Serials_Genre1_idx` (`Genre_idGenre`),
  CONSTRAINT `fk_Genre_has_Movies_Serials_Genre1` FOREIGN KEY (`Genre_idGenre`) REFERENCES `Genre_of_Movie_Serials` (`idGenre`),
  CONSTRAINT `fk_Genre_has_Movies_Serials_Movies_Serials1` FOREIGN KEY (`Movies_Serials_idMovies_Serials`) REFERENCES `Movies_Serials` (`idMovies_Serials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre_has_Movies_Serials`
--

LOCK TABLES `Genre_has_Movies_Serials` WRITE;
/*!40000 ALTER TABLE `Genre_has_Movies_Serials` DISABLE KEYS */;
INSERT INTO `Genre_has_Movies_Serials` VALUES (1,13),(1,15),(3,15),(4,15),(2,17),(4,17),(5,17);
/*!40000 ALTER TABLE `Genre_has_Movies_Serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre_of_Movie_Serials`
--

DROP TABLE IF EXISTS `Genre_of_Movie_Serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre_of_Movie_Serials` (
  `idGenre` int NOT NULL AUTO_INCREMENT,
  `Genrecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGenre`),
  UNIQUE KEY `idGenre_UNIQUE` (`idGenre`),
  UNIQUE KEY `Genrecol_UNIQUE` (`Genrecol`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre_of_Movie_Serials`
--

LOCK TABLES `Genre_of_Movie_Serials` WRITE;
/*!40000 ALTER TABLE `Genre_of_Movie_Serials` DISABLE KEYS */;
INSERT INTO `Genre_of_Movie_Serials` VALUES (5,'боевик'),(1,'драма'),(2,'комедия'),(4,'криминал'),(3,'триллер');
/*!40000 ALTER TABLE `Genre_of_Movie_Serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre_of_music`
--

DROP TABLE IF EXISTS `Genre_of_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre_of_music` (
  `idGenre_of_music` int NOT NULL AUTO_INCREMENT,
  `Genre_of_musiccol` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenre_of_music`),
  UNIQUE KEY `idGenre_of_music_UNIQUE` (`idGenre_of_music`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre_of_music`
--

LOCK TABLES `Genre_of_music` WRITE;
/*!40000 ALTER TABLE `Genre_of_music` DISABLE KEYS */;
INSERT INTO `Genre_of_music` VALUES (1,'джаз'),(2,'инди-рок'),(3,'альтернативный-рок'),(4,'панк'),(5,'хип-хоп');
/*!40000 ALTER TABLE `Genre_of_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre_of_music_has_Music`
--

DROP TABLE IF EXISTS `Genre_of_music_has_Music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre_of_music_has_Music` (
  `Genre_of_music_idGenre_of_music` int NOT NULL,
  `Music_idMusic` int NOT NULL,
  PRIMARY KEY (`Genre_of_music_idGenre_of_music`,`Music_idMusic`),
  KEY `fk_Genre_of_music_has_Music_Music1_idx` (`Music_idMusic`),
  KEY `fk_Genre_of_music_has_Music_Genre_of_music1_idx` (`Genre_of_music_idGenre_of_music`),
  CONSTRAINT `fk_Genre_of_music_has_Music_Genre_of_music1` FOREIGN KEY (`Genre_of_music_idGenre_of_music`) REFERENCES `Genre_of_music` (`idGenre_of_music`),
  CONSTRAINT `fk_Genre_of_music_has_Music_Music1` FOREIGN KEY (`Music_idMusic`) REFERENCES `Music` (`idMusic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre_of_music_has_Music`
--

LOCK TABLES `Genre_of_music_has_Music` WRITE;
/*!40000 ALTER TABLE `Genre_of_music_has_Music` DISABLE KEYS */;
INSERT INTO `Genre_of_music_has_Music` VALUES (1,9),(2,10),(3,11),(3,12),(4,13),(5,14);
/*!40000 ALTER TABLE `Genre_of_music_has_Music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `movie_info`
--

DROP TABLE IF EXISTS `movie_info`;
/*!50001 DROP VIEW IF EXISTS `movie_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movie_info` AS SELECT 
 1 AS `ID Фильма/Сериала`,
 1 AS `Название фильма`,
 1 AS `Жанр`,
 1 AS `Режиссёр`,
 1 AS `Актёры`,
 1 AS `Год`,
 1 AS `Страна`,
 1 AS `Длительность`,
 1 AS `Сериал/Фильм`,
 1 AS `Возратсное ограничение`,
 1 AS `На каком устройстве находится`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Movies_Serials`
--

DROP TABLE IF EXISTS `Movies_Serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movies_Serials` (
  `idMovies_Serials` int NOT NULL AUTO_INCREMENT,
  `Name_MS` varchar(45) NOT NULL,
  `Date_premiere` year DEFAULT NULL,
  `Age` varchar(3) DEFAULT NULL,
  `Time_MS` time DEFAULT NULL,
  `Type_MS` varchar(6) NOT NULL,
  `MS_device` int NOT NULL,
  PRIMARY KEY (`idMovies_Serials`),
  UNIQUE KEY `idMovies_Serials_UNIQUE` (`idMovies_Serials`),
  KEY `MS_device_idx` (`MS_device`),
  CONSTRAINT `MS_device` FOREIGN KEY (`MS_device`) REFERENCES `Device` (`idDevice`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movies_Serials`
--

LOCK TABLES `Movies_Serials` WRITE;
/*!40000 ALTER TABLE `Movies_Serials` DISABLE KEYS */;
INSERT INTO `Movies_Serials` VALUES (13,'Учитель на замену',2011,'16+','01:38:00','Кино',11),(15,'Во все тяжкие',2008,'18+','00:47:00','Сериал',14),(17,'Карты, деньги, два ствола',1998,'18+','01:47:00','Кино',16);
/*!40000 ALTER TABLE `Movies_Serials` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Movies_Serials_BEFORE_INSERT` BEFORE INSERT ON `movies_serials` FOR EACH ROW BEGIN
	if new.Type_MS != 'Кино' or new.Type_MS != 'Сериал' then 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The value in the Type_MS field must be "Кино" or "Сериал"';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Movies_Serials_has_Country`
--

DROP TABLE IF EXISTS `Movies_Serials_has_Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movies_Serials_has_Country` (
  `Movies_Serials_idMovies_Serials` int NOT NULL,
  `Country_idCountry` int NOT NULL,
  PRIMARY KEY (`Movies_Serials_idMovies_Serials`,`Country_idCountry`),
  KEY `fk_Movies_Serials_has_Country_Country1_idx` (`Country_idCountry`),
  KEY `fk_Movies_Serials_has_Country_Movies_Serials1_idx` (`Movies_Serials_idMovies_Serials`),
  CONSTRAINT `fk_Movies_Serials_has_Country_Country1` FOREIGN KEY (`Country_idCountry`) REFERENCES `Country` (`idCountry`),
  CONSTRAINT `fk_Movies_Serials_has_Country_Movies_Serials1` FOREIGN KEY (`Movies_Serials_idMovies_Serials`) REFERENCES `Movies_Serials` (`idMovies_Serials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movies_Serials_has_Country`
--

LOCK TABLES `Movies_Serials_has_Country` WRITE;
/*!40000 ALTER TABLE `Movies_Serials_has_Country` DISABLE KEYS */;
INSERT INTO `Movies_Serials_has_Country` VALUES (13,1),(15,1),(17,2);
/*!40000 ALTER TABLE `Movies_Serials_has_Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movies_Serials_has_Director`
--

DROP TABLE IF EXISTS `Movies_Serials_has_Director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movies_Serials_has_Director` (
  `Director_idDirector` int NOT NULL,
  `Movies_Serials_idMovies_Serials` int NOT NULL,
  PRIMARY KEY (`Director_idDirector`,`Movies_Serials_idMovies_Serials`),
  KEY `Director_idDirector_idx` (`Director_idDirector`),
  KEY `Movies_Serials_idMovies_Serials_idx` (`Movies_Serials_idMovies_Serials`),
  CONSTRAINT `Director_idDirector` FOREIGN KEY (`Director_idDirector`) REFERENCES `Director` (`idDirector`),
  CONSTRAINT `Movies_Serials_idMovies_Serials` FOREIGN KEY (`Movies_Serials_idMovies_Serials`) REFERENCES `Movies_Serials` (`idMovies_Serials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movies_Serials_has_Director`
--

LOCK TABLES `Movies_Serials_has_Director` WRITE;
/*!40000 ALTER TABLE `Movies_Serials_has_Director` DISABLE KEYS */;
INSERT INTO `Movies_Serials_has_Director` VALUES (1,13),(2,15),(3,17);
/*!40000 ALTER TABLE `Movies_Serials_has_Director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Music`
--

DROP TABLE IF EXISTS `Music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Music` (
  `idMusic` int NOT NULL AUTO_INCREMENT,
  `Name_M` varchar(45) NOT NULL,
  `Date_realese` date DEFAULT NULL,
  `M_device` int NOT NULL,
  `Time_music` time DEFAULT NULL,
  PRIMARY KEY (`idMusic`),
  KEY `M_device_idx` (`M_device`),
  CONSTRAINT `M_device` FOREIGN KEY (`M_device`) REFERENCES `Device` (`idDevice`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Music`
--

LOCK TABLES `Music` WRITE;
/*!40000 ALTER TABLE `Music` DISABLE KEYS */;
INSERT INTO `Music` VALUES (9,'Take Five','1959-06-02',12,'00:05:25'),(10,'Шанс','2020-04-24',12,'00:03:28'),(11,'Look around','2012-01-25',13,'00:03:28'),(12,'Mr.Brightside','2003-09-29',13,'00:03:42'),(13,'Кукла колдуна','1999-03-01',15,'00:03:23'),(14,'Вокруг Шум','2008-05-15',15,'00:03:33');
/*!40000 ALTER TABLE `Music` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Music_BEFORE_INSERT` BEFORE INSERT ON `music` FOR EACH ROW BEGIN
	if new.Date_realese > date(now()) then
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'The value in the Date_realese field can not be more then NOW';
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `User_of_device`
--

DROP TABLE IF EXISTS `User_of_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_of_device` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_of_device`
--

LOCK TABLES `User_of_device` WRITE;
/*!40000 ALTER TABLE `User_of_device` DISABLE KEYS */;
INSERT INTO `User_of_device` VALUES (1,'Дмитрий','Шайманов','Николаевич'),(2,'Александр','Воронин','Владимирович'),(3,'Михаил','Васильев','Ильич');
/*!40000 ALTER TABLE `User_of_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Mediateka'
--
/*!50003 DROP FUNCTION IF EXISTS `count_actor_in_movies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_actor_in_movies`(Actor_name varchar(45)) RETURNS int
    DETERMINISTIC
BEGIN
	declare count_of_actors int;
    declare id_actor int;
    select idActors into id_actor from Actors where concat(Actors.first_name, ' ', Actors.second_name) = Actor_name;
    select count(*) into count_of_actors from Actors_has_Movies_Serials where Actors_idActors = id_actor;
RETURN count_of_actors;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `time_in_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `time_in_device`(id int) RETURNS time
    DETERMINISTIC
BEGIN
	declare sum_of_movie time;
    declare sum_of_music time;
    declare result time;
    
    select SEC_TO_TIME(sum(TIME_TO_SEC(Time_MS))) into sum_of_movie from Movies_Serials where id = MS_device;
    select SEC_TO_TIME(sum(TIME_TO_SEC(Time_music))) into sum_of_music from Music where id = M_device;
    
    if sum_of_movie is null then set sum_of_movie = '00:00:00'; end if;
    if sum_of_music is null then set sum_of_music = '00:00:00'; end if;
    set result = sum_of_movie + sum_of_music;
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user_with_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user_with_device`(new_first_name varchar(45), new_second_name varchar(45), new_surname varchar(45), new_Name_of_device varchar(45))
BEGIN
	declare buf int;
	insert into User_of_device(first_name, second_name, surname) values (new_first_name, new_second_name, new_surname);
    select idUser into buf from User_of_device where first_name = new_first_name and second_name = new_second_name and surname = new_surname;
    insert into Device(Name_of_device, Date_add_to_base, user_id) values (new_Name_of_device, CURRENT_DATE(), buf);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_time_in_mediateka` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_time_in_mediateka`()
BEGIN
	select sec_to_time(sum(TIME_TO_SEC(time_in_device(idDevice)))) as 'Продолжительность фильмов \nи музыки во всей медиатеке' from Device;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user_with_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_with_device`(id int)
BEGIN
	delete from device where user_id = id;
    delete from User_of_device where idUser = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `how_many_actors_have_films` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `how_many_actors_have_films`()
BEGIN
	select 	concat(first_name,' ',second_name) as 'Актёр',
			count_actor_in_movies(concat(first_name,' ',second_name)) as 'Количество фильмов'
		from Actors;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `time_on_every_devices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `time_on_every_devices`()
BEGIN
    select 	concat(first_name,' ', second_name, ' ',surname) as 'Владелец',
			Name_of_device as 'Устройство',
            time_in_device(idDevice) as 'Время'
		from User_of_device, Device where user_id=idUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `movie_info`
--

/*!50001 DROP VIEW IF EXISTS `movie_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_info` (`ID Фильма/Сериала`,`Название фильма`,`Жанр`,`Режиссёр`,`Актёры`,`Год`,`Страна`,`Длительность`,`Сериал/Фильм`,`Возратсное ограничение`,`На каком устройстве находится`) AS select `movies_serials`.`idMovies_Serials` AS `idMovies_Serials`,`movies_serials`.`Name_MS` AS `Name_MS`,group_concat(distinct `genre_of_movie_serials`.`Genrecol` separator ', ') AS `group_concat(distinct Genrecol SEPARATOR ', ')`,concat(`director`.`first_name`,' ',`director`.`second_name`) AS `concat(Director.first_name, ' ', Director.second_name)`,group_concat(distinct concat(`actors`.`first_name`,' ',`actors`.`second_name`) separator ', ') AS `Name_exp_5`,`movies_serials`.`Date_premiere` AS `Date_premiere`,group_concat(distinct `country`.`Countrycol` separator ', ') AS `group_concat(distinct Countrycol SEPARATOR ', ')`,`movies_serials`.`Time_MS` AS `Time_MS`,`movies_serials`.`Type_MS` AS `Type_MS`,`movies_serials`.`Age` AS `Age`,`device`.`Name_of_device` AS `Name_of_device` from (((((((((`movies_serials` join `actors`) join `actors_has_movies_serials`) join `director`) join `movies_serials_has_director`) join `country`) join `movies_serials_has_country`) join `genre_of_movie_serials`) join `genre_has_movies_serials`) join `device`) where ((`actors`.`idActors` = `actors_has_movies_serials`.`Actors_idActors`) and (`actors_has_movies_serials`.`Movies_Serials_idMovies_Serials` = `movies_serials`.`idMovies_Serials`) and (`movies_serials_has_director`.`Movies_Serials_idMovies_Serials` = `movies_serials`.`idMovies_Serials`) and (`director`.`idDirector` = `movies_serials_has_director`.`Director_idDirector`) and (`country`.`idCountry` = `movies_serials_has_country`.`Country_idCountry`) and (`movies_serials_has_country`.`Movies_Serials_idMovies_Serials` = `movies_serials`.`idMovies_Serials`) and (`genre_of_movie_serials`.`idGenre` = `genre_has_movies_serials`.`Genre_idGenre`) and (`genre_has_movies_serials`.`Movies_Serials_idMovies_Serials` = `movies_serials`.`idMovies_Serials`) and (`device`.`idDevice` = `movies_serials`.`MS_device`)) group by `country`.`Countrycol`,`movies_serials`.`idMovies_Serials`,concat(`director`.`first_name`,' ',`director`.`second_name`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-13 16:47:43
