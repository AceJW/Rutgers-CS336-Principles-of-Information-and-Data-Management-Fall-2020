-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: cs336jiazhao.cc5oyeunwz5y.us-east-2.rds.amazonaws.com    Database: RailwayBooking
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `emailAddress` varchar(50) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `disable` varchar(45) DEFAULT 'no',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('1','1','1@1.com','1','1',18,'yes'),('a','a','a@a','a','a',10,'no'),('aa','aa','a@a','aa','aa',9,'no'),('AAA','AAA','AAA@AAA','AAA','AAA',80,'no'),('abc','abc','s@a','abc','abc',19,'no'),('b','b','b@b','b','b',22,'no'),('c','c','c@c','c','c',20,'yes'),('d','d','d@d','d','d',90,'no'),('ddd','ddd','ddd@d','ddd','ddd',0,'no'),('hello','hello','hello@hello.com','hello','hello',1,'no');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `ssn` char(9) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('111111112','a','b','c02','123'),('111111113','a','c','c03','123'),('111111114','a','d','c04','123'),('111111115','a','e','c05','123'),('111111116','a','ef','c06','123'),('123121234','Jackie','Chan','admin','123456'),('234232345','Steven','Rogers','c01','123');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  3:13:47
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: cs336jiazhao.cc5oyeunwz5y.us-east-2.rds.amazonaws.com    Database: StationSystem
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Station` (
  `Sid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `city_name` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Sid`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Station`
--

LOCK TABLES `Station` WRITE;
/*!40000 ALTER TABLE `Station` DISABLE KEYS */;
INSERT INTO `Station` VALUES ('120','unS','un','NY'),('123','losS','los','los'),('130','mdS','md','CA'),('150','pyS','Py','CA'),('151','nbS','nb','NJ'),('160','detS','det','NJ'),('161','detaS','deta','NJ'),('162','detalS','detal','NJ');
/*!40000 ALTER TABLE `Station` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  3:13:52
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: cs336jiazhao.cc5oyeunwz5y.us-east-2.rds.amazonaws.com    Database: LineSystem
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Line`
--

DROP TABLE IF EXISTS `Line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Line` (
  `line_name` varchar(30) NOT NULL,
  PRIMARY KEY (`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Line`
--

LOCK TABLES `Line` WRITE;
/*!40000 ALTER TABLE `Line` DISABLE KEYS */;
INSERT INTO `Line` VALUES ('G111'),('G112'),('G113'),('G114'),('G115'),('G116'),('G117'),('G118'),('G119'),('G120'),('G121'),('G122'),('G217'),('G218'),('G219'),('G220'),('G221'),('G222'),('G223'),('G224'),('G225');
/*!40000 ALTER TABLE `Line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Line_Train_Schedule`
--

DROP TABLE IF EXISTS `Line_Train_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Line_Train_Schedule` (
  `line_name` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `origin` varchar(30) NOT NULL,
  `departure_time` time NOT NULL,
  `destination` varchar(30) NOT NULL,
  `arrive_time` time NOT NULL,
  `stops` int NOT NULL,
  `fare` float NOT NULL,
  PRIMARY KEY (`line_name`,`date`),
  CONSTRAINT `Line_Train_Schedule_ibfk_1` FOREIGN KEY (`line_name`) REFERENCES `Line` (`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Line_Train_Schedule`
--

LOCK TABLES `Line_Train_Schedule` WRITE;
/*!40000 ALTER TABLE `Line_Train_Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Line_Train_Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Line_current`
--

DROP TABLE IF EXISTS `Line_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Line_current` (
  `line_name` varchar(30) NOT NULL,
  `station_sid` varchar(30) NOT NULL,
  `time_from_departure` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`line_name`,`station_sid`),
  KEY `station_sid` (`station_sid`),
  CONSTRAINT `Line_current_ibfk_1` FOREIGN KEY (`line_name`) REFERENCES `Line` (`line_name`),
  CONSTRAINT `Line_current_ibfk_2` FOREIGN KEY (`station_sid`) REFERENCES `StationSystem`.`Station` (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Line_current`
--

LOCK TABLES `Line_current` WRITE;
/*!40000 ALTER TABLE `Line_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `Line_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Line_has_station`
--

DROP TABLE IF EXISTS `Line_has_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Line_has_station` (
  `line_name` varchar(30) NOT NULL,
  `station_sid` varchar(30) NOT NULL,
  `s_name` varchar(30) NOT NULL,
  `station_index` int NOT NULL,
  `arrive_to_station_time` time DEFAULT NULL,
  `departure_from_station_time` time DEFAULT NULL,
  PRIMARY KEY (`line_name`,`station_sid`),
  KEY `station_sid` (`station_sid`),
  CONSTRAINT `Line_has_station_ibfk_1` FOREIGN KEY (`line_name`) REFERENCES `Line` (`line_name`),
  CONSTRAINT `Line_has_station_ibfk_2` FOREIGN KEY (`station_sid`) REFERENCES `StationSystem`.`Station` (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Line_has_station`
--

LOCK TABLES `Line_has_station` WRITE;
/*!40000 ALTER TABLE `Line_has_station` DISABLE KEYS */;
INSERT INTO `Line_has_station` VALUES ('G111','120','unS',1,'00:00:00','11:31:30'),('G111','130','mdS',4,'13:00:00',NULL),('G111','150','pyS',2,'11:50:00','12:00:00'),('G111','151','nbS',3,'12:20:00','12:31:00'),('G112','120','unS',1,NULL,'11:31:00'),('G112','150','pyS',2,'12:25:00','12:35:00'),('G112','151','nbS',3,'13:35:00','13:40:00'),('G112','160','detS',5,'15:40:00',NULL),('G112','162','detalS',4,'14:40:00','14:50:00'),('G113','150','pyS',5,'15:00:00',NULL),('G113','151','nbS',1,NULL,'11:35:00'),('G113','160','detS',2,'12:25:00','12:35:00'),('G113','161','detaS',3,'13:30:00','13:38:00'),('G113','162','detalS',4,'14:15:00','14:23:00'),('G114','120','unS',6,'16:00:00',NULL),('G114','123','losS',1,NULL,'09:30:00'),('G114','150','pyS',5,'15:00:00','15:10:00'),('G114','151','nbS',3,'12:07:00','12:10:00'),('G114','160','detS',2,'11:20:00','11:25:00'),('G114','161','detaS',4,'13:20:00','13:30:00'),('G115','150','pyS',1,NULL,'10:10:00'),('G115','160','detS',3,'15:00:00','15:11:00'),('G115','161','detaS',4,'12:20:00','12:25:00'),('G115','162','detalS',4,'16:30:00',NULL),('G116','120','unS',2,'11:55:00',NULL),('G116','161','detaS',1,NULL,'08:25:00'),('G117','120','unS',1,NULL,'08:30:00'),('G117','161','detaS',2,'16:30:00',NULL),('G118','120','unS',1,NULL,'09:30:00'),('G118','161','detaS',2,'10:30:00',NULL),('G119','120','unS',1,NULL,'10:30:00'),('G119','161','detaS',2,'11:30:00',NULL),('G120','120','unS',1,NULL,'11:30:00'),('G120','161','detaS',2,'12:30:00','00:00:00'),('G121','120','unS',1,NULL,'08:30:00'),('G121','161','detaS',2,'10:30:00',NULL),('G122','120','unS',1,NULL,'09:30:00'),('G122','161','detaS',2,'11:30:00',NULL),('G217','120','unS',1,NULL,'08:30:00'),('G217','161','detaS',2,'09:30:00',NULL),('G218','120','unS',1,NULL,'09:30:00'),('G218','161','detaS',2,'10:30:00',NULL),('G219','120','unS',1,NULL,'10:30:00'),('G219','161','detaS',2,'11:30:00',NULL),('G220','120','unS',2,'11:30:00',NULL),('G220','161','detaS',1,NULL,'09:30:00'),('G221','120','unS',2,'09:30:00',NULL),('G221','161','detaS',1,NULL,'08:30:00'),('G222','120','unS',2,'11:30:00',NULL),('G222','161','detaS',1,NULL,'07:30:00'),('G223','150','pyS',2,'13:35:00',NULL),('G223','151','nbS',1,'00:00:00','12:35:00'),('G224','150','pyS',2,NULL,'13:20:00'),('G224','151','nbS',1,'14:50:00',NULL),('G225','150','pyS',2,'13:35:00',NULL),('G225','151','nbS',1,NULL,'12:35:00');
/*!40000 ALTER TABLE `Line_has_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train` (
  `tid` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
INSERT INTO `Train` VALUES ('1111'),('2222'),('3333'),('4444'),('5555'),('6666'),('7777'),('8888'),('9987'),('9988'),('9989'),('9990'),('9991'),('9992'),('9993'),('9994'),('9995'),('9996'),('9997'),('9998'),('9999');
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train_Schedule`
--

DROP TABLE IF EXISTS `Train_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train_Schedule` (
  `line_name` varchar(30) NOT NULL,
  `tid` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `origin_sid` varchar(30) NOT NULL,
  `origin_s_name` varchar(30) NOT NULL,
  `dest_sid` varchar(30) NOT NULL,
  `dest_s_name` varchar(30) NOT NULL,
  `departure_time` time NOT NULL,
  `arrive_time` time NOT NULL,
  `fare_for_each_stop` varchar(30) NOT NULL,
  `total_fare` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`line_name`,`tid`,`date`),
  KEY `origin_sid` (`origin_sid`),
  KEY `dest_sid` (`dest_sid`),
  KEY `tid` (`tid`),
  CONSTRAINT `Train_Schedule_ibfk_1` FOREIGN KEY (`line_name`) REFERENCES `Line` (`line_name`),
  CONSTRAINT `Train_Schedule_ibfk_2` FOREIGN KEY (`origin_sid`) REFERENCES `StationSystem`.`Station` (`Sid`),
  CONSTRAINT `Train_Schedule_ibfk_3` FOREIGN KEY (`dest_sid`) REFERENCES `StationSystem`.`Station` (`Sid`),
  CONSTRAINT `Train_Schedule_ibfk_4` FOREIGN KEY (`tid`) REFERENCES `Train` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train_Schedule`
--

LOCK TABLES `Train_Schedule` WRITE;
/*!40000 ALTER TABLE `Train_Schedule` DISABLE KEYS */;
INSERT INTO `Train_Schedule` VALUES ('G111','1111','2021-01-01','120','unS','130','mdS','11:31:30','13:00:00','8','24'),('G112','2222','2021-01-01','120','unS','160','detS','11:31:00','15:40:00','7','28'),('G113','3333','2019-03-03','151','nbS','150','pyS','11:35:00','15:00:00','6','24'),('G114','4444','2018-05-06','123','losS','120','unS','09:30:00','16:00:00','5','25'),('G115','5555','2018-06-09','150','pyS','162','detalS','10:10:00','16:30:00','4','12'),('G116','6666','2020-01-13','161','detaS','120','unS','08:25:00','11:55:00','9','9'),('G117','7777','2019-02-01','120','unS','161','detaS','08:30:00','16:30:00','4','4'),('G118','8888','2019-02-01','120','unS','161','detaS','09:30:00','10:30:00','5','5'),('G119','9999','2019-02-01','120','unS','161','detaS','10:30:00','11:30:00','3','3'),('G120','9993','2019-02-01','120','unS','161','detaS','11:30:00','12:30:00','3','3'),('G121','9994','2019-02-01','120','unS','161','detaS','08:30:00','10:00:00','3','3'),('G122','9995','2019-02-01','120','unS','161','detaS','09:30:00','11:30:00','3','3'),('G217','9996','2021-02-01','120','unS','161','detaS','08:30:00','09:30:00','3','3'),('G218','9997','2021-02-01','120','unS','161','detaS','09:30:00','10:30:00','3','3'),('G219','9998','2021-02-01','120','unS','161','detaS','10:30:00','11:30:00','3','3'),('G220','9992','2021-02-01','161','detaS','120','unS','09:30:00','11:30:00','4','4'),('G221','9991','2021-02-01','161','detaS','120','unS','08:30:00','09:30:00','5','5'),('G222','9990','2021-02-01','161','detaS','120','unS','07:30:00','11:30:00','6','6'),('G223','9989','2021-01-01','151','nbS','150','pyS','12:35:00','13:35:00','2','2'),('G223','9989','2021-02-01','151','nbS','150','pyS','12:35:00','13:35:00','2','2'),('G223','9989','2021-09-03','151','nbS','150','pyS','12:35:00','13:35:00','2','2'),('G224','9988','2021-01-01','150','pyS','151','nbS','13:20:00','14:50:00','4','4'),('G225','9987','2021-09-03','151','nbS','150','pyS','12:35:00','13:35:00','7','7');
/*!40000 ALTER TABLE `Train_Schedule` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  3:14:06
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: cs336jiazhao.cc5oyeunwz5y.us-east-2.rds.amazonaws.com    Database: ReservationSystem
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Have_Reservation`
--

DROP TABLE IF EXISTS `Have_Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Have_Reservation` (
  `reserve_num` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `line_name` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `origin` varchar(30) NOT NULL,
  `departure_time` time NOT NULL,
  `dest` varchar(30) NOT NULL,
  `arrive_time` time NOT NULL,
  `stop_num` varchar(10) NOT NULL,
  `fare` float NOT NULL,
  `state` varchar(45) DEFAULT 'in_progress',
  `one_or_round_way` varchar(45) DEFAULT 'one_way',
  PRIMARY KEY (`reserve_num`,`username`,`line_name`),
  KEY `line_name` (`line_name`),
  KEY `username` (`username`),
  KEY `origin` (`origin`),
  KEY `dest` (`dest`),
  CONSTRAINT `Have_Reservation_ibfk_1` FOREIGN KEY (`line_name`) REFERENCES `LineSystem`.`Line` (`line_name`),
  CONSTRAINT `Have_Reservation_ibfk_2` FOREIGN KEY (`username`) REFERENCES `RailwayBooking`.`Customer` (`username`),
  CONSTRAINT `Have_Reservation_ibfk_3` FOREIGN KEY (`origin`) REFERENCES `StationSystem`.`Station` (`name`),
  CONSTRAINT `Have_Reservation_ibfk_4` FOREIGN KEY (`dest`) REFERENCES `StationSystem`.`Station` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Have_Reservation`
--

LOCK TABLES `Have_Reservation` WRITE;
/*!40000 ALTER TABLE `Have_Reservation` DISABLE KEYS */;
INSERT INTO `Have_Reservation` VALUES (1,'1','G111','2019-02-01','unS','11:31:00','mdS','13:00:00','8',8,'in_progress','one_way'),(2,'1','G114','2018-05-06','losS','09:30:00','unS','16:00:00','5',25,'in_progress','one_way'),(3,'1','G113','2019-03-03','nbs','11:35:00','pyS','15:00:00','6',24,'in_progress','one_way'),(4,'1','G115','2018-06-09','pyS','10:10:00','detalS','16:30:00','4',12,'in_progress','one_way'),(5,'a','G117','2019-02-01','unS','08:30:00','detaS','09:30:00','1',2.4,'complete','one_way'),(6,'a','G116','2020-01-13','detaS','08:25:00','unS','11:55:00','1',3,'in_progress','round_way'),(6,'a','G117','2019-02-01','unS','08:30:00','detaS','09:30:00','1',3,'in_progress','round_way'),(7,'a','G116','2020-01-13','detaS','08:25:00','unS','11:55:00','1',3,'in_progress','round_way'),(7,'a','G118','2019-02-01','unS','09:30:00','detaS','10:30:00','1',3,'in_progress','round_way'),(8,'a','G117','2019-02-01','unS','08:30:00','detaS','09:30:00','1',3,'in_progress','round_way'),(8,'a','G222','2021-02-01','detaS','07:30:00','unS','11:30:00','1',3,'in_progress','round_way'),(9,'a','G117','2019-02-01','unS','08:30:00','detaS','09:30:00','1',2.4,'complete','one_way'),(10,'a','G117','2019-02-01','unS','08:30:00','detaS','09:30:00','1',2.4,'complete','one_way'),(11,'a','G117','2019-02-01','unS','08:30:00','detaS','09:30:00','1',2.4,'complete','one_way'),(12,'a','G122','2019-02-01','unS','09:30:00','detaS','11:30:00','1',2.4,'complete','one_way'),(13,'a','G119','2019-02-01','unS','10:30:00','detaS','11:30:00','1',2.4,'complete','one_way'),(15,'a','G114','2018-05-06','detaS','13:30:00','unS','16:00:00','2',10,'in_progress','one_way'),(16,'a','G111','2019-02-01','unS','11:31:00','mdS','13:00:00','3',19.2,'complete','one_way'),(17,'a','G111','2019-02-01','unS','11:31:00','mdS','13:00:00','3',24,'in_progress','one_way'),(18,'a','G114','2018-05-06','nbS','12:10:00','pyS','15:00:00','2',10,'in_progress','one_way'),(19,'a','G111','2019-02-01','unS','11:31:00','mdS','13:00:00','3',24,'in_progress','one_way'),(20,'a','G114','2018-05-06','nbS','12:10:00','unS','16:00:00','3',15,'in_progress','one_way'),(21,'a','G114','2018-02-06','detS','11:25:00','detaS','13:20:00','2',10,'in_progress','one_way'),(22,'a','G111','2019-02-06','unS','11:31:00','mdS','13:00:00','3',19.2,'complete','one_way'),(23,'a','G122','2019-02-07','unS','09:30:00','detaS','11:30:00','1',2.4,'complete','one_way'),(24,'a','G122','2019-02-07','unS','09:30:00','detaS','11:30:00','1',2.4,'complete','one_way'),(25,'1','G115','2019-02-09','pyS','10:10:00','detalS','16:30:00','4',12,'complete','one_way'),(25,'a','G119','2019-02-01','unS','10:30:00','detaS','11:30:00','1',3,'in_progress','one_way'),(26,'a','G119','2019-02-01','unS','10:30:00','detaS','11:30:00','1',3,'in_progress','one_way'),(27,'a','G119','2019-02-01','unS','10:30:00','detaS','11:30:00','1',3,'in_progress','round_way'),(27,'a','G222','2021-02-01','detaS','07:30:00','unS','11:30:00','1',3,'in_progress','round_way'),(28,'a','G114','2019-02-06','nbS','12:10:00','unS','16:00:00','3',15,'in_progress','one_way'),(30,'a','G219','2021-02-01','unS','10:30:00','detaS','11:30:00','1',4.8,'complete','round_way'),(30,'a','G222','2021-02-01','detaS','07:30:00','unS','11:30:00','1',4.8,'complete','round_way'),(31,'a','G220','2021-09-01','detaS','09:30:00','unS','11:30:00','1',3.2,'complete','one_way'),(32,'a','G220','2021-09-01','detaS','09:30:00','unS','11:30:00','1',3.2,'complete','one_way'),(33,'a','G220','2021-09-01','detaS','09:30:00','unS','11:30:00','1',3.2,'complete','one_way'),(34,'a','G220','2021-09-01','detaS','09:30:00','unS','11:30:00','1',3.2,'complete','one_way'),(35,'a','G220','2021-09-01','detaS','09:30:00','unS','11:30:00','1',3.2,'complete','one_way'),(36,'a','G219','2021-09-02','unS','10:30:00','detaS','11:30:00','1',4.8,'complete','round_way'),(37,'a','G219','2021-09-02','unS','10:30:00','detaS','11:30:00','1',4.8,'complete','round_way'),(38,'a','G219','2021-09-02','unS','10:30:00','detaS','11:30:00','1',4.8,'complete','round_way'),(39,'a','G219','2021-09-02','unS','10:30:00','detaS','11:30:00','1',4.8,'complete','round_way'),(40,'a','G122','2021-09-03','unS','09:30:00','detaS','11:30:00','1',2.4,'complete','one_way'),(41,'a','G122','2021-09-03','unS','09:30:00','detaS','11:30:00','1',2.4,'complete','one_way'),(42,'a','G122','2021-09-03','unS','09:30:00','detaS','11:30:00','1',2.4,'complete','one_way'),(43,'a','G111','2021-09-04','unS','11:31:00','mdS','13:00:00','3',19.2,'complete','one_way'),(44,'a','G111','2021-09-04','unS','11:31:00','mdS','13:00:00','3',19.2,'complete','one_way'),(45,'a','G114','2021-09-05','nbS','12:10:00','pyS','15:00:00','2',10,'complete','one_way'),(46,'1','G115','2021-09-06','pyS','10:10:00','detalS','16:30:00','4',12,'in_progress','one_way'),(47,'a','G119','2021-09-07','unS','10:30:00','detaS','11:30:00','1',3,'complete','one_way'),(48,'a','G117','2019-02-01','unS','08:30:00','detaS','16:30:00','1',4,'in_progress','one_way'),(49,'a','G117','2019-02-01','unS','08:30:00','detaS','16:30:00','1',4,'in_progress','one_way'),(50,'a','G111','2021-01-01','pyS','12:00:00','nbs','12:20:00','1',6.4,'complete','one_way'),(51,'a','G117','2019-02-01','unS','08:30:00','detaS','16:30:00','1',4,'complete','one_way'),(52,'1','G117','2019-02-01','unS','08:30:00','detaS','16:30:00','1',4,'complete','one_way'),(53,'c','G117','2019-02-01','unS','08:30:00','detaS','16:30:00','1',4,'complete','one_way'),(54,'d','G117','2019-02-01','unS','08:30:00','detaS','16:30:00','1',4,'complete','one_way');
/*!40000 ALTER TABLE `Have_Reservation` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  3:14:11
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: cs336jiazhao.cc5oyeunwz5y.us-east-2.rds.amazonaws.com    Database: Questions
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `AllQuestions`
--

DROP TABLE IF EXISTS `AllQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AllQuestions` (
  `question` varchar(150) NOT NULL,
  `answer` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AllQuestions`
--

LOCK TABLES `AllQuestions` WRITE;
/*!40000 ALTER TABLE `AllQuestions` DISABLE KEYS */;
INSERT INTO `AllQuestions` VALUES ('?','aa'),('a','a'),('aa','absolutely'),('aa c','aa'),('aa ee','bcd'),('aaaaa',''),('abc','aa'),('aeiou',''),('as',''),('ASD',''),('bbb',''),('bce',''),('Can I buy tickets?',' Yes'),('Can I create account','Yes'),('why?','no why');
/*!40000 ALTER TABLE `AllQuestions` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  3:14:16
