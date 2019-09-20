-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: service_station_app_data
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'ServiceStationManager');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (6,1,25),(7,1,26),(8,1,27),(9,1,28),(10,1,29),(11,1,30),(12,1,31),(1,1,32),(2,1,33),(3,1,34),(4,1,35),(5,1,36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add customer',7,'add_customer'),(26,'Can change customer',7,'change_customer'),(27,'Can delete customer',7,'delete_customer'),(28,'Can view customer',7,'view_customer'),(29,'Can add vehicle',8,'add_vehicle'),(30,'Can change vehicle',8,'change_vehicle'),(31,'Can delete vehicle',8,'delete_vehicle'),(32,'Can view vehicle',8,'view_vehicle'),(33,'Can add order',9,'add_order'),(34,'Can change order',9,'change_order'),(35,'Can delete order',9,'delete_order'),(36,'Can view order',9,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$DNepnBQf6xuu$WtAq9sS7ppiGXocwqYtCKSFAHD+o8RNqzO1WwJZB8Gc=','2019-09-20 10:38:29.780240',1,'admin','','','skorpi_09@mail.ru',1,1,'2019-09-11 13:52:06.821636'),(3,'pbkdf2_sha256$150000$QyY0fLUf0YK9$XjD/73TPMxuA+T8tmJhQ2wrLllgbyofzxELsTT97n8g=','2019-09-20 13:55:20.338479',0,'InteticsLab','','','',0,1,'2019-09-20 10:47:48.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-09-11 21:32:20.572293','6','Jane Doe: skorpi_09@mail.ru',3,'',7,1),(2,'2019-09-15 19:32:48.664731','3','1N4AL11DX2C230798',3,'',8,1),(3,'2019-09-15 19:32:52.762927','2','1N4AL11DX2C230798',3,'',8,1),(4,'2019-09-18 19:54:09.993079','2','kuku',1,'[{\"added\": {}}]',4,1),(5,'2019-09-18 19:56:52.430378','2','kuku',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"user_permissions\"]}}]',4,1),(6,'2019-09-18 20:02:03.839689','1','ServiceStationManager',1,'[{\"added\": {}}]',3,1),(7,'2019-09-18 20:02:09.440816','1','ServiceStationManager',2,'[]',3,1),(8,'2019-09-18 21:22:13.957333','2','kuku',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(9,'2019-09-20 10:40:45.969055','2','kuku',3,'',4,1),(10,'2019-09-20 10:47:48.708396','3','InteticsLab',1,'[{\"added\": {}}]',4,1),(11,'2019-09-20 10:48:21.850022','3','InteticsLab',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(12,'2019-09-20 10:48:35.742975','3','InteticsLab',2,'[]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'servicemanager','customer'),(9,'servicemanager','order'),(8,'servicemanager','vehicle'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-09-10 20:44:36.775002'),(2,'auth','0001_initial','2019-09-10 20:44:42.523117'),(3,'admin','0001_initial','2019-09-10 20:45:23.288231'),(4,'admin','0002_logentry_remove_auto_add','2019-09-10 20:45:37.513353'),(5,'admin','0003_logentry_add_action_flag_choices','2019-09-10 20:45:37.777333'),(6,'contenttypes','0002_remove_content_type_name','2019-09-10 20:45:51.743793'),(7,'auth','0002_alter_permission_name_max_length','2019-09-10 20:45:57.313683'),(8,'auth','0003_alter_user_email_max_length','2019-09-10 20:45:58.585294'),(9,'auth','0004_alter_user_username_opts','2019-09-10 20:45:58.780116'),(10,'auth','0005_alter_user_last_login_null','2019-09-10 20:46:04.096430'),(11,'auth','0006_require_contenttypes_0002','2019-09-10 20:46:05.125798'),(12,'auth','0007_alter_validators_add_error_messages','2019-09-10 20:46:05.539080'),(13,'auth','0008_alter_user_username_max_length','2019-09-10 20:46:11.992277'),(14,'auth','0009_alter_user_last_name_max_length','2019-09-10 20:46:19.593918'),(15,'auth','0010_alter_group_name_max_length','2019-09-10 20:46:20.445215'),(16,'auth','0011_update_proxy_permissions','2019-09-10 20:46:20.718370'),(17,'servicemanager','0001_initial','2019-09-10 20:46:25.533269'),(18,'sessions','0001_initial','2019-09-10 20:46:47.238088'),(19,'servicemanager','0002_auto_20190911_0901','2019-09-11 09:02:24.296597'),(20,'servicemanager','0003_auto_20190911_1304','2019-09-11 13:04:12.230999'),(21,'servicemanager','0004_auto_20190911_2141','2019-09-11 21:42:08.617866'),(22,'servicemanager','0005_auto_20190915_1933','2019-09-15 19:33:38.867768'),(23,'servicemanager','0006_auto_20190916_1113','2019-09-16 11:15:00.674531'),(24,'servicemanager','0007_auto_20190916_1114','2019-09-16 11:15:00.845210'),(25,'servicemanager','0008_auto_20190916_1508','2019-09-16 15:08:16.502368'),(26,'servicemanager','0009_auto_20190916_1509','2019-09-16 15:09:12.417158'),(27,'servicemanager','0010_auto_20190916_1557','2019-09-16 15:57:43.175410'),(28,'servicemanager','0011_auto_20190918_1618','2019-09-18 16:19:00.163959'),(29,'servicemanager','0012_auto_20190918_1833','2019-09-18 18:33:57.654825'),(30,'servicemanager','0013_auto_20190918_1835','2019-09-18 18:35:25.683028');
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
INSERT INTO `django_session` VALUES ('0srwta0ncaush9ubnn1i0qe4emsgkg6q','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 19:32:10.331420'),('592f3ufvhxir7o9x1z1x11wg5boipsg2','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 18:31:02.263743'),('i9mui50zwp2mdftipslmtq30e9bziui6','MWJiYzg0N2U3NTJhY2M1NmE1ZmU0M2UzM2YxNWVmYjE4MGQxZGM3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzg3ZWZmMjY3Yjg0YTU1Mzg3YTVmZTRiNjUzY2ZkMDg4YmE4MTU2In0=','2019-09-29 19:32:23.723379'),('icrwk1gdnfrzva4ktf11j5wrlmnj9umx','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 10:13:19.740662'),('jihnqzw2nhwm8z21dq3j85nfrqr9897x','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 09:30:49.836153'),('mp4p4afbr58h5kkxd4d0chdq2sf7mudp','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 11:14:08.936290'),('my4ybi801pbxu1fwmk0gw2bqf8ayvztc','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 11:21:53.533032'),('nrxj76cwbuqpcea2s4cehqry3cl7c2w1','MWJiYzg0N2U3NTJhY2M1NmE1ZmU0M2UzM2YxNWVmYjE4MGQxZGM3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzg3ZWZmMjY3Yjg0YTU1Mzg3YTVmZTRiNjUzY2ZkMDg4YmE4MTU2In0=','2019-09-25 13:53:05.782672'),('nvupoe7uvqj2nwmqhdpnrgsxx3ly5smi','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 21:57:35.669944'),('o85rpoa0orrt72qahkpsy83ddoya3bgb','MThmMDg2ZDk2YzQ5YTU0OGY4MzEyMDEzNmU1YWZkYTlkNDUyMDg1Nzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYzE4ZDgxMWY1NWJmMTRhNzlhZThkOWE4Zjk1ODc5MTQxNzczNTIyIn0=','2019-10-04 10:49:12.175517'),('ry8fbk19e2mq4i2sfzgw2wq85pgmkyvm','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 10:42:45.807763'),('yv40mwise3wkvh0rqzv4pf910d6oyiqm','MGQ3NjM3ZDUyNzMyZmQzMjk5YzNkNWZhN2FkNmU3NDlhM2Y3M2FiYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjAyNmI1MWQxNTk3MDQ2NTczMGI0MDhkOTFhYTI5NGQ4ZGI3MDg5In0=','2019-10-03 19:04:19.855283');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicemanager_customer`
--

DROP TABLE IF EXISTS `servicemanager_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicemanager_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(254) NOT NULL,
  `created_timestamp` datetime(6) NOT NULL,
  `updated_timestamp` datetime(6) NOT NULL,
  `country` varchar(120) NOT NULL,
  `state` varchar(120) NOT NULL,
  `city` varchar(120) NOT NULL,
  `street` varchar(120) NOT NULL,
  `house` varchar(20) NOT NULL,
  `postal_code` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servicemanager_customer_email_20289dba_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicemanager_customer`
--

LOCK TABLES `servicemanager_customer` WRITE;
/*!40000 ALTER TABLE `servicemanager_customer` DISABLE KEYS */;
INSERT INTO `servicemanager_customer` VALUES (1,'Jane','Dow','2001-08-11','18012138700','jane@example.com','2019-09-11 11:09:33.357729','2019-09-12 15:16:11.237734','United States','UT','Salt Lake City','Student Life Way','1701','84112'),(2,'John','Doe','1995-01-01','18012138701','jhon@example.com','2019-09-11 13:47:24.889755','2019-09-11 13:47:24.889815','United States','UT','Salt Lake City','State Street','350','84103'),(3,'Janet','Jones','2001-09-11','18012138702','janet@example.com','2019-09-11 14:07:36.068336','2019-09-11 14:07:36.068393','United States','UT','Salt Lake City','West 100 South','400','84101'),(4,'Peter','Parker','2001-09-11','18012138700','peter@marvel.com','2019-09-11 14:09:26.738581','2019-09-11 14:09:26.738629','United States','UT','Salt Lake City','North Temple','50','84150'),(8,'Jane','Doe','2001-09-13','18012138700','jane4@example.com','2019-09-13 14:58:44.796651','2019-09-13 21:23:22.227498','United States','UT','Salt Lake City','North Salt Street','55','84103'),(14,'Kate','Karson','2001-09-18','8012138700','kate2@example.com','2019-09-18 09:36:12.967796','2019-09-18 09:36:12.967841','Netherlands','ZH','Rotterdam','Antoine Platekade','995','3072 ME'),(15,'Agnius','Radzevichus','1963-02-12','37065557362','agnius@example.lt','2019-09-18 09:43:17.164119','2019-09-18 09:43:17.164170','Lithuania','Alytaus apskr.','Druskininkai','Gardino gatvė','8','LT-96035');
/*!40000 ALTER TABLE `servicemanager_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicemanager_order`
--

DROP TABLE IF EXISTS `servicemanager_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicemanager_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `status` varchar(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `created_timestamp` datetime(6) NOT NULL,
  `updated_timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `servicemanager_order_vehicle_id_dd7d221b_fk_servicema` (`vehicle_id`),
  CONSTRAINT `servicemanager_order_vehicle_id_dd7d221b_fk_servicema` FOREIGN KEY (`vehicle_id`) REFERENCES `servicemanager_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicemanager_order`
--

LOCK TABLES `servicemanager_order` WRITE;
/*!40000 ALTER TABLE `servicemanager_order` DISABLE KEYS */;
INSERT INTO `servicemanager_order` VALUES (1,'2019-09-16',150.00,'In progress',6,'2019-09-16 12:01:03.213909','2019-09-16 12:01:03.213943'),(6,'2019-09-01',250.07,'In progress',9,'2019-09-17 17:32:39.697018','2019-09-17 17:32:39.697067'),(7,'2019-08-01',666.66,'Completed',9,'2019-09-17 17:34:05.767972','2019-09-17 17:34:19.552796'),(9,'2019-09-17',10000.00,'In progress',10,'2019-09-17 18:27:55.538629','2019-09-17 18:27:55.538689'),(11,'2019-09-19',10000.00,'In progress',12,'2019-09-19 11:28:06.899069','2019-09-19 11:28:06.899100'),(12,'2019-06-05',1500.70,'Cancelled',6,'2019-09-20 14:21:19.289699','2019-09-20 14:21:19.289739');
/*!40000 ALTER TABLE `servicemanager_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicemanager_vehicle`
--

DROP TABLE IF EXISTS `servicemanager_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicemanager_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `make` varchar(70) NOT NULL,
  `model` varchar(120) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `vin` varchar(17) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servicemanager_vehicle_vin_e48fb0a2_uniq` (`vin`),
  KEY `servicemanager_vehic_owner_id_31e5e406_fk_servicema` (`owner_id`),
  CONSTRAINT `servicemanager_vehic_owner_id_31e5e406_fk_servicema` FOREIGN KEY (`owner_id`) REFERENCES `servicemanager_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicemanager_vehicle`
--

LOCK TABLES `servicemanager_vehicle` WRITE;
/*!40000 ALTER TABLE `servicemanager_vehicle` DISABLE KEYS */;
INSERT INTO `servicemanager_vehicle` VALUES (6,'BMW','e39',1995,'1G1AD1F51A7228334',4),(8,'BMW','M550i xDrive',2018,'4S3BH6864Y6662220',4),(9,'Maserati','Gran Turismo S',2010,'JF1SG69677G707523',1),(10,'Bugatti','La Voiture Noire',2019,'1N4AL11DX2C230798',3),(12,'Bentley','Speed Six',1928,'3HSCUAPR29N085219',8);
/*!40000 ALTER TABLE `servicemanager_vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 14:53:28
