USE raumschiffe;

DROP TABLE IF EXISTS `auftrag`;

CREATE TABLE `auftrag` (
  `auftragId` int(11) NOT NULL AUTO_INCREMENT,
  `auftragName` varchar(100) DEFAULT NULL,
  `beschreibung` text,
  `erteilungsdatum` date DEFAULT NULL,
  `beendigungsdatum` date DEFAULT NULL,
  `folgeaufragId_fk` int(11) DEFAULT NULL,
  `auftragTypId_fk` int(11) DEFAULT NULL,
  `flotteId_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`auftragId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auftrag`
--

LOCK TABLES `auftrag` WRITE;
INSERT INTO `auftrag` VALUES (1,'Sektor X erkunden','','2301-04-04',NULL,NULL,1,1),(2,'Raumpiraten jagen','','2301-05-06',NULL,NULL,2,2),(3,'Dunkle Materie nach Caprica bringen','','2301-05-03','2301-06-01',4,3,3),(4,'Personen zur Erde bringen','','2301-06-02',NULL,NULL,3,3),(5,'Grenze überwachen','','2300-09-09','2301-01-04',NULL,4,4),(6,'Invasion verhindern','','2299-09-09','2300-01-04',7,2,5),(7,'Territorium zurück erobern','Holen Sie sich das verlorene Gebiet zurück','2300-01-05','2300-03-04',8,2,2),(8,'Soldaten ins Kampfgebiet bringen','','2300-03-05','2300-04-04',9,3,2),(9,'Rohstoffe zum Wiederaufbau transportieren','Vieles wurde zerstört. Bauen wir es wieder auf.','2300-05-05','2300-06-04',NULL,3,2);
UNLOCK TABLES;

--
-- Table structure for table `auftragtyp`
--

DROP TABLE IF EXISTS `auftragtyp`;
CREATE TABLE `auftragtyp` (
  `auftragtypId` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(50) DEFAULT NULL,
  `beschreibung` text,
  PRIMARY KEY (`auftragtypId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auftragtyp`
--

LOCK TABLES `auftragtyp` WRITE;
INSERT INTO `auftragtyp` VALUES (1,'Forschung',''),(2,'Kampf','Bösen Aliens Arschtritte geben'),(3,'Transport','Rohstoffe von A nach B bringen'),(4,'Patrouille','');
UNLOCK TABLES;


--
-- Table structure for table `planet`
--

DROP TABLE IF EXISTS `planet`;
CREATE TABLE `planet` (
  `planetid` int(11) NOT NULL,
  `planetname` varchar(100) DEFAULT NULL,
  `bevoelkerung` int(11) DEFAULT NULL,
  `galaxie` int(11) DEFAULT NULL,
  `sonnensystem` int(11) DEFAULT NULL,
  `planetenposition` int(11) DEFAULT NULL,
  `metallLager` int(11) DEFAULT NULL,
  `kristallLager` int(11) DEFAULT NULL,
  `dunkleMaterieLager` int(11) DEFAULT NULL,
  PRIMARY KEY (`planetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planet`
--

LOCK TABLES `planet` WRITE;
INSERT INTO `planet` VALUES (1,'Erde',7000000,1,1,3,0,0,0),(2,'Mars',7000,1,1,4,0,0,0),(3,'Vulkan',123456,3,4,4,0,0,0),(4,'Romulus',12236,6,2,2,0,0,0),(5,'Sirius',1226,3,4,2,0,0,0),(6,'Beteigeuze',12,4,7,2,0,0,0),(7,'Centauri Prime',8123876,12,6,2,0,0,0),(8,'Narn',47851,12,9,2,0,0,0),(9,'Bajor',4741851,1,9,5,0,0,0),(10,'Caprica',1234332,4,5,6,0,0,0),(11,'Tatooine',1432,2,1,1,0,0,0);
UNLOCK TABLES;


--
-- Table structure for table `flotte`
--

DROP TABLE IF EXISTS `flotte`;
CREATE TABLE `flotte` (
  `flotteId` int(11) NOT NULL AUTO_INCREMENT,
  `flottenname` varchar(100) NOT NULL,
  `maximaleGroesse` int(11) NOT NULL DEFAULT '5',
  `planetId_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`flotteId`),
  UNIQUE KEY `flottenname` (`flottenname`),
  KEY `planetId_fk` (`planetId_fk`),
  CONSTRAINT `flotte_ibfk_1` FOREIGN KEY (`planetId_fk`) REFERENCES `planet` (`planetid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flotte`
--

LOCK TABLES `flotte` WRITE;
INSERT INTO `flotte` VALUES (1,'kampfflotte 1',10,2),(2,'geschwader 1',5,1),(3,'Transporter mit Escorte',3,NULL),(4,'Leere Flotte',5,1),(5,'Starke Flotte',20,NULL),(6,'Unbeschaeftigt',5,2);
UNLOCK TABLES;

--
-- Table structure for table `gebaeude`
--

DROP TABLE IF EXISTS `gebaeude`;
CREATE TABLE `gebaeude` (
  `gebaeudeId` int(11) DEFAULT NULL,
  `gebaeudeName` varchar(100) DEFAULT NULL,
  `kristallKosten` int(11) DEFAULT NULL,
  `metallKosten` int(11) DEFAULT NULL,
  `dunkleMaterieKosten` int(11) DEFAULT NULL,
  `typ` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gebaeude`
--

LOCK TABLES `gebaeude` WRITE;
INSERT INTO `gebaeude` VALUES (1,'Werft',500,1000,100,'Z'),(2,'Kristallmine',100,50,0,'P'),(3,'Metallfabrik',100,50,0,'P'),(4,'Lager',3000,500,2500,'Z'),(5,'Kaserne',4500,2000,500,'M'),(6,'Wohngebäude',400,200,40,'Z'),(7,'Krankenhaus',600,800,400,'Z'),(8,'Ruine',0,0,0,'X');
UNLOCK TABLES;

--
-- Table structure for table `gebaeudeaufplanet`
--

DROP TABLE IF EXISTS `gebaeudeaufplanet`;
CREATE TABLE `gebaeudeaufplanet` (
  `gebaeudeAufPlanetId` int(11) DEFAULT NULL,
  `gebaeudeId_fk` int(11) DEFAULT NULL,
  `planetId_fk` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gebaeudeaufplanet`
--

LOCK TABLES `gebaeudeaufplanet` WRITE;
INSERT INTO `gebaeudeaufplanet` VALUES (1,1,1,3),(2,2,1,3),(3,3,1,5),(4,4,1,5),(5,5,1,1),(6,6,1,0),(7,7,1,0),(8,1,2,3),(9,2,2,4),(10,3,2,4),(11,4,2,0),(12,5,2,0),(13,6,2,2),(14,7,2,3),(15,1,3,5),(16,2,3,7),(17,3,3,6),(18,4,3,0),(19,5,3,0),(20,6,3,3),(21,7,3,3),(22,1,4,3),(23,2,4,3),(24,3,4,3),(25,4,4,3),(26,5,4,5),(27,6,4,5),(28,7,4,2),(29,1,5,2),(30,2,5,2),(31,3,5,2),(32,4,5,5),(33,5,5,6),(34,6,5,6),(35,7,5,6);
UNLOCK TABLES;


DROP TABLE IF EXISTS `kapitaen`;
CREATE TABLE `kapitaen` (
  `kapitaenid` int(11) DEFAULT NULL,
  `kapitaenname` varchar(100) DEFAULT NULL,
  `heimatplanet` varchar(100) DEFAULT NULL,
  `gehalt` double DEFAULT NULL,
  `dienstjahre` int(11) DEFAULT NULL,
  `heimatplanetId_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kapitaen`
--

LOCK TABLES `kapitaen` WRITE;
INSERT INTO `kapitaen` VALUES (1,'Picard','Erde',3000,15,1),(2,'Kirk','Erde',3500,15,1),(3,'Spock','Vulkan',2500,3,3),(4,'Skywalker','Tatooine',2500,10,11),(5,'Janeway','Erde',5000,6,1),(6,'Adama','Caprica',6000,7,10),(7,'Meier',NULL,4000,5,NULL),(8,'Meyer',NULL,4300,8,NULL),(9,'Maier','Caprica',3600,6,10),(10,'Sisko','Erde',2600,10,1),(11,'Sinclair','Erde',2600,10,1),(12,'Blaubär','Erde',6000,300,1);
UNLOCK TABLES;

--
-- Table structure for table `logbuch`
--

DROP TABLE IF EXISTS `logbuch`;
CREATE TABLE `logbuch` (
  `logbuchId` int(11) NOT NULL AUTO_INCREMENT,
  `raumschiffid_fk` int(11) DEFAULT NULL,
  `archiviert` smallint(6) DEFAULT '0',
  PRIMARY KEY (`logbuchId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logbuch`
--

LOCK TABLES `logbuch` WRITE;
INSERT INTO `logbuch` VALUES (4,10,1);
UNLOCK TABLES;



--
-- Table structure for table `raumschiff`
--

DROP TABLE IF EXISTS `raumschiff`;
CREATE TABLE `raumschiff` (
  `raumschiffId` int(11) NOT NULL AUTO_INCREMENT,
  `raumschiffname` varchar(255) DEFAULT NULL,
  `schaden` double DEFAULT NULL,
  `aktiv` tinyint(1) DEFAULT NULL,
  `raumschifftypid_fk` int(11) DEFAULT NULL,
  `kapitaenId_fk` int(11) DEFAULT NULL,
  `flotteId_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`raumschiffId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `raumschiff`
--

LOCK TABLES `raumschiff` WRITE;
INSERT INTO `raumschiff` VALUES (1,'Enterprise',55,1,1,1,1),(2,'Voyager',80,1,2,5,2),(3,'DeepSpace 9',20,1,3,10,NULL),(4,'Sehnsucht nach Unendlichkeit',0,1,4,4,3),(5,'Babylon 5',50,1,3,11,NULL),(6,'Weisser Stern',90,1,1,9,1),(7,'Serenity',0,1,4,6,3),(8,'Millenium Falke',0,1,2,3,NULL),(9,'Defiant',0,1,2,5,6);
UNLOCK TABLES;
DELIMITER ;


--
-- Table structure for table `raumschifftyp`
--

DROP TABLE IF EXISTS `raumschifftyp`;
CREATE TABLE `raumschifftyp` (
  `raumschifftypid` int(11) NOT NULL,
  `bezeichnung` varchar(100) DEFAULT NULL,
  `besatzung` int(11) DEFAULT NULL,
  `groesse` int(11) DEFAULT NULL,
  `anzahlgeschuetze` int(11) DEFAULT NULL,
  `schildstaerke` double DEFAULT NULL,
  `lagerraum` int(11) DEFAULT NULL,
  `geschwindigkeit` double DEFAULT NULL,
  PRIMARY KEY (`raumschifftypid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `raumschifftyp`
--

LOCK TABLES `raumschifftyp` WRITE;
INSERT INTO `raumschifftyp` VALUES (1,'Fregatte',1000,500,150,1567.12,50,1123),(2,'Forschungsschiff',100,200,20,987.4,100,2000),(3,'Raumstation',10000,7000,1234,2345.67,9878,0),(4,'Transportschiff',200,3000,120,800.67,9000,400),(5,'Spionageschiff',10,10,5,30,0,3000),(6,'Passagierschiff',10,500,10,30,0,1600);
UNLOCK TABLES;

--
-- Table structure for table `schadensbericht`
--

DROP TABLE IF EXISTS `schadensbericht`;
CREATE TABLE `schadensbericht` (
  `schadensberichtId` int(11) NOT NULL AUTO_INCREMENT,
  `raumschiffId_fk` int(11) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `schaden` double DEFAULT NULL,
  PRIMARY KEY (`schadensberichtId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schadensbericht`
--

LOCK TABLES `schadensbericht` WRITE;
INSERT INTO `schadensbericht` VALUES (10,1,'2019-05-19',55),(11,2,'2019-05-19',80),(12,3,'2019-05-19',20),(13,4,'2019-05-19',0),(14,5,'2019-05-19',50),(15,6,'2019-05-19',90),(16,7,'2019-05-19',0),(17,8,'2019-05-19',0),(18,9,'2019-05-19',0);
UNLOCK TABLES;

--
-- Table structure for table `werft`
--

DROP TABLE IF EXISTS `werft`;
CREATE TABLE `werft` (
  `raumschiffId` int(11) NOT NULL AUTO_INCREMENT,
  `raumschiffname` varchar(255) DEFAULT NULL,
  `raumschifftypid_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`raumschiffId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `werft`
--

LOCK TABLES `werft` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `zeit`
--

DROP TABLE IF EXISTS `zeit`;
CREATE TABLE `zeit` (
  `zeit` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zeit`
--

LOCK TABLES `zeit` WRITE;
INSERT INTO `zeit` VALUES ('2019-05-19 15:31:55'),('2019-05-19 15:32:00'),('2019-05-19 15:32:05'),('2019-05-19 15:32:10'),('2019-05-19 15:32:15'),('2019-05-19 15:32:20'),('2019-05-19 15:32:25'),('2019-05-19 15:44:17'),('2019-05-19 15:44:22'),('2019-05-19 15:44:27'),('2019-05-19 15:44:32'),('2019-05-19 15:44:37'),('2019-05-19 15:44:42'),('2019-05-19 15:44:51'),('2019-05-19 15:45:22'),('2019-05-19 15:45:27'),('2019-05-19 15:45:32'),('2019-05-19 15:45:37'),('2019-05-19 15:46:00'),('2019-05-19 15:46:05'),('2019-05-19 15:46:10'),('2019-05-19 15:46:15'),('2019-05-19 15:46:20'),('2019-05-19 15:46:25'),('2019-05-19 15:46:30'),('2019-05-19 15:46:35'),('2019-05-19 15:46:40'),('2019-05-19 15:46:45'),('2019-05-19 15:46:50'),('2019-05-19 15:46:55'),('2019-05-19 15:47:00');
UNLOCK TABLES;

-- Dump completed on 2019-05-19 15:54:31
