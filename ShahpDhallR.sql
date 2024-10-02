CREATE DATABASE  IF NOT EXISTS `pickup_sports` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pickup_sports`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pickup_sports
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `game_id` int DEFAULT NULL,
  `user_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `username` (`username`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`username`) REFERENCES `pickup_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'prathams28',5,'Can someone bring a ball'),(2,'prathams28',6,'I might be 5 minutes late'),(3,'prathams28',17,'Can someone bring water'),(4,'ritika',6,'Okay got  it!'),(5,'prathams28',8,'Hello'),(6,'prathams28',10,'Testing comments'),(7,'prathams28',14,'Testing comments 2'),(8,'prathams28',7,'Comments in joined game'),(9,'prathams28',19,'Comments in joined game');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-08 09:50:23.909426'),(2,'auth','0001_initial','2023-12-08 09:50:25.084139'),(3,'admin','0001_initial','2023-12-08 09:50:25.362236'),(4,'admin','0002_logentry_remove_auto_add','2023-12-08 09:50:25.381698'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-08 09:50:25.394042'),(6,'admin','0004_alter_logentry_user','2023-12-08 09:50:25.410943'),(7,'admin','0005_alter_logentry_user','2023-12-08 09:50:25.429950'),(8,'admin','0006_alter_logentry_user','2023-12-08 09:50:25.446342'),(9,'admin','0007_alter_logentry_user','2023-12-08 09:50:25.462389'),(10,'admin','0008_alter_logentry_user','2023-12-08 09:50:25.474074'),(11,'admin','0009_alter_logentry_user','2023-12-08 09:50:25.490737'),(12,'admin','0010_alter_logentry_user','2023-12-08 09:50:25.503761'),(13,'admin','0011_alter_logentry_user','2023-12-08 09:50:25.510684'),(14,'admin','0012_alter_logentry_user','2023-12-08 09:50:25.532653'),(15,'admin','0013_alter_logentry_user','2023-12-08 09:50:25.548487'),(16,'contenttypes','0002_remove_content_type_name','2023-12-08 09:50:25.641175'),(17,'auth','0002_alter_permission_name_max_length','2023-12-08 09:50:25.763969'),(18,'auth','0003_alter_user_email_max_length','2023-12-08 09:50:25.791164'),(19,'auth','0004_alter_user_username_opts','2023-12-08 09:50:25.809552'),(20,'auth','0005_alter_user_last_login_null','2023-12-08 09:50:25.919861'),(21,'auth','0006_require_contenttypes_0002','2023-12-08 09:50:25.951858'),(22,'auth','0007_alter_validators_add_error_messages','2023-12-08 09:50:25.976252'),(23,'auth','0008_alter_user_username_max_length','2023-12-08 09:50:26.120843'),(24,'auth','0009_alter_user_last_name_max_length','2023-12-08 09:50:26.239499'),(25,'auth','0010_alter_group_name_max_length','2023-12-08 09:50:26.269725'),(26,'auth','0011_update_proxy_permissions','2023-12-08 09:50:26.285479'),(27,'auth','0012_alter_user_first_name_max_length','2023-12-08 09:50:26.408003'),(28,'initial','0001_initial','2023-12-08 09:50:26.418925'),(29,'initial','0002_game','2023-12-08 09:50:26.428651'),(30,'initial','0003_delete_customuser_delete_game','2023-12-08 09:50:26.437503'),(31,'sessions','0001_initial','2023-12-08 09:50:26.491008');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('re2urlsx7xodexhbqo2jrpkxic8y5h1p','eyJ1c2VybmFtZSI6Im1hbmFnZXIifQ:1rBo6n:Mf-qh7hroIW1ymEkoMUca17ONq_nvTgIN-CJVUIrGsI','2023-12-23 03:34:29.889990'),('u4ctg7wr4us7wo2fslbcsm7crs9wdx6i','eyJ1c2VybmFtZSI6InByYXRoYW1zMjgifQ:1rBp8o:L6lBQETkGGNPxxcqykAF8jPvT-R8AmhLXjNZ50lKcMc','2023-12-23 04:40:38.916968');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `num_players` int NOT NULL,
  `max_players` int NOT NULL,
  `sport_name` varchar(64) NOT NULL,
  `section_id` int NOT NULL,
  `creator_username` varchar(10) NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `sport_name` (`sport_name`),
  KEY `section_id` (`section_id`),
  KEY `creator_username` (`creator_username`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`sport_name`) REFERENCES `sports` (`sport_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `game_ibfk_3` FOREIGN KEY (`creator_username`) REFERENCES `pickup_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'2023-12-08 04:51:00','2023-12-01 04:51:00',1,10,'Handball',3,'prathams28'),(2,'2023-12-08 04:52:00','2023-12-23 04:52:00',1,2,'American Football',2,'prathams28'),(4,'2023-12-01 13:43:00','2023-12-01 14:43:00',1,10,'American Football',21,'prathams28'),(5,'2023-12-09 13:45:00','2023-12-09 14:45:00',1,11,'Football 11 v 11',22,'prathams28'),(6,'2023-12-10 14:00:00','2023-12-10 15:00:00',2,10,'Football 11 v 11',1,'prathams28'),(7,'2023-12-10 16:00:00','2023-12-10 17:00:00',2,4,'Badminton doubles',1,'ritika'),(8,'2023-12-11 15:30:00','2023-12-11 16:30:00',1,8,'Badminton',2,'prathams28'),(9,'2023-12-11 17:30:00','2023-12-11 18:30:00',1,6,'Basketball',2,'ritika'),(10,'2023-12-12 18:00:00','2023-12-12 19:00:00',1,20,'Hockey',3,'prathams28'),(11,'2023-12-12 20:00:00','2023-12-12 21:00:00',1,8,'Handball',3,'ritika'),(12,'2023-12-25 14:00:00','2023-12-25 15:00:00',1,15,'Basketball',4,'prathams28'),(13,'2023-12-25 16:00:00','2023-12-25 17:00:00',1,6,'Handball',4,'ritika'),(14,'2023-12-26 15:30:00','2023-12-26 16:30:00',1,10,'Rugby',5,'prathams28'),(15,'2023-12-26 17:30:00','2023-12-26 18:30:00',1,8,'Baseball',5,'ritika'),(16,'2023-12-27 18:00:00','2023-12-27 19:00:00',1,12,'Football 11 v 11',6,'prathams28'),(17,'2023-12-27 20:00:00','2023-12-27 21:00:00',1,4,'Badminton doubles',6,'ritika'),(18,'2023-12-28 14:00:00','2023-12-28 15:00:00',1,8,'Badminton',7,'prathams28'),(19,'2023-12-28 16:00:00','2023-12-28 17:00:00',2,6,'Basketball',7,'ritika'),(20,'2023-12-01 10:00:00','2023-12-01 11:00:00',1,10,'Football 11 v 11',1,'prathams28'),(21,'2023-12-01 12:00:00','2023-12-01 13:00:00',1,4,'Badminton doubles',1,'ritika'),(22,'2023-12-02 11:30:00','2023-12-02 12:30:00',1,8,'Badminton',2,'prathams28'),(23,'2023-12-02 13:30:00','2023-12-02 14:30:00',1,6,'Basketball',2,'ritika'),(24,'2023-12-03 17:00:00','2023-12-03 18:00:00',1,20,'Hockey',3,'prathams28'),(25,'2023-12-03 19:00:00','2023-12-03 20:00:00',1,8,'Handball',3,'ritika'),(26,'2023-12-04 10:30:00','2023-12-04 11:30:00',1,12,'Volleyball',4,'prathams28'),(27,'2023-12-04 12:30:00','2023-12-04 13:30:00',1,10,'Tennis doubles',4,'ritika'),(28,'2023-12-08 09:21:00','2023-12-30 17:21:00',1,999,'American Football',2,'prathams28'),(29,'2023-12-15 20:24:00','2023-12-15 22:24:00',1,12,'Baseball',25,'prathams28'),(32,'2023-12-16 23:40:00','2023-12-23 23:40:00',1,4,'American Football',21,'prathams28');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_player_creator` AFTER INSERT ON `game` FOR EACH ROW BEGIN
    INSERT INTO user_join_game (username, game_id)
    VALUES (NEW.creator_username, NEW.game_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ground`
--

DROP TABLE IF EXISTS `ground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ground` (
  `ground_id` int NOT NULL AUTO_INCREMENT,
  `ground_name` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `zipcode` int DEFAULT NULL,
  PRIMARY KEY (`ground_id`),
  KEY `city` (`city`),
  CONSTRAINT `ground_ibfk_1` FOREIGN KEY (`city`) REFERENCES `location` (`city`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ground`
--

LOCK TABLES `ground` WRITE;
/*!40000 ALTER TABLE `ground` DISABLE KEYS */;
INSERT INTO `ground` VALUES (1,'Carter','Boston',2120),(2,'Clemente','Boston',2121),(3,'Fenway','Boston',2122),(4,'Juggernaut','New York',10001),(5,'ARA','New York',10002),(6,'Hudson','New York',10003),(7,'Sunset Park','Los Angeles',90001),(8,'Pacific Park','Los Angeles',90045),(9,'Hollywood Arena','Los Angeles',90010),(10,'Windy City Arena','Chicago',60601),(11,'Lakefront Field','Chicago',60618),(12,'Midwest Stadium','Chicago',60625),(13,'Lone Star Park','Dallas',75201),(14,'Texan Stadium','Dallas',75225),(15,'Dallas Dome','Dallas',75230);
/*!40000 ALTER TABLE `ground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `city` varchar(64) NOT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('Boston','Massachusetts','USA'),('Chicago','Illinois','USA'),('Dallas','Texas','USA'),('Los Angeles','California','USA'),('New York','New York','USA');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_user`
--

DROP TABLE IF EXISTS `pickup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_user` (
  `username` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone_number` decimal(10,0) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `city` (`city`),
  CONSTRAINT `pickup_user_ibfk_1` FOREIGN KEY (`city`) REFERENCES `location` (`city`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_user`
--

LOCK TABLES `pickup_user` WRITE;
/*!40000 ALTER TABLE `pickup_user` DISABLE KEYS */;
INSERT INTO `pickup_user` VALUES ('amb','a','a','2021-10-17','mms',1274567590,'Boston','asss',NULL),('manager','Pratham','Shah','2023-12-08','manager@gmail.com',8238348655,'Los Angeles','ca20d54ab129a9051d1d4ffb265378bdfeaabe6a3f7231fea5fb950d5c0dcdc1',1),('prathams28','Pratham','Shah','2002-03-28','shahpratham2803@gmail.com',8238518655,'Los Angeles','ca20d54ab129a9051d1d4ffb265378bdfeaabe6a3f7231fea5fb950d5c0dcdc1',NULL),('ritika','Ritika','Dhall','2023-12-08','ritika@gmail.com',9090909090,'Boston','ca20d54ab129a9051d1d4ffb265378bdfeaabe6a3f7231fea5fb950d5c0dcdc1',NULL);
/*!40000 ALTER TABLE `pickup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `section_name` varchar(64) NOT NULL,
  `ground_id` int NOT NULL,
  `field_type` varchar(64) DEFAULT NULL,
  `indoor` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `ground_id` (`ground_id`,`section_name`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`ground_id`) REFERENCES `ground` (`ground_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Upper football field',1,'Artificial turf',0),(2,'Lower football field',1,'Real grass',0),(3,'Basketball court',2,'Tiles',1),(4,'Futsal ground',2,'Tiles',0),(5,'Baseball ground',3,'Real grass',1),(6,'Multi-purpose Court',3,'Asphalt',0),(7,'Open Green Area',3,'Grass',0),(8,'Circular Ground',4,'Synthetic turf',0),(9,'Rectangle Free Play Area',4,'Grass',0),(10,'Jogging Track',5,'Rubberized',0),(11,'Open Workout Area',5,'Grass',0),(12,'Squash Court',5,'Grass',1),(13,'Badminton Court 1',5,'Tiles',1),(14,'Badminton Court 2',5,'Tiles',1),(15,'Tennis Court 1',5,'Clay',0),(16,'Tennis Court 2',5,'Clay',0),(17,'Community Baseball Field',6,'Grass',0),(18,'Softball Area',6,'Grass',0),(19,'Pickball Court 1',6,'Concrete',0),(20,'Pickball Court 2',6,'Concrete',0),(21,'Left Open Ground',7,'Grass',0),(22,'Right Covered Ground',7,'Artifical Turf',0),(23,'Open Badminton Court',8,'Asphalt',0),(24,'Outdoor Squash Court',8,'Concrete',0),(25,'Baseball field',8,'Sand',0),(26,'Swimming Pool',8,'Water',1),(27,'American Football Field',8,'Grass',0),(28,'Public Golf Practice Area',9,'Artificial turf',0),(29,'Putting Practice Green',9,'Artificial turf',0),(30,'Football field 1',10,'Field',0),(31,'Football field 2',10,'Field',0),(32,'Football field 3',10,'Field',0),(33,'Multi purpose ground',11,'Grass',0),(34,'Open ground',11,'Natural terrain',0),(35,'Rugby Practice Area',12,'Natural grass',0),(36,'Open Lacrosse Field',12,'Grass',0),(37,'Hockey Field',13,'Grass',0),(38,'Kabbadi Field',13,'Dirt',0),(39,'Skate Park',14,'Concrete',0),(40,'Parkour Zone',14,'Obstacle course',0),(41,'Community Swimming Area',15,'Natural water',0),(42,'Open Diving Spot',15,'Deep water',0);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_sports`
--

DROP TABLE IF EXISTS `section_sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_sports` (
  `section_id` int DEFAULT NULL,
  `sport_name` varchar(64) DEFAULT NULL,
  UNIQUE KEY `section_id` (`section_id`,`sport_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_sports`
--

LOCK TABLES `section_sports` WRITE;
/*!40000 ALTER TABLE `section_sports` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports` (
  `sport_name` varchar(64) NOT NULL,
  `teams` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sport_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES ('American Football',1),('Badminton',0),('Badminton doubles',1),('Baseball',1),('Basketball',1),('Cricket',1),('Football 11 v 11',1),('Frisbee',1),('Handball',1),('Hockey',1),('Quidditch',1),('Rugby',1),('Shotput',0),('Tennis',0),('Tennis doubles',1),('Volleyball',1);
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_give_feedback`
--

DROP TABLE IF EXISTS `user_give_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_give_feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `feedback_description` varchar(200) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `username` (`username`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `user_give_feedback_ibfk_1` FOREIGN KEY (`username`) REFERENCES `pickup_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_give_feedback_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_give_feedback`
--

LOCK TABLES `user_give_feedback` WRITE;
/*!40000 ALTER TABLE `user_give_feedback` DISABLE KEYS */;
INSERT INTO `user_give_feedback` VALUES (1,1,'1','prathams28',2),(2,2,'2','prathams28',2),(3,1,'','prathams28',2),(4,5,'5','prathams28',2),(5,4,'4','prathams28',2),(6,5,'f','prathams28',2),(7,4,'Top ground','prathams28',21),(8,5,'m','prathams28',3),(9,1,'','prathams28',3),(10,1,'','prathams28',3),(11,4,'The ground was well-maintained and clean!','prathams28',1),(12,3,'The ground facilities need some improvements','ritika',1),(13,5,'Loved the spaciousness of the ground for basketball!','prathams28',2),(14,2,'The court surface for basketball needs attention','ritika',2),(15,4,'The hockey ground was in great condition, enjoyed the match!','prathams28',3),(16,1,'Handball ground needs better lighting in the evening','ritika',3),(17,4,'The ground was clean and well-maintained. Enjoyed playing here!','prathams28',1),(18,3,'Suggest improving the seating arrangement around the ground.','ritika',1),(19,5,'The basketball court is top-notch, great surface!','prathams28',2),(20,2,'The ground surroundings need better landscaping.','ritika',2),(21,4,'Hockey ground facilities are excellent, had a fantastic game!','prathams28',3),(22,1,'The lighting in the Handball area needs improvement.','ritika',3),(23,5,'Really liked the open space around the ground, perfect for a game!','prathams28',4),(24,3,'The seating arrangements could be more comfortable.','ritika',4),(25,4,'The cricket ground is well-maintained, had a good match!','prathams28',5),(26,2,'The ground entrance needs better signage.','ritika',5),(27,4,'Top class','prathams28',25),(28,5,'Demo','prathams28',3),(29,4,'The ground was well-maintained and clean!','prathams28',1),(30,3,'The ground facilities need some improvements','ritika',1),(31,5,'Loved the spaciousness of the ground for basketball!','prathams28',2),(32,2,'The court surface for basketball needs attention','ritika',2),(33,4,'The hockey ground was in great condition, enjoyed the match!','prathams28',3),(34,1,'Handball ground needs better lighting in the evening','ritika',3),(35,4,'The ground was clean and well-maintained. Enjoyed playing here!','prathams28',1),(36,3,'Suggest improving the seating arrangement around the ground.','ritika',1),(37,5,'The basketball court is top-notch, great surface!','prathams28',2),(38,2,'The ground surroundings need better landscaping.','ritika',2),(39,4,'Hockey ground facilities are excellent, had a fantastic game!','prathams28',3),(40,1,'The lighting in the Handball area needs improvement.','ritika',3),(41,5,'Really liked the open space around the ground, perfect for a game!','prathams28',4),(42,3,'The seating arrangements could be more comfortable.','ritika',4),(43,4,'The cricket ground is well-maintained, had a good match!','prathams28',5),(44,2,'The ground entrance needs better signage.','ritika',5),(45,4,'The ground was well-maintained and clean!','prathams28',1),(46,3,'The ground facilities need some improvements','ritika',1),(47,5,'Loved the spaciousness of the ground for basketball!','prathams28',2),(48,2,'The court surface for basketball needs attention','ritika',2),(49,4,'The hockey ground was in great condition, enjoyed the match!','prathams28',3),(50,1,'Handball ground needs better lighting in the evening','ritika',3),(51,4,'The ground was clean and well-maintained. Enjoyed playing here!','prathams28',1),(52,3,'Suggest improving the seating arrangement around the ground.','ritika',1),(53,5,'The basketball court is top-notch, great surface!','prathams28',2),(54,2,'The ground surroundings need better landscaping.','ritika',2),(55,4,'Hockey ground facilities are excellent, had a fantastic game!','prathams28',3),(56,1,'The lighting in the Handball area needs improvement.','ritika',3),(57,5,'Really liked the open space around the ground, perfect for a game!','prathams28',4),(58,3,'The seating arrangements could be more comfortable.','ritika',4),(59,4,'The cricket ground is well-maintained, had a good match!','prathams28',5),(60,2,'The ground entrance needs better signage.','ritika',5);
/*!40000 ALTER TABLE `user_give_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_join_game`
--

DROP TABLE IF EXISTS `user_join_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_join_game` (
  `username` varchar(10) DEFAULT NULL,
  `game_id` int DEFAULT NULL,
  UNIQUE KEY `username` (`username`,`game_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `user_join_game_ibfk_1` FOREIGN KEY (`username`) REFERENCES `pickup_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_join_game_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_join_game`
--

LOCK TABLES `user_join_game` WRITE;
/*!40000 ALTER TABLE `user_join_game` DISABLE KEYS */;
INSERT INTO `user_join_game` VALUES ('prathams28',1),('prathams28',2),('prathams28',4),('prathams28',5),('prathams28',6),('prathams28',7),('prathams28',8),('prathams28',10),('prathams28',12),('prathams28',14),('prathams28',16),('prathams28',18),('prathams28',19),('prathams28',20),('prathams28',22),('prathams28',24),('prathams28',26),('prathams28',28),('prathams28',29),('prathams28',32),('ritika',6),('ritika',7),('ritika',9),('ritika',11),('ritika',13),('ritika',15),('ritika',17),('ritika',19),('ritika',21),('ritika',23),('ritika',25),('ritika',27);
/*!40000 ALTER TABLE `user_join_game` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_player` AFTER INSERT ON `user_join_game` FOR EACH ROW BEGIN
	DECLARE user_check VARCHAR(64);
    SELECT creator_username FROM game WHERE game_id = NEW.game_id INTO user_check;
    IF NEW.username <> user_check THEN
		UPDATE game
		SET num_players = num_players + 1
		WHERE game_id = NEW.game_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `leave_player` AFTER DELETE ON `user_join_game` FOR EACH ROW BEGIN
		UPDATE game
		SET num_players = num_players - 1
		WHERE game_id = OLD.game_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'pickup_sports'
--

--
-- Dumping routines for database 'pickup_sports'
--
/*!50003 DROP FUNCTION IF EXISTS `auth_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `auth_login`(
    p_username VARCHAR(10),
    p_email VARCHAR(255),
    p_password VARCHAR(255)
) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE this_username VARCHAR(10);
    DECLARE stored_password VARCHAR(255);
    DECLARE password_match BOOLEAN;
    DECLARE p_is_valid BOOLEAN;
    DECLARE p_message VARCHAR(255);

    -- Initialize variables
    SET p_is_valid = FALSE;
    SET p_message = NULL;

    -- Check if email or phone number is provided
    IF p_email IS NOT NULL THEN
        -- Retrieve username based on email
        SELECT username INTO this_username FROM pickup_user WHERE email = p_email LIMIT 1;
    ELSE
        -- Retrieve username based on provided username
        SELECT username INTO this_username FROM pickup_user WHERE username = p_username LIMIT 1;
    END IF;

    -- Check if a user with the provided credential exists
    IF this_username IS NOT NULL THEN
        -- Match the password
        SELECT password INTO stored_password FROM pickup_user WHERE username = this_username LIMIT 1;
        SET p_is_valid = TRUE;
        SET password_match = CAST(stored_password AS CHAR) = CAST(p_password AS CHAR);

        -- Check if passwords match
        IF password_match THEN
            SET p_message = 'Login successful';
        ELSE
            SET p_message = 'Invalid password';
        END IF;
    ELSE
        -- Set message for invalid credential
        SET p_message = 'Username does not exist';
    END IF;

    -- Return the result message
    RETURN p_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_if_staff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_if_staff`(p_username VARCHAR(10)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE is_staff_value BOOLEAN;
    SELECT is_staff INTO is_staff_value FROM pickup_user WHERE username = p_username;
    RETURN is_staff_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_player_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_player_count`(
    p_game_id INT
) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE player_count INT;
	SELECT COUNT(*) INTO player_count
	FROM user_join_game
	WHERE game_id = p_game_id;
    SET player_count = player_count;
    RETURN player_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_user_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_user_city`(
	p_username VARCHAR(64)
) RETURNS varchar(64) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE city_u VARCHAR(64);
    SET city_u = NULL;
    SELECT city INTO city_u 
    FROM pickup_user WHERE username = p_username;
    RETURN city_u;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `popular_ground_for_sport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `popular_ground_for_sport`(
	p_sport_name VARCHAR(64),
    p_city VARCHAR(64)
) RETURNS varchar(64) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE popular_ground VARCHAR(64);
    SET popular_ground = NULL;
    SELECT ground_name INTO popular_ground
    FROM (
		SELECT g.ground_name, 
        COUNT(*) AS ground_count
		FROM game g
        JOIN section ON section.section_id = g.section_id
        JOIN ground ON ground.ground_id  = section.ground_id
        WHERE ground.city = p_city
        GROUP BY g.ground_name
        ORDER BY ground_count DESC
        LIMIT 1
    ) AS sport_counts;
    RETURN popular_ground;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `popular_sport_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `popular_sport_city`(
	p_city VARCHAR(64)
) RETURNS varchar(64) CHARSET utf8mb4
    READS SQL DATA
BEGIN 
	DECLARE max_sport VARCHAR(64);
    SET max_sport = NULL;
    
    SELECT sport_name INTO max_sport
    FROM (
		SELECT g.sport_name, 
        COUNT(*) AS sport_count
		FROM game g
        JOIN section ON section.section_id = g.section_id
        JOIN ground ON ground.ground_id  = section.ground_id
        WHERE ground.city = p_city
        GROUP BY g.sport_name
        ORDER BY sport_count DESC
        LIMIT 1
    ) AS sport_counts;
    RETURN max_sport; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_city`(
    p_city VARCHAR(64),
    p_state VARCHAR(64),
    p_country VARCHAR(64)
)
BEGIN
    INSERT INTO location (city, state, country)
    VALUES (p_city, p_state, p_country);
    SELECT 'City added successfully!' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_ground` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_ground`(
	p_ground_name VARCHAR(64),
	p_city VARCHAR(64), 
	p_zipcode INT
)
BEGIN
    INSERT INTO ground (ground_name, city, zipcode)
    VALUES (p_ground_name, p_city, p_zipcode);
    SELECT 'Ground added successfully!' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_section` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_section`(
    p_section_name VARCHAR(64),
	p_ground_id INT,
	p_field_type VARCHAR(64),
	p_indoor BOOLEAN
)
BEGIN
    INSERT INTO section (section_name, ground_id, field_type, indoor)
    VALUES (p_section_name, p_ground_id, p_field_type, p_indoor);
    SELECT 'Section added successfully!' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_sport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_sport`(
    p_sport_name VARCHAR(64),
	p_teams BOOLEAN
)
BEGIN
    INSERT INTO sports (sport_name, teams)
    VALUES (p_sport_name, p_teams);
    SELECT 'Sport added successfully!' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `city_ground_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `city_ground_count`(
	IN p_city VARCHAR(15)
)
BEGIN
	SELECT gr.ground_name, COUNT(game_id) AS sport_count FROM game g
    JOIN section s ON s.section_id = g.section_id
    JOIN ground gr ON s.ground_id = gr.ground_id
    WHERE gr.city = p_city
    GROUP BY gr.ground_name
    ORDER BY sport_count DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `city_ground_feedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `city_ground_feedback`(
	IN p_city VARCHAR(15)
)
BEGIN
	SELECT gr.ground_name, AVG(rating) AS avg_rating FROM user_give_feedback f
    JOIN section s ON s.section_id = f.section_id
    JOIN ground gr ON s.ground_id = gr.ground_id
    WHERE gr.city = p_city
    GROUP BY gr.ground_name
    ORDER BY avg_rating DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `city_sports_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `city_sports_count`(
	IN p_city VARCHAR(15)
)
BEGIN
	SELECT g.sport_name, COUNT(game_id) AS sport_count FROM game g
    JOIN section s ON s.section_id = g.section_id
    JOIN ground gr ON s.ground_id = gr.ground_id
    WHERE gr.city = p_city
    GROUP BY (g.sport_name)
    ORDER BY sport_count DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_feedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_feedback`(
	p_rating ENUM('1','2','3','4','5'),
	p_feedback_description VARCHAR(200),
	p_username VARCHAR(10),
	p_section_id INT
)
BEGIN
    INSERT INTO user_give_feedback (rating, feedback_description, username, section_id)
    VALUES (p_rating, p_feedback_description, p_username, p_section_id);
    SELECT 'Feedback created successfully!' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_game`(
        IN p_start_time DATETIME,
        IN p_end_time DATETIME,
        IN p_num_players INT,
        IN p_max_players INT,
        IN p_sport_name VARCHAR(64),
        IN p_section_id INT,
        IN p_creator_username VARCHAR(10)
)
BEGIN
IF p_num_players <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Number of players must be greater than zero';
    END IF;

    -- Validate that max_players is not zero or negative
    IF p_max_players <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Maximum number of players must be greater than zero';
    END IF;
    IF p_start_time > p_end_time THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Start time cannot be greater than end time';
    END IF;
    INSERT INTO game (start_time, end_time, num_players, max_players, section_id, creator_username, sport_name)
    VALUES (p_start_time, p_end_time, p_num_players, p_max_players, p_section_id, p_creator_username, p_sport_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_manager`(
    p_username VARCHAR(10),
    p_email VARCHAR(64),
    p_dob DATE, 
    p_phone_no CHAR(10),
    p_password VARCHAR(256),
    p_last_name VARCHAR(64),
    p_first_name VARCHAR(64),
    p_city VARCHAR(64)
)
BEGIN
    INSERT INTO pickup_user (username, first_name, last_name, date_of_birth,email, phone_number, password, city, is_staff)
    VALUES (p_username, p_first_name, p_last_name, p_dob,p_email, p_phone_no, p_password, p_city, true);
    SELECT 'Manager created successfully!' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user`(
    p_username VARCHAR(10),
    p_email VARCHAR(64),
    p_dob DATE, 
    p_phone_no CHAR(10),
    p_password VARCHAR(256),
    p_last_name VARCHAR(64),
    p_first_name VARCHAR(64),
    p_city VARCHAR(64)
)
BEGIN
    INSERT INTO pickup_user (username, first_name, last_name, date_of_birth,email, phone_number, password, city)
    VALUES (p_username, p_first_name, p_last_name, p_dob,p_email, p_phone_no, p_password, p_city);
    SELECT 'User created successfully!' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_game`(
	p_game_id INT
)
BEGIN
	DELETE FROM game
    WHERE game_id = p_game_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_participant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_participant`(
	p_game_id INT,
    p_username VARCHAR(64)
)
BEGIN
	DELETE FROM user_join_game
    WHERE game_id = p_game_id AND username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_city`(
	IN p_username VARCHAR(64),
	IN p_city VARCHAR(15)
)
BEGIN
	
    UPDATE pickup_user
	SET city = p_city
	WHERE username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_game`(
	IN p_game_id INT,
	IN p_start_time DATETIME,
    IN p_end_time DATETIME,
    IN p_num_players int,
    IN p_max_players int,
    IN p_sport_name varchar(64),
    IN p_section_id int
)
BEGIN
	
    UPDATE game
	SET start_time = p_start_time, end_time = p_end_time, num_players = p_num_players, max_players = p_max_players, sport_name = p_sport_name, section_id = p_section_id
	WHERE game_id = p_game_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_city`()
BEGIN 
	SELECT * FROM location;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comment`(
    IN p_game_id INT
)
BEGIN 
	SELECT * FROM comment WHERE game_id = p_game_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_feedback_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_feedback_search`(
	IN p_ground_id INT
)
BEGIN
    SELECT section_name, feedback_description, rating, username FROM user_give_feedback
    JOIN section ON section.section_id = user_give_feedback.section_id
    JOIN ground ON ground.ground_id = section.ground_id
    WHERE ground.ground_id = p_ground_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_games_by_creator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_games_by_creator`(
	p_username VARCHAR(10)
)
BEGIN
	SELECT * FROM game
    JOIN section ON section.section_id = game.section_id
    JOIN ground ON ground.ground_id = section.ground_id 
    JOIN location ON ground.city = location.city
    WHERE game.start_time > NOW() AND creator_username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_games_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_games_city`(
		p_city VARCHAR(64)
)
BEGIN
	SELECT * FROM games
    JOIN section ON section.section_id = games.section_id
    JOIN ground ON ground.ground_id = section.ground_id 
    JOIN location ON ground.city = location.city
    WHERE location.city = p_city AND game.start_time > NOW();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_games_joined` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_games_joined`(
	p_username VARCHAR(10)
)
BEGIN
	SELECT * FROM user_join_game
    JOIN game ON game.game_id = user_join_game.game_id 
    JOIN section ON section.section_id = game.section_id
    JOIN ground ON ground.ground_id = section.ground_id 
    JOIN location ON ground.city = location.city
    WHERE game.start_time > NOW() AND user_join_game.username = p_username AND game.creator_username <> p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_games_sport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_games_sport`(
	p_sport_name VARCHAR(64),
    p_teams BOOLEAN
)
BEGIN
	SELECT * FROM games
    WHERE games.sport_name = p_sport_name AND games.teams = p_teams;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_games_sport_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_games_sport_city`(
	p_sport_name VARCHAR(64),
    p_city VARCHAR(64),
    p_username VARCHAR(64)
)
BEGIN
	SELECT * FROM game
    JOIN section ON section.section_id = game.section_id
    JOIN ground ON ground.ground_id = section.ground_id 
    JOIN location ON ground.city = location.city
    WHERE location.city = p_city AND game.start_time > NOW() AND game.sport_name = p_sport_name AND game.creator_username <> p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_game_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_game_by_id`(
	p_game_id INT
)
BEGIN
	SELECT * FROM game
    WHERE game_id = p_game_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_ground` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ground`(
	p_city VARCHAR(64)
)
BEGIN 
	SELECT * FROM ground
    WHERE city = p_city;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_grounds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_grounds`(
)
BEGIN 
	SELECT * FROM ground;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_section` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_section`(
	p_ground_id INT
)
BEGIN 
	SELECT * FROM section
    WHERE ground_id = p_ground_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_section_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_section_id`(
	IN p_game_id INT
)
BEGIN 
	SELECT section_id FROM game
    WHERE game_id = p_game_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sports`()
BEGIN 
	SELECT * FROM sports;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_join_games` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_join_games`(
	IN p_username VARCHAR(10)
)
BEGIN
	SELECT * FROM user_join_game u
    WHERE u.username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_comment`(
	IN p_username VARCHAR(64),
    IN p_game_id INT,
    IN p_comment VARCHAR(200)
)
BEGIN 
	INSERT INTO comment(username, game_id, user_comment) VALUES (p_username, p_game_id, p_comment);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_user_user_join_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user_user_join_game`(
	IN p_username VARCHAR(64),
    IN p_game_id INT
)
BEGIN
	INSERT INTO user_join_game (username, game_id)
    VALUES (p_username, p_game_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `past_games` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `past_games`(
	IN p_username VARCHAR(64)
)
BEGIN
    SELECT * FROM user_join_game
    JOIN game ON game.game_id = user_join_game.game_id 
    JOIN section ON section.section_id = game.section_id
    JOIN ground ON ground.ground_id = section.ground_id 
    JOIN location ON ground.city = location.city
    WHERE game.end_time < NOW() AND user_join_game.username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `section_ground_from_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `section_ground_from_game`(
	IN game_id_p INT
)
BEGIN
	SELECT section.section_name, section.section_id, ground.ground_name, ground.ground_id FROM game g
    JOIN section ON g.section_id = section.section_id
    JOIN ground ON section.ground_id = ground.ground_id
    WHERE g.game_id = game_id_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sport_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sport_game`(
	IN p_city VARCHAR(15),
    IN p_username VARCHAR(64)
)
BEGIN 
	SELECT sport_name FROM game g
    JOIN section s ON g.section_id = s.section_id
    JOIN ground gr ON s.ground_id = gr.ground_id
    JOIN location l ON gr.city = l.city
    WHERE l.city = p_city AND g.creator_username <> p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_section` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_section`(
	IN p_section_id INT,
	IN p_section_name VARCHAR(64),
	IN p_field_type VARCHAR(64),
	IN p_indoor BOOLEAN
)
BEGIN
    UPDATE section
	SET section_name = p_section_name, field_type = p_field_type, indoor = p_indoor
	WHERE section_id = p_section_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 23:46:09
