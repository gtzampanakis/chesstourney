-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: chesstourney
-- ------------------------------------------------------
-- Server version	5.6.15-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT  IGNORE INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add player',7,'add_player'),(20,'Can change player',7,'change_player'),(21,'Can delete player',7,'delete_player'),(22,'Can add tournament',8,'add_tournament'),(23,'Can change tournament',8,'change_tournament'),(24,'Can delete tournament',8,'delete_tournament'),(25,'Can add match',9,'add_match'),(26,'Can change match',9,'change_match'),(27,'Can delete match',9,'delete_match'),(28,'Can add ranks',10,'add_ranks'),(29,'Can change ranks',10,'change_ranks'),(30,'Can delete ranks',10,'delete_ranks'),(31,'Can add rating hist',11,'add_ratinghist'),(32,'Can change rating hist',11,'change_ratinghist'),(33,'Can delete rating hist',11,'delete_ratinghist');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT  IGNORE INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$8JD97JijXFyr$6n8eVkMD55L0tEoG/LcsV85KusC5GiPBrQBsHLT3gR4=','2015-06-21 12:46:57',1,'root','','','giorgos.tzampanakis@gmail.com',1,1,'2015-06-21 12:46:20');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT  IGNORE INTO `django_admin_log` VALUES (1,'2015-06-21 12:53:20','1','<<class \'swiss.models.Player\'> (1) Mike Jones>',2,'Changed nationality.',7,1),(2,'2015-06-21 12:54:29','1','<<class \'swiss.models.Tournament\'> (1) Testing tournament>',1,'',8,1),(3,'2015-06-21 12:54:35','1','<<class \'swiss.models.Match\'> (1) 2015-06-21 <<class \'swiss.models.Player\'> (1) Mike Jones> - <<class \'swiss.models.Player\'> (1) Mike Jones>>',1,'',9,1),(4,'2015-06-21 12:55:23','2','<<class \'swiss.models.Player\'> (2) John Michaels>',1,'',7,1),(5,'2015-06-21 12:55:36','1','<<class \'swiss.models.Match\'> (1) 2015-06-21 <<class \'swiss.models.Player\'> (1) Mike Jones> - <<class \'swiss.models.Player\'> (2) John Michaels>>',2,'Changed black_player.',9,1),(6,'2015-06-21 13:31:02','1','Test tournament (1)',2,'Changed name.',8,1),(7,'2015-06-21 20:48:18','1','Test tournament (1)',2,'Changed players.',8,1),(8,'2015-06-21 21:50:57','1','Test tournament (1)',2,'Changed players.',8,1),(9,'2015-06-22 17:12:45','1','Test tournament (1)',2,'Changed players.',8,1),(10,'2015-06-22 17:12:53','1','Test tournament (1)',2,'No fields changed.',8,1),(11,'2015-06-22 18:38:08','1','Test tournament (1)',2,'Changed players.',8,1),(12,'2015-06-22 21:35:39','30','Nakamura, Hikaru (183) - Wang, Yue (206) (30)',2,'Changed result.',9,1),(13,'2015-06-22 21:35:39','29','Ivanchuk, Vassily (205) - Anand, Viswanathan (182) (29)',2,'Changed result.',9,1),(14,'2015-06-22 21:35:39','28','Harikrishna, P. (204) - Caruana, Fabiano (181) (28)',2,'Changed result.',9,1),(15,'2015-06-22 21:35:39','27','Carlsen, Magnus (180) - So, Wesley (188) (27)',2,'Changed result.',9,1),(16,'2015-06-22 21:35:46','27','Carlsen, Magnus (180) - So, Wesley (188) (27)',2,'Changed result.',9,1),(17,'2015-06-22 21:37:25','27','Carlsen, Magnus (180) - So, Wesley (188) (27)',2,'Changed result.',9,1),(18,'2015-06-22 21:38:20','35','Wang, Yue (206) - Nakamura, Hikaru (183) (35)',2,'Changed result.',9,1),(19,'2015-06-22 21:38:20','34','Anand, Viswanathan (182) - Ivanchuk, Vassily (205) (34)',2,'Changed result.',9,1),(20,'2015-06-22 21:38:20','33','Caruana, Fabiano (181) - Harikrishna, P. (204) (33)',2,'Changed result.',9,1),(21,'2015-06-22 21:38:20','32','Carlsen, Magnus (180) - So, Wesley (188) (32)',2,'Changed result.',9,1),(22,'2015-06-22 21:47:32','40','So, Wesley (188) - Wang, Yue (206) (40)',2,'Changed result.',9,1),(23,'2015-06-22 21:47:32','39','Ivanchuk, Vassily (205) - Anand, Viswanathan (182) (39)',2,'Changed result.',9,1),(24,'2015-06-22 21:47:32','38','Nakamura, Hikaru (183) - Vachier-Lagrave, Maxime (207) (38)',2,'Changed result.',9,1),(25,'2015-06-22 21:47:32','37','Carlsen, Magnus (180) - Caruana, Fabiano (181) (37)',2,'Changed result.',9,1),(26,'2015-06-22 21:49:26','45','Vachier-Lagrave, Maxime (207) - Ivanchuk, Vassily (205) (45)',2,'Changed result.',9,1),(27,'2015-06-22 21:49:26','44','So, Wesley (188) - Harikrishna, P. (204) (44)',2,'Changed result.',9,1),(28,'2015-06-22 21:49:26','43','Caruana, Fabiano (181) - Nakamura, Hikaru (183) (43)',2,'Changed result.',9,1),(29,'2015-06-22 21:49:26','42','Anand, Viswanathan (182) - Carlsen, Magnus (180) (42)',2,'Changed result.',9,1),(30,'2015-06-22 22:01:56','50','Ivanchuk, Vassily (205) - Vachier-Lagrave, Maxime (207) (50)',2,'Changed result.',9,1),(31,'2015-06-22 22:01:56','49','Nakamura, Hikaru (183) - So, Wesley (188) (49)',2,'Changed result.',9,1),(32,'2015-06-22 22:01:56','48','Anand, Viswanathan (182) - Wang, Yue (206) (48)',2,'Changed result.',9,1),(33,'2015-06-22 22:01:56','47','Harikrishna, P. (204) - Carlsen, Magnus (180) (47)',2,'Changed result.',9,1),(34,'2015-06-22 22:05:08','54','So, Wesley (188) - Ivanchuk, Vassily (205) (54)',2,'Changed result.',9,1),(35,'2015-06-22 22:05:08','53','Vachier-Lagrave, Maxime (207) - Harikrishna, P. (204) (53)',2,'Changed result.',9,1),(36,'2015-06-22 22:05:08','52','Caruana, Fabiano (181) - Anand, Viswanathan (182) (52)',2,'Changed result.',9,1),(37,'2015-06-22 22:05:08','51','Nakamura, Hikaru (183) - Carlsen, Magnus (180) (51)',2,'Changed result.',9,1),(38,'2015-06-22 23:06:13','2','test2 (2)',1,'',8,1),(39,'2015-06-23 16:27:06','3','vvv tournament (3)',1,'',8,1),(40,'2015-06-23 16:28:32','4','vvv tournament (4)',1,'',8,1),(41,'2015-06-23 16:28:42','4','vvv tournament (4)',3,'',8,1),(42,'2015-06-23 16:28:42','3','vvv tournament (3)',3,'',8,1),(43,'2015-06-23 16:31:06','2','test2 (2)',3,'',8,1),(44,'2015-06-23 16:31:29','5','V Tournament (5)',1,'',8,1),(45,'2015-06-23 16:32:24','5','V Tournament (5)',3,'',8,1),(46,'2015-06-23 16:32:56','6','VTour (6)',1,'',8,1),(47,'2015-06-23 16:38:02','6','VTour (6)',2,'Changed players.',8,1),(48,'2015-06-23 22:45:04','69','Caruana, Fabiano - Anand, Viswanathan',2,'Changed result.',9,1),(49,'2015-06-23 22:47:05','7','5 players tourney',1,'',8,1),(50,'2015-06-23 22:47:31','68','Nakamura, Hikaru - Carlsen, Magnus',2,'Changed result.',9,1),(51,'2015-06-23 22:48:05','7','5 players tourney',2,'Changed players.',8,1),(52,'2015-06-23 22:48:40','72','Cheparinov, Ivan - Ragger, Markus',2,'Changed result.',9,1),(53,'2015-06-23 22:48:40','71','Hou, Yifan - Short, Nigel D',2,'Changed result.',9,1),(54,'2015-06-23 22:48:40','70','Rodshtein, Maxim - McShane, Luke J',2,'Changed result.',9,1),(55,'2015-06-23 22:48:52','7','5 players tourney',3,'',8,1),(56,'2015-06-23 22:49:20','8','5 player tourney',1,'',8,1),(57,'2015-06-23 22:49:57','75','Granda Zuniga, Julio E - Khairullin, Ildar',2,'Changed result.',9,1),(58,'2015-06-23 22:49:57','74','Zhigalko, Sergei - Van Wely, Loek',2,'Changed result.',9,1),(59,'2015-06-23 22:50:16','78','Khairullin, Ildar - Granda Zuniga, Julio E',2,'Changed result.',9,1),(60,'2015-06-23 22:50:16','77','Alekseev, Evgeny - Zhigalko, Sergei',2,'Changed result.',9,1),(61,'2015-06-23 22:55:40','81','Van Wely, Loek - Khairullin, Ildar',2,'Changed result.',9,1),(62,'2015-06-23 22:55:40','80','Zhigalko, Sergei - Alekseev, Evgeny',2,'Changed result.',9,1),(63,'2015-06-24 15:11:06','84','Anand, Viswanathan - Caruana, Fabiano',2,'Changed result.',9,1),(64,'2015-06-24 15:11:06','83','Carlsen, Magnus - Nakamura, Hikaru',2,'Changed result.',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT  IGNORE INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'swiss','match'),(7,'swiss','player'),(10,'swiss','ranks'),(11,'swiss','ratinghist'),(8,'swiss','tournament');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT  IGNORE INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-06-21 12:26:59'),(2,'auth','0001_initial','2015-06-21 12:27:00'),(3,'admin','0001_initial','2015-06-21 12:27:01'),(4,'contenttypes','0002_remove_content_type_name','2015-06-21 12:27:01'),(5,'auth','0002_alter_permission_name_max_length','2015-06-21 12:27:01'),(6,'auth','0003_alter_user_email_max_length','2015-06-21 12:27:01'),(7,'auth','0004_alter_user_username_opts','2015-06-21 12:27:01'),(8,'auth','0005_alter_user_last_login_null','2015-06-21 12:27:01'),(9,'auth','0006_require_contenttypes_0002','2015-06-21 12:27:01'),(10,'sessions','0001_initial','2015-06-21 12:27:01'),(11,'swiss','0001_initial','2015-06-21 12:27:03'),(12,'swiss','0002_auto_20150621_1535','2015-06-21 12:35:11'),(13,'swiss','0003_auto_20150621_1551','2015-06-21 12:51:48'),(14,'swiss','0004_auto_20150621_1623','2015-06-21 13:24:28'),(15,'swiss','0005_auto_20150621_1625','2015-06-21 13:26:04'),(16,'swiss','0006_tournament_players','2015-06-21 20:45:52'),(17,'swiss','0007_auto_20150623_0016','2015-06-22 21:17:06'),(18,'swiss','0008_auto_20150623_0018','2015-06-22 21:19:02'),(19,'swiss','0009_ratinghist_after_match','2015-06-23 16:01:35'),(20,'swiss','0010_auto_20150623_1947','2015-06-23 16:47:56'),(21,'swiss','0011_auto_20150623_2010','2015-06-23 17:10:34'),(22,'swiss','0012_auto_20150623_2018','2015-06-23 17:18:26');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT  IGNORE INTO `django_session` VALUES ('sm84yien98d5atd0wjgo1ehcwxeg94px','ZWZkMDA2ZTNiOTIwNDM3ZWRkYWIzZTI5NjQwZDVmODdlNmEyNDk3Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MjBlZTJiZmJiOWZkODdlNDQzZTYyZDUyYTRjOGYxOTIxYTg4ZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-07-05 12:46:57');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swiss_match`
--

DROP TABLE IF EXISTS `swiss_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `result` smallint(6) DEFAULT NULL,
  `time_controls` varchar(100) NOT NULL,
  `pgn` longtext NOT NULL,
  `place` varchar(200) NOT NULL,
  `round` smallint(6) NOT NULL,
  `black_player_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `white_player_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `swiss_match_5683eac4` (`black_player_id`),
  KEY `swiss_match_656a3fdb` (`tournament_id`),
  KEY `swiss_match_1a31d0ef` (`white_player_id`),
  CONSTRAINT `swiss_match_black_player_id_595ff7dd_fk_swiss_player_id` FOREIGN KEY (`black_player_id`) REFERENCES `swiss_player` (`id`),
  CONSTRAINT `swiss_match_tournament_id_566a86c1_fk_swiss_tournament_id` FOREIGN KEY (`tournament_id`) REFERENCES `swiss_tournament` (`id`),
  CONSTRAINT `swiss_match_white_player_id_3cea308b_fk_swiss_player_id` FOREIGN KEY (`white_player_id`) REFERENCES `swiss_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swiss_match`
--

LOCK TABLES `swiss_match` WRITE;
/*!40000 ALTER TABLE `swiss_match` DISABLE KEYS */;
INSERT  IGNORE INTO `swiss_match` VALUES (32,'2015-06-23',1,'','','',1,188,1,180,'2015-06-22 21:38:08','2015-06-22 21:38:20'),(33,'2015-06-23',1,'','','',1,204,1,181,'2015-06-22 21:38:08','2015-06-22 21:38:20'),(34,'2015-06-23',0,'','','',1,205,1,182,'2015-06-22 21:38:08','2015-06-22 21:38:20'),(35,'2015-06-23',0,'','','',1,183,1,206,'2015-06-22 21:38:08','2015-06-22 21:38:20'),(36,'2015-06-23',1,'','','',1,1,1,207,'2015-06-22 21:38:08','2015-06-22 21:38:08'),(37,'2015-06-23',0,'','','',2,181,1,180,'2015-06-22 21:41:35','2015-06-22 21:47:32'),(38,'2015-06-23',1,'','','',2,207,1,183,'2015-06-22 21:41:35','2015-06-22 21:47:32'),(39,'2015-06-23',2,'','','',2,182,1,205,'2015-06-22 21:41:35','2015-06-22 21:47:32'),(40,'2015-06-23',1,'','','',2,206,1,188,'2015-06-22 21:41:35','2015-06-22 21:47:32'),(41,'2015-06-23',1,'','','',2,1,1,204,'2015-06-22 21:41:35','2015-06-22 21:41:35'),(42,'2015-06-23',2,'','','',3,180,1,182,'2015-06-22 21:48:25','2015-06-22 21:49:26'),(43,'2015-06-23',1,'','','',3,183,1,181,'2015-06-22 21:48:25','2015-06-22 21:49:26'),(44,'2015-06-23',0,'','','',3,204,1,188,'2015-06-22 21:48:25','2015-06-22 21:49:26'),(45,'2015-06-23',0,'','','',3,205,1,207,'2015-06-22 21:48:25','2015-06-22 21:49:26'),(46,'2015-06-23',1,'','','',3,1,1,206,'2015-06-22 21:48:25','2015-06-22 21:48:25'),(47,'2015-06-23',0,'','','',4,180,1,204,'2015-06-22 22:01:27','2015-06-22 22:01:56'),(48,'2015-06-23',1,'','','',4,206,1,182,'2015-06-22 22:01:27','2015-06-22 22:01:56'),(49,'2015-06-23',1,'','','',4,188,1,183,'2015-06-22 22:01:27','2015-06-22 22:01:56'),(50,'2015-06-23',2,'','','',4,207,1,205,'2015-06-22 22:01:27','2015-06-22 22:01:56'),(51,'2015-06-23',0,'','','',5,180,1,183,'2015-06-22 22:04:38','2015-06-22 22:05:08'),(52,'2015-06-23',1,'','','',5,182,1,181,'2015-06-22 22:04:38','2015-06-22 22:05:08'),(53,'2015-06-23',1,'','','',5,204,1,207,'2015-06-22 22:04:38','2015-06-22 22:05:08'),(54,'2015-06-23',1,'','','',5,205,1,188,'2015-06-22 22:04:38','2015-06-22 22:05:08'),(68,'2015-06-24',0,'','','',1,180,6,183,'2015-06-23 22:38:23','2015-06-23 22:47:31'),(69,'2015-06-24',0,'','','',1,182,6,181,'2015-06-23 22:38:23','2015-06-23 22:45:04'),(74,'2015-06-24',1,'','','',1,277,8,275,'2015-06-23 22:49:40','2015-06-23 22:49:57'),(75,'2015-06-24',0,'','','',1,276,8,278,'2015-06-23 22:49:40','2015-06-23 22:49:57'),(76,'2015-06-24',1,'','','',1,1,8,279,'2015-06-23 22:49:40','2015-06-23 22:49:40'),(77,'2015-06-24',0,'','','',2,275,8,279,'2015-06-23 22:50:07','2015-06-23 22:50:16'),(78,'2015-06-24',0,'','','',2,278,8,276,'2015-06-23 22:50:07','2015-06-23 22:50:16'),(79,'2015-06-24',1,'','','',2,1,8,277,'2015-06-23 22:50:07','2015-06-23 22:50:07'),(80,'2015-06-24',1,'','','',3,279,8,275,'2015-06-23 22:50:25','2015-06-23 22:55:40'),(81,'2015-06-24',1,'','','',3,276,8,277,'2015-06-23 22:50:25','2015-06-23 22:55:40'),(82,'2015-06-24',1,'','','',3,1,8,278,'2015-06-23 22:50:25','2015-06-23 22:50:25'),(83,'2015-06-24',1,'','','',2,183,6,180,'2015-06-24 15:10:57','2015-06-24 15:11:06'),(84,'2015-06-24',2,'','','',2,181,6,182,'2015-06-24 15:10:57','2015-06-24 15:11:06');
/*!40000 ALTER TABLE `swiss_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swiss_player`
--

DROP TABLE IF EXISTS `swiss_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `nationality` varchar(3) NOT NULL,
  `dob` date NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swiss_player`
--

LOCK TABLES `swiss_player` WRITE;
/*!40000 ALTER TABLE `swiss_player` DISABLE KEYS */;
INSERT  IGNORE INTO `swiss_player` VALUES (1,'Bye','000','1901-01-01','2015-06-22 21:48:05','2015-06-22 21:48:05'),(180,'Carlsen, Magnus','NOR','1990-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(181,'Caruana, Fabiano','ITA','1992-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(182,'Anand, Viswanathan','IND','1969-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(183,'Nakamura, Hikaru','USA','1987-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(184,'Topalov, Veselin','BUL','1975-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(185,'Kramnik, Vladimir','RUS','1975-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(186,'Grischuk, Alexander','RUS','1983-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(187,'Aronian, Levon','ARM','1982-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(188,'So, Wesley','USA','1993-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(189,'Giri, Anish','NED','1994-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(190,'Jakovenko, Dmitry','RUS','1983-01-01','2015-06-22 00:49:55','2015-06-22 00:49:55'),(191,'Karjakin, Sergey','RUS','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(192,'Gelfand, Boris','ISR','1968-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(193,'Navara, David','CZE','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(194,'Ding, Liren','CHN','1992-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(195,'Wojtaszek, Radoslaw','POL','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(196,'Li, Chao b','CHN','1989-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(197,'Dominguez Perez, Leinier','CUB','1983-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(198,'Tomashevsky, Evgeny','RUS','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(199,'Svidler, Peter','RUS','1976-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(200,'Adams, Michael','ENG','1971-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(201,'Radjabov, Teimour','AZE','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(202,'Mamedyarov, Shakhriyar','AZE','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(203,'Vitiugov, Nikita','RUS','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(204,'Harikrishna, P.','IND','1986-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(205,'Ivanchuk, Vassily','UKR','1969-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(206,'Wang, Yue','CHN','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(207,'Vachier-Lagrave, Maxime','FRA','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(208,'Naiditsch, Arkadij','GER','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(209,'Wei, Yi','CHN','1999-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(210,'Nepomniachtchi, Ian','RUS','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(211,'Fressinet, Laurent','FRA','1981-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(212,'Andreikin, Dmitry','RUS','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(213,'Eljanov, Pavel','UKR','1983-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(214,'Yu, Yangyi','CHN','1994-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(215,'Leko, Peter','HUN','1979-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(216,'Morozevich, Alexander','RUS','1977-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(217,'Ponomariov, Ruslan','UKR','1983-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(218,'Moiseenko, Alexander','UKR','1980-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(219,'Wang, Hao','CHN','1989-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(220,'Kasimdzhanov, Rustam','UZB','1979-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(221,'Rublevsky, Sergei','RUS','1974-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(222,'Ni, Hua','CHN','1983-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(223,'Almasi, Zoltan','HUN','1976-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(224,'Shirov, Alexei','LAT','1972-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(225,'Malakhov, Vladimir','RUS','1980-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(226,'Korobov, Anton','UKR','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(227,'Howell, David W L','ENG','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(228,'Matlakov, Maxim','RUS','1991-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(229,'Bu, Xiangzhi','CHN','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(230,'Bacrot, Etienne','FRA','1983-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(231,'Kryvoruchko, Yuriy','UKR','1986-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(232,'Jobava, Baadur','GEO','1983-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(233,'Le, Quang Liem','VIE','1991-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(234,'Vallejo Pons, Francisco','ESP','1982-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(235,'McShane, Luke J','ENG','1984-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(236,'Short, Nigel D','ENG','1965-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(237,'Cheparinov, Ivan','BUL','1986-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(238,'Rodshtein, Maxim','ISR','1989-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(239,'Bruzon Batista, Lazaro','CUB','1982-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(240,'Hammer, Jon Ludvig','NOR','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(241,'Hou, Yifan','CHN','1994-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(242,'Ragger, Markus','AUT','1988-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(243,'Polgar, Judit','HUN','1976-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(244,'Lysyj, Igor','RUS','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(245,'Fedoseev, Vladimir','RUS','1995-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(246,'Robson, Ray','USA','1994-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(247,'Sargissian, Gabriel','ARM','1983-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(248,'Rapport, Richard','HUN','1996-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(249,'Kamsky, Gata','USA','1974-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(250,'Inarkiev, Ernesto','RUS','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(251,'Berkes, Ferenc','HUN','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(252,'Negi, Parimarjan','IND','1993-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(253,'Smirin, Ilia','ISR','1968-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(254,'Sjugirov, Sanan','RUS','1993-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(255,'Ivanisevic, Ivan','SRB','1977-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(256,'Nguyen, Ngoc Truong Son','VIE','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(257,'Onischuk, Alexander','USA','1975-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(258,'Dubov, Daniil','RUS','1996-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(259,'Najer, Evgeniy','RUS','1977-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(260,'Artemiev, Vladislav','RUS','1998-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(261,'Sadler, Matthew D','ENG','1974-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(262,'Balogh, Csaba','HUN','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(263,'Riazantsev, Alexander','RUS','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(264,'Kovalenko, Igor','LAT','1988-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(265,'Grachev, Boris','RUS','1986-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(266,'Laznicka, Viktor','CZE','1988-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(267,'Tkachiev, Vladislav','FRA','1973-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(268,'Areshchenko, Alexander','UKR','1986-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(269,'Shankland, Samuel L','USA','1991-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(270,'Movsesian, Sergei','ARM','1978-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(271,'Nielsen, Peter Heine','DEN','1973-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(272,'Nisipeanu, Liviu-Dieter','GER','1976-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(273,'Meier, Georg','GER','1987-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(274,'Volokitin, Andrei','UKR','1986-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(275,'Zhigalko, Sergei','BLR','1989-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(276,'Khairullin, Ildar','RUS','1990-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(277,'Van Wely, Loek','NED','1972-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(278,'Granda Zuniga, Julio E','PER','1967-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56'),(279,'Alekseev, Evgeny','RUS','1985-01-01','2015-06-22 00:49:56','2015-06-22 00:49:56');
/*!40000 ALTER TABLE `swiss_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swiss_ranks`
--

DROP TABLE IF EXISTS `swiss_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` smallint(6) NOT NULL,
  `player_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `swiss_ranks_player_id_2840450d_fk_swiss_player_id` (`player_id`),
  KEY `swiss_ranks_656a3fdb` (`tournament_id`),
  CONSTRAINT `swiss_ranks_player_id_2840450d_fk_swiss_player_id` FOREIGN KEY (`player_id`) REFERENCES `swiss_player` (`id`),
  CONSTRAINT `swiss_ranks_tournament_id_6da4efc7_fk_swiss_tournament_id` FOREIGN KEY (`tournament_id`) REFERENCES `swiss_tournament` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swiss_ranks`
--

LOCK TABLES `swiss_ranks` WRITE;
/*!40000 ALTER TABLE `swiss_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `swiss_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swiss_ratinghist`
--

DROP TABLE IF EXISTS `swiss_ratinghist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_ratinghist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `player_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `after_match_id` int(11),
  PRIMARY KEY (`id`),
  KEY `swiss_ratinghist_player_id_49c06b4c_fk_swiss_player_id` (`player_id`),
  KEY `swiss_ratinghist_d983b639` (`after_match_id`),
  CONSTRAINT `swiss_ratinghist_after_match_id_47aba7e_fk_swiss_match_id` FOREIGN KEY (`after_match_id`) REFERENCES `swiss_match` (`id`),
  CONSTRAINT `swiss_ratinghist_player_id_49c06b4c_fk_swiss_player_id` FOREIGN KEY (`player_id`) REFERENCES `swiss_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swiss_ratinghist`
--

LOCK TABLES `swiss_ratinghist` WRITE;
/*!40000 ALTER TABLE `swiss_ratinghist` DISABLE KEYS */;
INSERT  IGNORE INTO `swiss_ratinghist` VALUES (35,2876,'2015-06-22',180,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(36,2805,'2015-06-22',181,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(37,2804,'2015-06-22',182,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(38,2802,'2015-06-22',183,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(39,2798,'2015-06-22',184,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(40,2783,'2015-06-22',185,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(41,2781,'2015-06-22',186,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(42,2780,'2015-06-22',187,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(43,2778,'2015-06-22',188,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(44,2773,'2015-06-22',189,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(45,2759,'2015-06-22',190,'2015-06-22 00:49:55','2015-06-22 00:49:55',NULL),(46,2753,'2015-06-22',191,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(47,2751,'2015-06-22',192,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(48,2751,'2015-06-22',193,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(49,2749,'2015-06-22',194,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(50,2749,'2015-06-22',195,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(51,2748,'2015-06-22',196,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(52,2746,'2015-06-22',197,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(53,2745,'2015-06-22',198,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(54,2740,'2015-06-22',199,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(55,2740,'2015-06-22',200,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(56,2738,'2015-06-22',201,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(57,2735,'2015-06-22',202,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(58,2734,'2015-06-22',203,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(59,2733,'2015-06-22',204,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(60,2733,'2015-06-22',205,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(61,2726,'2015-06-22',206,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(62,2723,'2015-06-22',207,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(63,2722,'2015-06-22',208,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(64,2721,'2015-06-22',209,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(65,2720,'2015-06-22',210,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(66,2720,'2015-06-22',211,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(67,2718,'2015-06-22',212,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(68,2718,'2015-06-22',213,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(69,2715,'2015-06-22',214,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(70,2714,'2015-06-22',215,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(71,2711,'2015-06-22',216,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(72,2711,'2015-06-22',217,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(73,2707,'2015-06-22',218,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(74,2704,'2015-06-22',219,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(75,2704,'2015-06-22',220,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(76,2702,'2015-06-22',221,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(77,2701,'2015-06-22',222,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(78,2700,'2015-06-22',223,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(79,2699,'2015-06-22',224,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(80,2699,'2015-06-22',225,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(81,2698,'2015-06-22',226,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(82,2698,'2015-06-22',227,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(83,2696,'2015-06-22',228,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(84,2696,'2015-06-22',229,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(85,2695,'2015-06-22',230,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(86,2695,'2015-06-22',231,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(87,2693,'2015-06-22',232,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(88,2693,'2015-06-22',233,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(89,2686,'2015-06-22',234,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(90,2685,'2015-06-22',235,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(91,2683,'2015-06-22',236,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(92,2681,'2015-06-22',237,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(93,2678,'2015-06-22',238,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(94,2677,'2015-06-22',239,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(95,2677,'2015-06-22',240,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(96,2676,'2015-06-22',241,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(97,2676,'2015-06-22',242,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(98,2675,'2015-06-22',243,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(99,2674,'2015-06-22',244,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(100,2674,'2015-06-22',245,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(101,2674,'2015-06-22',246,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(102,2673,'2015-06-22',247,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(103,2671,'2015-06-22',248,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(104,2669,'2015-06-22',249,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(105,2668,'2015-06-22',250,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(106,2664,'2015-06-22',251,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(107,2664,'2015-06-22',252,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(108,2663,'2015-06-22',253,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(109,2662,'2015-06-22',254,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(110,2662,'2015-06-22',255,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(111,2662,'2015-06-22',256,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(112,2662,'2015-06-22',257,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(113,2661,'2015-06-22',258,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(114,2661,'2015-06-22',259,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(115,2660,'2015-06-22',260,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(116,2659,'2015-06-22',261,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(117,2659,'2015-06-22',262,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(118,2658,'2015-06-22',263,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(119,2657,'2015-06-22',264,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(120,2657,'2015-06-22',265,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(121,2657,'2015-06-22',266,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(122,2657,'2015-06-22',267,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(123,2656,'2015-06-22',268,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(124,2656,'2015-06-22',269,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(125,2655,'2015-06-22',270,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(126,2655,'2015-06-22',271,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(127,2654,'2015-06-22',272,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(128,2654,'2015-06-22',273,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(129,2654,'2015-06-22',274,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(130,2654,'2015-06-22',275,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(131,2653,'2015-06-22',276,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(132,2653,'2015-06-22',277,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(133,2652,'2015-06-22',278,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(134,2651,'2015-06-22',279,'2015-06-22 00:49:56','2015-06-22 00:49:56',NULL),(136,-1000,'2015-06-23',1,'2015-06-23 01:39:31','2015-06-23 01:39:31',NULL),(187,2882.45165145087,'2015-06-23',180,'2015-06-23 17:22:05','2015-06-23 17:22:05',32),(188,2771.54834854913,'2015-06-23',188,'2015-06-23 17:22:05','2015-06-23 17:22:05',32),(189,2811.85722054559,'2015-06-23',181,'2015-06-23 17:22:05','2015-06-23 17:22:05',33),(190,2726.14277945441,'2015-06-23',204,'2015-06-23 17:22:05','2015-06-23 17:22:05',33),(191,2802.87292532186,'2015-06-23',182,'2015-06-23 17:22:05','2015-06-23 17:22:05',34),(192,2734.12707467814,'2015-06-23',205,'2015-06-23 17:22:05','2015-06-23 17:22:05',34),(193,2727.20552695576,'2015-06-23',206,'2015-06-23 17:22:05','2015-06-23 17:22:05',35),(194,2800.79447304424,'2015-06-23',183,'2015-06-23 17:22:05','2015-06-23 17:22:05',35),(195,2723,'2015-06-23',207,'2015-06-23 17:22:05','2015-06-23 17:22:05',36),(196,-1000,'2015-06-23',1,'2015-06-23 17:22:05','2015-06-23 17:22:05',36),(197,2881.3309481368,'2015-06-23',180,'2015-06-23 17:22:05','2015-06-23 17:22:05',37),(198,2812.97792385966,'2015-06-23',181,'2015-06-23 17:22:05','2015-06-23 17:22:05',37),(199,2807.56083475504,'2015-06-23',183,'2015-06-23 17:22:05','2015-06-23 17:22:05',38),(200,2716.2336382892,'2015-06-23',207,'2015-06-23 17:22:05','2015-06-23 17:22:05',38),(201,2727.21872302522,'2015-06-23',205,'2015-06-23 17:22:05','2015-06-23 17:22:05',39),(202,2809.78127697478,'2015-06-23',182,'2015-06-23 17:22:05','2015-06-23 17:22:05',39),(203,2778.84218616176,'2015-06-23',188,'2015-06-23 17:22:05','2015-06-23 17:22:05',40),(204,2719.91168934313,'2015-06-23',206,'2015-06-23 17:22:05','2015-06-23 17:22:05',40),(205,2726.14277945441,'2015-06-23',204,'2015-06-23 17:22:05','2015-06-23 17:22:05',41),(206,-1000,'2015-06-23',1,'2015-06-23 17:22:05','2015-06-23 17:22:05',41),(207,2802.91698498434,'2015-06-23',182,'2015-06-23 17:22:05','2015-06-23 17:22:05',42),(208,2888.19524012724,'2015-06-23',180,'2015-06-23 17:22:05','2015-06-23 17:22:05',42),(209,2820.89148226676,'2015-06-23',181,'2015-06-23 17:22:05','2015-06-23 17:22:05',43),(210,2799.64727634795,'2015-06-23',183,'2015-06-23 17:22:05','2015-06-23 17:22:05',43),(211,2778.00365183477,'2015-06-23',188,'2015-06-23 17:22:05','2015-06-23 17:22:05',44),(212,2726.9813137814,'2015-06-23',204,'2015-06-23 17:22:05','2015-06-23 17:22:05',44),(213,2716.4089128471,'2015-06-23',207,'2015-06-23 17:22:05','2015-06-23 17:22:05',45),(214,2727.04344846732,'2015-06-23',205,'2015-06-23 17:22:05','2015-06-23 17:22:05',45),(215,2719.91168934313,'2015-06-23',206,'2015-06-23 17:22:05','2015-06-23 17:22:05',46),(216,-1000,'2015-06-23',1,'2015-06-23 17:22:05','2015-06-23 17:22:05',46),(217,2729.48593288338,'2015-06-23',204,'2015-06-23 17:22:05','2015-06-23 17:22:05',47),(218,2885.69062102526,'2015-06-23',180,'2015-06-23 17:22:05','2015-06-23 17:22:05',47),(219,2809.60185741944,'2015-06-23',182,'2015-06-23 17:22:05','2015-06-23 17:22:05',48),(220,2713.22681690803,'2015-06-23',206,'2015-06-23 17:22:05','2015-06-23 17:22:05',48),(221,2807.30206253168,'2015-06-23',183,'2015-06-23 17:22:05','2015-06-23 17:22:05',49),(222,2770.34886565104,'2015-06-23',188,'2015-06-23 17:22:05','2015-06-23 17:22:05',49),(223,2718.87376582146,'2015-06-23',205,'2015-06-23 17:22:05','2015-06-23 17:22:05',50),(224,2724.57859549296,'2015-06-23',207,'2015-06-23 17:22:05','2015-06-23 17:22:05',50),(225,2808.54500209671,'2015-06-23',183,'2015-06-23 17:22:05','2015-06-23 17:22:05',51),(226,2884.44768146023,'2015-06-23',180,'2015-06-23 17:22:05','2015-06-23 17:22:05',51),(227,2828.71134983533,'2015-06-23',181,'2015-06-23 17:22:05','2015-06-23 17:22:05',52),(228,2801.78198985087,'2015-06-23',182,'2015-06-23 17:22:05','2015-06-23 17:22:05',52),(229,2732.65690330334,'2015-06-23',207,'2015-06-23 17:22:05','2015-06-23 17:22:05',53),(230,2721.407625073,'2015-06-23',204,'2015-06-23 17:22:05','2015-06-23 17:22:05',53),(231,2777.52970348486,'2015-06-23',188,'2015-06-23 17:22:05','2015-06-23 17:22:05',54),(232,2711.69292798764,'2015-06-23',205,'2015-06-23 17:22:05','2015-06-23 17:22:05',54),(233,2661.98404232541,'2015-06-24',275,'2015-06-23 22:56:00','2015-06-23 22:56:00',74),(234,2645.01595767459,'2015-06-24',277,'2015-06-23 22:56:00','2015-06-23 22:56:00',74),(235,2652.01595767459,'2015-06-24',278,'2015-06-23 22:56:00','2015-06-23 22:56:00',75),(236,2652.98404232541,'2015-06-24',276,'2015-06-23 22:56:00','2015-06-23 22:56:00',75),(237,2651,'2015-06-24',279,'2015-06-23 22:56:00','2015-06-23 22:56:00',76),(238,-1000,'2015-06-24',1,'2015-06-23 22:56:00','2015-06-23 22:56:00',76),(239,2651.1752579297,'2015-06-24',279,'2015-06-23 22:56:00','2015-06-23 22:56:00',77),(240,2661.80878439571,'2015-06-24',275,'2015-06-23 22:56:00','2015-06-23 22:56:00',77),(241,2652.96859394456,'2015-06-24',276,'2015-06-23 22:56:00','2015-06-23 22:56:00',78),(242,2652.03140605544,'2015-06-24',278,'2015-06-23 22:56:00','2015-06-23 22:56:00',78),(243,2645.01595767459,'2015-06-24',277,'2015-06-23 22:56:00','2015-06-23 22:56:00',79),(244,-1000,'2015-06-24',1,'2015-06-23 22:56:00','2015-06-23 22:56:00',79),(245,2669.63911784793,'2015-06-24',275,'2015-06-23 22:56:00','2015-06-23 22:56:00',80),(246,2643.34492447748,'2015-06-24',279,'2015-06-23 22:56:00','2015-06-23 22:56:00',80),(247,2653.14285502854,'2015-06-24',277,'2015-06-23 22:56:00','2015-06-23 22:56:00',81),(248,2644.84169659061,'2015-06-24',276,'2015-06-23 22:56:00','2015-06-23 22:56:00',81),(249,2652.03140605544,'2015-06-24',278,'2015-06-23 22:56:00','2015-06-23 22:56:00',82),(250,-1000,'2015-06-24',1,'2015-06-23 22:56:00','2015-06-23 22:56:00',82);
/*!40000 ALTER TABLE `swiss_ratinghist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swiss_tournament`
--

DROP TABLE IF EXISTS `swiss_tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_tournament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `rounds` smallint(6) NOT NULL,
  `place` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swiss_tournament`
--

LOCK TABLES `swiss_tournament` WRITE;
/*!40000 ALTER TABLE `swiss_tournament` DISABLE KEYS */;
INSERT  IGNORE INTO `swiss_tournament` VALUES (1,'Test tournament',5,'Nicosia Hilton Hotel','2015-06-21 00:00:00','2015-06-22 18:38:08'),(6,'VTour',5,'1st floor','2015-06-23 16:32:56','2015-06-23 16:38:02'),(8,'5 player tourney',3,'France','2015-06-23 22:49:20','2015-06-23 22:49:20');
/*!40000 ALTER TABLE `swiss_tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swiss_tournament_players`
--

DROP TABLE IF EXISTS `swiss_tournament_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_tournament_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tournament_id` (`tournament_id`,`player_id`),
  KEY `swiss_tournament_players_player_id_51db5da1_fk_swiss_player_id` (`player_id`),
  CONSTRAINT `swiss_tournament_players_player_id_51db5da1_fk_swiss_player_id` FOREIGN KEY (`player_id`) REFERENCES `swiss_player` (`id`),
  CONSTRAINT `swiss_tournament_p_tournament_id_613aa073_fk_swiss_tournament_id` FOREIGN KEY (`tournament_id`) REFERENCES `swiss_tournament` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swiss_tournament_players`
--

LOCK TABLES `swiss_tournament_players` WRITE;
/*!40000 ALTER TABLE `swiss_tournament_players` DISABLE KEYS */;
INSERT  IGNORE INTO `swiss_tournament_players` VALUES (27,1,180),(28,1,181),(29,1,182),(30,1,183),(31,1,188),(23,1,204),(24,1,205),(25,1,206),(26,1,207),(49,6,180),(50,6,181),(51,6,182),(52,6,183),(63,8,275),(64,8,276),(65,8,277),(66,8,278),(67,8,279);
/*!40000 ALTER TABLE `swiss_tournament_players` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-24 19:56:04
