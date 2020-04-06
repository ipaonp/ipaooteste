-- MySQL dump 10.13  Distrib 8.0.16, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: ipaoo-novo
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES UTF8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mt_address_book`
--

DROP TABLE IF EXISTS `mt_address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_address_book` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `client_id` int(14) NOT NULL DEFAULT '0',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(255) NOT NULL DEFAULT '',
  `location_name` varchar(255) NOT NULL DEFAULT '',
  `country_code` varchar(3) NOT NULL DEFAULT '',
  `as_default` int(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `as_default` (`as_default`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_address_book`
--

LOCK TABLES `mt_address_book` WRITE;
/*!40000 ALTER TABLE `mt_address_book` DISABLE KEYS */;
INSERT INTO `mt_address_book` VALUES (1,1,'rua campos sales, 215','santo andre','sp','09015-200','113','BR',1,'2019-10-01 22:19:43','2019-10-02 01:19:43','201.95.66.116'),(2,2,'Av. Portugal, 894','Santo André','São Paulo','09040','','BR',1,'2019-10-01 22:29:07','2019-10-02 01:29:07','201.95.66.116'),(3,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-02 23:30:43','2019-10-03 02:30:43','187.101.170.169'),(4,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-02 23:31:05','2019-10-03 02:31:05','187.101.170.169'),(5,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-03 22:19:53','2019-10-04 01:19:53','187.101.170.169'),(6,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-03 22:25:00','2019-10-04 01:25:00','187.101.170.169'),(7,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-03 22:34:42','2019-10-04 01:34:42','187.101.170.169'),(8,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-03 22:49:33','2019-10-04 01:49:33','187.101.170.169'),(9,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-03 23:00:29','2019-10-04 02:00:29','187.101.170.169'),(10,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-04 20:46:40','2019-10-04 23:46:40','187.101.170.169'),(11,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-04 20:53:27','2019-10-04 23:53:27','187.101.170.169'),(12,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','BR',1,'2019-10-05 07:15:17','2019-10-05 10:15:17','187.101.170.169'),(13,5,'Engeheiro Caetano Alvares, 123','São Paulo','SP','02546-000','','BR',1,'2019-10-07 22:50:14','2019-10-08 01:50:14','187.101.170.169'),(14,7,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo','SP','02471130','','BR',1,'2019-10-20 09:26:32','2019-10-20 12:26:32','189.79.85.100'),(15,7,'Avenida Imirim, 1895',' São Paulo - São Paulo','SP','02465-200','','BR',2,'2019-10-20 10:04:58','2019-10-20 10:14:59','191.39.33.163'),(16,11,'Rua george chahestian 11 apto 123','São Paulo','São Paulo','02471','','BR',2,'2019-10-21 19:56:26','2019-10-21 22:56:26','177.33.141.87');
/*!40000 ALTER TABLE `mt_address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_address_book_location`
--

DROP TABLE IF EXISTS `mt_address_book_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_address_book_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(14) NOT NULL DEFAULT '0',
  `street` varchar(255) NOT NULL DEFAULT '',
  `location_name` varchar(255) NOT NULL DEFAULT '',
  `country_id` int(14) NOT NULL DEFAULT '0',
  `state_id` int(14) NOT NULL DEFAULT '0',
  `city_id` int(14) NOT NULL DEFAULT '0',
  `area_id` int(14) NOT NULL DEFAULT '0',
  `as_default` int(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_address_book_location`
--

LOCK TABLES `mt_address_book_location` WRITE;
/*!40000 ALTER TABLE `mt_address_book_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_address_book_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_admin_user`
--

DROP TABLE IF EXISTS `mt_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_admin_user` (
  `admin_id` int(14) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(100) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `user_lang` int(14) NOT NULL DEFAULT '0',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `lost_password_code` varchar(255) NOT NULL DEFAULT '',
  `session_token` varchar(255) NOT NULL DEFAULT '',
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_access` text,
  PRIMARY KEY (`admin_id`),
  KEY `admin_id` (`admin_id`),
  KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `lost_password_code` (`lost_password_code`),
  KEY `session_token` (`session_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_admin_user`
--

LOCK TABLES `mt_admin_user` WRITE;
/*!40000 ALTER TABLE `mt_admin_user` DISABLE KEYS */;
INSERT INTO `mt_admin_user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','','','','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116',0,'','','426656149029ae53d581d917458641141affe923be6','2019-10-23 10:34:34','[\"autologin\",\"dashboard\",\"merchant\",\"sponsoredMerchantList\",\"packages\",\"Cuisine\",\"dishes\",\"OrderStatus\",\"incomingorders\",\"cancel_order\",\"settings\",\"themesettings\",\"managelocation\",\"commisionsettings\",\"voucher\",\"invoice\",\"merchantcommission\",\"withdrawal\",\"incomingwithdrawal\",\"withdrawalsettings\",\"emailsettings\",\"emailtpl\",\"notisettings\",\"emailogs\",\"cronjobs\",\"customPage\",\"Ratings\",\"ContactSettings\",\"SocialSettings\",\"ManageCurrency\",\"ManageLanguage\",\"Seo\",\"addons\",\"addonexport\",\"mobileapp\",\"pointsprogram\",\"merchantapp\",\"analytics\",\"customerlist\",\"subscriberlist\",\"reviews\",\"bankdeposit\",\"paymentgatewaysettings\",\"paymentgateway\",\"paypalSettings\",\"cardpaymentsettings\",\"stripeSettings\",\"mercadopagoSettings\",\"sisowsettings\",\"payumonenysettings\",\"obdsettings\",\"payserasettings\",\"payondelivery\",\"barclay\",\"epaybg\",\"authorize\",\"braintree\",\"razor\",\"mollie\",\"ipay88\",\"moneris\",\"sms\",\"smsSettings\",\"smsPackage\",\"smstransaction\",\"smslogs\",\"fax\",\"faxtransaction\",\"faxpackage\",\"faxlogs\",\"faxsettings\",\"reports\",\"rptMerchantReg\",\"rptMerchantPayment\",\"rptMerchanteSales\",\"rptmerchantsalesummary\",\"rptbookingsummary\",\"userList\",\"voguepay\",\"printermodule\",\"paypal_v2\",\"mercadopago\",\"singlemerchant\"]');
/*!40000 ALTER TABLE `mt_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_bank_deposit`
--

DROP TABLE IF EXISTS `mt_bank_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_bank_deposit` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `branch_code` varchar(100) NOT NULL DEFAULT '',
  `date_of_deposit` date DEFAULT NULL,
  `time_of_deposit` varchar(50) NOT NULL DEFAULT '',
  `amount` float(14,4) NOT NULL DEFAULT '0.0000',
  `scanphoto` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `date_created` date DEFAULT NULL,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `transaction_type` varchar(255) NOT NULL DEFAULT 'merchant_signup',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `order_id` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `status` (`status`),
  KEY `client_id` (`client_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_bank_deposit`
--

LOCK TABLES `mt_bank_deposit` WRITE;
/*!40000 ALTER TABLE `mt_bank_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_bank_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_barclay_trans`
--

DROP TABLE IF EXISTS `mt_barclay_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_barclay_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(14) NOT NULL DEFAULT '',
  `token` varchar(255) NOT NULL DEFAULT '',
  `transaction_type` varchar(255) NOT NULL DEFAULT 'signup',
  `date_created` date DEFAULT NULL,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `param1` varchar(255) NOT NULL DEFAULT '',
  `param2` text,
  `param3` text,
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `token` (`token`),
  KEY `transaction_type` (`transaction_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_barclay_trans`
--

LOCK TABLES `mt_barclay_trans` WRITE;
/*!40000 ALTER TABLE `mt_barclay_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_barclay_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_bookingtable`
--

DROP TABLE IF EXISTS `mt_bookingtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_bookingtable` (
  `booking_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `number_guest` int(14) NOT NULL DEFAULT '0',
  `date_booking` date DEFAULT NULL,
  `booking_time` varchar(50) NOT NULL DEFAULT '',
  `booking_name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(100) NOT NULL DEFAULT '',
  `booking_notes` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT '1',
  `client_id` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`booking_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `status` (`status`),
  KEY `viewed` (`viewed`),
  KEY `client_id` (`client_id`),
  KEY `date_booking` (`date_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_bookingtable`
--

LOCK TABLES `mt_bookingtable` WRITE;
/*!40000 ALTER TABLE `mt_bookingtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_bookingtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_bookingtable_history`
--

DROP TABLE IF EXISTS `mt_bookingtable_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_bookingtable_history` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `booking_id` int(14) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_bookingtable_history`
--

LOCK TABLES `mt_bookingtable_history` WRITE;
/*!40000 ALTER TABLE `mt_bookingtable_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_bookingtable_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_category`
--

DROP TABLE IF EXISTS `mt_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_category` (
  `cat_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `category_name` varchar(255) NOT NULL DEFAULT '',
  `category_description` text,
  `photo` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` varchar(50) NOT NULL DEFAULT '',
  `date_modified` varchar(50) DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `spicydish` int(2) NOT NULL DEFAULT '1',
  `spicydish_notes` text,
  `dish` text,
  `category_name_trans` text,
  `category_description_trans` text,
  `parent_cat_id` int(14) NOT NULL DEFAULT '0',
  `monday` int(1) NOT NULL DEFAULT '0',
  `tuesday` int(1) NOT NULL DEFAULT '0',
  `wednesday` int(1) NOT NULL DEFAULT '0',
  `thursday` int(1) NOT NULL DEFAULT '0',
  `friday` int(1) NOT NULL DEFAULT '0',
  `saturday` int(1) NOT NULL DEFAULT '0',
  `sunday` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `category_name` (`category_name`),
  KEY `status` (`status`),
  KEY `sequence` (`sequence`),
  KEY `parent_cat_id` (`parent_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_category`
--

LOCK TABLES `mt_category` WRITE;
/*!40000 ALTER TABLE `mt_category` DISABLE KEYS */;
INSERT INTO `mt_category` VALUES (1,1,'Pao de Leite','Pao de Leite','','publish',0,'2019-10-01 22:05:04','','189.79.78.120',1,'','',NULL,NULL,0,0,0,0,0,0,0,0),(2,1,'Pao','Pao','','publish',0,'2019-10-01 22:07:02','','189.79.78.120',1,'','',NULL,NULL,0,0,0,0,0,0,0,0),(3,2,'Leite','Leite Tipo A','1570327633-leite.jpg','publish',0,'2019-10-05 23:07:20','','187.101.170.169',1,'','',NULL,NULL,0,0,0,0,0,0,0,0),(4,2,'Bolo','Bolo de Chocolate','1570327655-bolo-de-chocolate.jpg','publish',0,'2019-10-05 23:07:36','','187.101.170.169',1,'','',NULL,NULL,0,0,0,0,0,0,0,0),(5,2,'Mortadela','Mortadela Marba','1570327681-mortadela.jpg','publish',0,'2019-10-05 23:07:49','2019-10-05 23:08:03','187.101.170.169',1,'','',NULL,NULL,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `mt_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_client`
--

DROP TABLE IF EXISTS `mt_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_client` (
  `client_id` int(14) NOT NULL AUTO_INCREMENT,
  `social_strategy` varchar(100) NOT NULL DEFAULT 'web',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `email_address` varchar(200) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(100) NOT NULL DEFAULT '',
  `country_code` varchar(3) NOT NULL DEFAULT '',
  `location_name` text,
  `contact_phone` varchar(20) NOT NULL DEFAULT '',
  `lost_password_token` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `token` varchar(255) NOT NULL DEFAULT '',
  `mobile_verification_code` int(14) NOT NULL DEFAULT '0',
  `mobile_verification_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `custom_field1` varchar(255) NOT NULL DEFAULT '',
  `custom_field2` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `email_verification_code` varchar(14) NOT NULL DEFAULT '',
  `is_guest` int(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`client_id`),
  KEY `social_strategy` (`social_strategy`),
  KEY `email_address` (`email_address`),
  KEY `password` (`password`),
  KEY `street` (`street`),
  KEY `city` (`city`),
  KEY `state` (`state`),
  KEY `contact_phone` (`contact_phone`),
  KEY `lost_password_token` (`lost_password_token`),
  KEY `status` (`status`),
  KEY `token` (`token`),
  KEY `mobile_verification_code` (`mobile_verification_code`),
  KEY `is_guest` (`is_guest`),
  KEY `email_verification_code` (`email_verification_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_client`
--

LOCK TABLES `mt_client` WRITE;
/*!40000 ALTER TABLE `mt_client` DISABLE KEYS */;
INSERT INTO `mt_client` VALUES (1,'web','alex','cliente','alexorbit@gmail.com','e10adc3949ba59abbe56e057f20f883e','','','','','','113','+551122334455','','2019-10-01 22:19:06','2019-10-02 01:19:06','2019-10-02 00:23:46','187.116.108.144','active','',0,'2019-10-02 01:19:06','','','','',2),(2,'mobile','alex','cliente2','alex@gmail.com','827ccb0eea8a706c4c34a16891f84e7b','','','','','',NULL,'+5522334455','','2019-10-01 22:28:53','2019-10-04 11:20:11','2019-10-02 01:28:53','187.116.108.144','active','fnkqyfl1ctehbfw0312d0d39585741666c19c217ed769f7',0,'2019-10-02 01:28:53','','','','',2),(3,'mobile','Yassu','Teste ','ipaonp@gmail.com','698dc19d489c4e4db73e28a713eab07b','','','','','','','+5511988888888','','2019-10-01 22:35:47','2019-10-05 23:27:40','2019-10-21 00:29:22','189.79.85.100','active','9qgn4b46jxs4xewf4a2b9f7760aab66a5d5fcd5484b44a0',0,'2019-10-02 01:35:47','','','','',2),(4,'mobile','Joao','Doe','joao@gmail.com','202cb962ac59075b964b07152d234b70','','','','','',NULL,'+55183736','','2019-10-04 10:05:33','2019-10-04 10:19:15','2019-10-04 13:05:33','187.116.108.144','active','jtdnw3ijhu17jgwe52d270281261b738fcd413c72d8ad4c',0,'2019-10-04 13:05:33','','','','',2),(5,'web','Yassunoria','Takara','yassu','b1f3944fb84514664bd02be8e3678251','','','','','','','+5511970960399','','2019-10-07 22:48:25','2019-10-08 01:48:25','2019-10-07 22:48:26','187.101.170.169','active','',0,'2019-10-08 01:48:25','','','','',2),(6,'web','Antonio','Carlos da Silva','Antonio','dc599a9972fde3045dab59dbd1ae170b','','','','','',NULL,'+5511971960399','','2019-10-20 08:33:29','2019-10-20 11:33:29','2019-10-20 08:39:43','189.79.85.100','active','txjcch6o1en2bfm885383f16fccd10370814fcd862aa10d',0,'2019-10-20 11:33:29','','','','',2),(7,'mobile','Midori','Takara','sayuri.takara@hotmail.com','24135987d297bb6ba629c148f8b7d097','','','','','','','+5511957702025','','2019-10-20 08:42:41','2019-10-21 06:38:19','2019-10-20 09:40:31','189.79.85.100','active','k1stixb0n7w3031e929eaea04f464f7a1b1853d964db000',0,'2019-10-20 11:42:41','','','','',2),(8,'google','Marcio','Takara','marcio.yassu@gmail.com','b1f3944fb84514664bd02be8e3678251','','','','','',NULL,'+5511988888888','','2019-10-20 21:42:19','2019-10-21 23:25:27','2019-10-21 23:35:15','189.79.85.100','active','jpunblgee152rjr0800d8a8423793c248a193f60b1e0402',0,'2019-10-21 00:42:19','','','image64016.jpg','',2),(9,'google','Ipaooteste','teste','ipaooteste@gmail.com','98b432ccc150bbceda52fc24ce67f349','','','','','',NULL,'','','2019-10-20 21:43:34','2019-10-21 00:43:34','2019-10-20 21:43:34','189.79.85.100','active','',0,'2019-10-21 00:43:34','','','','',2),(10,'fb','Marcio','Takara','my_takara@yahoo.com.br','e9e3d0a9c5fd099faefe6264883b10cb','','','','','','','+5511958585858','','2019-10-20 22:16:33','2019-10-21 01:16:34','2019-10-21 00:20:10','189.79.85.100','active','',0,'2019-10-21 01:16:34','','','avatar_2703385036379185.jpg','',2),(11,'mobile','Cristiane','Takara','1sayuri.takara@hotmail.com','931af583573227f0220bc568c65ce104','','','','','',NULL,'+5511957702023','','2019-10-21 19:50:31','2019-10-21 19:58:44','2019-10-21 22:50:31','177.33.141.87','active','8kr6lrj0q4r5950599ea99cf149365938d57b5d178952df',0,'2019-10-21 22:50:31','','','','',2);
/*!40000 ALTER TABLE `mt_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_client_cc`
--

DROP TABLE IF EXISTS `mt_client_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_client_cc` (
  `cc_id` int(14) NOT NULL AUTO_INCREMENT,
  `client_id` int(14) NOT NULL DEFAULT '0',
  `card_name` varchar(255) NOT NULL DEFAULT '',
  `credit_card_number` varchar(20) NOT NULL DEFAULT '',
  `expiration_month` varchar(5) NOT NULL DEFAULT '',
  `expiration_yr` varchar(5) NOT NULL DEFAULT '',
  `cvv` varchar(20) NOT NULL DEFAULT '',
  `billing_address` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `encrypted_card` binary(255) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  PRIMARY KEY (`cc_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_client_cc`
--

LOCK TABLES `mt_client_cc` WRITE;
/*!40000 ALTER TABLE `mt_client_cc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_client_cc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_cooking_ref`
--

DROP TABLE IF EXISTS `mt_cooking_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_cooking_ref` (
  `cook_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `cooking_name` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'published',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `cooking_name_trans` text,
  PRIMARY KEY (`cook_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `cooking_name` (`cooking_name`),
  KEY `sequence` (`sequence`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_cooking_ref`
--

LOCK TABLES `mt_cooking_ref` WRITE;
/*!40000 ALTER TABLE `mt_cooking_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_cooking_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_cuisine`
--

DROP TABLE IF EXISTS `mt_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_cuisine` (
  `cuisine_id` int(14) NOT NULL AUTO_INCREMENT,
  `cuisine_name` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `cuisine_name_trans` text,
  `status` varchar(100) NOT NULL DEFAULT 'publish',
  `featured_image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cuisine_id`),
  KEY `cuisine_name` (`cuisine_name`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_cuisine`
--

LOCK TABLES `mt_cuisine` WRITE;
/*!40000 ALTER TABLE `mt_cuisine` DISABLE KEYS */;
INSERT INTO `mt_cuisine` VALUES (21,'Padaria',0,'2019-10-05 00:27:27','2019-10-05 03:27:27','187.101.170.169',NULL,'publish',''),(22,'Supermercado',0,'2019-10-05 00:27:53','2019-10-05 03:27:53','187.101.170.169',NULL,'publish',''),(23,'Mercearia',0,'2019-10-05 00:28:07','2019-10-05 03:28:07','187.101.170.169',NULL,'publish',''),(24,'Mercado',0,'2019-10-20 20:09:10','2019-10-20 23:09:10','189.79.85.100',NULL,'publish',''),(25,'Mercadinho',0,'2019-10-20 20:09:21','2019-10-20 23:09:21','189.79.85.100',NULL,'publish',''),(26,'Hipermercado',0,'2019-10-20 20:09:36','2019-10-20 23:09:36','189.79.85.100',NULL,'publish','');
/*!40000 ALTER TABLE `mt_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_currency`
--

DROP TABLE IF EXISTS `mt_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_currency` (
  `currency_code` varchar(3) NOT NULL DEFAULT '',
  `currency_symbol` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`currency_code`),
  KEY `currency_symbol` (`currency_symbol`),
  KEY `currency_code` (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_currency`
--

LOCK TABLES `mt_currency` WRITE;
/*!40000 ALTER TABLE `mt_currency` DISABLE KEYS */;
INSERT INTO `mt_currency` VALUES ('AUD','&#36;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('BRL','R$','2019-10-02 01:24:31','2019-10-02 01:24:31','201.95.66.116'),('CAD','&#36;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('CNY','&yen;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('EUR','&euro;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('HKD','&#36;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('JPY','&yen;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('MXN','&#36;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('NZD','&#36;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),('USD','&#36;','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116');
/*!40000 ALTER TABLE `mt_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_custom_page`
--

DROP TABLE IF EXISTS `mt_custom_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_custom_page` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `slug_name` varchar(255) NOT NULL DEFAULT '',
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `meta_description` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '',
  `icons` varchar(255) NOT NULL DEFAULT '',
  `assign_to` varchar(50) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  `open_new_tab` int(11) NOT NULL DEFAULT '1',
  `is_custom_link` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `slug_name` (`slug_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_custom_page`
--

LOCK TABLES `mt_custom_page` WRITE;
/*!40000 ALTER TABLE `mt_custom_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_custom_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_dishes`
--

DROP TABLE IF EXISTS `mt_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_dishes` (
  `dish_id` int(14) NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`dish_id`),
  KEY `dish_name` (`dish_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_dishes`
--

LOCK TABLES `mt_dishes` WRITE;
/*!40000 ALTER TABLE `mt_dishes` DISABLE KEYS */;
INSERT INTO `mt_dishes` VALUES (1,'PRATO123','1571613844-Forno.jpg','publish','2019-10-20 20:24:06','2019-10-20 20:24:43','189.79.85.100');
/*!40000 ALTER TABLE `mt_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver`
--

DROP TABLE IF EXISTS `mt_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver` (
  `driver_id` int(14) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  `on_duty` int(1) NOT NULL DEFAULT '1',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `team_id` int(14) NOT NULL DEFAULT '0',
  `transport_type_id` varchar(50) NOT NULL DEFAULT '',
  `transport_description` varchar(255) NOT NULL DEFAULT '',
  `licence_plate` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_online` int(14) NOT NULL DEFAULT '0',
  `location_address` text,
  `location_lat` varchar(50) NOT NULL DEFAULT '',
  `location_lng` varchar(50) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `forgot_pass_code` varchar(10) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `device_id` text,
  `device_platform` varchar(50) NOT NULL DEFAULT 'Android',
  `enabled_push` int(1) NOT NULL DEFAULT '1',
  `profile_photo` varchar(255) NOT NULL DEFAULT '',
  `is_signup` int(1) NOT NULL DEFAULT '2',
  `app_version` varchar(14) NOT NULL DEFAULT '',
  `last_onduty` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`driver_id`),
  KEY `team_id` (`team_id`),
  KEY `user_type` (`user_type`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver`
--

LOCK TABLES `mt_driver` WRITE;
/*!40000 ALTER TABLE `mt_driver` DISABLE KEYS */;
INSERT INTO `mt_driver` VALUES (2,'admin',1,1,'Marcio','Takara','my_takara@yahoo.com.br','+55971960399','Marcio','e10adc3949ba59abbe56e057f20f883e',1,'bicycle','biz 2019','55444','Branca','active','2019-10-01 17:56:25','2019-10-05 23:21:09','2019-10-20 10:29:59',1571577903,NULL,'-23.4825264','-46.6499822','189.79.85.100','0','40b117986e707534891a61d00d52333c','cGbp0YBifAU:APA91bHobQAYcUqKROBeXVNo-FPWhs-rW70n1XomWs01-1WgZJkuznDHyoHvLQaBqojD71nyVUKHbdvUVphexyHeSY7MZu8X3CJr_pgpWVM4gX9AHHAj35wDMZwtxsYEuWrm2P-NhS-u','Android',1,'',1,'1.7.1','1570152612'),(4,'merchant',2,1,'Minoru','Kondo','minorex@gmail.com','+5511971960399','minoru','68f2a2aca533d8f0f8f3cdf3dd4b365c',2,'bicycle','Bicicleta 2016','VIADO1234','ROSA','active','2019-10-20 10:48:31','2019-10-20 13:48:31','2019-10-20 18:36:05',1571607069,NULL,'-23.4823186','-46.6500936','189.79.85.100','0','19d74ee82a32289a9a2f3a18069dd96d','ccMq9kwwXH4:APA91bGJlEzESlhFxU50YLhYmXFv9mMxb0uyQnV3-XRT1UzjE2kjJX9ykTq-xos2LuK4Nu4ApRXvu1pfayw-7TxYt4-u7OKfg03CxcDB0_XBn3HTfmTWsW6hJSxrWsKVlG-pD3pnf-l7','Android',1,'',2,'1.7.1',''),(5,'merchant',2,1,'Danilo','Sanada','danilo.sanada@gmail.com','+5511958874455','sanada','2853317c4abbac70528b177856a1f100',2,'scooter','Yamada 2016','ssd2235','Branco','active','2019-10-20 11:48:01','2019-10-20 14:48:01','2019-10-20 14:48:01',0,NULL,'','','189.79.85.100','0','',NULL,'Android',1,'',2,'',''),(6,'admin',1,1,'Renan','Shimada','renan.shimada@hotmail.com','+5511956587745','Renan','91cdfc2ec44117c2c28df394ff155602',0,'bicycle','Moto 2016 Honda','mjk2654','Azul','active','2019-10-20 18:19:51','2019-10-20 21:19:51','2019-10-20 18:56:16',1571608283,NULL,'-23.4823249','-46.6500578','189.79.85.100','0','ffd2c51db0b2e38187028b9c76de0d9f','fMzO2lL7ZL4:APA91bFCy2pFjEUac-1DfPwVacImKk8IuwdwiTJAwgw_m8mgKcrBpauJC0iJzsfwQon7pnHVVJQ4x_s13wktw-ZyDqEcEANVQ17pPSsosnERHSdqoYowpAJYod_F3CbUo4-BEdZqO_mf','Android',1,'',1,'1.7.1',''),(7,'admin',1,1,'Enzo','Shimada','enzo.shimada@hotmail.com','+5511955544554','Enzo','91cdfc2ec44117c2c28df394ff155602',0,'car','Gol TSI 2016','sddr5444','Prata','active','2019-10-20 18:21:39','2019-10-20 21:21:39','2019-10-20 21:21:39',0,NULL,'','','189.79.85.100','0','',NULL,'Android',1,'',1,'',''),(8,'admin',1,1,'Gabriel','Shimada','gabriel.shimada@hotmail.com','+5511965656888','Gabriel','91cdfc2ec44117c2c28df394ff155602',0,'scooter','Yamada 2016','ssrr225555','Azul','active','2019-10-20 18:30:39','2019-10-20 21:30:39','2019-10-20 18:54:24',1571608172,NULL,'','','189.79.85.100','0','4f7fb05d7ce115b923dc95db016b9576','ebVX4yS4-m4:APA91bHUUOysMgCf1LQhMK8PaC-_QdaKzs92nLVrAUrpdEyM69riTZlzZDicDHcG4OX7Uvx_-pfbAudlyVpnh7XQDkBIwiIm53T_9kQrLl1C0Pddow6kz4kkLaBwgpJvyHeb3iGMUvbp','Android',1,'',1,'1.7.1',''),(9,'admin',1,1,'Matheus','Ken Takara','matheus.kentakara@hotmail.com','+5511958786589','Matheus','5088357448864f6d80d06b75c5952d65',0,'car','Veloster 2013 der2588','deerr1587','Preto','active','2019-10-20 18:34:11','2019-10-20 18:45:43','2019-10-21 19:59:33',1571698481,NULL,'-23.4816819','-46.6490935','177.33.141.87','0','421cff7f3773196306f7cbf88e518929','czBzBkn6lGI:APA91bHReCkdsK_2P71dS3_4v6OUgf2_k-yl25mWvrYC64Ary-H6BKRaXZh1-lbmVN06y65L6Kvu7LgJyxaoYIBQ0YVP4tkr1Bca9rwvgqNK0TwEG6RaqEu56uGv_HfG5lBOBCB6TYKb','Android',1,'image64016.jpg',1,'1.7.1','1571607691');
/*!40000 ALTER TABLE `mt_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver_assignment`
--

DROP TABLE IF EXISTS `mt_driver_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_assignment` (
  `assignment_id` int(14) NOT NULL AUTO_INCREMENT,
  `auto_assign_type` varchar(50) NOT NULL DEFAULT '',
  `task_id` int(14) NOT NULL DEFAULT '0',
  `driver_id` int(14) NOT NULL DEFAULT '0',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `task_status` varchar(255) NOT NULL DEFAULT 'unassigned',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_process` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`assignment_id`),
  KEY `auto_assign_type` (`auto_assign_type`),
  KEY `task_id` (`task_id`),
  KEY `driver_id` (`driver_id`),
  KEY `status` (`status`),
  KEY `task_status` (`task_status`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_assignment`
--

LOCK TABLES `mt_driver_assignment` WRITE;
/*!40000 ALTER TABLE `mt_driver_assignment` DISABLE KEYS */;
INSERT INTO `mt_driver_assignment` VALUES (1,'send_to_all',100027,4,'Minoru','Kondo','process','acknowledged','2019-10-20 11:56:01','2019-10-20 11:57:01','35.198.24.213'),(2,'send_to_all',100027,5,'Danilo','Sanada','process','acknowledged','2019-10-20 11:56:01','2019-10-20 11:57:01','35.198.24.213');
/*!40000 ALTER TABLE `mt_driver_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver_bulk_push`
--

DROP TABLE IF EXISTS `mt_driver_bulk_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_bulk_push` (
  `bulk_id` int(14) NOT NULL AUTO_INCREMENT,
  `push_title` varchar(255) NOT NULL DEFAULT '',
  `push_message` text,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_process` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `team_id` int(14) NOT NULL DEFAULT '0',
  `user_type` varchar(50) DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bulk_id`),
  KEY `team_id` (`team_id`),
  KEY `user_type` (`user_type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_bulk_push`
--

LOCK TABLES `mt_driver_bulk_push` WRITE;
/*!40000 ALTER TABLE `mt_driver_bulk_push` DISABLE KEYS */;
INSERT INTO `mt_driver_bulk_push` VALUES (1,'teste 123','push teste ','process','2019-10-01 22:05:59','2019-10-02 01:05:59','201.95.66.116',1,'admin',1),(2,'teste','dsdsdsd','process','2019-10-01 22:13:14','2019-10-02 01:13:14','189.79.78.120',1,'admin',1),(3,'teste de push bulk','testando push bulk para todos os entregadores.','process','2019-10-04 10:47:18','2019-10-04 13:47:18','187.116.108.144',1,'admin',1);
/*!40000 ALTER TABLE `mt_driver_bulk_push` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver_mapsapicall`
--

DROP TABLE IF EXISTS `mt_driver_mapsapicall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_mapsapicall` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `map_provider` varchar(100) NOT NULL DEFAULT '',
  `api_functions` varchar(255) NOT NULL DEFAULT '',
  `api_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_call` date DEFAULT NULL,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_mapsapicall`
--

LOCK TABLES `mt_driver_mapsapicall` WRITE;
/*!40000 ALTER TABLE `mt_driver_mapsapicall` DISABLE KEYS */;
INSERT INTO `mt_driver_mapsapicall` VALUES (1,'mapbox','geocode','{\"0\":{\"id\":\"country.12447454793682710\",\"type\":\"Feature\",\"place_type\":[\"country\"],\"relevance\":1,\"properties\":{\"short_code\":\"br\",\"wikidata\":\"Q155\"},\"text\":\"Brazil\",\"place_name\":\"Brazil\",\"bbox\":[-73.982498,-33.83191,-28.741975,5.271602],\"center\":[-53,-11],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-53,-11]}},\"1\":{\"id\":\"place.6928285331682710\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":1,\"properties\":{\"wikidata\":\"Q1998364\"},\"text\":\"Brazil\",\"place_name\":\"Brazil, Indiana, United States\",\"bbox\":[-87.2583330758304,39.3874209807944,-87.0116685710978,39.7139544277387],\"center\":[-87.125,39.5237],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-87.125,39.5237]},\"context\":[{\"id\":\"region.18316833095766400\",\"short_code\":\"US-IN\",\"wikidata\":\"Q1415\",\"text\":\"Indiana\"},{\"id\":\"country.9053006287256050\",\"short_code\":\"us\",\"wikidata\":\"Q30\",\"text\":\"United States\"}]},\"2\":{\"id\":\"poi.3032246978194\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":1,\"properties\":{\"landmark\":true,\"address\":\"\\u0431\\u0443\\u043b. \\u041b\\u0435\\u0441\\u0456 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u043a\\u0438, 24\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Grill do Brasil\",\"place_name\":\"Grill do Brasil, \\u0431\\u0443\\u043b. \\u041b\\u0435\\u0441\\u0456 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u043a\\u0438, 24, \\u041a\\u0438\\u0457\\u0432, \\u041a\\u0438\\u0457\\u0432\\u0441\\u044c\\u043a\\u0430, Ukraine\",\"center\":[30.535197,50.430136],\"geometry\":{\"coordinates\":[30.535197,50.430136],\"type\":\"Point\"},\"context\":[{\"id\":\"place.16378188342744340\",\"wikidata\":\"Q1899\",\"text\":\"\\u041a\\u0438\\u0457\\u0432\"},{\"id\":\"region.13255199797441120\",\"short_code\":\"UA-32\",\"wikidata\":\"Q170036\",\"text\":\"\\u041a\\u0438\\u0457\\u0432\\u0441\\u044c\\u043a\\u0430\"},{\"id\":\"country.6525766365476590\",\"short_code\":\"ua\",\"wikidata\":\"Q212\",\"text\":\"Ukraine\"}]},\"3\":{\"id\":\"poi.2688649574934\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":1,\"properties\":{\"landmark\":true,\"address\":\"\\u0432\\u0443\\u043b. \\u041f\\u0443\\u0448\\u043a\\u0456\\u043d\\u0441\\u044c\\u043a\\u0430, 22\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Churrasco Bar\",\"place_name\":\"Churrasco Bar, \\u0432\\u0443\\u043b. \\u041f\\u0443\\u0448\\u043a\\u0456\\u043d\\u0441\\u044c\\u043a\\u0430, 22, \\u0425\\u0430\\u0440\\u043a\\u0456\\u0432, \\u0425\\u0430\\u0440\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\u0430, Ukraine\",\"center\":[36.235574,49.994124],\"geometry\":{\"coordinates\":[36.235574,49.994124],\"type\":\"Point\"},\"context\":[{\"id\":\"place.8412476688788770\",\"wikidata\":\"Q42308\",\"text\":\"\\u0425\\u0430\\u0440\\u043a\\u0456\\u0432\"},{\"id\":\"region.15128994744510780\",\"short_code\":\"UA-63\",\"wikidata\":\"Q170666\",\"text\":\"\\u0425\\u0430\\u0440\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\u0430\"},{\"id\":\"country.6525766365476590\",\"short_code\":\"ua\",\"wikidata\":\"Q212\",\"text\":\"Ukraine\"}]},\"4\":{\"id\":\"poi.3350074541019\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":1,\"properties\":{\"landmark\":true,\"address\":\"corniche road\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Brasa De Brazil\",\"place_name\":\"Brasa De Brazil, corniche road, Alkhubar, Ash Sharqiyah, Saudi Arabia\",\"center\":[50.220368,26.271904],\"geometry\":{\"coordinates\":[50.220368,26.271904],\"type\":\"Point\"},\"context\":[{\"id\":\"place.11205268712248460\",\"wikidata\":\"Q311266\",\"text\":\"Alkhubar\"},{\"id\":\"region.7111612412101170\",\"short_code\":\"SA-04\",\"wikidata\":\"Q953508\",\"text\":\"Ash Sharqiyah\"},{\"id\":\"country.8186587445602250\",\"short_code\":\"sa\",\"wikidata\":\"Q851\",\"text\":\"Saudi Arabia\"}]}}','2019-10-01 17:51:54','2019-10-01','201.95.66.116'),(2,'mapbox','geocode','{\"0\":{\"id\":\"address.675430952\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.502222,\"properties\":{\"accuracy\":\"point\"},\"text\":\"Rua Campos Sales\",\"place_name\":\"Rua Campos Sales 215, \\u00c1gua Santa, Curitibanos - Santa Catarina, Brazil\",\"center\":[-50.567118,-27.300744],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-50.567118,-27.300744]},\"address\":\"215\",\"context\":[{\"id\":\"neighborhood.13722388769391180\",\"text\":\"\\u00c1gua Santa\"},{\"id\":\"place.18435365382414860\",\"wikidata\":\"Q1765072\",\"text\":\"Curitibanos\"},{\"id\":\"region.6555850234176350\",\"short_code\":\"BR-SC\",\"wikidata\":\"Q41115\",\"text\":\"Santa Catarina\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"address.2046068451\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.502222,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Campos Sales\",\"place_name\":\"Rua Campos Sales 215, Camargos, Contagem - Minas Gerais, 32210, Brazil\",\"center\":[-44.030441,-19.945775],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-44.030441,-19.945775],\"interpolated\":true},\"address\":\"215\",\"context\":[{\"id\":\"neighborhood.10254547326903030\",\"text\":\"Camargos\"},{\"id\":\"locality.11522646762518860\",\"text\":\"Parque Industrial\"},{\"id\":\"postcode.6358495033433570\",\"text\":\"32210\"},{\"id\":\"place.14293562085534410\",\"wikidata\":\"Q271333\",\"text\":\"Contagem\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"address.297773947\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.502222,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Campos Sales\",\"place_name\":\"Rua Campos Sales 215, Nova Su\\u00ed\\u00e7a, Belo Horizonte - Minas Gerais, 30673, Brazil\",\"center\":[-43.980403,-19.92825],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.980403,-19.92825],\"interpolated\":true},\"address\":\"215\",\"context\":[{\"id\":\"neighborhood.6494900075328380\",\"text\":\"Nova Su\\u00ed\\u00e7a\"},{\"id\":\"postcode.15261649001163540\",\"text\":\"30673\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"address.1517264207\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.502222,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Campos Salles\",\"place_name\":\"Rua Campos Salles 215, Santa Maria, S\\u00e3o Caetano Do Sul - S\\u00e3o Paulo, 09551, Brazil\",\"matching_text\":\"Rua Campos S\\u00e1les\",\"matching_place_name\":\"Rua Campos S\\u00e1les 215, Santa Maria, S\\u00e3o Caetano Do Sul - S\\u00e3o Paulo, 09551, Brazil\",\"center\":[-46.553144,-23.625506],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.553144,-23.625506],\"interpolated\":true},\"address\":\"215\",\"context\":[{\"id\":\"neighborhood.10635703922608990\",\"text\":\"Santa Maria\"},{\"id\":\"postcode.10677849193296150\",\"text\":\"09551\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"address.44324058\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.502222,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Campos Sales\",\"place_name\":\"Rua Campos Sales 215, Rp1 (Regi\\u00f5es De Planejamento), Mau\\u00e1 - S\\u00e3o Paulo, 09322, Brazil\",\"center\":[-46.456184,-23.666954],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.456184,-23.666954],\"interpolated\":true},\"address\":\"215\",\"context\":[{\"id\":\"neighborhood.11543498887997320\",\"text\":\"Rp1 (Regi\\u00f5es De Planejamento)\"},{\"id\":\"postcode.10810525583864530\",\"text\":\"09322\"},{\"id\":\"place.9994893886216040\",\"wikidata\":\"Q331300\",\"text\":\"Mau\\u00e1\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-01 22:25:52','2019-10-01','201.95.66.116'),(3,'mapbox','geocode','{\"0\":{\"id\":\"address.210256868\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.603333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Portugal\",\"place_name\":\"Avenida Portugal 894, Rp4 (Regi\\u00f5es De Planejamento), Mau\\u00e1 - S\\u00e3o Paulo, 09337, Brazil\",\"center\":[-46.459796,-23.676262],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.459796,-23.676262],\"interpolated\":true},\"address\":\"894\",\"context\":[{\"id\":\"neighborhood.11406040089380170\",\"text\":\"Rp4 (Regi\\u00f5es De Planejamento)\"},{\"id\":\"postcode.12403757157271440\",\"text\":\"09337\"},{\"id\":\"place.9994893886216040\",\"wikidata\":\"Q331300\",\"text\":\"Mau\\u00e1\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"address.60541951\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.603333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Portugal\",\"place_name\":\"Avenida Portugal 894, Santa Cruz Do Rio Pardo - S\\u00e3o Paulo,, Brazil\",\"center\":[-49.620398,-22.922494],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-49.620398,-22.922494],\"interpolated\":true},\"address\":\"894\",\"context\":[{\"id\":\"place.3537356462146040\",\"wikidata\":\"Q1646321\",\"text\":\"Santa Cruz Do Rio Pardo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"address.523523524\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.603333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Portugal\",\"place_name\":\"Rua Portugal 894, Descalvado - S\\u00e3o Paulo,, Brazil\",\"matching_text\":\"Avenida Portugal\",\"matching_place_name\":\"Avenida Portugal 894, Descalvado - S\\u00e3o Paulo,, Brazil\",\"center\":[-47.592253,-21.907038],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.592253,-21.907038],\"interpolated\":true},\"address\":\"894\",\"context\":[{\"id\":\"place.7584250220639780\",\"wikidata\":\"Q1761089\",\"text\":\"Descalvado\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"address.446157813\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.603333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Portugal\",\"place_name\":\"Avenida Portugal 894, S\\u00e3o Paulo - S\\u00e3o Paulo, 04562, Brazil\",\"center\":[-46.680609,-23.613755],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.680609,-23.613755],\"interpolated\":true,\"omitted\":true},\"address\":\"894\",\"context\":[{\"id\":\"locality.7152303194279610\",\"wikidata\":\"Q10304153\",\"text\":\"Itaim Bibi\"},{\"id\":\"postcode.17382375266787460\",\"text\":\"04562\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"address.1462409749\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.603333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Portugal\",\"place_name\":\"Avenida Portugal 894, Araraquara - S\\u00e3o Paulo,, Brazil\",\"center\":[-48.176466,-21.793904],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-48.176466,-21.793904],\"interpolated\":true,\"omitted\":true},\"address\":\"894\",\"context\":[{\"id\":\"locality.13490722169511690\",\"text\":\"Vila Xavier\"},{\"id\":\"place.12015183001821190\",\"wikidata\":\"Q626247\",\"text\":\"Araraquara\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-01 22:29:43','2019-10-01','201.95.66.116'),(4,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.805,\"properties\":{\"accuracy\":\"point\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini 127, S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.650453,-23.482695],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.650453,-23.482695]},\"address\":\"127\",\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.595,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"address.1235643811\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.559,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Doutor C\\u00e1ssio Ciampolini\",\"place_name\":\"Rua Doutor C\\u00e1ssio Ciampolini 127, Tiet\\u00ea - S\\u00e3o Paulo,, Brazil\",\"center\":[-47.70214,-23.09376],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.70214,-23.09376],\"interpolated\":true,\"omitted\":true},\"address\":\"127\",\"context\":[{\"id\":\"place.8619553606674220\",\"wikidata\":\"Q542815\",\"text\":\"Tiet\\u00ea\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"address.444199212\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.559,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Doutor C\\u00e1ssio Ciampolini\",\"place_name\":\"Rua Doutor C\\u00e1ssio Ciampolini 127, Ourinhos - S\\u00e3o Paulo, 19907, Brazil\",\"center\":[-49.874682,-22.970997],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-49.874682,-22.970997],\"interpolated\":true,\"omitted\":true},\"address\":\"127\",\"context\":[{\"id\":\"postcode.15579548487719770\",\"text\":\"19907\"},{\"id\":\"place.9089733563731520\",\"wikidata\":\"Q985605\",\"text\":\"Ourinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.16515264996618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.555,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Itanha\\u00e9m - S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.787815087733,-24.1825855483313,-46.7775043477418,-24.1752401881683],\"center\":[-46.783535,-24.179054],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.783535,-24.179054]},\"context\":[{\"id\":\"postcode.17030957870241110\",\"text\":\"11740\"},{\"id\":\"place.11957414074285610\",\"text\":\"Itanha\\u00e9m\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-02 23:03:24','2019-10-02','187.101.170.169'),(5,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.805,\"properties\":{\"accuracy\":\"point\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini 127, S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.650453,-23.482695],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.650453,-23.482695]},\"address\":\"127\",\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.595,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"address.1235643811\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.559,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Doutor C\\u00e1ssio Ciampolini\",\"place_name\":\"Rua Doutor C\\u00e1ssio Ciampolini 127, Tiet\\u00ea - S\\u00e3o Paulo,, Brazil\",\"center\":[-47.70214,-23.09376],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.70214,-23.09376],\"interpolated\":true,\"omitted\":true},\"address\":\"127\",\"context\":[{\"id\":\"place.8619553606674220\",\"wikidata\":\"Q542815\",\"text\":\"Tiet\\u00ea\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"address.444199212\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.559,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Doutor C\\u00e1ssio Ciampolini\",\"place_name\":\"Rua Doutor C\\u00e1ssio Ciampolini 127, Ourinhos - S\\u00e3o Paulo, 19907, Brazil\",\"center\":[-49.874682,-22.970997],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-49.874682,-22.970997],\"interpolated\":true,\"omitted\":true},\"address\":\"127\",\"context\":[{\"id\":\"postcode.15579548487719770\",\"text\":\"19907\"},{\"id\":\"place.9089733563731520\",\"wikidata\":\"Q985605\",\"text\":\"Ourinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.16515264996618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.555,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Itanha\\u00e9m - S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.787815087733,-24.1825855483313,-46.7775043477418,-24.1752401881683],\"center\":[-46.783535,-24.179054],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.783535,-24.179054]},\"context\":[{\"id\":\"postcode.17030957870241110\",\"text\":\"11740\"},{\"id\":\"place.11957414074285610\",\"text\":\"Itanha\\u00e9m\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-02 23:13:14','2019-10-02','187.101.170.169'),(6,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.805,\"properties\":{\"accuracy\":\"point\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini 127, S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.650453,-23.482695],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.650453,-23.482695]},\"address\":\"127\",\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.595,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"address.1235643811\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.559,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Doutor C\\u00e1ssio Ciampolini\",\"place_name\":\"Rua Doutor C\\u00e1ssio Ciampolini 127, Tiet\\u00ea - S\\u00e3o Paulo,, Brazil\",\"center\":[-47.70214,-23.09376],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.70214,-23.09376],\"interpolated\":true,\"omitted\":true},\"address\":\"127\",\"context\":[{\"id\":\"place.8619553606674220\",\"wikidata\":\"Q542815\",\"text\":\"Tiet\\u00ea\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"address.444199212\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.559,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Rua Doutor C\\u00e1ssio Ciampolini\",\"place_name\":\"Rua Doutor C\\u00e1ssio Ciampolini 127, Ourinhos - S\\u00e3o Paulo, 19907, Brazil\",\"center\":[-49.874682,-22.970997],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-49.874682,-22.970997],\"interpolated\":true,\"omitted\":true},\"address\":\"127\",\"context\":[{\"id\":\"postcode.15579548487719770\",\"text\":\"19907\"},{\"id\":\"place.9089733563731520\",\"wikidata\":\"Q985605\",\"text\":\"Ourinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.16515264996618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.555,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Itanha\\u00e9m - S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.787815087733,-24.1825855483313,-46.7775043477418,-24.1752401881683],\"center\":[-46.783535,-24.179054],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.783535,-24.179054]},\"context\":[{\"id\":\"postcode.17030957870241110\",\"text\":\"11740\"},{\"id\":\"place.11957414074285610\",\"text\":\"Itanha\\u00e9m\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-02 23:15:21','2019-10-02','187.101.170.169'),(7,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-02 23:31:43','2019-10-02','187.101.170.169'),(8,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.752,\"properties\":{\"accuracy\":\"point\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini 127, S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.650453,-23.482695],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.650453,-23.482695]},\"address\":\"127\",\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.492,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.492,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.492,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.492,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-03 22:07:30','2019-10-03','187.101.170.169'),(9,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-03 22:21:20','2019-10-03','187.101.170.169'),(10,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-03 22:25:22','2019-10-03','187.101.170.169'),(11,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-03 22:26:52','2019-10-03','187.101.170.169'),(12,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-03 22:46:10','2019-10-03','187.101.170.169'),(13,'mapbox','geocode','{\"0\":{\"id\":\"poi.1769526572172\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.540714,\"properties\":{\"landmark\":true,\"address\":\"R. Porto Carrero, 285\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Cozinha Campestre\",\"place_name\":\"Cozinha Campestre, R. Porto Carrero, 285, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.540822,-23.641625],\"geometry\":{\"coordinates\":[-46.540822,-23.641625],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"poi.2267742735864\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.493571,\"properties\":{\"landmark\":true,\"address\":\"D. Pedro II\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Feijao de Corda\",\"place_name\":\"Feijao de Corda, D. Pedro II, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.54056,-23.641171],\"geometry\":{\"coordinates\":[-46.54056,-23.641171],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"poi.3075196648662\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Goi\\u00e1s, 1135\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Vivano Steakhouse\",\"place_name\":\"Vivano Steakhouse, Av. Goi\\u00e1s, 1135, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 09541, Brazil\",\"center\":[-46.565161,-23.616541],\"geometry\":{\"coordinates\":[-46.565161,-23.616541],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.12067332303595220\",\"text\":\"Santa Paula\"},{\"id\":\"locality.14736785072911910\",\"wikidata\":\"Q10391152\",\"text\":\"Vila Prudente\"},{\"id\":\"postcode.11276239568160630\",\"text\":\"09541\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"poi.3186865792144\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Ver. Abel Ferreira, 1106\",\"category\":\"northeastern brazilian restaurant, northeastern brazilian food, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Panel\\u00e3o do Norte\",\"place_name\":\"Panel\\u00e3o do Norte, Av. Ver. Abel Ferreira, 1106, S\\u00e3o Paulo, S\\u00e3o Paulo 03371, Brazil\",\"center\":[-46.558587,-23.565111],\"geometry\":{\"coordinates\":[-46.558587,-23.565111],\"type\":\"Point\"},\"context\":[{\"id\":\"locality.9448037091812410\",\"text\":\"Vila Formosa\"},{\"id\":\"postcode.9490837492518210\",\"text\":\"03371\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"poi.2156073627168\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"ParkShoppingS\\u00e3oCaetano\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Viena\",\"place_name\":\"Viena, ParkShoppingS\\u00e3oCaetano, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 04243, Brazil\",\"center\":[-46.579827,-23.626314],\"geometry\":{\"coordinates\":[-46.579827,-23.626314],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.13997554527345250\",\"text\":\"Cer\\u00e2mica\"},{\"id\":\"locality.9696961768142140\",\"wikidata\":\"Q10366796\",\"text\":\"Sacom\\u00e3\"},{\"id\":\"postcode.17167266219243580\",\"text\":\"04243\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 10:08:09','2019-10-04','187.116.108.144'),(14,'mapbox','geocode','{\"0\":{\"id\":\"poi.1769526572172\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.540714,\"properties\":{\"landmark\":true,\"address\":\"R. Porto Carrero, 285\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Cozinha Campestre\",\"place_name\":\"Cozinha Campestre, R. Porto Carrero, 285, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.540822,-23.641625],\"geometry\":{\"coordinates\":[-46.540822,-23.641625],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"poi.2267742735864\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.493571,\"properties\":{\"landmark\":true,\"address\":\"D. Pedro II\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Feijao de Corda\",\"place_name\":\"Feijao de Corda, D. Pedro II, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.54056,-23.641171],\"geometry\":{\"coordinates\":[-46.54056,-23.641171],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"poi.3075196648662\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Goi\\u00e1s, 1135\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Vivano Steakhouse\",\"place_name\":\"Vivano Steakhouse, Av. Goi\\u00e1s, 1135, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 09541, Brazil\",\"center\":[-46.565161,-23.616541],\"geometry\":{\"coordinates\":[-46.565161,-23.616541],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.12067332303595220\",\"text\":\"Santa Paula\"},{\"id\":\"locality.14736785072911910\",\"wikidata\":\"Q10391152\",\"text\":\"Vila Prudente\"},{\"id\":\"postcode.11276239568160630\",\"text\":\"09541\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"poi.3186865792144\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Ver. Abel Ferreira, 1106\",\"category\":\"northeastern brazilian restaurant, northeastern brazilian food, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Panel\\u00e3o do Norte\",\"place_name\":\"Panel\\u00e3o do Norte, Av. Ver. Abel Ferreira, 1106, S\\u00e3o Paulo, S\\u00e3o Paulo 03371, Brazil\",\"center\":[-46.558587,-23.565111],\"geometry\":{\"coordinates\":[-46.558587,-23.565111],\"type\":\"Point\"},\"context\":[{\"id\":\"locality.9448037091812410\",\"text\":\"Vila Formosa\"},{\"id\":\"postcode.9490837492518210\",\"text\":\"03371\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"poi.2156073627168\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"ParkShoppingS\\u00e3oCaetano\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Viena\",\"place_name\":\"Viena, ParkShoppingS\\u00e3oCaetano, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 04243, Brazil\",\"center\":[-46.579827,-23.626314],\"geometry\":{\"coordinates\":[-46.579827,-23.626314],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.13997554527345250\",\"text\":\"Cer\\u00e2mica\"},{\"id\":\"locality.9696961768142140\",\"wikidata\":\"Q10366796\",\"text\":\"Sacom\\u00e3\"},{\"id\":\"postcode.17167266219243580\",\"text\":\"04243\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 10:10:31','2019-10-04','187.116.108.144'),(15,'mapbox','geocode','{\"0\":{\"id\":\"poi.1769526572172\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.540714,\"properties\":{\"landmark\":true,\"address\":\"R. Porto Carrero, 285\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Cozinha Campestre\",\"place_name\":\"Cozinha Campestre, R. Porto Carrero, 285, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.540822,-23.641625],\"geometry\":{\"coordinates\":[-46.540822,-23.641625],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"poi.2267742735864\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.493571,\"properties\":{\"landmark\":true,\"address\":\"D. Pedro II\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Feijao de Corda\",\"place_name\":\"Feijao de Corda, D. Pedro II, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.54056,-23.641171],\"geometry\":{\"coordinates\":[-46.54056,-23.641171],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"poi.3075196648662\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Goi\\u00e1s, 1135\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Vivano Steakhouse\",\"place_name\":\"Vivano Steakhouse, Av. Goi\\u00e1s, 1135, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 09541, Brazil\",\"center\":[-46.565161,-23.616541],\"geometry\":{\"coordinates\":[-46.565161,-23.616541],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.12067332303595220\",\"text\":\"Santa Paula\"},{\"id\":\"locality.14736785072911910\",\"wikidata\":\"Q10391152\",\"text\":\"Vila Prudente\"},{\"id\":\"postcode.11276239568160630\",\"text\":\"09541\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"poi.3186865792144\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Ver. Abel Ferreira, 1106\",\"category\":\"northeastern brazilian restaurant, northeastern brazilian food, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Panel\\u00e3o do Norte\",\"place_name\":\"Panel\\u00e3o do Norte, Av. Ver. Abel Ferreira, 1106, S\\u00e3o Paulo, S\\u00e3o Paulo 03371, Brazil\",\"center\":[-46.558587,-23.565111],\"geometry\":{\"coordinates\":[-46.558587,-23.565111],\"type\":\"Point\"},\"context\":[{\"id\":\"locality.9448037091812410\",\"text\":\"Vila Formosa\"},{\"id\":\"postcode.9490837492518210\",\"text\":\"03371\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"poi.2156073627168\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"ParkShoppingS\\u00e3oCaetano\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Viena\",\"place_name\":\"Viena, ParkShoppingS\\u00e3oCaetano, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 04243, Brazil\",\"center\":[-46.579827,-23.626314],\"geometry\":{\"coordinates\":[-46.579827,-23.626314],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.13997554527345250\",\"text\":\"Cer\\u00e2mica\"},{\"id\":\"locality.9696961768142140\",\"wikidata\":\"Q10366796\",\"text\":\"Sacom\\u00e3\"},{\"id\":\"postcode.17167266219243580\",\"text\":\"04243\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 10:23:42','2019-10-04','187.116.108.144'),(16,'mapbox','geocode','{\"0\":{\"id\":\"country.12447454793682710\",\"type\":\"Feature\",\"place_type\":[\"country\"],\"relevance\":1,\"properties\":{\"short_code\":\"br\",\"wikidata\":\"Q155\"},\"text\":\"Brazil\",\"place_name\":\"Brazil\",\"bbox\":[-73.982498,-33.83191,-28.741975,5.271602],\"center\":[-53,-11],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-53,-11]}},\"1\":{\"id\":\"place.6928285331682710\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":1,\"properties\":{\"wikidata\":\"Q1998364\"},\"text\":\"Brazil\",\"place_name\":\"Brazil, Indiana, United States\",\"bbox\":[-87.2583330758304,39.3874209807944,-87.0116685710978,39.7139544277387],\"center\":[-87.125,39.5237],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-87.125,39.5237]},\"context\":[{\"id\":\"region.18316833095766400\",\"short_code\":\"US-IN\",\"wikidata\":\"Q1415\",\"text\":\"Indiana\"},{\"id\":\"country.9053006287256050\",\"short_code\":\"us\",\"wikidata\":\"Q30\",\"text\":\"United States\"}]},\"2\":{\"id\":\"poi.3032246978194\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":1,\"properties\":{\"landmark\":true,\"address\":\"\\u0431\\u0443\\u043b. \\u041b\\u0435\\u0441\\u0456 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u043a\\u0438, 24\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Grill do Brasil\",\"place_name\":\"Grill do Brasil, \\u0431\\u0443\\u043b. \\u041b\\u0435\\u0441\\u0456 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u043a\\u0438, 24, \\u041a\\u0438\\u0457\\u0432, \\u041a\\u0438\\u0457\\u0432\\u0441\\u044c\\u043a\\u0430, Ukraine\",\"center\":[30.535197,50.430136],\"geometry\":{\"coordinates\":[30.535197,50.430136],\"type\":\"Point\"},\"context\":[{\"id\":\"place.16378188342744340\",\"wikidata\":\"Q1899\",\"text\":\"\\u041a\\u0438\\u0457\\u0432\"},{\"id\":\"region.13255199797441120\",\"short_code\":\"UA-32\",\"wikidata\":\"Q170036\",\"text\":\"\\u041a\\u0438\\u0457\\u0432\\u0441\\u044c\\u043a\\u0430\"},{\"id\":\"country.6525766365476590\",\"short_code\":\"ua\",\"wikidata\":\"Q212\",\"text\":\"Ukraine\"}]},\"3\":{\"id\":\"poi.2688649574934\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":1,\"properties\":{\"landmark\":true,\"address\":\"\\u0432\\u0443\\u043b. \\u041f\\u0443\\u0448\\u043a\\u0456\\u043d\\u0441\\u044c\\u043a\\u0430, 22\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Churrasco Bar\",\"place_name\":\"Churrasco Bar, \\u0432\\u0443\\u043b. \\u041f\\u0443\\u0448\\u043a\\u0456\\u043d\\u0441\\u044c\\u043a\\u0430, 22, \\u0425\\u0430\\u0440\\u043a\\u0456\\u0432, \\u0425\\u0430\\u0440\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\u0430, Ukraine\",\"center\":[36.235574,49.994124],\"geometry\":{\"coordinates\":[36.235574,49.994124],\"type\":\"Point\"},\"context\":[{\"id\":\"place.8412476688788770\",\"wikidata\":\"Q42308\",\"text\":\"\\u0425\\u0430\\u0440\\u043a\\u0456\\u0432\"},{\"id\":\"region.15128994744510780\",\"short_code\":\"UA-63\",\"wikidata\":\"Q170666\",\"text\":\"\\u0425\\u0430\\u0440\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\u0430\"},{\"id\":\"country.6525766365476590\",\"short_code\":\"ua\",\"wikidata\":\"Q212\",\"text\":\"Ukraine\"}]},\"4\":{\"id\":\"poi.3350074541019\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":1,\"properties\":{\"landmark\":true,\"address\":\"corniche road\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Brasa De Brazil\",\"place_name\":\"Brasa De Brazil, corniche road, Alkhubar, Ash Sharqiyah, Saudi Arabia\",\"center\":[50.220368,26.271904],\"geometry\":{\"coordinates\":[50.220368,26.271904],\"type\":\"Point\"},\"context\":[{\"id\":\"place.11205268712248460\",\"wikidata\":\"Q311266\",\"text\":\"Alkhubar\"},{\"id\":\"region.7111612412101170\",\"short_code\":\"SA-04\",\"wikidata\":\"Q953508\",\"text\":\"Ash Sharqiyah\"},{\"id\":\"country.8186587445602250\",\"short_code\":\"sa\",\"wikidata\":\"Q851\",\"text\":\"Saudi Arabia\"}]}}','2019-10-04 10:32:28','2019-10-04','187.116.108.144'),(17,'mapbox','geocode','{\"0\":{\"id\":\"poi.1769526572172\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.540714,\"properties\":{\"landmark\":true,\"address\":\"R. Porto Carrero, 285\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Cozinha Campestre\",\"place_name\":\"Cozinha Campestre, R. Porto Carrero, 285, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.540822,-23.641625],\"geometry\":{\"coordinates\":[-46.540822,-23.641625],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"poi.2267742735864\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.493571,\"properties\":{\"landmark\":true,\"address\":\"D. Pedro II\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Feijao de Corda\",\"place_name\":\"Feijao de Corda, D. Pedro II, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.54056,-23.641171],\"geometry\":{\"coordinates\":[-46.54056,-23.641171],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"poi.3075196648662\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Goi\\u00e1s, 1135\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Vivano Steakhouse\",\"place_name\":\"Vivano Steakhouse, Av. Goi\\u00e1s, 1135, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 09541, Brazil\",\"center\":[-46.565161,-23.616541],\"geometry\":{\"coordinates\":[-46.565161,-23.616541],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.12067332303595220\",\"text\":\"Santa Paula\"},{\"id\":\"locality.14736785072911910\",\"wikidata\":\"Q10391152\",\"text\":\"Vila Prudente\"},{\"id\":\"postcode.11276239568160630\",\"text\":\"09541\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"poi.3186865792144\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Ver. Abel Ferreira, 1106\",\"category\":\"northeastern brazilian restaurant, northeastern brazilian food, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Panel\\u00e3o do Norte\",\"place_name\":\"Panel\\u00e3o do Norte, Av. Ver. Abel Ferreira, 1106, S\\u00e3o Paulo, S\\u00e3o Paulo 03371, Brazil\",\"center\":[-46.558587,-23.565111],\"geometry\":{\"coordinates\":[-46.558587,-23.565111],\"type\":\"Point\"},\"context\":[{\"id\":\"locality.9448037091812410\",\"text\":\"Vila Formosa\"},{\"id\":\"postcode.9490837492518210\",\"text\":\"03371\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"poi.2156073627168\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"ParkShoppingS\\u00e3oCaetano\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Viena\",\"place_name\":\"Viena, ParkShoppingS\\u00e3oCaetano, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 04243, Brazil\",\"center\":[-46.579827,-23.626314],\"geometry\":{\"coordinates\":[-46.579827,-23.626314],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.13997554527345250\",\"text\":\"Cer\\u00e2mica\"},{\"id\":\"locality.9696961768142140\",\"wikidata\":\"Q10366796\",\"text\":\"Sacom\\u00e3\"},{\"id\":\"postcode.17167266219243580\",\"text\":\"04243\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 10:51:09','2019-10-04','187.116.108.144'),(18,'mapbox','geocode','{\"0\":{\"id\":\"poi.1769526572172\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.540714,\"properties\":{\"landmark\":true,\"address\":\"R. Porto Carrero, 285\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Cozinha Campestre\",\"place_name\":\"Cozinha Campestre, R. Porto Carrero, 285, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.540822,-23.641625],\"geometry\":{\"coordinates\":[-46.540822,-23.641625],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"poi.2267742735864\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.493571,\"properties\":{\"landmark\":true,\"address\":\"D. Pedro II\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Feijao de Corda\",\"place_name\":\"Feijao de Corda, D. Pedro II, Santo Andr\\u00e9, S\\u00e3o Paulo 09080, Brazil\",\"center\":[-46.54056,-23.641171],\"geometry\":{\"coordinates\":[-46.54056,-23.641171],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.4645977430898100\",\"text\":\"Campestre\"},{\"id\":\"postcode.7981076233296180\",\"text\":\"09080\"},{\"id\":\"place.11364796670595490\",\"wikidata\":\"Q191652\",\"text\":\"Santo Andr\\u00e9\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"poi.2267742739423\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.486429,\"properties\":{\"landmark\":true,\"address\":\"Avenida Sapopemba,11948\",\"category\":\"brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Restaurante Feij\\u00e3o De Corda\",\"place_name\":\"Restaurante Feij\\u00e3o De Corda, Avenida Sapopemba,11948, S\\u00e3o Paulo, S\\u00e3o Paulo 03978, Brazil\",\"center\":[-46.503389,-23.61438],\"geometry\":{\"coordinates\":[-46.503389,-23.61438],\"type\":\"Point\"},\"context\":[{\"id\":\"locality.11961109107518710\",\"text\":\"Sapopemba\"},{\"id\":\"postcode.16083639621502690\",\"text\":\"03978\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"poi.3075196648662\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Goi\\u00e1s, 1135\",\"category\":\"churrascarias, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Vivano Steakhouse\",\"place_name\":\"Vivano Steakhouse, Av. Goi\\u00e1s, 1135, S\\u00e3o Caetano Do Sul, S\\u00e3o Paulo 09541, Brazil\",\"center\":[-46.565161,-23.616541],\"geometry\":{\"coordinates\":[-46.565161,-23.616541],\"type\":\"Point\"},\"context\":[{\"id\":\"neighborhood.12067332303595220\",\"text\":\"Santa Paula\"},{\"id\":\"locality.14736785072911910\",\"wikidata\":\"Q10391152\",\"text\":\"Vila Prudente\"},{\"id\":\"postcode.11276239568160630\",\"text\":\"09541\"},{\"id\":\"place.12960593867549610\",\"wikidata\":\"Q967648\",\"text\":\"S\\u00e3o Caetano Do Sul\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"poi.3186865792144\",\"type\":\"Feature\",\"place_type\":[\"poi\"],\"relevance\":0.391429,\"properties\":{\"landmark\":true,\"address\":\"Av. Ver. Abel Ferreira, 1106\",\"category\":\"northeastern brazilian restaurant, northeastern brazilian food, brazilian restaurant, brazilian food, latin american restaurant, latin american food, restaurant\"},\"text\":\"Panel\\u00e3o do Norte\",\"place_name\":\"Panel\\u00e3o do Norte, Av. Ver. Abel Ferreira, 1106, S\\u00e3o Paulo, S\\u00e3o Paulo 03371, Brazil\",\"center\":[-46.558587,-23.565111],\"geometry\":{\"coordinates\":[-46.558587,-23.565111],\"type\":\"Point\"},\"context\":[{\"id\":\"locality.9448037091812410\",\"text\":\"Vila Formosa\"},{\"id\":\"postcode.9490837492518210\",\"text\":\"03371\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 11:20:25','2019-10-04','187.116.108.144'),(19,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 21:12:38','2019-10-04','187.101.170.169'),(20,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 21:15:41','2019-10-04','187.101.170.169'),(21,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-04 23:32:59','2019-10-04','187.101.170.169'),(22,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-05 22:14:01','2019-10-05','187.101.170.169'),(23,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-05 22:14:22','2019-10-05','187.101.170.169'),(24,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-05 23:17:00','2019-10-05','187.101.170.169'),(25,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-05 23:27:07','2019-10-05','187.101.170.169'),(26,'mapbox','geocode','{\"0\":{\"id\":\"address.491648684\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.751111,\"properties\":{\"accuracy\":\"street\"},\"text\":\"Rua Deputado Cassio Ciampolini\",\"place_name\":\"Rua Deputado Cassio Ciampolini S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649387,-23.482252],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649387,-23.482252]},\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.12724150853838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Belo Horizonte - Minas Gerais, Brazil\",\"bbox\":[-43.9283487583904,-19.8731609675322,-43.9193749443336,-19.8639667275532],\"center\":[-43.9236,-19.8678],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-43.9236,-19.8678]},\"context\":[{\"id\":\"locality.7894015601934860\",\"text\":\"Venda Nova\"},{\"id\":\"postcode.18419136086282110\",\"text\":\"31190\"},{\"id\":\"place.12356262099041040\",\"wikidata\":\"Q42800\",\"text\":\"Belo Horizonte\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.5979560748838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Governador Valadares - Minas Gerais, Brazil\",\"bbox\":[-41.9619873417197,-18.8832849786857,-41.951116642597,-18.868108473892],\"center\":[-41.9547,-18.8758],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-41.9547,-18.8758]},\"context\":[{\"id\":\"postcode.10525343751420510\",\"text\":\"35033\"},{\"id\":\"place.7943051523057000\",\"wikidata\":\"Q462218\",\"text\":\"Governador Valadares\"},{\"id\":\"region.10277355935390450\",\"short_code\":\"BR-MG\",\"wikidata\":\"Q39109\",\"text\":\"Minas Gerais\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.6495312427838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Tapejara - Rio Grande Do Sul, Brazil\",\"bbox\":[-52.0093448616303,-28.0696831795721,-51.9804130848649,-28.0537900916707],\"center\":[-52,-28.06],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-52,-28.06]},\"context\":[{\"id\":\"place.18751405673404980\",\"wikidata\":\"Q2045002\",\"text\":\"Tapejara\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.6946476341838220\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.493333,\"properties\":[],\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, Montenegro - Rio Grande Do Sul, Brazil\",\"bbox\":[-51.5018703026022,-29.7133235880747,-51.4850459743441,-29.6978386995595],\"center\":[-51.49,-29.7],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-51.49,-29.7]},\"context\":[{\"id\":\"place.9734136253550580\",\"wikidata\":\"Q1001470\",\"text\":\"Montenegro\"},{\"id\":\"region.10641826217890480\",\"short_code\":\"BR-RS\",\"wikidata\":\"Q40030\",\"text\":\"Rio Grande Do Sul\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-05 23:28:04','2019-10-05','187.101.170.169'),(27,'mapbox','geocode','{\"0\":{\"id\":\"address.847590815\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.590333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Imirim\",\"place_name\":\"Avenida Imirim 1895, S\\u00e3o Paulo - S\\u00e3o Paulo, 02464, Brazil\",\"center\":[-46.65087,-23.489839],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.65087,-23.489839],\"interpolated\":true},\"address\":\"1895\",\"context\":[{\"id\":\"locality.11221498469496350\",\"wikidata\":\"Q9698149\",\"text\":\"Casa Verde\"},{\"id\":\"postcode.13115272953179750\",\"text\":\"02464\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.16623717118525860\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Jardim S\\u00e3o Paulo\",\"place_name\":\"Jardim S\\u00e3o Paulo, Rio Claro - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.596328,-22.420629,-47.569908,-22.396489],\"center\":[-47.58,-22.41],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.58,-22.41]},\"context\":[{\"id\":\"postcode.16711024416445930\",\"text\":\"13503\"},{\"id\":\"place.7679163304231800\",\"wikidata\":\"Q291277\",\"text\":\"Rio Claro\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.11277393707618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Tatu\\u00ed - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.859341,-23.348311,-47.8561542153432,-23.345396],\"center\":[-47.857754,-23.347044],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.857754,-23.347044]},\"context\":[{\"id\":\"postcode.11461088918675420\",\"text\":\"18278\"},{\"id\":\"place.11241403744186510\",\"wikidata\":\"Q1795613\",\"text\":\"Tatu\\u00ed\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.408667,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"postcode.4674792684334110\",\"type\":\"Feature\",\"place_type\":[\"postcode\"],\"relevance\":0.402667,\"properties\":[],\"text\":\"SP\",\"place_name\":\"SP, Valinhos, S\\u00e3o Paulo, Brazil\",\"center\":[-47.023373,-22.996342],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.023373,-22.996342]},\"context\":[{\"id\":\"place.9555086482177100\",\"wikidata\":\"Q983511\",\"text\":\"Valinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-20 10:45:30','2019-10-20','189.79.85.100'),(28,'mapbox','geocode','{\"0\":{\"id\":\"address.847590815\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.590333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Imirim\",\"place_name\":\"Avenida Imirim 1895, S\\u00e3o Paulo - S\\u00e3o Paulo, 02464, Brazil\",\"center\":[-46.65087,-23.489839],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.65087,-23.489839],\"interpolated\":true},\"address\":\"1895\",\"context\":[{\"id\":\"locality.11221498469496350\",\"wikidata\":\"Q9698149\",\"text\":\"Casa Verde\"},{\"id\":\"postcode.13115272953179750\",\"text\":\"02464\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.16623717118525860\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Jardim S\\u00e3o Paulo\",\"place_name\":\"Jardim S\\u00e3o Paulo, Rio Claro - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.596328,-22.420629,-47.569908,-22.396489],\"center\":[-47.58,-22.41],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.58,-22.41]},\"context\":[{\"id\":\"postcode.16711024416445930\",\"text\":\"13503\"},{\"id\":\"place.7679163304231800\",\"wikidata\":\"Q291277\",\"text\":\"Rio Claro\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.11277393707618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Tatu\\u00ed - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.859341,-23.348311,-47.8561542153432,-23.345396],\"center\":[-47.857754,-23.347044],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.857754,-23.347044]},\"context\":[{\"id\":\"postcode.11461088918675420\",\"text\":\"18278\"},{\"id\":\"place.11241403744186510\",\"wikidata\":\"Q1795613\",\"text\":\"Tatu\\u00ed\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.408667,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"postcode.4674792684334110\",\"type\":\"Feature\",\"place_type\":[\"postcode\"],\"relevance\":0.402667,\"properties\":[],\"text\":\"SP\",\"place_name\":\"SP, Valinhos, S\\u00e3o Paulo, Brazil\",\"center\":[-47.023373,-22.996342],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.023373,-22.996342]},\"context\":[{\"id\":\"place.9555086482177100\",\"wikidata\":\"Q983511\",\"text\":\"Valinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-20 10:46:29','2019-10-20','189.79.85.100'),(29,'mapbox','geocode','{\"0\":{\"id\":\"address.847590815\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.590333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Imirim\",\"place_name\":\"Avenida Imirim 1895, S\\u00e3o Paulo - S\\u00e3o Paulo, 02464, Brazil\",\"center\":[-46.65087,-23.489839],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.65087,-23.489839],\"interpolated\":true},\"address\":\"1895\",\"context\":[{\"id\":\"locality.11221498469496350\",\"wikidata\":\"Q9698149\",\"text\":\"Casa Verde\"},{\"id\":\"postcode.13115272953179750\",\"text\":\"02464\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.16623717118525860\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Jardim S\\u00e3o Paulo\",\"place_name\":\"Jardim S\\u00e3o Paulo, Rio Claro - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.596328,-22.420629,-47.569908,-22.396489],\"center\":[-47.58,-22.41],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.58,-22.41]},\"context\":[{\"id\":\"postcode.16711024416445930\",\"text\":\"13503\"},{\"id\":\"place.7679163304231800\",\"wikidata\":\"Q291277\",\"text\":\"Rio Claro\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.11277393707618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Tatu\\u00ed - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.859341,-23.348311,-47.8561542153432,-23.345396],\"center\":[-47.857754,-23.347044],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.857754,-23.347044]},\"context\":[{\"id\":\"postcode.11461088918675420\",\"text\":\"18278\"},{\"id\":\"place.11241403744186510\",\"wikidata\":\"Q1795613\",\"text\":\"Tatu\\u00ed\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.408667,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"postcode.4674792684334110\",\"type\":\"Feature\",\"place_type\":[\"postcode\"],\"relevance\":0.402667,\"properties\":[],\"text\":\"SP\",\"place_name\":\"SP, Valinhos, S\\u00e3o Paulo, Brazil\",\"center\":[-47.023373,-22.996342],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.023373,-22.996342]},\"context\":[{\"id\":\"place.9555086482177100\",\"wikidata\":\"Q983511\",\"text\":\"Valinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-20 11:55:21','2019-10-20','189.79.85.100'),(30,'mapbox','geocode','{\"0\":{\"id\":\"address.847590815\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.590333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Imirim\",\"place_name\":\"Avenida Imirim 1895, S\\u00e3o Paulo - S\\u00e3o Paulo, 02464, Brazil\",\"center\":[-46.65087,-23.489839],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.65087,-23.489839],\"interpolated\":true},\"address\":\"1895\",\"context\":[{\"id\":\"locality.11221498469496350\",\"wikidata\":\"Q9698149\",\"text\":\"Casa Verde\"},{\"id\":\"postcode.13115272953179750\",\"text\":\"02464\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.16623717118525860\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Jardim S\\u00e3o Paulo\",\"place_name\":\"Jardim S\\u00e3o Paulo, Rio Claro - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.596328,-22.420629,-47.569908,-22.396489],\"center\":[-47.58,-22.41],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.58,-22.41]},\"context\":[{\"id\":\"postcode.16711024416445930\",\"text\":\"13503\"},{\"id\":\"place.7679163304231800\",\"wikidata\":\"Q291277\",\"text\":\"Rio Claro\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.11277393707618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Tatu\\u00ed - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.859341,-23.348311,-47.8561542153432,-23.345396],\"center\":[-47.857754,-23.347044],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.857754,-23.347044]},\"context\":[{\"id\":\"postcode.11461088918675420\",\"text\":\"18278\"},{\"id\":\"place.11241403744186510\",\"wikidata\":\"Q1795613\",\"text\":\"Tatu\\u00ed\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.408667,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"postcode.4674792684334110\",\"type\":\"Feature\",\"place_type\":[\"postcode\"],\"relevance\":0.402667,\"properties\":[],\"text\":\"SP\",\"place_name\":\"SP, Valinhos, S\\u00e3o Paulo, Brazil\",\"center\":[-47.023373,-22.996342],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.023373,-22.996342]},\"context\":[{\"id\":\"place.9555086482177100\",\"wikidata\":\"Q983511\",\"text\":\"Valinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-20 18:52:21','2019-10-20','189.79.85.100'),(31,'mapbox','geocode','{\"0\":{\"id\":\"address.847590815\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.590333,\"properties\":{\"accuracy\":\"interpolated\"},\"text\":\"Avenida Imirim\",\"place_name\":\"Avenida Imirim 1895, S\\u00e3o Paulo - S\\u00e3o Paulo, 02464, Brazil\",\"center\":[-46.65087,-23.489839],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.65087,-23.489839],\"interpolated\":true},\"address\":\"1895\",\"context\":[{\"id\":\"locality.11221498469496350\",\"wikidata\":\"Q9698149\",\"text\":\"Casa Verde\"},{\"id\":\"postcode.13115272953179750\",\"text\":\"02464\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"neighborhood.16623717118525860\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Jardim S\\u00e3o Paulo\",\"place_name\":\"Jardim S\\u00e3o Paulo, Rio Claro - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.596328,-22.420629,-47.569908,-22.396489],\"center\":[-47.58,-22.41],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.58,-22.41]},\"context\":[{\"id\":\"postcode.16711024416445930\",\"text\":\"13503\"},{\"id\":\"place.7679163304231800\",\"wikidata\":\"Q291277\",\"text\":\"Rio Claro\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"neighborhood.11277393707618550\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.466267,\"properties\":[],\"text\":\"Vila S\\u00e3o Paulo\",\"place_name\":\"Vila S\\u00e3o Paulo, Tatu\\u00ed - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.859341,-23.348311,-47.8561542153432,-23.345396],\"center\":[-47.857754,-23.347044],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.857754,-23.347044]},\"context\":[{\"id\":\"postcode.11461088918675420\",\"text\":\"18278\"},{\"id\":\"place.11241403744186510\",\"wikidata\":\"Q1795613\",\"text\":\"Tatu\\u00ed\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.408667,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"postcode.4674792684334110\",\"type\":\"Feature\",\"place_type\":[\"postcode\"],\"relevance\":0.402667,\"properties\":[],\"text\":\"SP\",\"place_name\":\"SP, Valinhos, S\\u00e3o Paulo, Brazil\",\"center\":[-47.023373,-22.996342],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.023373,-22.996342]},\"context\":[{\"id\":\"place.9555086482177100\",\"wikidata\":\"Q983511\",\"text\":\"Valinhos\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-20 19:27:19','2019-10-20','189.79.85.100'),(32,'mapbox','geocode','{\"0\":{\"id\":\"address.33661597\",\"type\":\"Feature\",\"place_type\":[\"address\"],\"relevance\":0.75,\"properties\":{\"accuracy\":\"point\"},\"text\":\"Rua George Chahestian\",\"place_name\":\"Rua George Chahestian 11, S\\u00e3o Paulo - S\\u00e3o Paulo, 02471, Brazil\",\"center\":[-46.649187,-23.481388],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.649187,-23.481388]},\"address\":\"11\",\"context\":[{\"id\":\"locality.7399115973352940\",\"wikidata\":\"Q6747827\",\"text\":\"Mandaqui\"},{\"id\":\"postcode.10457565267191190\",\"text\":\"02471\"},{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"1\":{\"id\":\"place.9128493891838220\",\"type\":\"Feature\",\"place_type\":[\"place\"],\"relevance\":0.590833,\"properties\":{\"wikidata\":\"Q174\"},\"text\":\"S\\u00e3o Paulo\",\"place_name\":\"S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.826199,-24.0084309997018,-46.365084,-23.3562929996874],\"center\":[-46.6334,-23.5507],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.6334,-23.5507]},\"context\":[{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"2\":{\"id\":\"postcode.10457565267191190\",\"type\":\"Feature\",\"place_type\":[\"postcode\"],\"relevance\":0.4825,\"properties\":[],\"text\":\"02471\",\"place_name\":\"02471, S\\u00e3o Paulo, S\\u00e3o Paulo, Brazil\",\"bbox\":[-46.656229,-23.486285,-46.648345,-23.478983],\"center\":[-46.651562,-23.482768],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-46.651562,-23.482768]},\"context\":[{\"id\":\"place.9128493891838220\",\"wikidata\":\"Q174\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"3\":{\"id\":\"neighborhood.16623717118525860\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.461667,\"properties\":[],\"text\":\"Jardim S\\u00e3o Paulo\",\"place_name\":\"Jardim S\\u00e3o Paulo, Rio Claro - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.596328,-22.420629,-47.569908,-22.396489],\"center\":[-47.58,-22.41],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.58,-22.41]},\"context\":[{\"id\":\"postcode.16711024416445930\",\"text\":\"13503\"},{\"id\":\"place.7679163304231800\",\"wikidata\":\"Q291277\",\"text\":\"Rio Claro\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]},\"4\":{\"id\":\"neighborhood.8105292561525860\",\"type\":\"Feature\",\"place_type\":[\"neighborhood\"],\"relevance\":0.461667,\"properties\":[],\"text\":\"Jardim S\\u00e3o Paulo\",\"place_name\":\"Jardim S\\u00e3o Paulo, Tatu\\u00ed - S\\u00e3o Paulo, Brazil\",\"bbox\":[-47.846279,-23.349888,-47.834773,-23.342673],\"center\":[-47.842996,-23.344931],\"geometry\":{\"type\":\"Point\",\"coordinates\":[-47.842996,-23.344931]},\"context\":[{\"id\":\"postcode.7699087748670170\",\"text\":\"18271\"},{\"id\":\"place.11241403744186510\",\"wikidata\":\"Q1795613\",\"text\":\"Tatu\\u00ed\"},{\"id\":\"region.7147849468838220\",\"short_code\":\"BR-SP\",\"wikidata\":\"Q175\",\"text\":\"S\\u00e3o Paulo\"},{\"id\":\"country.12447454793682710\",\"short_code\":\"br\",\"wikidata\":\"Q155\",\"text\":\"Brazil\"}]}}','2019-10-21 21:59:16','2019-10-21','189.79.85.100');
/*!40000 ALTER TABLE `mt_driver_mapsapicall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mt_driver_order_view`
--

DROP TABLE IF EXISTS `mt_driver_order_view`;
/*!50001 DROP VIEW IF EXISTS `mt_driver_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mt_driver_order_view` AS SELECT 
 1 AS `order_id`,
 1 AS `client_id`,
 1 AS `device_platform`,
 1 AS `device_id`,
 1 AS `enabled_push`,
 1 AS `status`,
 1 AS `client_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mt_driver_pushlog`
--

DROP TABLE IF EXISTS `mt_driver_pushlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_pushlog` (
  `push_id` int(14) NOT NULL AUTO_INCREMENT,
  `device_platform` varchar(50) NOT NULL DEFAULT '',
  `device_id` text,
  `push_title` varchar(255) NOT NULL DEFAULT '',
  `push_message` varchar(255) NOT NULL DEFAULT '',
  `push_type` varchar(50) NOT NULL DEFAULT 'task',
  `actions` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `json_response` text,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `driver_id` int(14) NOT NULL DEFAULT '0',
  `task_id` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_process` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `is_read` int(1) DEFAULT '2',
  `bulk_id` int(14) NOT NULL DEFAULT '0',
  `user_type` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`push_id`),
  KEY `device_platform` (`device_platform`),
  KEY `status` (`status`),
  KEY `order_id` (`order_id`),
  KEY `task_id` (`task_id`),
  KEY `user_type` (`user_type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_pushlog`
--

LOCK TABLES `mt_driver_pushlog` WRITE;
/*!40000 ALTER TABLE `mt_driver_pushlog` DISABLE KEYS */;
INSERT INTO `mt_driver_pushlog` VALUES (1,'Android',NULL,'teste','teste','private','private','Device id is empty','',0,2,0,'2019-10-01 17:57:05','2019-10-01 17:57:05','35.198.24.213',1,0,'admin',1),(2,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','testando 123','push de teste','private','private','Caught exception:invalid response: \n\nUnauthorized\n\n\nUnauthorized\nError 401\n\n\n','',0,2,0,'2019-10-01 22:02:16','2019-10-01 22:02:16','35.198.24.213',1,0,'admin',1),(3,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','testando 123','push de teste','private','private','Caught exception:invalid response: \n\nUnauthorized\n\n\nUnauthorized\nError 401\n\n\n','',0,1,0,'2019-10-01 22:02:21','2019-10-01 22:02:21','35.198.24.213',2,0,'admin',1),(4,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','teste','teste','private','private','Caught exception:invalid response: \n\nUnauthorized\n\n\nUnauthorized\nError 401\n\n\n','',0,2,0,'2019-10-01 22:02:48','2019-10-01 22:02:48','35.198.24.213',1,0,'admin',1),(5,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','teste 123','push teste ','private','private','Caught exception:MismatchSenderId\n','',0,1,0,'2019-10-01 22:06:01','2019-10-01 22:07:01','35.198.24.213',2,1,'admin',1),(6,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','teste','teste','private','private','Caught exception:MismatchSenderId\n','',0,2,0,'2019-10-01 22:12:00','2019-10-01 22:12:00','35.198.24.213',1,0,'admin',1),(7,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','teste','teste','private','private','Caught exception:MismatchSenderId\n','',0,2,0,'2019-10-01 22:12:06','2019-10-01 22:12:07','35.198.24.213',1,0,'admin',1),(8,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','teste','dsdsdsd','private','private','Caught exception:MismatchSenderId\n','',0,1,0,'2019-10-01 22:14:01','2019-10-01 22:14:18','35.198.24.213',2,2,'admin',1),(9,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','teste','dsdsdsd','private','private','Caught exception:MismatchSenderId\n','',0,2,0,'2019-10-01 22:14:01','2019-10-01 22:14:18','35.198.24.213',1,2,'admin',1),(11,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','2323232','323232','private','private','Caught exception:MismatchSenderId\n','',0,2,0,'2019-10-01 22:14:17','2019-10-01 22:14:19','35.198.24.213',1,0,'admin',1),(12,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','2323232','323232','private','private','Caught exception:MismatchSenderId\n','',0,2,0,'2019-10-01 22:14:31','2019-10-01 22:14:31','35.198.24.213',1,0,'admin',1),(13,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','teste','teste','private','private','Caught exception:MismatchSenderId\n','',0,1,0,'2019-10-01 22:17:53','2019-10-01 22:17:53','35.198.24.213',2,0,'admin',1),(14,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',3,1,100000,'2019-10-01 22:26:08','2019-10-01 22:26:08','35.198.24.213',2,0,'merchant',1),(15,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',4,1,100001,'2019-10-01 22:30:16','2019-10-01 22:30:16','35.198.24.213',2,0,'merchant',1),(16,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',5,2,100002,'2019-10-01 22:40:03','2019-10-01 22:40:04','35.198.24.213',1,0,'merchant',1),(17,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',18,2,100003,'2019-10-02 23:09:12','2019-10-02 23:09:12','35.198.24.213',1,0,'merchant',1),(18,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',19,2,100004,'2019-10-02 23:13:49','2019-10-02 23:13:50','35.198.24.213',1,0,'merchant',1),(19,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',20,2,100005,'2019-10-02 23:16:33','2019-10-02 23:16:34','35.198.24.213',1,0,'merchant',1),(20,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',21,2,100006,'2019-10-02 23:39:11','2019-10-02 23:39:12','35.198.24.213',1,0,'merchant',1),(21,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',23,2,100008,'2019-10-03 22:21:43','2019-10-03 22:21:43','35.198.24.213',1,0,'merchant',1),(22,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',22,2,100007,'2019-10-03 22:23:20','2019-10-03 22:23:20','35.198.24.213',1,0,'merchant',1),(23,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',24,2,100009,'2019-10-03 22:25:34','2019-10-03 22:25:34','35.198.24.213',1,0,'merchant',1),(24,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',25,2,100010,'2019-10-03 22:28:40','2019-10-03 22:28:40','35.198.24.213',1,0,'merchant',1),(25,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',32,2,100011,'2019-10-03 22:46:25','2019-10-03 22:46:25','35.198.24.213',1,0,'merchant',1),(26,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:MismatchSenderId\n','',39,1,100013,'2019-10-04 10:29:37','2019-10-04 10:29:37','35.198.24.213',2,0,'merchant',1),(27,'Android','dbWSwFRVxaI:APA91bGiQT4PKfPt_-7Yug9I_Gz9jq3AYHjAlPYu-0_8AIe1ETkl59-RtFc7yevIazUF13HwrRPsnmylsAzx3smL0SYeP2IAk9-t5jIoDeJwhWuJB8N9jejhJinlBw81FC4TRtJY62Os','rass','dasd','private','private','process','{\"multicast_id\":4520721773073157113,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570195988749127%a84e0122f9fd7ecd\"}]}',0,1,0,'2019-10-04 10:33:08','2019-10-04 10:33:08','35.198.24.213',2,0,'admin',1),(28,'Android','ds-5GOHjv90:APA91bH6duQmz3PPBKk941lRuhLZqUr1xsIShSlW7RLp-vQYPn57Z-4DBCPjRzY4G5NG34ejdaAL1oAvzdW3oyabl9CdTnoYtpE_2pjrZ2Iv3AfgNWsX7MRsKckWAc21URo_GfwWXc5q','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":161250767894334028,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570196029334451%a84e0122f9fd7ecd\"}]}',40,1,100014,'2019-10-04 10:33:49','2019-10-04 10:33:49','35.198.24.213',2,0,'merchant',1),(29,'Android','ds-5GOHjv90:APA91bH6duQmz3PPBKk941lRuhLZqUr1xsIShSlW7RLp-vQYPn57Z-4DBCPjRzY4G5NG34ejdaAL1oAvzdW3oyabl9CdTnoYtpE_2pjrZ2Iv3AfgNWsX7MRsKckWAc21URo_GfwWXc5q','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":8154241282290994013,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570196037208863%a84e0122f9fd7ecd\"}]}',38,1,100012,'2019-10-04 10:33:57','2019-10-04 10:33:57','35.198.24.213',2,0,'merchant',1),(30,'Android','ds-5GOHjv90:APA91bH6duQmz3PPBKk941lRuhLZqUr1xsIShSlW7RLp-vQYPn57Z-4DBCPjRzY4G5NG34ejdaAL1oAvzdW3oyabl9CdTnoYtpE_2pjrZ2Iv3AfgNWsX7MRsKckWAc21URo_GfwWXc5q','teste de push bulk','testando push bulk para todos os entregadores.','private','private','process','{\"multicast_id\":1636939092902255527,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570196941531097%a84e0122f9fd7ecd\"}]}',0,1,0,'2019-10-04 10:48:01','2019-10-04 10:49:01','35.198.24.213',2,3,'admin',1),(31,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','teste de push bulk','testando push bulk para todos os entregadores.','private','private','process','{\"multicast_id\":2903215863343593433,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570196941705761%a84e0122f9fd7ecd\"}]}',0,2,0,'2019-10-04 10:48:01','2019-10-04 10:49:01','35.198.24.213',1,3,'admin',1),(33,'Android','ds-5GOHjv90:APA91bGaDTX_rBT4j0sUBgif0hNtIjTV9FecA6UAcJ7AxmF3CspWuJdTOtaa2isu_DMrl8tmvLNcCGPsKjgK4bcetxRUDDBGJFGIKgWxA7r_tC_sLBWAiSn-f7EfSw7eEAqgg7sNvyXr','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":3935339541218746211,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570197663835537%a84e0122f9fd7ecd\"}]}',41,1,100015,'2019-10-04 11:01:03','2019-10-04 11:01:03','35.198.24.213',2,0,'merchant',1),(34,'Android','ds-5GOHjv90:APA91bGaDTX_rBT4j0sUBgif0hNtIjTV9FecA6UAcJ7AxmF3CspWuJdTOtaa2isu_DMrl8tmvLNcCGPsKjgK4bcetxRUDDBGJFGIKgWxA7r_tC_sLBWAiSn-f7EfSw7eEAqgg7sNvyXr','ds','dasd','private','private','process','{\"multicast_id\":1574513571925951481,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570197898184218%a84e0122f9fd7ecd\"}]}',0,1,0,'2019-10-04 11:04:58','2019-10-04 11:04:58','35.198.24.213',2,0,'admin',1),(35,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":8851207038307312960,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570234411906317%a84e0122f9fd7ecd\"}]}',44,2,100017,'2019-10-04 21:13:31','2019-10-04 21:13:32','35.198.24.213',1,0,'merchant',1),(36,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":8685557089899592088,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570234590595407%a84e0122f9fd7ecd\"}]}',47,2,100018,'2019-10-04 21:16:30','2019-10-04 21:16:30','35.198.24.213',1,0,'merchant',1),(37,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','sdsds','dsdsds','private','private','process','{\"multicast_id\":8092921927556515409,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570234682229321%a84e0122f9fd7ecd\"}]}',0,2,0,'2019-10-04 21:18:02','2019-10-04 21:18:02','35.198.24.213',1,0,'admin',1),(38,'Android','coacOPBOFn0:APA91bHOWamfYhnZj57EGjsN5uu9uzqzAqIYeXQkTbcjtuL1HYqFixoemsmDqmHpoDdLmkAD8O5nVzf57uz1wN2a3ARPdXaLM2IQCWXixkQYIC_CVhUkrxa6rbFvSgJ_Yd-IHssrof2Y','ola isso e um teste','olaaaaaaaaaaaaaaaaaaaaa','private','private','process','{\"multicast_id\":7746922688043643637,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570234701398820%a84e0122f9fd7ecd\"}]}',0,2,0,'2019-10-04 21:18:21','2019-10-04 21:18:21','35.198.24.213',1,0,'admin',1),(39,'Android','cGbp0YBifAU:APA91bG63iMwJuyYoGTeSOUqjdxyFx7W__w2bUPY3n_rya4NEkfXLKvuKIlRVIz16E7tsEmzFF3gUl8yoWOGgKvpWN9yK5-GbbxqzG-FkZu3VtAXj8aelVZfL4xxPCylg7CY5G2fhR1e','Atende a padaria','Urgente','private','private','process','{\"multicast_id\":3349196272087633890,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570328496482489%a84e0122f9fd7ecd\"}]}',0,2,0,'2019-10-05 23:21:36','2019-10-05 23:21:36','35.198.24.213',1,0,'admin',1),(40,'Android','cGbp0YBifAU:APA91bG63iMwJuyYoGTeSOUqjdxyFx7W__w2bUPY3n_rya4NEkfXLKvuKIlRVIz16E7tsEmzFF3gUl8yoWOGgKvpWN9yK5-GbbxqzG-FkZu3VtAXj8aelVZfL4xxPCylg7CY5G2fhR1e','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":3057666041980747456,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570328510618443%a84e0122f9fd7ecd\"}]}',50,2,100021,'2019-10-05 23:21:50','2019-10-05 23:21:50','35.198.24.213',1,0,'merchant',1),(41,'Android','cGbp0YBifAU:APA91bG63iMwJuyYoGTeSOUqjdxyFx7W__w2bUPY3n_rya4NEkfXLKvuKIlRVIz16E7tsEmzFF3gUl8yoWOGgKvpWN9yK5-GbbxqzG-FkZu3VtAXj8aelVZfL4xxPCylg7CY5G2fhR1e','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":7504071201469112554,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570328529404754%a84e0122f9fd7ecd\"}]}',51,2,100020,'2019-10-05 23:22:08','2019-10-05 23:22:09','35.198.24.213',1,0,'merchant',1),(42,'Android','cGbp0YBifAU:APA91bG63iMwJuyYoGTeSOUqjdxyFx7W__w2bUPY3n_rya4NEkfXLKvuKIlRVIz16E7tsEmzFF3gUl8yoWOGgKvpWN9yK5-GbbxqzG-FkZu3VtAXj8aelVZfL4xxPCylg7CY5G2fhR1e','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":8137773431497633395,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570328536821748%a84e0122f9fd7ecd\"}]}',48,2,100019,'2019-10-05 23:22:16','2019-10-05 23:22:16','35.198.24.213',1,0,'merchant',1),(43,'Android','cGbp0YBifAU:APA91bG63iMwJuyYoGTeSOUqjdxyFx7W__w2bUPY3n_rya4NEkfXLKvuKIlRVIz16E7tsEmzFF3gUl8yoWOGgKvpWN9yK5-GbbxqzG-FkZu3VtAXj8aelVZfL4xxPCylg7CY5G2fhR1e','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":4596933576912135298,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570329053000550%a84e0122f9fd7ecd\"}]}',54,2,100024,'2019-10-05 23:30:52','2019-10-05 23:30:53','35.198.24.213',2,0,'merchant',2),(44,'Android','cGbp0YBifAU:APA91bG63iMwJuyYoGTeSOUqjdxyFx7W__w2bUPY3n_rya4NEkfXLKvuKIlRVIz16E7tsEmzFF3gUl8yoWOGgKvpWN9yK5-GbbxqzG-FkZu3VtAXj8aelVZfL4xxPCylg7CY5G2fhR1e','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":5463597944984296247,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1570329059865335%a84e0122f9fd7ecd\"}]}',53,2,100023,'2019-10-05 23:30:59','2019-10-05 23:30:59','35.198.24.213',2,0,'merchant',1),(45,'Android','ccMq9kwwXH4:APA91bH1kTlk5Ohf4e6ZcqENwylctAyJ0QaSqoOJFFMofJPYirPYlvAVHGsUFBm9ApvKHFC5yp63iYsBW-zfKu57H-qZcTM81vOYMsL17E4rixeLbt-8P8-6Aq481mEZOJsUNPlKP1q4','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":9156944264549541270,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571579446313696%a84e0122f9fd7ecd\"}]}',63,4,100026,'2019-10-20 10:50:45','2019-10-20 10:50:46','35.198.24.213',2,0,'merchant',2),(46,'Android','ccMq9kwwXH4:APA91bGJlEzESlhFxU50YLhYmXFv9mMxb0uyQnV3-XRT1UzjE2kjJX9ykTq-xos2LuK4Nu4ApRXvu1pfayw-7TxYt4-u7OKfg03CxcDB0_XBn3HTfmTWsW6hJSxrWsKVlG-pD3pnf-l7','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":4882182168916818096,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571579524954741%a84e0122f9fd7ecd\"}]}',64,4,100025,'2019-10-20 10:52:04','2019-10-20 10:52:05','35.198.24.213',2,0,'merchant',2),(47,'Android','ccMq9kwwXH4:APA91bGJlEzESlhFxU50YLhYmXFv9mMxb0uyQnV3-XRT1UzjE2kjJX9ykTq-xos2LuK4Nu4ApRXvu1pfayw-7TxYt4-u7OKfg03CxcDB0_XBn3HTfmTWsW6hJSxrWsKVlG-pD3pnf-l7','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":1069081984615645820,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571583421864929%a84e0122f9fd7ecd\"}]}',65,4,100027,'2019-10-20 11:57:01','2019-10-20 11:57:01','35.198.24.213',2,0,'merchant',2),(48,'Android','ewtfYgW8mA4:APA91bEYL32e4wVYLDjMsJ5pgLR4c-13nxb8SGsyhhrtCXMtQiQF6mHE2jQPXki5BZCLtig38SxSCIgECjUTLwVrJqgpi2AiZPGWkSOQ_BF5JC7Ll0HhRBTGUiAj37pfdn0IM5n0yn_U','ALO','TESTE DE ENVIO','private','private','process','{\"multicast_id\":2225038528903446182,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571607428080849%a84e0122f9fd7ecd\"}]}',0,9,0,'2019-10-20 18:37:07','2019-10-20 18:37:08','35.198.24.213',2,0,'merchant',2),(49,'Android','ewtfYgW8mA4:APA91bEYL32e4wVYLDjMsJ5pgLR4c-13nxb8SGsyhhrtCXMtQiQF6mHE2jQPXki5BZCLtig38SxSCIgECjUTLwVrJqgpi2AiZPGWkSOQ_BF5JC7Ll0HhRBTGUiAj37pfdn0IM5n0yn_U','Envio de pedido em nome da Padaria Paneteria','Gostaríamos de enviar um pedido para o nosso cliente e precisamos da sua ajuda. Pode nos entregar o produto? Obrigado','private','private','process','{\"multicast_id\":248416118370297080,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571607526033786%a84e0122f9fd7ecd\"}]}',0,9,0,'2019-10-20 18:38:45','2019-10-20 18:38:46','35.198.24.213',2,0,'merchant',2),(50,'Android','czubxqi6Lmw:APA91bHbEcz7TI7XmfqkWkpKOG_nxQuMjltt-fLZAv2gy7D4hKyn8auQdSnra3GzyXKNLJu6uKGlfdh57X5p9C8U8eyWTg4sm_xhO4JQu40W0M-aTSQf3fLl8-lzdMQZ-D82sYg4Eur0','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":7287459776322316938,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608442176019%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 18:54:02','2019-10-20 18:54:02','35.198.24.213',2,0,'merchant',2),(51,'Android','fMzO2lL7ZL4:APA91bFCy2pFjEUac-1DfPwVacImKk8IuwdwiTJAwgw_m8mgKcrBpauJC0iJzsfwQon7pnHVVJQ4x_s13wktw-ZyDqEcEANVQ17pPSsosnERHSdqoYowpAJYod_F3CbUo4-BEdZqO_mf','CANCEL TASK','','task','CANCEL_TASK','process','{\"multicast_id\":7219737716830277643,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608561827577%a84e0122f9fd7ecd\"}]}',66,6,100028,'2019-10-20 18:55:01','2019-10-20 18:56:01','35.198.24.213',2,0,'merchant',2),(52,'Android','ebVX4yS4-m4:APA91bHUUOysMgCf1LQhMK8PaC-_QdaKzs92nLVrAUrpdEyM69riTZlzZDicDHcG4OX7Uvx_-pfbAudlyVpnh7XQDkBIwiIm53T_9kQrLl1C0Pddow6kz4kkLaBwgpJvyHeb3iGMUvbp','CANCEL TASK','','task','CANCEL_TASK','Caught exception:NotRegistered\n','{\"multicast_id\":7219737716830277643,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608561827577%a84e0122f9fd7ecd\"}]}',66,8,100028,'2019-10-20 18:55:01','2019-10-20 18:56:02','35.198.24.213',2,0,'merchant',2),(53,'Android','czubxqi6Lmw:APA91bHbEcz7TI7XmfqkWkpKOG_nxQuMjltt-fLZAv2gy7D4hKyn8auQdSnra3GzyXKNLJu6uKGlfdh57X5p9C8U8eyWTg4sm_xhO4JQu40W0M-aTSQf3fLl8-lzdMQZ-D82sYg4Eur0','CANCEL TASK','','task','CANCEL_TASK','Caught exception:NotRegistered\n','{\"multicast_id\":7219737716830277643,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608561827577%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 18:55:01','2019-10-20 18:56:02','35.198.24.213',2,0,'merchant',2),(54,'Android','fMzO2lL7ZL4:APA91bFCy2pFjEUac-1DfPwVacImKk8IuwdwiTJAwgw_m8mgKcrBpauJC0iJzsfwQon7pnHVVJQ4x_s13wktw-ZyDqEcEANVQ17pPSsosnERHSdqoYowpAJYod_F3CbUo4-BEdZqO_mf','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:NotRegistered\n','',66,6,100028,'2019-10-20 18:57:01','2019-10-20 18:57:01','35.198.24.213',2,0,'merchant',2),(55,'Android','ebVX4yS4-m4:APA91bHUUOysMgCf1LQhMK8PaC-_QdaKzs92nLVrAUrpdEyM69riTZlzZDicDHcG4OX7Uvx_-pfbAudlyVpnh7XQDkBIwiIm53T_9kQrLl1C0Pddow6kz4kkLaBwgpJvyHeb3iGMUvbp','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:NotRegistered\n','',66,8,100028,'2019-10-20 18:57:01','2019-10-20 18:57:01','35.198.24.213',2,0,'merchant',2),(56,'Android','e4Wwou44XZQ:APA91bHaN7CRy8N4ZLb3UyfkU1QSa6jSYYk0jR3ZvfBEY-NcVrinnu2GKA6A9TgB0geG3S_Taav3WU7nLa9FZJKoiaCFE4QfdFtVUjCPjdMnlVASp7uRAJAAsQfXgNHwR9qg8U_Cf6Dm','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":7857526569251931066,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608622015755%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 18:57:01','2019-10-20 18:57:02','35.198.24.213',2,0,'merchant',2),(57,'Android','fMzO2lL7ZL4:APA91bFCy2pFjEUac-1DfPwVacImKk8IuwdwiTJAwgw_m8mgKcrBpauJC0iJzsfwQon7pnHVVJQ4x_s13wktw-ZyDqEcEANVQ17pPSsosnERHSdqoYowpAJYod_F3CbUo4-BEdZqO_mf','CANCEL TASK','','task','CANCEL_TASK','Caught exception:NotRegistered\n','',66,6,100028,'2019-10-20 18:58:01','2019-10-20 18:59:01','35.198.24.213',2,0,'merchant',2),(58,'Android','ebVX4yS4-m4:APA91bHUUOysMgCf1LQhMK8PaC-_QdaKzs92nLVrAUrpdEyM69riTZlzZDicDHcG4OX7Uvx_-pfbAudlyVpnh7XQDkBIwiIm53T_9kQrLl1C0Pddow6kz4kkLaBwgpJvyHeb3iGMUvbp','CANCEL TASK','','task','CANCEL_TASK','Caught exception:NotRegistered\n','',66,8,100028,'2019-10-20 18:58:01','2019-10-20 18:59:01','35.198.24.213',2,0,'merchant',2),(59,'Android','e4Wwou44XZQ:APA91bHaN7CRy8N4ZLb3UyfkU1QSa6jSYYk0jR3ZvfBEY-NcVrinnu2GKA6A9TgB0geG3S_Taav3WU7nLa9FZJKoiaCFE4QfdFtVUjCPjdMnlVASp7uRAJAAsQfXgNHwR9qg8U_Cf6Dm','CANCEL TASK','','task','CANCEL_TASK','process','{\"multicast_id\":3538322181782140607,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608742761854%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 18:58:01','2019-10-20 18:59:02','35.198.24.213',2,0,'merchant',2),(60,'Android','fMzO2lL7ZL4:APA91bFCy2pFjEUac-1DfPwVacImKk8IuwdwiTJAwgw_m8mgKcrBpauJC0iJzsfwQon7pnHVVJQ4x_s13wktw-ZyDqEcEANVQ17pPSsosnERHSdqoYowpAJYod_F3CbUo4-BEdZqO_mf','ASSIGN TASK','','task','ASSIGN_TASK','Caught exception:NotRegistered\n','',66,6,100028,'2019-10-20 19:00:02','2019-10-20 19:00:02','35.198.24.213',2,0,'merchant',2),(61,'Android','e4Wwou44XZQ:APA91bHaN7CRy8N4ZLb3UyfkU1QSa6jSYYk0jR3ZvfBEY-NcVrinnu2GKA6A9TgB0geG3S_Taav3WU7nLa9FZJKoiaCFE4QfdFtVUjCPjdMnlVASp7uRAJAAsQfXgNHwR9qg8U_Cf6Dm','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":2984862177722942411,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608802424210%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 19:00:02','2019-10-20 19:00:02','35.198.24.213',2,0,'merchant',2),(62,'Android','fMzO2lL7ZL4:APA91bFCy2pFjEUac-1DfPwVacImKk8IuwdwiTJAwgw_m8mgKcrBpauJC0iJzsfwQon7pnHVVJQ4x_s13wktw-ZyDqEcEANVQ17pPSsosnERHSdqoYowpAJYod_F3CbUo4-BEdZqO_mf','CANCEL TASK','','task','CANCEL_TASK','Caught exception:NotRegistered\n','',66,6,100028,'2019-10-20 19:01:01','2019-10-20 19:02:02','35.198.24.213',2,0,'merchant',2),(63,'Android','e4Wwou44XZQ:APA91bHaN7CRy8N4ZLb3UyfkU1QSa6jSYYk0jR3ZvfBEY-NcVrinnu2GKA6A9TgB0geG3S_Taav3WU7nLa9FZJKoiaCFE4QfdFtVUjCPjdMnlVASp7uRAJAAsQfXgNHwR9qg8U_Cf6Dm','CANCEL TASK','','task','CANCEL_TASK','process','{\"multicast_id\":4686007982476264150,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608922289820%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 19:01:01','2019-10-20 19:02:02','35.198.24.213',2,0,'merchant',2),(64,'Android','e4Wwou44XZQ:APA91bHaN7CRy8N4ZLb3UyfkU1QSa6jSYYk0jR3ZvfBEY-NcVrinnu2GKA6A9TgB0geG3S_Taav3WU7nLa9FZJKoiaCFE4QfdFtVUjCPjdMnlVASp7uRAJAAsQfXgNHwR9qg8U_Cf6Dm','ASSIGN TASK','','task','ASSIGN_TASK','process','{\"multicast_id\":7994659467857062939,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571608981704908%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 19:03:01','2019-10-20 19:03:01','35.198.24.213',2,0,'merchant',2),(65,'Android','e4Wwou44XZQ:APA91bHaN7CRy8N4ZLb3UyfkU1QSa6jSYYk0jR3ZvfBEY-NcVrinnu2GKA6A9TgB0geG3S_Taav3WU7nLa9FZJKoiaCFE4QfdFtVUjCPjdMnlVASp7uRAJAAsQfXgNHwR9qg8U_Cf6Dm','CANCEL TASK','','task','CANCEL_TASK','process','{\"multicast_id\":5949733349078935252,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571609101484922%a84e0122f9fd7ecd\"}]}',66,9,100028,'2019-10-20 19:04:02','2019-10-20 19:05:01','35.198.24.213',2,0,'merchant',2);
/*!40000 ALTER TABLE `mt_driver_pushlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver_sms_logs`
--

DROP TABLE IF EXISTS `mt_driver_sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_sms_logs` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(100) DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  `contact_phone` varchar(50) NOT NULL DEFAULT '',
  `sms_message` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `gateway_response` varchar(255) NOT NULL DEFAULT '',
  `gateway` varchar(100) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_type` (`user_type`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_sms_logs`
--

LOCK TABLES `mt_driver_sms_logs` WRITE;
/*!40000 ALTER TABLE `mt_driver_sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_driver_sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver_task`
--

DROP TABLE IF EXISTS `mt_driver_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_task` (
  `task_id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `user_type` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  `task_description` varchar(255) NOT NULL DEFAULT '',
  `trans_type` varchar(255) NOT NULL DEFAULT '',
  `contact_number` varchar(50) NOT NULL DEFAULT '',
  `email_address` varchar(200) NOT NULL DEFAULT '',
  `customer_name` varchar(255) NOT NULL DEFAULT '',
  `delivery_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_address` varchar(255) NOT NULL DEFAULT '',
  `team_id` int(14) NOT NULL DEFAULT '0',
  `driver_id` int(14) NOT NULL DEFAULT '0',
  `task_lat` varchar(50) NOT NULL DEFAULT '',
  `task_lng` varchar(50) NOT NULL DEFAULT '',
  `customer_signature` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'unassigned',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `auto_assign_type` varchar(50) NOT NULL DEFAULT '',
  `assign_started` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assignment_status` varchar(255) NOT NULL DEFAULT '',
  `dropoff_merchant` int(14) NOT NULL DEFAULT '0',
  `dropoff_contact_name` varchar(255) NOT NULL DEFAULT '',
  `dropoff_contact_number` varchar(20) NOT NULL DEFAULT '',
  `drop_address` varchar(255) NOT NULL DEFAULT '',
  `dropoff_lat` varchar(30) NOT NULL DEFAULT '',
  `dropoff_lng` varchar(30) NOT NULL DEFAULT '',
  `recipient_name` varchar(255) NOT NULL DEFAULT '',
  `critical` int(14) NOT NULL DEFAULT '1',
  PRIMARY KEY (`task_id`),
  KEY `order_id` (`order_id`),
  KEY `user_type` (`user_type`),
  KEY `user_id` (`user_id`),
  KEY `team_id` (`team_id`),
  KEY `driver_id` (`driver_id`),
  KEY `critical` (`critical`)
) ENGINE=InnoDB AUTO_INCREMENT=100033 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_task`
--

LOCK TABLES `mt_driver_task` WRITE;
/*!40000 ALTER TABLE `mt_driver_task` DISABLE KEYS */;
INSERT INTO `mt_driver_task` VALUES (100000,3,'merchant',1,'','delivery','+551122334455','alexorbit@gmail.com','alex cliente','2019-10-01 23:25:00','rua campos sales, 215 santo andre sp 09015-200 Brazil',1,1,'-27.300744','-50.567118','signature_100000-60466676436.png','successful','2019-10-01 22:25:51','2019-10-01 22:27:18','179.193.165.233','none','2019-10-02 01:25:52','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',1),(100001,4,'merchant',1,'','delivery','+5522334455','alex@gmail.com','alex cliente2','2019-10-01 23:28:00','Av. Portugal, 894 Santo André São Paulo 09040 Brazil',1,1,'-23.676262','-46.459796','signature_100001-65292307899.png','successful','2019-10-01 22:29:42','2019-10-01 22:37:08','179.193.165.233','none','2019-10-02 01:29:43','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',1),(100002,5,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-01 23:34:00','Deputado Cássio Ciampolini, 127 São Paulo São Paulo 02471130 Brazil',1,2,'-23.4825173','-46.6499973','','successful','2019-10-01 22:37:49','2019-10-01 22:40:03','201.95.66.116','none','2019-10-02 01:37:50','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',1),(100003,18,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 00:00:00','Deputado Cássio Ciampolini, 127 São Paulo São Paulo 02471130 Brazil',1,2,'-23.482695','-46.650453','','successful','2019-10-02 23:03:24','2019-10-02 23:09:12','187.101.170.169','','2019-10-03 02:03:24','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100004,19,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 00:11:00','Deputado Cássio Ciampolini, 127 São Paulo São Paulo 02471130 Brazil',1,2,'-23.482695','-46.650453','','successful','2019-10-02 23:13:14','2019-10-02 23:13:49','187.101.170.169','','2019-10-03 02:13:14','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100005,20,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 00:14:00','Deputado Cássio Ciampolini, 127 São Paulo São Paulo 02471139 Brazil',1,2,'-23.482695','-46.650453','','successful','2019-10-02 23:15:20','2019-10-02 23:16:33','187.101.170.169','','2019-10-03 02:15:21','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100006,21,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 00:30:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-02 23:31:43','2019-10-02 23:39:10','187.101.170.169','','2019-10-03 02:31:43','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100007,22,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 21:24:00','Rua deputado Cássio ciampolini,127 São Paulo Sp 02471130 Brazil',1,2,'-23.482695','-46.650453','','successful','2019-10-03 22:07:30','2019-10-03 22:23:20','187.101.170.169','none','2019-10-04 01:07:30','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100008,23,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 23:19:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-03 22:21:20','2019-10-03 22:21:43','187.101.170.169','','2019-10-04 01:21:20','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100009,24,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 23:24:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-03 22:25:22','2019-10-03 22:25:34','187.101.170.169','','2019-10-04 01:25:22','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100010,25,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 23:26:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-03 22:26:52','2019-10-04 21:12:01','187.101.170.169','none','2019-10-04 01:26:52','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100011,32,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-03 23:45:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-03 22:46:10','2019-10-03 22:46:25','187.101.170.169','','2019-10-04 01:46:10','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100012,38,'merchant',1,'','delivery','+55183736','joao@gmail.com','Joao Doe','2019-10-04 11:04:00','Capuava Santo André São Paulo 09251 Brazil',1,1,'-23.641625','-46.540822','','successful','2019-10-04 10:08:09','2019-10-04 10:33:57','187.116.108.144','none','2019-10-04 13:08:09','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100013,39,'merchant',1,'','delivery','+55183736','joao@gmail.com','Joao Doe','2019-10-04 11:06:00','Capuava Santo André São Paulo 09251 Brazil',1,1,'-23.641625','-46.540822','','successful','2019-10-04 10:10:31','2019-10-04 10:29:37','187.116.108.144','none','2019-10-04 13:10:31','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100014,40,'merchant',1,'','delivery','+55183736','joao@gmail.com','Joao Doe','2019-10-04 11:10:00','Capuava Santo André São Paulo 09251 Brazil',1,1,'-23.641625','-46.540822','','successful','2019-10-04 10:23:42','2019-10-04 10:33:49','187.116.108.144','none','2019-10-04 13:23:42','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100015,41,'merchant',1,'','delivery','+5522334455','alex@gmail.com','alex cliente2','2019-10-04 11:50:00','Capuava Santo André São Paulo 09251 Brazil',1,1,'-23.641625','-46.540822','signature_100015-63710380936.png','successful','2019-10-04 10:51:09','2019-10-04 11:04:15','187.116.108.144','none','2019-10-04 13:51:09','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100016,42,'merchant',1,'','delivery','+5522334455','alex@gmail.com','alex cliente2','2019-10-04 12:19:00','Sapopemba Santo André São Paulo 09251 Brazil',1,2,'-23.641625','-46.540822','','successful','2019-10-04 11:20:24','2019-10-04 21:13:01','187.101.170.169','none','2019-10-04 14:20:25','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100017,44,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-04 21:53:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-04 21:12:38','2019-10-04 21:13:31','187.101.170.169','none','2019-10-05 00:12:38','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100018,47,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-04 22:14:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-04 21:15:41','2019-10-04 21:16:30','187.101.170.169','none','2019-10-05 00:15:41','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100019,48,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-05 00:30:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-04 23:32:59','2019-10-05 23:22:16','187.101.170.169','none','2019-10-05 02:32:59','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100020,51,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-05 22:58:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-05 22:14:01','2019-10-05 23:22:08','187.101.170.169','none','2019-10-06 01:14:01','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100021,50,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-05 19:59:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-05 22:14:22','2019-10-05 23:21:50','187.101.170.169','none','2019-10-06 01:14:22','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100022,52,'merchant',2,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-06 00:11:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',0,0,'-23.482252','-46.649387','','unassigned','2019-10-05 23:17:00','2019-10-06 02:17:00','187.101.170.169','none','2019-10-06 02:17:00','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100023,53,'merchant',1,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-05 23:26:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-05 23:27:07','2019-10-05 23:30:59','187.101.170.169','none','2019-10-06 02:27:07','',1,'Joao','5511956565656','Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001','-23.483733','-46.643623','',2),(100024,54,'merchant',2,'','delivery','+5511988888888','ipaonp@gmail.com','Yassu Teste ','2019-10-05 23:27:00','Rua deputado Cássio ciampolini São Paulo Sp 02471130 Brazil',1,2,'-23.482252','-46.649387','','successful','2019-10-05 23:28:04','2019-10-05 23:30:52','187.101.170.169','none','2019-10-06 02:28:04','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100025,64,'merchant',2,'','delivery','+5511957702025','sayuri.takara@hotmail.com','Midori Takara','2019-10-20 10:45:00','Avenida Imirim, 1895  São Paulo - São Paulo SP 02465-200 Brazil',2,4,'-23.489839','-46.65087','','successful','2019-10-20 10:45:30','2019-10-20 10:52:04','189.79.85.100','none','2019-10-20 13:45:30','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100026,63,'merchant',2,'','delivery','+5511957702025','sayuri.takara@hotmail.com','Midori Takara','2019-10-20 10:46:00','Avenida Imirim, 1895  São Paulo - São Paulo SP 02465-200 Brazil',2,4,'-23.489839','-46.65087','','successful','2019-10-20 10:46:29','2019-10-20 10:50:45','189.79.85.100','none','2019-10-20 13:46:29','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100027,65,'merchant',2,'','delivery','+5511957702025','sayuri.takara@hotmail.com','Midori Takara','2019-10-20 11:55:00','Avenida Imirim, 1895  São Paulo - São Paulo SP 02465-200 Brazil',2,4,'-23.489839','-46.65087','','cancelled','2019-10-20 11:55:21','2019-10-20 14:55:21','189.79.85.100','send_to_all','2019-10-20 11:55:01','waiting for driver acknowledgement',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100028,66,'merchant',2,'','delivery','+5511957702025','sayuri.takara@hotmail.com','Midori Takara','2019-10-20 18:52:00','Avenida Imirim, 1895  São Paulo - São Paulo SP 02465-200 Brazil',2,5,'-23.489839','-46.65087','','assigned','2019-10-20 18:52:21','2019-10-20 19:04:24','189.79.85.100','','2019-10-20 19:03:02','waiting for driver acknowledgement',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100029,67,'merchant',2,'','delivery','+5511957702025','sayuri.takara@hotmail.com','Midori Takara','2019-10-20 19:27:00','Avenida Imirim, 1895  São Paulo - São Paulo SP 02465-200 Brazil',2,5,'-23.489839','-46.65087','','assigned','2019-10-20 19:27:19','2019-10-20 19:43:25','189.79.85.100','none','2019-10-20 22:27:19','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100030,72,'merchant',2,'','delivery','+5511957702023','1sayuri.takara@hotmail.com','Cristiane Takara','2019-10-21 19:58:00','Rua george chahestian 11 apto 123 São Paulo São Paulo 02471 Brazil',0,0,'-23.481388','-46.649187','','unassigned','2019-10-21 21:59:16','2019-10-22 00:59:16','189.79.85.100','none','2019-10-22 00:59:16','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100031,71,'merchant',2,'','delivery','+5511957702023','1sayuri.takara@hotmail.com','Cristiane Takara','2019-10-21 19:55:00','Rua george chahestian 11 apto 123 São Paulo São Paulo 02471 Brazil',0,0,'-23.4816756','-46.6490987','','unassigned','2019-10-21 21:59:26','2019-10-22 00:59:26','189.79.85.100','none','2019-10-22 00:59:26','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2),(100032,70,'merchant',2,'','delivery','+5511957702023','1sayuri.takara@hotmail.com','Cristiane Takara','2019-10-21 19:50:00','Rua george chahestian 11 apto 123 São Paulo São Paulo 02471120 Brazil',0,0,'-23.4816835','-46.6490906','','unassigned','2019-10-21 21:59:32','2019-10-22 00:59:32','189.79.85.100','none','2019-10-22 00:59:32','',2,'ROGÉRIO','(11) 2236-6000','Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000','-23.486835','-46.642512','',2);
/*!40000 ALTER TABLE `mt_driver_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver_task_photo`
--

DROP TABLE IF EXISTS `mt_driver_task_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_task_photo` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `task_id` int(14) NOT NULL DEFAULT '0',
  `photo_name` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_task_photo`
--

LOCK TABLES `mt_driver_task_photo` WRITE;
/*!40000 ALTER TABLE `mt_driver_task_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_driver_task_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mt_driver_task_view`
--

DROP TABLE IF EXISTS `mt_driver_task_view`;
/*!50001 DROP VIEW IF EXISTS `mt_driver_task_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mt_driver_task_view` AS SELECT 
 1 AS `task_id`,
 1 AS `order_id`,
 1 AS `user_type`,
 1 AS `user_id`,
 1 AS `task_description`,
 1 AS `trans_type`,
 1 AS `contact_number`,
 1 AS `email_address`,
 1 AS `customer_name`,
 1 AS `delivery_date`,
 1 AS `delivery_address`,
 1 AS `team_id`,
 1 AS `driver_id`,
 1 AS `task_lat`,
 1 AS `task_lng`,
 1 AS `customer_signature`,
 1 AS `status`,
 1 AS `date_created`,
 1 AS `date_modified`,
 1 AS `ip_address`,
 1 AS `auto_assign_type`,
 1 AS `assign_started`,
 1 AS `assignment_status`,
 1 AS `dropoff_merchant`,
 1 AS `dropoff_contact_name`,
 1 AS `dropoff_contact_number`,
 1 AS `drop_address`,
 1 AS `dropoff_lat`,
 1 AS `dropoff_lng`,
 1 AS `recipient_name`,
 1 AS `critical`,
 1 AS `driver_name`,
 1 AS `device_id`,
 1 AS `driver_phone`,
 1 AS `driver_email`,
 1 AS `device_platform`,
 1 AS `enabled_push`,
 1 AS `driver_lat`,
 1 AS `driver_lng`,
 1 AS `merchant_id`,
 1 AS `merchant_name`,
 1 AS `merchant_address`,
 1 AS `team_name`,
 1 AS `sub_total`,
 1 AS `total_w_tax`,
 1 AS `delivery_charge`,
 1 AS `payment_type`,
 1 AS `order_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mt_driver_team`
--

DROP TABLE IF EXISTS `mt_driver_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_team` (
  `team_id` int(14) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  `team_name` varchar(255) NOT NULL DEFAULT '',
  `location_accuracy` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`team_id`),
  KEY `user_type` (`user_type`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_team`
--

LOCK TABLES `mt_driver_team` WRITE;
/*!40000 ALTER TABLE `mt_driver_team` DISABLE KEYS */;
INSERT INTO `mt_driver_team` VALUES (1,'admin',1,'Time 1','high','publish','2019-10-01 17:52:30','2019-10-17 21:51:55','189.79.85.100'),(2,'merchant',2,'PANETERIAZN','low','publish','2019-10-20 10:49:56','2019-10-20 10:50:20','189.79.85.100');
/*!40000 ALTER TABLE `mt_driver_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_driver_track_location`
--

DROP TABLE IF EXISTS `mt_driver_track_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_driver_track_location` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  `driver_id` int(14) NOT NULL DEFAULT '0',
  `latitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `longitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `altitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `accuracy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `altitudeAccuracy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `heading` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `speed` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `track_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `device_platform` varchar(50) NOT NULL DEFAULT 'Android',
  `date_log` date DEFAULT NULL,
  `full_request` text,
  PRIMARY KEY (`id`),
  KEY `user_type` (`user_type`),
  KEY `user_id` (`user_id`),
  KEY `driver_id` (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_driver_track_location`
--

LOCK TABLES `mt_driver_track_location` WRITE;
/*!40000 ALTER TABLE `mt_driver_track_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_driver_track_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_email_logs`
--

DROP TABLE IF EXISTS `mt_email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_email_logs` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `status` varchar(200) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `module_type` varchar(255) NOT NULL DEFAULT '',
  `user_type` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(14) NOT NULL DEFAULT '0',
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `email_provider` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_type` (`user_type`),
  KEY `merchant_id` (`merchant_id`),
  KEY `module_type` (`module_type`),
  KEY `email_address` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_email_logs`
--

LOCK TABLES `mt_email_logs` WRITE;
/*!40000 ALTER TABLE `mt_email_logs` DISABLE KEYS */;
INSERT INTO `mt_email_logs` VALUES (1,'marcio.yassu@gmail.com','','Welcome Taba Paes','hi  Taba Paes\n\nThank you for joining us!\n\nLogin here\nhttps://ipaoo.com.br/merchant\n\nRegards\n - ipaoo','error occurred','2019-10-01 17:51:29','35.198.24.213','core','',0,0,''),(2,'alexorbit@gmail.com','','Welcome alex','hi alex<br />\n<br />\nthank you for signup <br />\n<br />\nRegards<br />\n- ipaoo','error occurred','2019-10-01 22:19:06','201.95.66.116','core','',0,0,''),(3,'alexorbit@gmail.com','','Your Receipt for Order ID : 3','Dear alex cliente,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 3. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>alex cliente</td></tr><tr><td>Estabelecimento</td><td>Taba Paes</td></tr><tr><td>Telefone</td><td>5511989895695</td></tr><tr><td>Endereco</td><td>Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>COD</td></tr><tr><td>N# Referencia</td><td>3</td></tr><tr><td>Data transacao</td><td>01 Out, 2019 10:25:33 pm</td></tr><tr><td>Data de entrega</td><td>01 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>rua campos sales, 215  santo andre sp 09015-200</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td>113</td></tr><tr><td>Numero de contato</td><td>+551122334455</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>4 Pao de Leite<p>small</p></td><td>R$ 4.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 4.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 0.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 4.00</td></tr>		\n		</table>\n		\n\nKind Regards','error occurred','2019-10-01 22:25:33','35.198.24.213','core','',0,0,''),(4,'alex@gmail.com','','','','error occurred','2019-10-01 22:29:15','35.198.24.213','core','',0,0,''),(5,'ipaonp@gmail.com','','','','error occurred','2019-10-01 22:36:26','35.198.24.213','core','',0,0,''),(6,'ipaonp@gmail.com','','','','error occurred','2019-10-02 23:01:12','35.198.24.213','core','',0,0,''),(7,'ipaonp@gmail.com','','','','error occurred','2019-10-02 23:12:14','35.198.24.213','core','',0,0,''),(8,'ipaonp@gmail.com','','','','error occurred','2019-10-02 23:14:52','35.198.24.213','core','',0,0,''),(9,'ipaonp@gmail.com','','','','error occurred','2019-10-02 23:31:10','35.198.24.213','core','',0,0,''),(10,'ipaonp@gmail.com','','','','error occurred','2019-10-03 20:25:23','35.198.24.213','core','',0,0,''),(11,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:19:58','35.198.24.213','core','',0,0,''),(12,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:25:04','35.198.24.213','core','',0,0,''),(13,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:26:32','35.198.24.213','core','',0,0,''),(14,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:40:51','35.198.24.213','core','',0,0,''),(15,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:40:51','35.198.24.213','core','',0,0,''),(16,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:45:48','35.198.24.213','core','',0,0,''),(17,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:45:48','35.198.24.213','core','',0,0,''),(18,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:50:13','35.198.24.213','core','',0,0,''),(19,'ipaonp@gmail.com','','','','error occurred','2019-10-03 22:50:13','35.198.24.213','core','',0,0,''),(20,'joao@gmail.com','','','','error occurred','2019-10-04 10:05:52','35.198.24.213','core','',0,0,''),(21,'joao@gmail.com','','','','error occurred','2019-10-04 10:10:16','35.198.24.213','core','',0,0,''),(22,'joao@gmail.com','','','','error occurred','2019-10-04 10:19:15','35.198.24.213','core','',0,0,''),(23,'alex@gmail.com','','','','error occurred','2019-10-04 10:50:39','35.198.24.213','core','',0,0,''),(24,'alex@gmail.com','','','','error occurred','2019-10-04 11:20:11','35.198.24.213','core','',0,0,''),(25,'ipaonp@gmail.com','','','','error occurred','2019-10-04 20:47:13','35.198.24.213','core','',0,0,''),(26,'ipaonp@gmail.com','','','','error occurred','2019-10-04 20:55:52','35.198.24.213','core','',0,0,''),(27,'ipaonp@gmail.com','','','','error occurred','2019-10-04 21:14:25','35.198.24.213','core','',0,0,''),(28,'my_takara@yahoo.com.br','','Welcome PANETTERIA ZN','hi  PANETTERIA ZN\n\nThank you for joining us!\n\nLogin here\nhttps://ipaoo.com.br/merchant\n\nRegards\n - ipaoo','error occurred','2019-10-04 21:29:02','35.198.24.213','core','',0,0,''),(29,'marcio.yassu@gmail.com','',' Sua solicitação de retirada foi recebida','<p>Olá m,</p><br><p>Estamos apenas informando que recebemos sua solicitação para o pagamento de 14.00 via bank para </p>Você pode cancelar esta solicitação a qualquer momento antes de October 09 2019 aqui:<p>https://ipaoo.com.br/store/cancelwithdrawal/id/67af9a781abb50c7843c9f8ebb16cf77</p><p>Concluiremos esta solicitação na October 11 2019 (or the next business day), mas pode levar até sete dias para aparecer em sua conta. Um segundo e-mail de confirmação será enviado no momento.</p><br><p> Atenciosamente,</p><p>iPaoo</p><p><br></p>','error occurred','2019-10-04 23:14:14','187.101.170.169','core','',0,0,''),(30,'ipaonp@gmail.com','','','','error occurred','2019-10-04 23:31:04','35.198.24.213','core','',0,0,''),(31,'marcio.yassu@gmail.com','',' Sua solicitação de retirada foi recebida','<p>Olá m,</p><br><p>Estamos apenas informando que recebemos sua solicitação para o pagamento de 7.00 via bank para </p>Você pode cancelar esta solicitação a qualquer momento antes de October 09 2019 aqui:<p>https://ipaoo.com.br/store/cancelwithdrawal/id/5bd3fdaa7942abf787162cb62abad384</p><p>Concluiremos esta solicitação na October 11 2019 (or the next business day), mas pode levar até sete dias para aparecer em sua conta. Um segundo e-mail de confirmação será enviado no momento.</p><br><p> Atenciosamente,</p><p>iPaoo</p><p><br></p>','error occurred','2019-10-04 23:38:34','187.101.170.169','core','',0,0,''),(32,'marcio.yassu@gmail.com','administrador@ipaoo.com.br','This is a test email','This is a test email','sent','2019-10-05 00:23:32','187.101.170.169','core','',0,0,'smtp'),(33,'ipaonp@gmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-05 19:00:24','35.198.24.213','core','',0,0,'smtp'),(34,'ipaonp@gmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-05 22:05:41','35.198.24.213','core','',0,0,'smtp'),(35,'marcio.yassu@gmail.com','administrador@ipaoo.com.br',' Sua solicitação de retirada foi recebida','<p>Olá m,</p><br><p>Estamos apenas informando que recebemos sua solicitação para o pagamento de 4.20 via bank para </p>Você pode cancelar esta solicitação a qualquer momento antes de October 10 2019 aqui:<p>https://ipaoo.com.br/store/cancelwithdrawal/id/d262f4482e227dc8fa9c343613c6e7c5</p><p>Concluiremos esta solicitação na October 12 2019 (or the next business day), mas pode levar até sete dias para aparecer em sua conta. Um segundo e-mail de confirmação será enviado no momento.</p><br><p> Atenciosamente,</p><p>iPaoo</p><p><br></p>','sent','2019-10-05 22:30:26','187.101.170.169','core','',0,0,'smtp'),(36,'ipaonp@gmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-05 23:13:43','35.198.24.213','core','',0,0,'smtp'),(37,'ipaonp@gmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-05 23:26:37','35.198.24.213','core','',0,0,'smtp'),(38,'ipaonp@gmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-05 23:27:40','35.198.24.213','core','',0,0,'smtp'),(39,'yassu','administrador@ipaoo.com.br','Welcome Yassunoria','hi Yassunoria<br />\n<br />\nthank you for signup <br />\n<br />\nRegards<br />\n- ipaoo','error occurred You must provide at least one recipient email address.','2019-10-07 22:48:25','187.101.170.169','core','',0,0,'smtp'),(40,'yassu','administrador@ipaoo.com.br','Your Receipt for Order ID : 55','Dear Yassunoria Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 55. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Yassunoria Takara</td></tr><tr><td>Estabelecimento</td><td>Taba Paes</td></tr><tr><td>Telefone</td><td>5511989895695</td></tr><tr><td>Endereco</td><td>Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>COD</td></tr><tr><td>N# Referencia</td><td>55</td></tr><tr><td>Data transacao</td><td>07 Out, 2019 10:50:14 pm</td></tr><tr><td>Data de entrega</td><td>07 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Engeheiro Caetano Alvares, 123  São Paulo SP 02546-000</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511970960399</td></tr><tr><td>Troco</td><td>20.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>3 Pao de Leite<p>small</p></td><td>R$ 3.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 3.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 0.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 3.00</td></tr>		\n		</table>\n		\n\nKind Regards','error occurred You must provide at least one recipient email address.','2019-10-07 22:50:14','35.198.24.213','core','',0,0,'smtp'),(41,'Antonio','administrador@ipaoo.com.br','Welcome Antonio','hi Antonio<br />\n<br />\nthank you for signup <br />\n<br />\nRegards<br />\n- ipaoo','error occurred You must provide at least one recipient email address.','2019-10-20 08:33:29','189.79.85.100','core','',0,0,'smtp'),(42,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 58','Dear Sayuri Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 58. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Sayuri Takara</td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>PYR</td></tr><tr><td>Card#</td><td>VISA DEBITO</td></tr><tr><td>N# Referencia</td><td>58</td></tr><tr><td>Data transacao</td><td>20 Out, 2019 9:26:32 am</td></tr><tr><td>Data de entrega</td><td>20 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Rua Deputado Cassio Ciampolini 266   São Paulo - São Paulo SP 02471130</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511957702023</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 5.00</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>2 Mortandela Marba<p>medium</p></td><td>R$ 4.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 9.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 13.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-20 09:26:33','35.198.24.213','core','',0,0,'smtp'),(43,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 59','Dear Sayuri Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 59. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Sayuri Takara</td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>PYR</td></tr><tr><td>Card#</td><td>ELLO DEBITO</td></tr><tr><td>N# Referencia</td><td>59</td></tr><tr><td>Data transacao</td><td>20 Out, 2019 9:33:36 am</td></tr><tr><td>Data de entrega</td><td>20 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Rua Deputado Cassio Ciampolini 266   São Paulo - São Paulo SP 02471130</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511957702023</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>2 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 10.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 10.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 14.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-20 09:33:36','35.198.24.213','core','',0,0,'smtp'),(44,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 63','Dear Midori Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 63. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Midori Takara</td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>COD</td></tr><tr><td>N# Referencia</td><td>63</td></tr><tr><td>Data transacao</td><td>20 Out, 2019 10:17:45 am</td></tr><tr><td>Data de entrega</td><td>20 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Avenida Imirim, 1895   São Paulo - São Paulo SP 02465-200</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511957702025</td></tr><tr><td>Troco</td><td>10.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 5.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 5.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 9.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-20 10:17:45','35.198.24.213','core','',0,0,'smtp'),(45,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 64','Dear Midori Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 64. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Midori Takara</td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>COD</td></tr><tr><td>N# Referencia</td><td>64</td></tr><tr><td>Data transacao</td><td>20 Out, 2019 10:23:50 am</td></tr><tr><td>Data de entrega</td><td>20 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Avenida Imirim, 1895   São Paulo - São Paulo SP 02465-200</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511957702025</td></tr><tr><td>Troco</td><td>20.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 5.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 5.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 9.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-20 10:23:51','35.198.24.213','core','',0,0,'smtp'),(46,'my_takara@yahoo.com.br','administrador@ipaoo.com.br',' Sua solicitação de retirada foi recebida','<p>Olá m,</p><br><p>Estamos apenas informando que recebemos sua solicitação para o pagamento de 18.00 via bank para </p>Você pode cancelar esta solicitação a qualquer momento antes de October 25 2019 aqui:<p>https://ipaoo.com.br/store/cancelwithdrawal/id/73eb0940d740521880e5808d96671db7</p><p>Concluiremos esta solicitação na October 27 2019 (or the next business day), mas pode levar até sete dias para aparecer em sua conta. Um segundo e-mail de confirmação será enviado no momento.</p><br><p> Atenciosamente,</p><p>iPaoo</p><p><br></p>','sent','2019-10-20 11:36:25','189.79.85.100','core','',0,0,'smtp'),(47,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 65','Dear Midori Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 65. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Midori Takara</td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>PYR</td></tr><tr><td>Card#</td><td>ELLO DEBITO</td></tr><tr><td>N# Referencia</td><td>65</td></tr><tr><td>Data transacao</td><td>20 Out, 2019 11:49:52 am</td></tr><tr><td>Data de entrega</td><td>20 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Avenida Imirim, 1895   São Paulo - São Paulo SP 02465-200</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511957702025</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 5.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 5.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 9.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-20 11:49:52','35.198.24.213','core','',0,0,'smtp'),(48,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 66','Dear Midori Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 66. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Midori Takara</td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>PYR</td></tr><tr><td>Card#</td><td>MASTERCARD CRéDITO</td></tr><tr><td>N# Referencia</td><td>66</td></tr><tr><td>Data transacao</td><td>20 Out, 2019 6:46:20 pm</td></tr><tr><td>Data de entrega</td><td>20 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Avenida Imirim, 1895   São Paulo - São Paulo SP 02465-200</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511957702025</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 5.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 5.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 9.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-20 18:46:20','35.198.24.213','core','',0,0,'smtp'),(49,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 67','Dear Midori Takara,\n\n\nThank you for shopping at ipaoo. We hope you enjoy your new purchase! Your order number is 67. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Midori Takara</td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>PYR</td></tr><tr><td>Card#</td><td>MASTERCARD CRéDITO</td></tr><tr><td>N# Referencia</td><td>67</td></tr><tr><td>Data transacao</td><td>20 Out, 2019 7:26:53 pm</td></tr><tr><td>Data de entrega</td><td>20 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Avenida Imirim, 1895   São Paulo - São Paulo SP 02465-200</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511957702025</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 5.00</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Bolo de Chocolate<p>large</p></td><td>R$ 6.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 11.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 15.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-20 19:26:53','35.198.24.213','core','',0,0,'smtp'),(50,'marcio.k@gmail.com','administrador@ipaoo.com.br','Welcome PADARIA','hi  PADARIA\n\nThank you for joining us!\n\nLogin here\nhttps://ipaoo.com.br/merchant\n\nRegards\n - ipaoo','sent','2019-10-20 20:21:16','35.198.24.213','core','',0,0,'smtp'),(51,'my_takara@yahoo.com.br','administrador@ipaoo.com.br','Your Receipt for Order ID : 68','Dear Marcio Takara,\n\n\nThank you for shopping at iPaoo. We hope you enjoy your new purchase! Your order number is 68. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Marcio Takara</td></tr><tr><td>Estabelecimento</td><td>Taba Paes</td></tr><tr><td>Telefone</td><td>5511989895695</td></tr><tr><td>Endereco</td><td>Conselheiro Moreira de Barros, 2850 São Paulo SP 02430-001</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>PYR</td></tr><tr><td>Card#</td><td>VISA DEBITO</td></tr><tr><td>N# Referencia</td><td>68</td></tr><tr><td>Data transacao</td><td>21 Out, 2019 12:20:34 am</td></tr><tr><td>Data de entrega</td><td>21 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Rua Deputado Cassio Ciampolini 266   São Paulo - São Paulo  02471 </td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511958585858</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>1 Pao de Leite<p>small</p></td><td>R$ 1.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 1.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 0.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 1.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-21 00:20:34','35.198.24.213','core','',0,0,'smtp'),(52,'sayuri.takara@hotmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-21 06:38:19','35.198.24.213','core','',0,0,'smtp'),(53,'1sayuri.takara@hotmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-21 19:52:28','35.198.24.213','core','',0,0,'smtp'),(54,'1sayuri.takara@hotmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-21 19:56:34','35.198.24.213','core','',0,0,'smtp'),(55,'1sayuri.takara@hotmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-21 19:58:44','35.198.24.213','core','',0,0,'smtp'),(56,'ipaonp@gmail.com','administrador@ipaoo.com.br','Your Receipt for Order ID : 73','Dear Yassu Teste ,\n\n\nThank you for shopping at iPaoo. We hope you enjoy your new purchase! Your order number is 73. We have included your order receipt and delivery details below:\n\n		<!--<div style=\"display: block;max-height: 70px;max-width: 200px;\">-->\n				<!--</div>-->\n		<table border=\"0\">\n		<tr><td>Nome do Cliente</td><td>Yassu Teste </td></tr><tr><td>Estabelecimento</td><td>PANETTERIA ZN</td></tr><tr><td>Telefone</td><td>(11) 2236-6000</td></tr><tr><td>Endereco</td><td>Av. Eng. Caetano Álvares, 4740 São Paulo SP  02413-000</td></tr><tr><td>Transacao</td><td>delivery</td></tr><tr><td>Pagamento</td><td>PYR</td></tr><tr><td>Card#</td><td>ELLO DEBITO</td></tr><tr><td>N# Referencia</td><td>73</td></tr><tr><td>Data transacao</td><td>21 Out, 2019 10:58:52 pm</td></tr><tr><td>Data de entrega</td><td>21 Out, 2019</td></tr><tr><td>Entregar agora?</td><td>Sim</td></tr><tr><td>Entregar para</td><td>Rua deputado Cássio ciampolini  São Paulo Sp 02471130</td></tr><tr><td>Instrucoes de entrega</td><td></td></tr><tr><td>nome do local</td><td></td></tr><tr><td>Numero de contato</td><td>+5511988888888</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>18 Leite de Caixinha Tipo A<p>medium</p></td><td>R$ 90.00</td></tr><tr><td colspan=\"2\"><b></td></b></tr><tr><td>5 Bolo de Chocolate<p>medium</p></td><td>R$ 30.00</td></tr><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>Sub Total:</td><td>R$ 120.00</td></tr><tr><td>Taxa de entrega:</td><td>R$ 4.00</td></tr><tr><td>imposto 0.0000%</td><td>-</td></tr><tr><td>Total:</td><td>R$ 124.00</td></tr>		\n		</table>\n		\n\nKind Regards','sent','2019-10-21 22:58:52','35.198.24.213','core','',0,0,'smtp'),(57,'marcio.yassu@gmail.com','administrador@ipaoo.com.br','','','error occurred Message body empty','2019-10-21 23:23:46','35.198.24.213','core','',0,0,'smtp');
/*!40000 ALTER TABLE `mt_email_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_favorites`
--

DROP TABLE IF EXISTS `mt_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_favorites` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `fav_type` varchar(100) NOT NULL DEFAULT 'restaurant',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_favorites`
--

LOCK TABLES `mt_favorites` WRITE;
/*!40000 ALTER TABLE `mt_favorites` DISABLE KEYS */;
INSERT INTO `mt_favorites` VALUES (1,'restaurant',1,1,'2019-10-01 23:08:10','2019-10-02 02:08:10','201.95.66.116'),(3,'restaurant',5,1,'2019-10-07 22:48:39','2019-10-08 01:48:39','187.101.170.169');
/*!40000 ALTER TABLE `mt_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_fax_broadcast`
--

DROP TABLE IF EXISTS `mt_fax_broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_fax_broadcast` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `faxno` varchar(50) NOT NULL DEFAULT '',
  `recipname` varchar(32) NOT NULL DEFAULT '',
  `faxurl` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `jobid` varchar(255) NOT NULL DEFAULT '',
  `api_raw_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_process` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_postback` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_fax_broadcast`
--

LOCK TABLES `mt_fax_broadcast` WRITE;
/*!40000 ALTER TABLE `mt_fax_broadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_fax_broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_fax_package`
--

DROP TABLE IF EXISTS `mt_fax_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_fax_package` (
  `fax_package_id` int(14) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `price` float(14,4) NOT NULL DEFAULT '0.0000',
  `promo_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `fax_limit` int(14) NOT NULL DEFAULT '0',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`fax_package_id`),
  KEY `title` (`title`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_fax_package`
--

LOCK TABLES `mt_fax_package` WRITE;
/*!40000 ALTER TABLE `mt_fax_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_fax_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_fax_package_trans`
--

DROP TABLE IF EXISTS `mt_fax_package_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_fax_package_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `fax_package_id` int(14) NOT NULL DEFAULT '0',
  `payment_type` varchar(50) NOT NULL DEFAULT '',
  `package_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `fax_limit` int(14) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `payment_reference` varchar(255) NOT NULL DEFAULT '',
  `payment_gateway_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_fax_package_trans`
--

LOCK TABLES `mt_fax_package_trans` WRITE;
/*!40000 ALTER TABLE `mt_fax_package_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_fax_package_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_ingredients`
--

DROP TABLE IF EXISTS `mt_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_ingredients` (
  `ingredients_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `ingredients_name` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'published',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `ingredients_name_trans` text,
  PRIMARY KEY (`ingredients_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `status` (`status`),
  KEY `ingredients_name` (`ingredients_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_ingredients`
--

LOCK TABLES `mt_ingredients` WRITE;
/*!40000 ALTER TABLE `mt_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_invoice`
--

DROP TABLE IF EXISTS `mt_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_invoice` (
  `invoice_number` int(14) NOT NULL AUTO_INCREMENT,
  `invoice_token` varchar(100) NOT NULL DEFAULT '',
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `merchant_name` varchar(255) NOT NULL DEFAULT '',
  `merchant_contact_email` varchar(200) NOT NULL DEFAULT '',
  `merchant_contact_phone` varchar(50) NOT NULL DEFAULT '',
  `invoice_terms` int(14) NOT NULL DEFAULT '0',
  `invoice_total` float(14,4) NOT NULL DEFAULT '0.0000',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `pdf_filename` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `viewed` varchar(2) NOT NULL DEFAULT '2',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_process` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`invoice_number`),
  KEY `invoice_token` (`invoice_token`),
  KEY `merchant_id` (`merchant_id`),
  KEY `status` (`status`),
  KEY `date_from` (`date_from`),
  KEY `date_to` (`date_to`),
  KEY `invoice_total` (`invoice_total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_invoice`
--

LOCK TABLES `mt_invoice` WRITE;
/*!40000 ALTER TABLE `mt_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_invoice_history`
--

DROP TABLE IF EXISTS `mt_invoice_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_invoice_history` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(14) NOT NULL DEFAULT '',
  `payment_status` varchar(100) NOT NULL DEFAULT '',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `invoice_number` (`invoice_number`),
  KEY `payment_status` (`payment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_invoice_history`
--

LOCK TABLES `mt_invoice_history` WRITE;
/*!40000 ALTER TABLE `mt_invoice_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_invoice_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_item`
--

DROP TABLE IF EXISTS `mt_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_item` (
  `item_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `item_description` text,
  `status` varchar(50) NOT NULL DEFAULT '',
  `category` text,
  `price` text,
  `addon_item` text,
  `cooking_ref` text,
  `discount` varchar(14) NOT NULL DEFAULT '',
  `multi_option` text,
  `multi_option_value` text,
  `photo` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `is_featured` varchar(1) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `ingredients` text,
  `spicydish` int(2) NOT NULL DEFAULT '1',
  `two_flavors` int(2) NOT NULL,
  `two_flavors_position` text,
  `require_addon` text,
  `dish` text,
  `item_name_trans` text,
  `item_description_trans` text,
  `non_taxable` int(1) NOT NULL DEFAULT '1',
  `not_available` int(1) NOT NULL DEFAULT '1',
  `gallery_photo` text,
  `points_earned` int(14) NOT NULL DEFAULT '0',
  `points_disabled` int(1) NOT NULL DEFAULT '1',
  `packaging_fee` float(14,4) NOT NULL DEFAULT '0.0000',
  `packaging_incremental` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `item_name` (`item_name`),
  KEY `status` (`status`),
  KEY `is_featured` (`is_featured`),
  KEY `spicydish` (`spicydish`),
  KEY `two_flavors` (`two_flavors`),
  KEY `points_earned` (`points_earned`),
  KEY `points_disabled` (`points_disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_item`
--

LOCK TABLES `mt_item` WRITE;
/*!40000 ALTER TABLE `mt_item` DISABLE KEYS */;
INSERT INTO `mt_item` VALUES (1,1,'Pao de Leite','','publish','[\"1\"]','{\"1\":\"1\"}','','','','','','1569978348-pao-de-leite-condensado-3685.jpg',0,'','2019-10-01 22:06:03','2019-10-01 22:08:56','189.79.78.120','',0,0,'','','',NULL,NULL,1,1,'[\"1569978470-pao-de-leite-condensado-3685.jpg\",\"1569978501-pao-de-leite-condensado-3685.jpg\",\"1569978533-pao-de-leite-condensado-3685.jpg\"]',0,1,0.0000,0),(2,1,'Pão','','publish','[\"2\"]','{\"1\":\"1\"}','','','','','','1569978438-paes.jpg',0,'','2019-10-01 22:07:32','2019-10-02 01:07:32','189.79.78.120','',0,0,'','','',NULL,NULL,1,1,'[\"1569978442-paes.jpg\"]',0,1,0.0000,0),(3,2,'Mortandela Marba','','publish','[\"5\"]','{\"5\":\"2\"}','','','','','','1570327703-mortadela.jpg',0,'','2019-10-05 23:08:44','2019-10-06 02:08:44','187.101.170.169','',0,0,'','','',NULL,NULL,1,1,'[\"1570327707-mortadela.jpg\"]',0,1,0.0000,0),(4,2,'Leite de Caixinha Tipo A','','publish','[\"3\"]','{\"5\":\"5\"}','','','','','','1570327742-leite.jpg',0,'','2019-10-05 23:09:20','2019-10-06 02:09:20','187.101.170.169','',0,0,'','','',NULL,NULL,1,1,'[\"1570327747-leite.jpg\"]',0,1,0.0000,0),(5,2,'Bolo de Chocolate','teste','publish','[\"4\"]','{\"5\":\"6\"}','','','','','','1570327774-bolo-de-chocolate.jpg',0,'','2019-10-05 23:09:47','2019-10-21 22:49:50','189.79.85.100','',0,2,'','','',NULL,NULL,1,1,'[\"1570327777-bolo-de-chocolate.jpg\"]',0,1,0.0000,0);
/*!40000 ALTER TABLE `mt_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_languages`
--

DROP TABLE IF EXISTS `mt_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_languages` (
  `lang_id` int(14) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(14) NOT NULL DEFAULT '',
  `language_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `source_text` text,
  `is_assign` int(1) NOT NULL DEFAULT '2',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_languages`
--

LOCK TABLES `mt_languages` WRITE;
/*!40000 ALTER TABLE `mt_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_location_area`
--

DROP TABLE IF EXISTS `mt_location_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_location_area` (
  `area_id` int(14) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `city_id` int(14) NOT NULL DEFAULT '0',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`area_id`),
  KEY `city_id` (`city_id`),
  KEY `sequence` (`sequence`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_location_area`
--

LOCK TABLES `mt_location_area` WRITE;
/*!40000 ALTER TABLE `mt_location_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_location_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_location_cities`
--

DROP TABLE IF EXISTS `mt_location_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_location_cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `postal_code` varchar(255) NOT NULL DEFAULT '',
  `state_id` int(11) NOT NULL,
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`city_id`),
  KEY `postal_code` (`postal_code`),
  KEY `state_id` (`state_id`),
  KEY `sequence` (`sequence`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_location_cities`
--

LOCK TABLES `mt_location_cities` WRITE;
/*!40000 ALTER TABLE `mt_location_cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_location_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_location_countries`
--

DROP TABLE IF EXISTS `mt_location_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_location_countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `shortcode` varchar(3) NOT NULL DEFAULT '',
  `country_name` varchar(150) NOT NULL DEFAULT '',
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`country_id`),
  KEY `shortcode` (`shortcode`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_location_countries`
--

LOCK TABLES `mt_location_countries` WRITE;
/*!40000 ALTER TABLE `mt_location_countries` DISABLE KEYS */;
INSERT INTO `mt_location_countries` VALUES (1,'AF','Afghanistan',93),(2,'AL','Albania',355),(3,'DZ','Algeria',213),(4,'AS','American Samoa',1684),(5,'AD','Andorra',376),(6,'AO','Angola',244),(7,'AI','Anguilla',1264),(8,'AQ','Antarctica',0),(9,'AG','Antigua And Barbuda',1268),(10,'AR','Argentina',54),(11,'AM','Armenia',374),(12,'AW','Aruba',297),(13,'AU','Australia',61),(14,'AT','Austria',43),(15,'AZ','Azerbaijan',994),(16,'BS','Bahamas The',1242),(17,'BH','Bahrain',973),(18,'BD','Bangladesh',880),(19,'BB','Barbados',1246),(20,'BY','Belarus',375),(21,'BE','Belgium',32),(22,'BZ','Belize',501),(23,'BJ','Benin',229),(24,'BM','Bermuda',1441),(25,'BT','Bhutan',975),(26,'BO','Bolivia',591),(27,'BA','Bosnia and Herzegovina',387),(28,'BW','Botswana',267),(29,'BV','Bouvet Island',0),(30,'BR','Brazil',55),(31,'IO','British Indian Ocean Territory',246),(32,'BN','Brunei',673),(33,'BG','Bulgaria',359),(34,'BF','Burkina Faso',226),(35,'BI','Burundi',257),(36,'KH','Cambodia',855),(37,'CM','Cameroon',237),(38,'CA','Canada',1),(39,'CV','Cape Verde',238),(40,'KY','Cayman Islands',1345),(41,'CF','Central African Republic',236),(42,'TD','Chad',235),(43,'CL','Chile',56),(44,'CN','China',86),(45,'CX','Christmas Island',61),(46,'CC','Cocos (Keeling) Islands',672),(47,'CO','Colombia',57),(48,'KM','Comoros',269),(49,'CG','Congo',242),(50,'CD','Congo The Democratic Republic Of The',242),(51,'CK','Cook Islands',682),(52,'CR','Costa Rica',506),(53,'CI','Cote D\'Ivoire (Ivory Coast)',225),(54,'HR','Croatia (Hrvatska)',385),(55,'CU','Cuba',53),(56,'CY','Cyprus',357),(57,'CZ','Czech Republic',420),(58,'DK','Denmark',45),(59,'DJ','Djibouti',253),(60,'DM','Dominica',1767),(61,'DO','Dominican Republic',1809),(62,'TP','East Timor',670),(63,'EC','Ecuador',593),(64,'EG','Egypt',20),(65,'SV','El Salvador',503),(66,'GQ','Equatorial Guinea',240),(67,'ER','Eritrea',291),(68,'EE','Estonia',372),(69,'ET','Ethiopia',251),(70,'XA','External Territories of Australia',61),(71,'FK','Falkland Islands',500),(72,'FO','Faroe Islands',298),(73,'FJ','Fiji Islands',679),(74,'FI','Finland',358),(75,'FR','France',33),(76,'GF','French Guiana',594),(77,'PF','French Polynesia',689),(78,'TF','French Southern Territories',0),(79,'GA','Gabon',241),(80,'GM','Gambia The',220),(81,'GE','Georgia',995),(82,'DE','Germany',49),(83,'GH','Ghana',233),(84,'GI','Gibraltar',350),(85,'GR','Greece',30),(86,'GL','Greenland',299),(87,'GD','Grenada',1473),(88,'GP','Guadeloupe',590),(89,'GU','Guam',1671),(90,'GT','Guatemala',502),(91,'XU','Guernsey and Alderney',44),(92,'GN','Guinea',224),(93,'GW','Guinea-Bissau',245),(94,'GY','Guyana',592),(95,'HT','Haiti',509),(96,'HM','Heard and McDonald Islands',0),(97,'HN','Honduras',504),(98,'HK','Hong Kong S.A.R.',852),(99,'HU','Hungary',36),(100,'IS','Iceland',354),(101,'IN','India',91),(102,'ID','Indonesia',62),(103,'IR','Iran',98),(104,'IQ','Iraq',964),(105,'IE','Ireland',353),(106,'IL','Israel',972),(107,'IT','Italy',39),(108,'JM','Jamaica',1876),(109,'JP','Japan',81),(110,'XJ','Jersey',44),(111,'JO','Jordan',962),(112,'KZ','Kazakhstan',7),(113,'KE','Kenya',254),(114,'KI','Kiribati',686),(115,'KP','Korea North',850),(116,'KR','Korea South',82),(117,'KW','Kuwait',965),(118,'KG','Kyrgyzstan',996),(119,'LA','Laos',856),(120,'LV','Latvia',371),(121,'LB','Lebanon',961),(122,'LS','Lesotho',266),(123,'LR','Liberia',231),(124,'LY','Libya',218),(125,'LI','Liechtenstein',423),(126,'LT','Lithuania',370),(127,'LU','Luxembourg',352),(128,'MO','Macau S.A.R.',853),(129,'MK','Macedonia',389),(130,'MG','Madagascar',261),(131,'MW','Malawi',265),(132,'MY','Malaysia',60),(133,'MV','Maldives',960),(134,'ML','Mali',223),(135,'MT','Malta',356),(136,'XM','Man (Isle of)',44),(137,'MH','Marshall Islands',692),(138,'MQ','Martinique',596),(139,'MR','Mauritania',222),(140,'MU','Mauritius',230),(141,'YT','Mayotte',269),(142,'MX','Mexico',52),(143,'FM','Micronesia',691),(144,'MD','Moldova',373),(145,'MC','Monaco',377),(146,'MN','Mongolia',976),(147,'MS','Montserrat',1664),(148,'MA','Morocco',212),(149,'MZ','Mozambique',258),(150,'MM','Myanmar',95),(151,'NA','Namibia',264),(152,'NR','Nauru',674),(153,'NP','Nepal',977),(154,'AN','Netherlands Antilles',599),(155,'NL','Netherlands The',31),(156,'NC','New Caledonia',687),(157,'NZ','New Zealand',64),(158,'NI','Nicaragua',505),(159,'NE','Niger',227),(160,'NG','Nigeria',234),(161,'NU','Niue',683),(162,'NF','Norfolk Island',672),(163,'MP','Northern Mariana Islands',1670),(164,'NO','Norway',47),(165,'OM','Oman',968),(166,'PK','Pakistan',92),(167,'PW','Palau',680),(168,'PS','Palestinian Territory Occupied',970),(169,'PA','Panama',507),(170,'PG','Papua new Guinea',675),(171,'PY','Paraguay',595),(172,'PE','Peru',51),(173,'PH','Philippines',63),(174,'PN','Pitcairn Island',0),(175,'PL','Poland',48),(176,'PT','Portugal',351),(177,'PR','Puerto Rico',1787),(178,'QA','Qatar',974),(179,'RE','Reunion',262),(180,'RO','Romania',40),(181,'RU','Russia',70),(182,'RW','Rwanda',250),(183,'SH','Saint Helena',290),(184,'KN','Saint Kitts And Nevis',1869),(185,'LC','Saint Lucia',1758),(186,'PM','Saint Pierre and Miquelon',508),(187,'VC','Saint Vincent And The Grenadines',1784),(188,'WS','Samoa',684),(189,'SM','San Marino',378),(190,'ST','Sao Tome and Principe',239),(191,'SA','Saudi Arabia',966),(192,'SN','Senegal',221),(193,'RS','Serbia',381),(194,'SC','Seychelles',248),(195,'SL','Sierra Leone',232),(196,'SG','Singapore',65),(197,'SK','Slovakia',421),(198,'SI','Slovenia',386),(199,'XG','Smaller Territories of the UK',44),(200,'SB','Solomon Islands',677),(201,'SO','Somalia',252),(202,'ZA','South Africa',27),(203,'GS','South Georgia',0),(204,'SS','South Sudan',211),(205,'ES','Spain',34),(206,'LK','Sri Lanka',94),(207,'SD','Sudan',249),(208,'SR','Suriname',597),(209,'SJ','Svalbard And Jan Mayen Islands',47),(210,'SZ','Swaziland',268),(211,'SE','Sweden',46),(212,'CH','Switzerland',41),(213,'SY','Syria',963),(214,'TW','Taiwan',886),(215,'TJ','Tajikistan',992),(216,'TZ','Tanzania',255),(217,'TH','Thailand',66),(218,'TG','Togo',228),(219,'TK','Tokelau',690),(220,'TO','Tonga',676),(221,'TT','Trinidad And Tobago',1868),(222,'TN','Tunisia',216),(223,'TR','Turkey',90),(224,'TM','Turkmenistan',7370),(225,'TC','Turks And Caicos Islands',1649),(226,'TV','Tuvalu',688),(227,'UG','Uganda',256),(228,'UA','Ukraine',380),(229,'AE','United Arab Emirates',971),(230,'GB','United Kingdom',44),(231,'US','United States',1),(232,'UM','United States Minor Outlying Islands',1),(233,'UY','Uruguay',598),(234,'UZ','Uzbekistan',998),(235,'VU','Vanuatu',678),(236,'VA','Vatican City State (Holy See)',39),(237,'VE','Venezuela',58),(238,'VN','Vietnam',84),(239,'VG','Virgin Islands (British)',1284),(240,'VI','Virgin Islands (US)',1340),(241,'WF','Wallis And Futuna Islands',681),(242,'EH','Western Sahara',212),(243,'YE','Yemen',967),(244,'YU','Yugoslavia',38),(245,'ZM','Zambia',260),(246,'ZW','Zimbabwe',263);
/*!40000 ALTER TABLE `mt_location_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_location_rate`
--

DROP TABLE IF EXISTS `mt_location_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_location_rate` (
  `rate_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `country_id` int(14) NOT NULL DEFAULT '0',
  `state_id` int(14) NOT NULL DEFAULT '0',
  `city_id` int(14) DEFAULT '0',
  `area_id` int(14) NOT NULL DEFAULT '0',
  `fee` float(14,5) NOT NULL DEFAULT '0.00000',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_location_rate`
--

LOCK TABLES `mt_location_rate` WRITE;
/*!40000 ALTER TABLE `mt_location_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_location_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_location_states`
--

DROP TABLE IF EXISTS `mt_location_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_location_states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL DEFAULT '1',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`state_id`),
  KEY `country_id` (`country_id`),
  KEY `sequence` (`sequence`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_location_states`
--

LOCK TABLES `mt_location_states` WRITE;
/*!40000 ALTER TABLE `mt_location_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_location_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_merchant`
--

DROP TABLE IF EXISTS `mt_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_merchant` (
  `merchant_id` int(14) NOT NULL AUTO_INCREMENT,
  `restaurant_slug` varchar(255) NOT NULL DEFAULT '',
  `restaurant_name` varchar(255) NOT NULL DEFAULT '',
  `restaurant_phone` varchar(100) NOT NULL DEFAULT '',
  `contact_name` varchar(255) NOT NULL DEFAULT '',
  `contact_phone` varchar(100) NOT NULL DEFAULT '',
  `contact_email` varchar(255) NOT NULL DEFAULT '',
  `country_code` varchar(3) NOT NULL DEFAULT '',
  `street` text,
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `post_code` varchar(100) NOT NULL DEFAULT '',
  `cuisine` text,
  `service` varchar(255) NOT NULL DEFAULT '',
  `free_delivery` int(1) NOT NULL DEFAULT '2',
  `delivery_estimation` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `activation_key` varchar(50) NOT NULL DEFAULT '',
  `activation_token` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_activated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `package_id` int(14) NOT NULL DEFAULT '0',
  `package_price` float(14,5) NOT NULL DEFAULT '0.00000',
  `membership_expired` date DEFAULT NULL,
  `payment_steps` int(1) NOT NULL DEFAULT '1',
  `is_featured` int(1) NOT NULL DEFAULT '1',
  `is_ready` int(1) NOT NULL DEFAULT '1',
  `is_sponsored` int(2) NOT NULL DEFAULT '1',
  `sponsored_expiration` date DEFAULT NULL,
  `lost_password_code` varchar(50) NOT NULL DEFAULT '',
  `user_lang` int(14) NOT NULL DEFAULT '0',
  `membership_purchase_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort_featured` int(14) NOT NULL DEFAULT '0',
  `is_commission` int(1) NOT NULL DEFAULT '1',
  `percent_commision` float(14,5) NOT NULL DEFAULT '0.00000',
  `abn` varchar(255) NOT NULL DEFAULT '',
  `session_token` varchar(255) NOT NULL DEFAULT '',
  `commision_type` varchar(50) NOT NULL DEFAULT 'percentage',
  `mobile_session_token` varchar(255) NOT NULL DEFAULT '',
  `merchant_key` varchar(255) NOT NULL DEFAULT '',
  `latitude` varchar(50) NOT NULL DEFAULT '',
  `lontitude` varchar(50) NOT NULL DEFAULT '',
  `delivery_charges` float(14,5) NOT NULL DEFAULT '0.00000',
  `minimum_order` float(14,5) NOT NULL DEFAULT '0.00000',
  `delivery_minimum_order` float(14,5) NOT NULL DEFAULT '0.00000',
  `delivery_maximum_order` float(14,5) NOT NULL DEFAULT '0.00000',
  `pickup_minimum_order` float(14,5) NOT NULL DEFAULT '0.00000',
  `pickup_maximum_order` float(14,5) NOT NULL DEFAULT '0.00000',
  `country_name` varchar(255) NOT NULL DEFAULT '',
  `country_id` int(14) NOT NULL DEFAULT '0',
  `state_id` int(14) NOT NULL DEFAULT '0',
  `city_id` int(14) NOT NULL DEFAULT '0',
  `area_id` int(14) NOT NULL DEFAULT '0',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `merchant_type` int(1) NOT NULL DEFAULT '1',
  `invoice_terms` int(14) NOT NULL DEFAULT '7',
  `payment_gateway_ref` varchar(255) NOT NULL DEFAULT '',
  `user_access` text,
  PRIMARY KEY (`merchant_id`),
  KEY `restaurant_slug` (`restaurant_slug`),
  KEY `restaurant_name` (`restaurant_name`),
  KEY `post_code` (`post_code`),
  KEY `service` (`service`),
  KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `status` (`status`),
  KEY `package_id` (`package_id`),
  KEY `payment_steps` (`payment_steps`),
  KEY `is_featured` (`is_featured`),
  KEY `is_ready` (`is_ready`),
  KEY `is_sponsored` (`is_sponsored`),
  KEY `is_commission` (`is_commission`),
  KEY `percent_commision` (`percent_commision`),
  KEY `session_token` (`session_token`),
  KEY `commision_type` (`commision_type`),
  KEY `delivery_charges` (`delivery_charges`),
  KEY `merchant_id` (`merchant_id`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  KEY `city_id` (`city_id`),
  KEY `area_id` (`area_id`),
  KEY `latitude` (`latitude`),
  KEY `lontitude` (`lontitude`),
  KEY `merchant_type` (`merchant_type`),
  KEY `invoice_terms` (`invoice_terms`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_merchant`
--

LOCK TABLES `mt_merchant` WRITE;
/*!40000 ALTER TABLE `mt_merchant` DISABLE KEYS */;
INSERT INTO `mt_merchant` VALUES (1,'taba-paes','Taba Paes','5511989895695','Joao','5511956565656','marcio.yassu@gmail.com','BR','Conselheiro Moreira de Barros, 2850','São Paulo','SP','02430-001','[\"21\",\"22\",\"23\"]','2',2,'','taba','21232f297a57a5a743894a0e4a801fc3','300414','d7a8590f1665486f1c73d3bf9df3968f','active','2019-10-01 17:51:29','2019-10-20 22:50:54','2019-10-02 00:51:29','2019-10-19 09:33:59','189.79.85.100',0,0.00000,NULL,3,2,2,2,'2019-10-31','',0,'2019-10-02 00:51:29',0,2,10.00000,'','41037081565b8385c35575bedb744a373beaedbe410','percentage','','','-23.483733','-46.643623',0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,'',0,0,0,0,'1570244203-TABA.jpg',2,1,'',NULL),(2,'panetteria-zn','PANETTERIA ZN','(11) 2236-6000','ROGÉRIO','(11) 2236-6000','my_takara@yahoo.com.br','BR','Av. Eng. Caetano Álvares, 4740','São Paulo','SP',' 02413-000','[\"21\",\"22\",\"23\"]','2',2,'','ZN','21232f297a57a5a743894a0e4a801fc3','202141','ac1884ab86eaade6f5ba42a40f9a7cf3','active','2019-10-04 21:29:02','2019-10-20 22:57:34','2019-10-05 00:29:02','2019-10-04 21:30:58','189.79.85.100',0,0.00000,NULL,3,1,2,2,'2019-10-31','',0,'2019-10-05 00:29:02',0,2,10.00000,'','87608857938b8385c35575bedb744a373beaedbe410','percentage','','','-23.486835','-46.642512',4.00000,5.00000,5.00000,0.00000,0.00000,0.00000,'',0,0,0,0,'',2,1,'',NULL),(3,'padaria','PADARIA','11256565655','JOSE','11958585858','marcio.k@gmail.com','BR','Rua: dfdfdfndk','Sao Paulo','SP','02556555','[\"21\",\"23\"]','2',2,'','PADARIA','21232f297a57a5a743894a0e4a801fc3','044404','16f1a959ed72464fa99c11f5619cfe32','active','2019-10-20 20:21:16','2019-10-20 20:22:24','2019-10-20 23:21:16','2019-10-20 23:21:16','189.79.85.100',0,0.00000,NULL,3,1,1,1,NULL,'',0,'2019-10-20 23:21:16',0,2,10.00000,'','75404730504b8385c35575bedb744a373beaedbe410','percentage','','','-21.82972','-49.2075',0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,'',0,0,0,0,'',2,1,'',NULL);
/*!40000 ALTER TABLE `mt_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_merchant_cc`
--

DROP TABLE IF EXISTS `mt_merchant_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_merchant_cc` (
  `mt_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `card_name` varchar(255) NOT NULL DEFAULT '',
  `credit_card_number` varchar(20) NOT NULL DEFAULT '',
  `expiration_month` varchar(5) NOT NULL DEFAULT '',
  `expiration_yr` varchar(5) NOT NULL DEFAULT '',
  `cvv` varchar(20) NOT NULL,
  `billing_address` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `encrypted_card` binary(255) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mt_id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_merchant_cc`
--

LOCK TABLES `mt_merchant_cc` WRITE;
/*!40000 ALTER TABLE `mt_merchant_cc` DISABLE KEYS */;
INSERT INTO `mt_merchant_cc` VALUES (1,2,'teste','1223XXXXXXXX1444','01','2019','15','RUa A numero 123','2019-10-20 11:34:11','',_binary '$\���@\�\�\�\��ځ\�`�\�TFi�	\���\�U\���F�o��N�!%����\��u���\�E�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','2019-10-20 14:34:11');
/*!40000 ALTER TABLE `mt_merchant_cc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_merchant_user`
--

DROP TABLE IF EXISTS `mt_merchant_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_merchant_user` (
  `merchant_user_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `user_access` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `contact_email` varchar(255) NOT NULL DEFAULT '',
  `session_token` varchar(255) NOT NULL DEFAULT '',
  `mobile_session_token` varchar(255) NOT NULL DEFAULT '',
  `lost_password_code` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`merchant_user_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `status` (`status`),
  KEY `session_token` (`session_token`),
  KEY `mobile_session_token` (`mobile_session_token`),
  KEY `lost_password_code` (`lost_password_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_merchant_user`
--

LOCK TABLES `mt_merchant_user` WRITE;
/*!40000 ALTER TABLE `mt_merchant_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_merchant_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_minimum_table`
--

DROP TABLE IF EXISTS `mt_minimum_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_minimum_table` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `distance_from` float(14,4) NOT NULL DEFAULT '0.0000',
  `distance_to` float(14,4) NOT NULL DEFAULT '0.0000',
  `shipping_units` varchar(5) NOT NULL DEFAULT '',
  `min_order` float(14,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_minimum_table`
--

LOCK TABLES `mt_minimum_table` WRITE;
/*!40000 ALTER TABLE `mt_minimum_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_minimum_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_mobile_broadcast`
--

DROP TABLE IF EXISTS `mt_mobile_broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_mobile_broadcast` (
  `broadcast_id` int(14) NOT NULL AUTO_INCREMENT,
  `push_title` varchar(255) NOT NULL DEFAULT '',
  `push_message` varchar(255) NOT NULL DEFAULT '',
  `device_platform` int(14) NOT NULL DEFAULT '1',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`broadcast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_mobile_broadcast`
--

LOCK TABLES `mt_mobile_broadcast` WRITE;
/*!40000 ALTER TABLE `mt_mobile_broadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_mobile_broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_mobile_cart`
--

DROP TABLE IF EXISTS `mt_mobile_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_mobile_cart` (
  `device_id` varchar(255) NOT NULL DEFAULT '',
  `cart` text,
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_mobile_cart`
--

LOCK TABLES `mt_mobile_cart` WRITE;
/*!40000 ALTER TABLE `mt_mobile_cart` DISABLE KEYS */;
INSERT INTO `mt_mobile_cart` VALUES ('dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]'),('dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]'),('fA_e_CLJLI0:APA91bFOCcDGRQnj9udK3-JfglWMdNjjseS-hwNlMETh4LUIoE9uUUFXUMSYKK0Sj5FFJNF453i_xQH6uETBjNlpxxyRWOt5jTMdPxqjJ6BLGT_1wWeW18MpRz8_tC1StP5uH0n5zgNM','[{\"item_id\":\"5\",\"qty\":1,\"price\":\"6|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"4\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]'),('fTsILZTgxWw:APA91bEIWwwjSDDVykhKqWItnDU6DcYKVYgXq7dL6JcyVJb5qDEFU_MhEtlP3tApilQGVIru3kEc9CRyPllF0NpALirEjGq5kYenciZjgdnhWPLYHC77X_rpeTCtXDraX7l2Sh7sdjM_','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]'),('c2RXGFHfPZQ:APA91bHjiM7Ctl_UL8GiUnGjPEhSstZxxKGIBYS5WWuUtZLUGaqWUr6FanG6wFyeieuHJlIK70TT9dQ0JMgummVggUQShOWTmuXOCY1FXGQZPA8zNbB-TAMZ00vp8RixcVpVURjmAjFA','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]'),('cRkk-nxzCGk:APA91bEufjPfk4cxX980R7QnmicC2tXX3ZjBPmIlXvt3kXeAuSasaRPqzK98xWGfb1Chbx9KZ6pbrc7xfexCmkCMgJbKt7r-gHtG7HseRGKZvLHc3R4vyBq2d9122YbvuLmect8mAuI_','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":\"4\",\"price\":\"5|medium\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"5\",\"qty\":1,\"price\":\"6|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"4\"},{\"item_id\":\"5\",\"qty\":1,\"price\":\"6|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"4\"}]');
/*!40000 ALTER TABLE `mt_mobile_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_mobile_pages`
--

DROP TABLE IF EXISTS `mt_mobile_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_mobile_pages` (
  `page_id` int(14) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `icon` varchar(100) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `use_html` int(1) NOT NULL DEFAULT '1',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`page_id`),
  KEY `status` (`status`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_mobile_pages`
--

LOCK TABLES `mt_mobile_pages` WRITE;
/*!40000 ALTER TABLE `mt_mobile_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_mobile_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_mobile_push_logs`
--

DROP TABLE IF EXISTS `mt_mobile_push_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_mobile_push_logs` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `client_id` int(14) NOT NULL DEFAULT '0',
  `client_name` varchar(255) NOT NULL DEFAULT '',
  `device_platform` varchar(100) NOT NULL DEFAULT '',
  `device_id` text,
  `push_title` varchar(255) NOT NULL DEFAULT '',
  `push_message` varchar(255) NOT NULL DEFAULT '',
  `push_type` varchar(100) NOT NULL DEFAULT 'order',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `json_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_process` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `broadcast_id` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `device_platform` (`device_platform`),
  KEY `push_type` (`push_type`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_mobile_push_logs`
--

LOCK TABLES `mt_mobile_push_logs` WRITE;
/*!40000 ALTER TABLE `mt_mobile_push_logs` DISABLE KEYS */;
INSERT INTO `mt_mobile_push_logs` VALUES (1,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY REQUEST RECEIVED','','order','process','{\"multicast_id\":1223269190399984385,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571710763306365%0a4a47cbf9fd7ecd\"}]}','2019-10-01 22:30:35','2019-10-21 19:19:23','179.193.165.233',0),(2,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY DRIVER STARTED','','order','process','{\"multicast_id\":7499654194973866057,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571710763466525%0a4a47cbf9fd7ecd\"}]}','2019-10-01 22:30:38','2019-10-21 19:19:23','179.193.165.233',0),(3,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY DRIVER ARRIVED','','order','process','{\"multicast_id\":28433024156513828,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571710764357286%0a4a47cbf9fd7ecd\"}]}','2019-10-01 22:30:48','2019-10-21 19:19:24','179.193.165.233',0),(4,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY SUCCESSFUL','','order','process','{\"multicast_id\":6793981532769458519,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1571710764539725%0a4a47cbf9fd7ecd\"}]}','2019-10-01 22:32:46','2019-10-21 19:19:24','179.193.165.233',0),(5,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','Caught exception:NotRegistered\n','\"Caught exception:NotRegistered\\n\"','2019-10-01 22:44:15','2019-10-21 19:19:25','189.79.78.120',0),(6,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','Caught exception:NotRegistered\n','\"Caught exception:NotRegistered\\n\"','2019-10-01 22:44:19','2019-10-21 19:19:26','189.79.78.120',0),(7,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','Caught exception:NotRegistered\n','\"Caught exception:NotRegistered\\n\"','2019-10-01 22:44:21','2019-10-21 19:19:26','189.79.78.120',0),(8,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','Caught exception:NotRegistered\n','\"Caught exception:NotRegistered\\n\"','2019-10-01 22:44:23','2019-10-21 19:19:26','189.79.78.120',0),(9,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','Caught exception:NotRegistered\n','\"Caught exception:NotRegistered\\n\"','2019-10-02 23:11:09','2019-10-21 19:19:27','187.101.170.169',0),(10,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','Caught exception:NotRegistered\n','\"Caught exception:NotRegistered\\n\"','2019-10-02 23:11:11','2019-10-21 19:19:27','187.101.170.169',0),(11,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-02 23:11:12','2019-10-03 02:11:12','187.101.170.169',0),(12,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-02 23:11:13','2019-10-03 02:11:13','187.101.170.169',0),(13,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-03 20:28:06','2019-10-03 23:28:06','187.101.170.169',0),(14,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-03 20:28:07','2019-10-03 23:28:07','187.101.170.169',0),(15,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-03 20:28:09','2019-10-03 23:28:09','187.101.170.169',0),(16,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-03 20:28:10','2019-10-03 23:28:10','187.101.170.169',0),(17,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-03 22:23:48','2019-10-04 01:23:48','187.101.170.169',0),(18,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-03 22:23:49','2019-10-04 01:23:49','187.101.170.169',0),(19,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-03 22:23:52','2019-10-04 01:23:52','187.101.170.169',0),(20,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-03 22:23:52','2019-10-04 01:23:52','187.101.170.169',0),(21,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-03 22:24:07','2019-10-04 01:24:07','187.101.170.169',0),(22,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-03 22:24:08','2019-10-04 01:24:08','187.101.170.169',0),(23,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-03 22:24:08','2019-10-04 01:24:08','187.101.170.169',0),(24,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-03 22:24:09','2019-10-04 01:24:09','187.101.170.169',0),(25,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-03 22:26:08','2019-10-04 01:26:08','187.101.170.169',0),(26,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-03 22:26:08','2019-10-04 01:26:08','187.101.170.169',0),(27,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-03 22:26:10','2019-10-04 01:26:10','187.101.170.169',0),(28,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-03 22:26:11','2019-10-04 01:26:11','187.101.170.169',0),(29,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-04 10:34:12','2019-10-04 13:34:12','187.116.108.144',0),(30,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-04 10:34:14','2019-10-04 13:34:14','187.116.108.144',0),(31,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-04 10:34:18','2019-10-04 13:34:18','187.116.108.144',0),(32,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-04 10:43:14','2019-10-04 13:43:14','187.116.108.144',0),(33,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-04 10:43:18','2019-10-04 13:43:18','187.116.108.144',0),(34,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-04 10:43:19','2019-10-04 13:43:19','187.116.108.144',0),(35,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-04 10:43:20','2019-10-04 13:43:20','187.116.108.144',0),(36,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-04 10:43:21','2019-10-04 13:43:21','187.116.108.144',0),(37,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-04 10:43:24','2019-10-04 13:43:24','187.116.108.144',0),(38,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-04 10:43:27','2019-10-04 13:43:27','187.116.108.144',0),(39,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-04 10:43:35','2019-10-04 13:43:35','187.116.108.144',0),(40,4,'Joao Doe','Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-04 10:43:42','2019-10-04 13:43:42','187.116.108.144',0),(41,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-04 11:03:00','2019-10-04 14:03:00','187.116.108.144',0),(42,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-04 11:03:05','2019-10-04 14:03:05','187.116.108.144',0),(43,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-04 11:03:13','2019-10-04 14:03:13','187.116.108.144',0),(44,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-04 11:04:17','2019-10-04 14:04:17','187.116.108.144',0),(45,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-04 21:13:41','2019-10-05 00:13:41','187.101.170.169',0),(46,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-04 21:13:42','2019-10-05 00:13:42','187.101.170.169',0),(47,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-04 21:13:43','2019-10-05 00:13:43','187.101.170.169',0),(48,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-04 21:13:44','2019-10-05 00:13:44','187.101.170.169',0),(49,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-04 21:13:50','2019-10-05 00:13:50','187.101.170.169',0),(50,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-04 21:13:50','2019-10-05 00:13:50','187.101.170.169',0),(51,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-04 21:13:53','2019-10-05 00:13:53','187.101.170.169',0),(52,2,'alex cliente2','Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-04 21:13:54','2019-10-05 00:13:54','187.101.170.169',0),(53,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-04 21:17:17','2019-10-05 00:17:17','187.101.170.169',0),(54,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-04 21:17:18','2019-10-05 00:17:18','187.101.170.169',0),(55,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-04 21:17:19','2019-10-05 00:17:19','187.101.170.169',0),(56,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-04 21:17:20','2019-10-05 00:17:20','187.101.170.169',0),(57,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-05 23:22:24','2019-10-06 02:22:24','187.101.170.169',0),(58,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-05 23:22:25','2019-10-06 02:22:25','187.101.170.169',0),(59,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-05 23:22:26','2019-10-06 02:22:26','187.101.170.169',0),(60,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-05 23:22:30','2019-10-06 02:22:30','187.101.170.169',0),(61,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-05 23:22:39','2019-10-06 02:22:39','187.101.170.169',0),(62,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-05 23:22:41','2019-10-06 02:22:41','187.101.170.169',0),(63,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-05 23:22:42','2019-10-06 02:22:42','187.101.170.169',0),(64,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-05 23:22:43','2019-10-06 02:22:43','187.101.170.169',0),(65,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-05 23:22:46','2019-10-06 02:22:46','187.101.170.169',0),(66,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-05 23:22:47','2019-10-06 02:22:47','187.101.170.169',0),(67,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-05 23:22:47','2019-10-06 02:22:47','187.101.170.169',0),(68,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-05 23:22:48','2019-10-06 02:22:48','187.101.170.169',0),(69,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-05 23:32:18','2019-10-06 02:32:18','187.101.170.169',0),(70,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-05 23:32:18','2019-10-06 02:32:18','187.101.170.169',0),(71,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-05 23:32:19','2019-10-06 02:32:19','187.101.170.169',0),(72,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-05 23:32:20','2019-10-06 02:32:20','187.101.170.169',0),(73,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-05 23:32:22','2019-10-06 02:32:22','187.101.170.169',0),(74,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-05 23:32:22','2019-10-06 02:32:22','187.101.170.169',0),(75,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-05 23:32:23','2019-10-06 02:32:23','187.101.170.169',0),(76,3,'Yassu Teste ','Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-05 23:32:24','2019-10-06 02:32:24','187.101.170.169',0),(77,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-20 10:51:47','2019-10-20 13:51:47','189.79.85.100',0),(78,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-20 10:51:49','2019-10-20 13:51:49','189.79.85.100',0),(79,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-20 10:51:51','2019-10-20 13:51:51','189.79.85.100',0),(80,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-20 10:51:54','2019-10-20 13:51:54','189.79.85.100',0),(81,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-20 11:06:06','2019-10-20 14:06:06','189.79.85.100',0),(82,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-20 11:06:09','2019-10-20 14:06:09','189.79.85.100',0),(83,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY DRIVER ARRIVED','','order','pending',NULL,'2019-10-20 11:06:12','2019-10-20 14:06:12','189.79.85.100',0),(84,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY SUCCESSFUL','','order','pending',NULL,'2019-10-20 11:06:14','2019-10-20 14:06:14','189.79.85.100',0),(85,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY REQUEST RECEIVED','','order','pending',NULL,'2019-10-20 11:57:20','2019-10-20 14:57:20','189.79.85.100',0),(86,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY DRIVER STARTED','','order','pending',NULL,'2019-10-20 11:57:22','2019-10-20 14:57:22','189.79.85.100',0),(87,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','DELIVERY FAILED','','order','pending',NULL,'2019-10-20 12:28:14','2019-10-20 15:28:14','179.142.25.131',0),(88,7,'Midori Takara','Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8','ssas','sasas','campaign','pending',NULL,'2019-10-21 19:19:23','2019-10-22 02:19:23','189.79.85.100',0);
/*!40000 ALTER TABLE `mt_mobile_push_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_mobile_registered`
--

DROP TABLE IF EXISTS `mt_mobile_registered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_mobile_registered` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `client_id` int(14) NOT NULL DEFAULT '0',
  `device_platform` varchar(255) NOT NULL DEFAULT '',
  `device_id` text,
  `enabled_push` int(1) NOT NULL DEFAULT '1',
  `country_code_set` varchar(3) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `app_version` float(14,2) NOT NULL DEFAULT '2.50',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `enabled_push` (`enabled_push`),
  KEY `device_platform` (`device_platform`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_mobile_registered`
--

LOCK TABLES `mt_mobile_registered` WRITE;
/*!40000 ALTER TABLE `mt_mobile_registered` DISABLE KEYS */;
INSERT INTO `mt_mobile_registered` VALUES (1,2,'Android','dkIPlRZAp6Q:APA91bHU5LA8BbMSqZSWlFGa1cCwRY_PjXZBkg7iGD1qe1RFsG99zWkAsrL6ob_hlItPsdhKRiqTxg9_3mDuw9p1w9LzWzUD_l4SB2zukXwQEtPB3UvAZjeB5Ndj6DuBwYqFzn9nfU34',1,'','2019-10-01 22:28:53','2019-10-02 01:28:53','201.95.66.116','active',2.70),(2,3,'Android','czydwQzpqIs:APA91bGMGlW6qK3x7mluh8CFwYfAuaqKD83NeuSHF5b0JKUfdbYjcuSIKU2hJNYVr6Sl_Ftg44Mf8r_bMWTfeHBFyEKWLiB7I5DYhijhPl4u-oqxpL_HAFp__VbVUbUwuNcxICuzR5Or',1,'','2019-10-01 22:35:47','2019-10-02 01:35:47','189.79.78.120','active',2.70),(3,4,'Android','dmXbGUmhk0U:APA91bGyGSbgMgw5TrF3Huq87GGdYk0bP8XrX_HgdwH6Dz2ou1RITQlETfjVodk8B-WmqexCtxVOa4hBq_UBbQYvXVrdk4psxhEX05TDcfk77Ajdb1FW1t-d99naw9dVWI_UXdq0nwBX',1,'','2019-10-04 10:05:33','2019-10-04 13:05:33','187.116.108.144','active',2.70),(4,6,'Android','eE084z0EzVg:APA91bHuZitVL9ordgvfOR1mTqX17vhLvoEl3quDOH18_FpbTYp19c9lCbQB7sZ0VfrMuiBXXk2RbKhlgA3pf1mP_zdwZa88n1qcw64RoSFsOX3ytAwM3zmL999UqaGnExDcOHe93NsP',1,'','2019-10-20 08:39:43','2019-10-20 08:39:44','189.79.85.100','active',2.70),(5,7,'Android','fA_e_CLJLI0:APA91bEnuj9kKZVwe4ljjndeaNa9ytgtY3QKu8fi18gAUUL5Hm1xiPDZRL3jq4tao6-yPi7ooR-N48aj0ubdaPi6tebj0ZHUUN11CnOa0FZT1vSOH2KLkAnogQSWPUkFKuSTRnOgmXj8',1,'','2019-10-20 08:42:41','2019-10-20 09:40:32','189.79.85.100','active',2.70),(6,11,'Android','fTsILZTgxWw:APA91bEIWwwjSDDVykhKqWItnDU6DcYKVYgXq7dL6JcyVJb5qDEFU_MhEtlP3tApilQGVIru3kEc9CRyPllF0NpALirEjGq5kYenciZjgdnhWPLYHC77X_rpeTCtXDraX7l2Sh7sdjM_',1,'','2019-10-21 19:50:31','2019-10-21 22:50:31','177.33.141.87','active',2.70),(7,8,'Android','cRkk-nxzCGk:APA91bEufjPfk4cxX980R7QnmicC2tXX3ZjBPmIlXvt3kXeAuSasaRPqzK98xWGfb1Chbx9KZ6pbrc7xfexCmkCMgJbKt7r-gHtG7HseRGKZvLHc3R4vyBq2d9122YbvuLmect8mAuI_',1,'','2019-10-21 23:22:28','2019-10-21 23:35:15','189.79.85.100','active',2.70);
/*!40000 ALTER TABLE `mt_mobile_registered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mt_mobile_registered_view`
--

DROP TABLE IF EXISTS `mt_mobile_registered_view`;
/*!50001 DROP VIEW IF EXISTS `mt_mobile_registered_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mt_mobile_registered_view` AS SELECT 
 1 AS `id`,
 1 AS `client_id`,
 1 AS `device_platform`,
 1 AS `device_id`,
 1 AS `enabled_push`,
 1 AS `country_code_set`,
 1 AS `date_created`,
 1 AS `date_modified`,
 1 AS `ip_address`,
 1 AS `status`,
 1 AS `app_version`,
 1 AS `client_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mt_mobile_temp_email`
--

DROP TABLE IF EXISTS `mt_mobile_temp_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_mobile_temp_email` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `client_email` varchar(255) NOT NULL DEFAULT '',
  `receipt_sender` varchar(255) NOT NULL DEFAULT '',
  `receipt_subject` varchar(255) NOT NULL DEFAULT '',
  `tpl` text,
  `email_type` varchar(100) NOT NULL DEFAULT 'client',
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `client_name` varchar(255) NOT NULL DEFAULT '',
  `gateway` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  UNIQUE KEY `id` (`id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_mobile_temp_email`
--

LOCK TABLES `mt_mobile_temp_email` WRITE;
/*!40000 ALTER TABLE `mt_mobile_temp_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_mobile_temp_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_newsletter`
--

DROP TABLE IF EXISTS `mt_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_newsletter` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `email_address` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_newsletter`
--

LOCK TABLES `mt_newsletter` WRITE;
/*!40000 ALTER TABLE `mt_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_offers`
--

DROP TABLE IF EXISTS `mt_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_offers` (
  `offers_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `offer_percentage` float(14,4) NOT NULL DEFAULT '0.0000',
  `offer_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `applicable_to` varchar(100) NOT NULL DEFAULT 'all',
  PRIMARY KEY (`offers_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_offers`
--

LOCK TABLES `mt_offers` WRITE;
/*!40000 ALTER TABLE `mt_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_option`
--

DROP TABLE IF EXISTS `mt_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_option` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `option_name` varchar(255) NOT NULL DEFAULT '',
  `option_value` text,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_option`
--

LOCK TABLES `mt_option` WRITE;
/*!40000 ALTER TABLE `mt_option` DISABLE KEYS */;
INSERT INTO `mt_option` VALUES (1,0,'website_title','iPaoo'),(2,0,'website_address','ipaoo.com.br'),(3,0,'admin_country_set','BR'),(4,0,'website_contact_phone','11971960399'),(5,0,'website_contact_email','administrador@ipaoo.com.br'),(6,0,'contact_us_tpl_subject_en','contact us form'),(7,0,'contact_us_tpl_content_en','hi admin \n\nnew contact us\nname : [name] \nemail : [email]  \ncountry : [country] \nphone : [phone] \nmessage : [message] \n\nRegards \n- [sitename]'),(8,0,'contact_us_email','1'),(9,0,'customer_welcome_email_tpl_subject_en','Welcome [firstname]'),(10,0,'customer_welcome_email_tpl_content_en','hi [firstname]\n\nthank you for signup \n\nRegards\n- [sitename]'),(11,0,'customer_welcome_email_email','1'),(12,0,'customer_forgot_password_tpl_subject_en','Forgot password'),(13,0,'customer_forgot_password_tpl_content_en','Hi [firstname]\n\nYou have requested for your password\nclick in the link to change your password\n[change_pass_link]\n\nRegards\n - [sitename]'),(14,0,'customer_forgot_password_email','1'),(15,0,'customer_verification_code_email_tpl_subject_en','Signup Verification Code'),(16,0,'customer_verification_code_email_tpl_content_en','hi [firstname]\n\nYour signup verification is [code]\n\nRegards\n- [sitename]'),(17,0,'customer_verification_code_email_email','1'),(18,0,'merchant_verification_code_tpl_subject_en','Your Activation Code'),(19,0,'merchant_verification_code_tpl_content_en','hi [restaurant_name]\n\nYour activation code is [code]\n\nRegards\n  - [sitename]'),(20,0,'merchant_verification_code_email','1'),(21,0,'merchant_forgot_password_tpl_subject_en','Merchant Forgot Password'),(22,0,'merchant_forgot_password_tpl_content_en','hi [restaurant_name]\n\nYour Your verification code is  [code]\n\nRegards\n - [sitename]'),(23,0,'merchant_forgot_password_email','1'),(24,0,'admin_forgot_password_tpl_subject_en','Admin Change Password'),(25,0,'admin_forgot_password_tpl_content_en','hi admin\n\nYour password has been reset to : [newpassword]\n\nRegards\n- [sitename]'),(26,0,'admin_forgot_password_email','1'),(27,0,'merchant_new_signup_tpl_subject_en','New Restaurant Signup - [restaurant_name]'),(28,0,'merchant_new_signup_tpl_content_en','hi admin\n\nNew restaurant signup \nname : [restaurant_name]\npackage : [package_name]\ntype : [merchant_type]\n\nregard'),(29,0,'merchant_new_signup_sms_content_en','New Restaurant Signup name : [restaurant_name]\npackage : [package_name]\ntype : [merchant_type] '),(30,0,'receipt_template_tpl_subject_en','Your Receipt for Order ID : [order_id]'),(31,0,'receipt_template_tpl_content_en','Dear [customer_name],\n\n\nThank you for shopping at [sitename]. We hope you enjoy your new purchase! Your order number is [order_id]. We have included your order receipt and delivery details below:\n\n[receipt]\n\nKind Regards'),(32,0,'receipt_template_sms_content_en','Hi [customer_name] \nWe have receive your order,\nDetails:\nOrder ID : [order_id]\nRestaurant : [restaurant_name]\nTotal Amount : [total_amount]\nOrder Details : \n[order_details]\n\nRegards\n[sitename]\n'),(33,0,'receipt_template_email','1'),(34,0,'receipt_template_sms','1'),(35,0,'receipt_send_to_merchant_tpl_subject_en','New Order : [order_id] From [customer_name]'),(36,0,'receipt_send_to_merchant_tpl_content_en','hi [restaurant_name],\n\nThere is a new order with the reference number [order_id] from customer [customer_name]\n\n[receipt]\n\nAccept Order\n[accept_link]\n\nDecline Order\n[decline_link]\n\nKind Regards'),(37,0,'receipt_send_to_merchant_sms_content_en','New Order : [order_id] From [customer_name]\ntotal amout : [total_amount]\ndetails : \n[order_details]\n'),(38,0,'receipt_send_to_merchant_email','1'),(39,0,'receipt_send_to_admin_email','1'),(40,0,'receipt_send_to_admin_tpl_subject_en','New Order : [order_id] From [customer_name]'),(41,0,'receipt_send_to_admin_tpl_content_en','hi admin,\n\nThere is a new order to [restaurant_name]\nwith the reference number [order_id] from customer [customer_name]\n\n[receipt]\n\nAccept Order\n[accept_link]\n\nDecline Order\n[decline_link]\n\nKind Regards'),(42,0,'receipt_send_to_admin_sms_content_en','New Order : [order_id] From [customer_name]\ntotal amout : [total_amount]\ndetails : [order_details]'),(43,0,'offline_bank_deposit_tpl_subject_en','Bank deposit instructions'),(44,0,'offline_bank_deposit_tpl_content_en','Hi [restaurant_name]\n\nDeposit Instructions\n\nPlease deposit [amount] to :\n\nBank : Your bank name\nAccount Number : Your bank account number\nAccount Name : Your bank account name\n\nWhen deposit is completed \nfill in your bank deposit information \n[verify_payment_link]\n\n\nKind Regards\n  -[sitename]'),(45,0,'offline_bank_deposit_signup_merchant_tpl_subject_en','Bank deposit instructions'),(46,0,'offline_bank_deposit_signup_merchant_tpl_content_en','Hi [restaurant_name]\n\nDeposit Instructions\n\nPlease deposit [amount] to :\n\nBank : Your bank name\nAccount Number : Your bank account number\nAccount Name : Your bank account name\n\nWhen deposit is completed \nfill in your bank deposit information \n[verify_payment_link]\n\n\nKind Regards\n  -[sitename]'),(47,0,'offline_bank_deposit_signup_merchant_email','1'),(48,0,'offline_bank_deposit_purchase_email','1'),(49,0,'offline_bank_deposit_purchase_tpl_subject_en','Bank deposit instructions for order id : [order_id]'),(50,0,'offline_bank_deposit_purchase_tpl_content_en','Hi [customer_name]\n\nDeposit Instructions\n\nPlease deposit [amount] to :\n\nBank : Your bank name\nAccount Number : Your bank account number\nAccount Name : Your bank account name\n\nWhen deposit is completed \nfill in your bank deposit information \n[verify_payment_link]\n\n\nKind Regards\n  -[sitename]'),(51,0,'merchant_near_expiration_email','1'),(52,0,'merchant_near_expiration_sms','1'),(53,0,'merchant_near_expiration_tpl_subject_en','Your membership about to expired'),(54,0,'merchant_near_expiration_tpl_content_en','hi [restaurant_name]\n\n Your membership is about to expire in [expiration_date]\n\nRegards\n - [sitename]'),(55,0,'merchant_near_expiration_sms_content_en','hi [restaurant_name]\n Your membership is about to expire in [expiration_date]\nRegards\n - [sitename]'),(56,0,'merchant_near_expiration_day','5'),(57,0,'merchant_change_status_email','1'),(58,0,'merchant_change_status_tpl_subject_en','Account Status Updated'),(59,0,'merchant_change_status_tpl_content_en','hi [restaurant_name]\n\nYour merchant records status has change to [status]\n\nRegards\n - [sitename]'),(60,0,'merchant_change_status_sms_content_en','hi [restaurant_name]\n\nYour merchant records status has change to [status]\n\nRegards\n - [sitename]'),(61,0,'customer_booked_email','1'),(62,0,'customer_booked_tpl_subject_en','We have receive your Booking'),(63,0,'customer_booked_tpl_content_en','Hi [customer_name]\n\nwe have receive your booking \nfor restaurant [restaurant_name]\nwith the following information\n\nNumber of guest : [number_guest]\nDate of Booking : [date_booking]\nTime : [time]\nEmail address : [email]\nMobile  : [mobile]\nSpecial instruction : [instruction]\n\nYour booking id : [booking_id]\n\nPlease wait for the merchant to accept your booking.\nyou will receive another email for confirmation from the merchant\n\nRegards\n - [sitename]'),(64,0,'booked_notify_admin_email','1'),(65,0,'booked_notify_admin_tpl_subject_en','New booking from [restaurant_name]'),(66,0,'booked_notify_admin_tpl_content_en','hi admin\n\nthere is new booking from [restaurant_name]\nwith the following information\n\nBooking ID : [booking_id]\nName : [customer_name]\nNumber of guest : [number_guest]\nDate of Booking : [date_booking]\nTime : [time]\nEmail address : [email]\nMobile  : [mobile]\nSpecial instruction : [instruction]\n'),(67,0,'booked_notify_merchant_tpl_subject_en','New booking from [customer_name]'),(68,0,'booked_notify_merchant_tpl_content_en','hi [restaurant_name]\n\nthere is new booking from [customer_name]\nwith the following information\n\nBooking ID : [booking_id]\nName : [customer_name]\nNumber of guest : [number_guest]\nDate of Booking : [date_booking]\nTime : [time]\nEmail address : [email]\nMobile  : [mobile]\nSpecial instruction : [instruction]\n\n'),(69,0,'booking_update_status_tpl_subject_en','Update with your booking id [booking_id]'),(70,0,'booking_update_status_tpl_content_en','Hi [customer_name]\n\nYour booking id [booking_id]\nstatus updated to [status]\n\nmerchant remarks :\n[merchant_remarks]\n\nRegards\n - [sitename]'),(71,0,'merchant_welcome_signup_email','1'),(72,0,'merchant_welcome_signup_tpl_subject_en','Welcome [restaurant_name]'),(73,0,'merchant_welcome_signup_tpl_content_en','hi  [restaurant_name]\n\nThank you for joining us!\n\nLogin here\n[login_url]\n\nRegards\n - [sitename]'),(74,0,'order_idle_to_merchant_tpl_subject_en','Order ID [order_id] has been IDLE for [idle_time]'),(75,0,'order_idle_to_merchant_tpl_content_en','hi [restaurant_name]\n\nKindly take  action on Order ID : [order_Id]\n\nRegards\n- [sitename]'),(76,0,'order_idle_to_merchant_sms_content_en','hi [restaurant_name]\n\nKindly take action on Order ID : [order_Id]\n\nRegards\n- [sitename]'),(77,0,'order_idle_to_admin_tpl_subject_en','Order ID [order_id] has been IDLE for [idle_time]'),(78,0,'order_idle_to_admin_tpl_content_en','hi admin\n\nKindly take action on Order ID : [order_id]\n\nRegards\n- [sitename]'),(79,0,'order_idle_to_admin_sms_content_en','hi admin\n\nKindly take action on Order ID : [order_Id]\n\nRegards\n- [sitename]'),(80,0,'merchant_invoice_email','1'),(81,0,'merchant_invoice_tpl_subject_en','Your new Invoice : [invoice_number]'),(82,0,'merchant_invoice_tpl_content_en','hi [restaurant_name]\n\nyour invoice is now ready\nInvoice number : [invoice_number]\nTerms : [terms]\nPeriod : [period]\n\nYou can donwload your invoice below\n[invoice_link]\n\nRegards\n - [sitename]'),(83,0,'admin_decimal_place','2'),(84,0,'installation_done','1'),(85,0,'website_disbaled_auto_cart',''),(86,0,'website_enabled_mobile_verification',''),(87,0,'website_date_picker_format','dd-mm-yy'),(88,0,'website_time_picker_format','24'),(89,0,'website_date_format','d M, Y'),(90,0,'website_time_format',''),(91,0,'merchant_sigup_status','active'),(92,0,'merchant_email_verification','yes'),(93,0,'merchant_payment_enabled',''),(94,0,'admin_enabled_paypal',''),(95,0,'admin_enabled_card',''),(96,0,'admin_currency_set','BRL'),(97,0,'home_search_text',''),(98,0,'home_search_subtext',''),(99,0,'home_search_mode',''),(100,0,'website_logo','1569975728-logo-ipaoo.png'),(101,0,'admin_use_separators',''),(102,0,'google_auto_address',''),(103,0,'home_search_radius','100'),(104,0,'home_search_unit_type','km'),(105,0,'google_default_country',''),(106,0,'enabled_advance_search',''),(107,0,'disabled_share_location',''),(108,0,'enabled_search_map',''),(109,0,'admin_currency_position','left'),(110,0,'merchant_default_country','BR'),(111,0,'merchant_specific_country',''),(112,0,'map_marker','1569978026-pin-location.png'),(113,0,'global_admin_sender_email','administrador@ipaoo.com.br'),(114,0,'merchant_disabled_registration',''),(115,0,'disabled_subscription',''),(116,0,'disabled_featured_merchant',''),(117,0,'merchant_days_can_edit_status',''),(118,0,'disabled_website_ordering',''),(119,0,'admin_activated_menu','2'),(120,0,'website_hide_foodprice',''),(121,0,'disabled_cc_management',''),(122,0,'merchant_reg_abn',''),(123,0,'spicydish',''),(124,0,'website_timezone','America/Sao_Paulo'),(125,0,'website_admin_mutiple_login',''),(126,0,'website_merchant_mutiple_login',''),(127,0,'website_disabled_guest_checkout',''),(128,0,'website_reviews_actual_purchase',''),(129,0,'website_terms_merchant','yes'),(130,0,'website_terms_merchant_url','https://docs.google.com/document/d/1UEhZv2b03o2LrmnC-lb60bCfoO_dvxpo39Tp9JhVGmk/edit?usp=sharing'),(131,0,'website_terms_customer','yes'),(132,0,'website_terms_customer_url','https://docs.google.com/document/d/19IIpb75g6IybI9as7dWm-oyTk9pdQRAZccw62xAdULM/edit?usp=sharing'),(133,0,'admin_thousand_separator',''),(134,0,'admin_decimal_separator',''),(135,0,'website_disabled_login_popup',''),(136,0,'merchant_can_edit_reviews',''),(137,0,'website_enabled_rcpt',''),(138,0,'website_receipt_logo',''),(139,0,'disabled_cart_sticky',''),(140,0,'search_result_bydistance','2'),(141,0,'google_geo_api_key','AIzaSyBTl4jyXK9xcSUUBM5qsglhuqnCD4Wmz5c'),(142,0,'website_enabled_map_address',''),(143,0,'client_custom_field_name1',''),(144,0,'client_custom_field_name2',''),(145,0,'merchant_days_can_edit_status_basedon','1'),(146,0,'merchant_status_disabled',''),(147,0,'view_map_disabled',''),(148,0,'view_map_default_zoom',''),(149,0,'view_map_default_zoom_s',''),(150,0,'receipt_default_subject',''),(151,0,'merchant_tbl_book_disabled','2'),(152,0,'merchant_changeorder_sms',''),(153,0,'customer_ask_address','2'),(154,0,'captcha_site_key',''),(155,0,'captcha_secret',''),(156,0,'captcha_lang',''),(157,0,'captcha_customer_signup',''),(158,0,'captcha_merchant_signup',''),(159,0,'captcha_customer_login',''),(160,0,'captcha_merchant_login',''),(161,0,'captcha_admin_login',''),(162,0,'captcha_order',''),(163,0,'blocked_email_add',''),(164,0,'blocked_mobile',''),(165,0,'admin_zipcode_searchtype','1'),(166,0,'mobilelogo','1569975737-logo-ipaoo.png'),(167,0,'theme_enabled_email_verification',''),(168,0,'google_distance_method','straight_line'),(169,0,'google_use_curl',''),(170,0,'admin_menu_allowed_merchant',''),(171,0,'admin_printing_receipt_width',''),(172,0,'admin_printing_receipt_size',''),(173,0,'enabled_merchant_check_closing_time',''),(174,0,'admin_add_space_between_price','1'),(175,0,'enabled_food_search_menu','1'),(176,0,'location_default_country','30'),(177,0,'cod_change_required','2'),(178,0,'website_disabled_cart_validation','1'),(179,0,'cancel_order_days_applied',''),(180,0,'cancel_order_status_accepted','1'),(181,0,'cancel_order_enabled',''),(182,0,'website_review_type','1'),(183,0,'review_baseon_status','1'),(184,0,'website_use_date_picker','1'),(185,0,'website_use_time_picker','1'),(186,0,'website_time_picker_interval','15'),(187,0,'mapbox_access_token','pk.eyJ1IjoiYWxleG9yYml0IiwiYSI6ImNqejU4c3Q5NTBtajYzY20ybmV2cGl5bWcifQ.H8CfRyFuBDb6BOpCmQUuKw'),(188,0,'map_provider','mapbox'),(189,0,'mapbox_default_zoom',''),(190,0,'earn_points_review_status','1'),(191,0,'earn_points_booking_status','1'),(192,0,'website_review_approved_status','pending'),(193,0,'cancel_order_hours','0'),(194,0,'cancel_order_minutes','0'),(195,0,'website_review_decline_status',''),(196,0,'publish_review_status','1'),(197,0,'book_table_earn_status','1'),(198,0,'pre_configure_size',''),(199,0,'enabled_map_selection_delivery',''),(200,0,'disabled_order_confirm_page',''),(201,0,'review_merchant_can_add_review_status',''),(202,0,'drv_google_api','AIzaSyCq7SJ5OqJ1uGUkHSS6JINp95UuPKtgkYk'),(203,0,'driver_map_provider','mapbox'),(204,0,'drv_mapbox_token','pk.eyJ1IjoiYWxleG9yYml0IiwiYSI6ImNqejU4c3Q5NTBtajYzY20ybmV2cGl5bWcifQ.H8CfRyFuBDb6BOpCmQUuKw'),(205,0,'driver_google_use_curl',''),(206,0,'theme_hide_logo',''),(207,0,'theme_hide_how_works',''),(208,0,'theme_hide_cuisine',''),(209,0,'social_flag',''),(210,0,'theme_custom_footer',''),(211,0,'theme_show_app','2'),(212,0,'theme_app_android',''),(213,0,'theme_app_ios',''),(214,0,'theme_app_windows',''),(215,0,'theme_filter_colapse',''),(216,0,'theme_list_style','gridview'),(217,0,'theme_menu_colapse',''),(218,0,'theme_top_menu','[\\\"browse\\\",\\\"resto_signup\\\",\\\"signup\\\",\\\"driver_signup\\\"]'),(219,0,'show_language',''),(220,0,'theme_promo_tab',''),(221,0,'theme_hours_tab',''),(222,0,'theme_reviews_tab',''),(223,0,'theme_map_tab',''),(224,0,'theme_info_tab',''),(225,0,'theme_photos_tab',''),(226,0,'cookie_law_enabled',''),(227,0,'cookie_accept_text',''),(228,0,'cookie_info_text',''),(229,0,'cookie_msg_text',''),(230,0,'cookie_info_link',''),(231,0,'theme_search_merchant_name',''),(232,0,'theme_search_street_name',''),(233,0,'theme_search_cuisine',''),(234,0,'theme_search_foodname',''),(235,0,'theme_compression',''),(236,0,'theme_search_merchant_address',''),(237,0,'theme_lang_pos','bottom'),(238,0,'theme_hide_footer_section1',''),(239,0,'theme_hide_footer_section2',''),(240,0,'theme_time_pick',''),(241,0,'featured_merchant_sort',''),(242,0,'age_restriction',''),(243,0,'age_restriction_content',''),(244,0,'age_restriction_exit_link',''),(245,0,'browse_page_sort','1'),(246,0,'theme_enabled_rtl',''),(247,0,'admin_commission_enabled','yes'),(248,0,'admin_disabled_membership',''),(249,0,'admin_commision_percent','10'),(250,0,'admin_vat_no',''),(251,0,'admin_vat_percent',''),(252,0,'total_commission_status','[\\\"paid\\\"]'),(253,0,'admin_commision_ontop','1'),(254,0,'admin_commision_type','percentage'),(255,0,'admin_include_merchant_cod','yes'),(256,0,'admin_exclude_cod_balance',''),(257,0,'admin_disabled_membership_signup','1'),(258,0,'admin_bank_account_name','conta'),(259,0,'admin_bank_account_number','numero'),(260,0,'admin_bank_custom_tpl','dados da conta'),(261,0,'admin_bank_deposited_timeframe','15'),(262,0,'drv_order_status','Solicitando Entregador'),(263,0,'drv_delivery_time','0'),(264,0,'driver_api_hash_key',''),(265,0,'driver_website_title','iPaoo Entregador'),(266,0,'driver_send_push_to_online','1'),(267,0,'driver_owner_task','default'),(268,0,'drv_order_cancel','0'),(269,0,'driver_allowed_team_to_merchant','1'),(270,0,'driver_allowed_merchant_list',''),(271,0,'driver_donot_allow_delete_task',''),(272,0,'driver_allowed_days_delete_task',''),(273,0,'driver_merchant_task_to_admin',''),(274,0,'driver_show_admin_only_task',''),(275,0,'driver_merchant_block',''),(276,0,'driver_enabled_notes','1'),(277,0,'driver_enabled_signature','1'),(278,0,'driver_enabled_signup','1'),(279,0,'driver_send_admin_notification_email','administrador@ipaoo.com.br'),(280,0,'driver_signup_status','active'),(281,0,'vibrate_interval','3000'),(282,0,'driver_enabled_addphoto',''),(283,0,'enabled_critical_task','1'),(284,0,'critical_minutes','5'),(285,0,'driver_tracking_options','1'),(286,0,'driver_record_track_Location','1'),(287,0,'driver_enabled_resize_photo',''),(288,0,'photo_resize_width',''),(289,0,'photo_resize_height',''),(290,0,'driver_calendar_language','pt-BR'),(291,0,'driver_disabled_tracking_bg',''),(292,0,'driver_track_interval',''),(293,0,'driver_mandatory_signature','1'),(294,0,'app_default_language','0'),(295,0,'driver_app_name','iPaoo - Entregador'),(296,0,'driver_hide_total',''),(297,0,'drv_fcm_server_key','AAAAxturmIQ:APA91bEKvWDD9WXDQpIIG_Fl34ZP0KjzTAsrd1QA321f5Kfp_tlm1Dv_Pk0YeJ7k8SkXKiJ9TgOUnlvhCiDmwHk-gXgCeTejBWIePDF2S0tzkNDl5pdluUVfPZKvFG3fS9Lay7twVx5D'),(298,0,'drv_default_location','BR'),(299,0,'drv_default_location_lat','-11'),(300,0,'drv_default_location_lng','-53'),(301,0,'driver_include_offline_driver_map','1'),(302,0,'driver_hide_pickup_task',''),(303,0,'driver_hide_delivery_task',''),(304,0,'driver_hide_successful_task',''),(305,0,'driver_disabled_auto_refresh',''),(306,0,'drv_map_style',''),(307,0,'driver_map_refresh_interval','5'),(308,0,'driver_refresh_map_driver_activity','1'),(309,0,'driver_auto_geocode_address','1'),(310,1,'merchant_latitude','-23.483733'),(311,1,'merchant_longtitude','-46.643623'),(312,1,'merchant_information',''),(313,0,'DELIVERY_REQUEST_RECEIVED_PUSH','1'),(314,0,'DELIVERY_REQUEST_RECEIVED_SMS',''),(315,0,'DELIVERY_REQUEST_RECEIVED_EMAIL',''),(316,0,'DELIVERY_DRIVER_STARTED_PUSH','1'),(317,0,'DELIVERY_DRIVER_STARTED_SMS',''),(318,0,'DELIVERY_DRIVER_STARTED_EMAIL',''),(319,0,'DELIVERY_DRIVER_ARRIVED_PUSH','1'),(320,0,'DELIVERY_DRIVER_ARRIVED_SMS',''),(321,0,'DELIVERY_DRIVER_ARRIVED_EMAIL',''),(322,0,'DELIVERY_SUCCESSFUL_PUSH','1'),(323,0,'DELIVERY_SUCCESSFUL_SMS',''),(324,0,'DELIVERY_SUCCESSFUL_EMAIL',''),(325,0,'DELIVERY_FAILED_PUSH','1'),(326,0,'DELIVERY_FAILED_SMS',''),(327,0,'DELIVERY_FAILED_EMAIL',''),(328,0,'DELIVERY_NOTES_PUSH','1'),(329,0,'DELIVERY_NOTES_SMS',''),(330,0,'DELIVERY_NOTES_EMAIL',''),(331,0,'DELIVERY_PHOTO_PUSH','1'),(332,0,'DELIVERY_PHOTO_SMS',''),(333,0,'DELIVERY_PHOTO_EMAIL',''),(334,0,'PICKUP_REQUEST_RECEIVED_PUSH','1'),(335,0,'PICKUP_REQUEST_RECEIVED_SMS',''),(336,0,'PICKUP_REQUEST_RECEIVED_EMAIL',''),(337,0,'PICKUP_DRIVER_STARTED_PUSH','1'),(338,0,'PICKUP_DRIVER_STARTED_SMS',''),(339,0,'PICKUP_DRIVER_STARTED_EMAIL',''),(340,0,'PICKUP_DRIVER_ARRIVED_PUSH','1'),(341,0,'PICKUP_DRIVER_ARRIVED_SMS',''),(342,0,'PICKUP_DRIVER_ARRIVED_EMAIL',''),(343,0,'PICKUP_SUCCESSFUL_PUSH','1'),(344,0,'PICKUP_SUCCESSFUL_SMS',''),(345,0,'PICKUP_SUCCESSFUL_EMAIL',''),(346,0,'PICKUP_FAILED_PUSH','1'),(347,0,'PICKUP_FAILED_SMS',''),(348,0,'PICKUP_FAILED_EMAIL',''),(349,0,'PICKUP_NOTES_PUSH','1'),(350,0,'PICKUP_NOTES_SMS',''),(351,0,'PICKUP_NOTES_EMAIL',''),(352,0,'PICKUP_PHOTO_PUSH','1'),(353,0,'PICKUP_PHOTO_SMS',''),(354,0,'PICKUP_PHOTO_EMAIL',''),(355,0,'ASSIGN_TASK_PUSH','1'),(356,0,'ASSIGN_TASK_SMS',''),(357,0,'ASSIGN_TASK_EMAIL',''),(358,0,'CANCEL_TASK_PUSH','1'),(359,0,'CANCEL_TASK_SMS',''),(360,0,'CANCEL_TASK_EMAIL',''),(361,0,'UPDATE_TASK_PUSH','1'),(362,0,'UPDATE_TASK_SMS',''),(363,0,'UPDATE_TASK_EMAIL',''),(364,0,'FAILED_AUTO_ASSIGN_EMAIL','1'),(365,0,'AUTO_ASSIGN_ACCEPTED_PUSH','1'),(366,0,'NEW_DRIVER_PUSH',''),(367,0,'NEW_DRIVER_SMS',''),(368,0,'NEW_DRIVER_EMAIL','1'),(369,0,'DRIVER_NEW_SIGNUP_EMAIL','1'),(370,0,'SIGNUP_APPROVED_EMAIL','1'),(371,0,'SIGNUP_APPROVED_SMS',''),(372,0,'SIGNUP_DENIED_SMS',''),(373,0,'SIGNUP_DENIED_EMAIL','1'),(374,0,'driver_auto_assign_type','send_to_all'),(375,0,'driver_assign_request_expire','1'),(376,0,'driver_enabled_auto_assign','1'),(377,0,'driver_include_offline_driver','1'),(378,0,'driver_autoassign_notify_email','administrador@ipaoo.com.br'),(379,0,'driver_request_expire','1'),(380,0,'driver_within_radius','200'),(381,0,'driver_within_radius_unit','km'),(382,0,'driver_auto_assign_retry','1'),(383,0,'paymentgateway','[\\\"cod\\\",\\\"pyr\\\",\\\"mcd\\\"]'),(384,0,'mercadopago_v2_enabled',''),(385,0,'mercadopago_v2_mode','live'),(386,0,'admin_mercadopago_v2_client_id','513277331651204'),(387,0,'admin_mercadopago_v2_client_secret','BVJhxpGO93amoGxGCroKwEeJAnYIOfyj'),(388,0,'admin_mercadopago_v2_card_fee','1'),(389,0,'mobile_default_image_not_available','default-image-merchant.png'),(390,0,'mobile_android_push_key',''),(391,0,'mobile_push_order_title',''),(392,0,'mobile_push_order_message',''),(393,0,'ios_passphrase',''),(394,0,'ios_push_dev_cer',''),(395,0,'ios_push_prod_cer',''),(396,0,'ios_push_mode','development'),(397,0,'mobileapp_api_has_key',''),(398,0,'show_addon_description','1'),(399,0,'mobile_menu',''),(400,0,'mobile_save_cart_db','1'),(401,0,'force_app_default_lang','0'),(402,0,'app_current_location_results','formatted_address'),(403,0,'mobileapp_location_accuracy','true'),(404,0,'mobile_facebookid',''),(405,0,'mobile_enabled_googlogin','1'),(406,0,'upload_push_icon',''),(407,0,'upload_push_picture',''),(408,0,'mobileapp_enabled_push_picture','1'),(409,0,'mobile_analytics_id',''),(410,0,'mobile_analytics_enabled',''),(411,0,'mobile_show_category_image','1'),(412,0,'mobileapp_push_server_key','AAAAIY34R94:APA91bFMOcUxePx3C2a8tvkob-pLIe6jW1OotEr6qEWY9qJNjaQ3iKlqhssKXbIAJoNK2CMxze22wbVSUfMiu4c_ODS4qs9lqyT9ml99IggOkqjfXByWsHmcQlqiFz705ifuQBfuE_mc'),(413,0,'mobile_enabled_fblogin','1'),(414,0,'mobile_auto_location','1'),(415,0,'web_enabled_delivery_select_map',''),(416,0,'mobile_fb_save_pic','1'),(417,0,'admin_mercado_enabled','yes'),(418,0,'admin_mercado_mode','live'),(419,0,'admin_mercado_id','513277331651204'),(420,0,'admin_mercado_key','BVJhxpGO93amoGxGCroKwEeJAnYIOfyj'),(421,0,'offline_cc_encryption_key',''),(422,1,'payment_provider','[\\\"2\\\",\\\"3\\\",\\\"4\\\"]'),(423,1,'merchant_payondeliver_enabled','yes'),(424,1,'merchant_read_notice','1'),(425,0,'wd_paypal_minimum',''),(426,0,'wd_bank_minimum',''),(427,0,'wd_days_process','7'),(428,0,'wd_paypal',''),(429,0,'wd_paypal_mode',''),(430,0,'wd_paypal_mode_user',''),(431,0,'wd_paypal_mode_pass',''),(432,0,'wd_paypal_mode_signature',''),(433,0,'wd_bank_deposit','2'),(434,0,'wd_template_payout','<p>Olá {merchant-name},</p><br><p>Estamos apenas informando que recebemos sua solicitação para o pagamento de {payout-amount} via {payment-method} para {account}</p>Você pode cancelar esta solicitação a qualquer momento antes de {cancel-date} aqui:<p>{cancel-link}</p><p>Concluiremos esta solicitação na {process-date} (or the next business day), mas pode levar até sete dias para aparecer em sua conta. Um segundo e-mail de confirmação será enviado no momento.</p><br><p> Atenciosamente,</p><p>iPaoo</p><p><br></p>'),(435,0,'wd_template_process','<p>Olá {merchant-name},</p><br><p>Acabamos de processar sua solicitação de {payout-amount} via {payment-method}.</p><p>Seu pagamento foi enviado para {acoount}</p><p>Agradecemos por saber que faz parte do nosso time.</p><p> Atenciosamente,</p><p>iPaoo</p>'),(436,0,'wd_enabled_paypal',''),(437,0,'wd_payout_disabled',''),(438,0,'wd_payout_notification','2'),(439,0,'wd_template_payout_subject',' Sua solicitação de retirada foi recebida'),(440,0,'wd_template_process_subject','Sua solicitação de retirada foi processada'),(441,0,'wd_bank_fields','default'),(442,1,'merchant_payout_bank_account','{\\\"swift_code\\\":\\\"122045\\\",\\\"bank_account_number\\\":\\\"8317\\\",\\\"account_name\\\":\\\"Itau\\\",\\\"bank_name\\\":\\\"Itau\\\",\\\"bank_branch\\\":\\\"S\\\\u00e3o Paulo\\\"}'),(443,1,'merchant_minimum_order',''),(444,1,'merchant_tax',''),(445,1,'merchant_delivery_charges',''),(446,1,'stores_open_day',''),(447,1,'stores_open_starts','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(448,1,'stores_open_ends','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(449,1,'stores_open_custom_text','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(450,1,'merchant_photo','1570244203-TABA.jpg'),(451,1,'merchant_delivery_estimation',''),(452,1,'merchant_delivery_miles',''),(453,1,'merchant_photo_bg','1570244208-TABA.jpg'),(454,1,'merchant_disabled_cod',''),(455,1,'merchant_disabled_ccr',''),(456,1,'merchant_extenal',''),(457,1,'merchant_enabled_voucher',''),(458,1,'merchant_distance_type','mi'),(459,1,'merchant_timezone',''),(460,1,'merchant_close_msg',''),(461,1,'merchant_preorder',''),(462,1,'merchant_maximum_order',''),(463,1,'merchant_packaging_charge',''),(464,1,'merchant_close_msg_holiday',''),(465,1,'merchant_holiday','[\\\"\\\"]'),(466,1,'merchant_activated_menu',''),(467,1,'spicydish',''),(468,1,'merchant_required_delivery_time',''),(469,1,'merchant_close_store',''),(470,1,'merchant_packaging_increment',''),(471,1,'merchant_show_time',''),(472,1,'merchant_enabled_tip',''),(473,1,'merchant_tip_default',''),(474,1,'merchant_minimum_order_pickup',''),(475,1,'merchant_maximum_order_pickup',''),(476,1,'merchant_disabled_ordering',''),(477,1,'merchant_tax_charges',''),(478,1,'stores_open_pm_start','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(479,1,'stores_open_pm_ends','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(480,1,'food_option_not_available',''),(481,1,'order_verification',''),(482,1,'order_sms_code_waiting',''),(483,1,'disabled_food_gallery',''),(484,1,'merchant_apply_tax',''),(485,1,'printing_receipt_width',''),(486,1,'printing_receipt_size',''),(487,1,'free_delivery_above_price',''),(488,1,'merchant_minimum_order_dinein',''),(489,1,'merchant_maximum_order_dinein',''),(490,1,'food_viewing_private',''),(491,1,'merchant_tax_number',''),(492,1,'merchant_packaging_wise',''),(493,1,'merchant_show_category_image',''),(494,1,'merchant_two_flavor_option','1'),(495,1,'default_order_status','preparando'),(496,0,'smtp_host','smtp.zoho.com'),(497,0,'smtp_port','587'),(498,0,'smtp_username','administrador@ipaoo.com.br'),(499,0,'smtp_password','ipaonp2019'),(500,0,'email_provider','smtp'),(501,0,'mandrill_api_key',''),(502,0,'sendgrid_api_key',''),(503,0,'mailjet_api_key',''),(504,0,'mailjet_secret_key',''),(505,0,'elastic_email_apikey',''),(506,0,'email_dsiabled_auto_break',''),(507,0,'smtp_secure','tls'),(508,2,'merchant_latitude','-23.486835'),(509,2,'merchant_longtitude','-46.642512'),(510,2,'merchant_information',''),(511,2,'default_order_status','Pedido Recebido'),(512,2,'merchant_minimum_order','5'),(513,2,'merchant_tax',''),(514,2,'merchant_delivery_charges','4'),(515,2,'stores_open_day',''),(516,2,'stores_open_starts','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(517,2,'stores_open_ends','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(518,2,'stores_open_custom_text','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(519,2,'merchant_photo',''),(520,2,'merchant_delivery_estimation','10 minutos'),(521,2,'merchant_delivery_miles','5'),(522,2,'merchant_photo_bg',''),(523,2,'merchant_disabled_cod',''),(524,2,'merchant_disabled_ccr',''),(525,2,'merchant_extenal',''),(526,2,'merchant_enabled_voucher',''),(527,2,'merchant_distance_type','km'),(528,2,'merchant_timezone',''),(529,2,'merchant_close_msg',''),(530,2,'merchant_preorder',''),(531,2,'merchant_maximum_order',''),(532,2,'merchant_packaging_charge',''),(533,2,'merchant_close_msg_holiday',''),(534,2,'merchant_holiday','[\\\"\\\"]'),(535,2,'merchant_activated_menu',''),(536,2,'spicydish',''),(537,2,'merchant_required_delivery_time',''),(538,2,'merchant_close_store',''),(539,2,'merchant_packaging_increment',''),(540,2,'merchant_show_time',''),(541,2,'merchant_enabled_tip',''),(542,2,'merchant_tip_default',''),(543,2,'merchant_minimum_order_pickup',''),(544,2,'merchant_maximum_order_pickup',''),(545,2,'merchant_disabled_ordering',''),(546,2,'merchant_tax_charges',''),(547,2,'stores_open_pm_start','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(548,2,'stores_open_pm_ends','{\\\"monday\\\":\\\"\\\",\\\"tuesday\\\":\\\"\\\",\\\"wednesday\\\":\\\"\\\",\\\"thursday\\\":\\\"\\\",\\\"friday\\\":\\\"\\\",\\\"saturday\\\":\\\"\\\",\\\"sunday\\\":\\\"\\\"}'),(549,2,'food_option_not_available',''),(550,2,'order_verification',''),(551,2,'order_sms_code_waiting',''),(552,2,'disabled_food_gallery',''),(553,2,'merchant_apply_tax',''),(554,2,'printing_receipt_width',''),(555,2,'printing_receipt_size',''),(556,2,'free_delivery_above_price',''),(557,2,'merchant_minimum_order_dinein','5'),(558,2,'merchant_maximum_order_dinein',''),(559,2,'food_viewing_private',''),(560,2,'merchant_tax_number',''),(561,2,'merchant_packaging_wise',''),(562,2,'merchant_show_category_image',''),(563,2,'merchant_two_flavor_option','1'),(564,2,'payment_provider','[\\\"2\\\",\\\"3\\\",\\\"4\\\"]'),(565,2,'merchant_payondeliver_enabled','yes'),(566,2,'driver_auto_assign_type','send_to_all'),(567,2,'driver_assign_request_expire',''),(568,2,'driver_enabled_auto_assign',''),(569,2,'driver_include_offline_driver',''),(570,2,'driver_autoassign_notify_email',''),(571,2,'driver_request_expire','1'),(572,2,'driver_within_radius',''),(573,2,'driver_within_radius_unit','mi'),(574,2,'driver_auto_assign_retry','1'),(575,3,'merchant_latitude','-21.82972'),(576,3,'merchant_longtitude','-49.2075'),(577,3,'merchant_information',''),(578,0,'fb_flag',''),(579,0,'fb_app_id','728641840939774'),(580,0,'fb_app_secret','0ced8439a45f16cf2836b4d6f2b5994b'),(581,0,'admin_fb_page','https://ipaoo.com.br/socialauth'),(582,0,'admin_twitter_page',''),(583,0,'admin_google_page',''),(584,0,'admin_merchant_share',''),(585,0,'google_client_id','144115779550-48hv8njn6qi4rb95qcpp2afcrjcfmeu9.apps.googleusercontent.com'),(586,0,'google_client_secret','plfYxNUYeFZL6LajwIn3gucX'),(587,0,'google_client_redirect_ulr','https://ipaoo.com.br/store/GoogleLogin'),(588,0,'google_login_enabled','2'),(589,0,'default_share_text',''),(590,0,'admin_intagram_page',''),(591,0,'admin_youtube_url','');
/*!40000 ALTER TABLE `mt_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_order`
--

DROP TABLE IF EXISTS `mt_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_order` (
  `order_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `json_details` text,
  `trans_type` varchar(100) NOT NULL DEFAULT '',
  `payment_type` varchar(100) NOT NULL DEFAULT '',
  `sub_total` float(14,4) NOT NULL DEFAULT '0.0000',
  `tax` float(14,4) NOT NULL DEFAULT '0.0000',
  `taxable_total` decimal(14,4) NOT NULL,
  `total_w_tax` float(14,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `stats_id` int(14) NOT NULL DEFAULT '0',
  `viewed` int(1) NOT NULL DEFAULT '1',
  `delivery_charge` float(14,4) NOT NULL DEFAULT '0.0000',
  `delivery_date` date DEFAULT NULL,
  `delivery_time` varchar(100) NOT NULL DEFAULT '',
  `delivery_asap` varchar(14) NOT NULL DEFAULT '',
  `delivery_instruction` varchar(255) NOT NULL DEFAULT '',
  `voucher_code` varchar(100) NOT NULL DEFAULT '',
  `voucher_amount` float(14,4) NOT NULL DEFAULT '0.0000',
  `voucher_type` varchar(100) NOT NULL DEFAULT '',
  `cc_id` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `order_change` float(14,4) NOT NULL DEFAULT '0.0000',
  `payment_provider_name` varchar(255) NOT NULL DEFAULT '',
  `discounted_amount` float(14,5) NOT NULL DEFAULT '0.00000',
  `discount_percentage` float(14,5) NOT NULL DEFAULT '0.00000',
  `percent_commision` float(14,4) NOT NULL DEFAULT '0.0000',
  `total_commission` float(14,4) NOT NULL DEFAULT '0.0000',
  `commision_ontop` int(2) NOT NULL DEFAULT '2',
  `merchant_earnings` float(14,4) NOT NULL DEFAULT '0.0000',
  `packaging` float(14,4) NOT NULL DEFAULT '0.0000',
  `cart_tip_percentage` float(14,4) NOT NULL DEFAULT '0.0000',
  `cart_tip_value` float(14,4) NOT NULL DEFAULT '0.0000',
  `card_fee` float(14,4) NOT NULL DEFAULT '0.0000',
  `donot_apply_tax_delivery` int(1) NOT NULL DEFAULT '1',
  `order_locked` int(1) NOT NULL DEFAULT '1',
  `request_from` varchar(10) NOT NULL DEFAULT 'web',
  `mobile_cart_details` text,
  `points_discount` float(14,4) NOT NULL DEFAULT '0.0000',
  `apply_food_tax` int(1) NOT NULL DEFAULT '0',
  `order_id_token` varchar(100) NOT NULL DEFAULT '',
  `admin_viewed` int(1) NOT NULL DEFAULT '0',
  `merchantapp_viewed` int(1) NOT NULL DEFAULT '0',
  `dinein_number_of_guest` varchar(14) NOT NULL DEFAULT '',
  `dinein_special_instruction` varchar(255) NOT NULL DEFAULT '',
  `critical` int(1) NOT NULL DEFAULT '1',
  `commision_type` varchar(50) NOT NULL DEFAULT 'percentage',
  `calculation_method` int(1) NOT NULL DEFAULT '1',
  `request_cancel` int(1) NOT NULL DEFAULT '2',
  `request_cancel_viewed` int(1) NOT NULL DEFAULT '2',
  `request_cancel_status` varchar(255) NOT NULL DEFAULT 'pending',
  `sofort_trans_id` varchar(255) NOT NULL DEFAULT '',
  `dinein_table_number` varchar(50) NOT NULL DEFAULT '',
  `payment_gateway_ref` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `client_id` (`client_id`),
  KEY `order_id_token` (`order_id_token`),
  KEY `merchantapp_viewed` (`merchantapp_viewed`),
  KEY `admin_viewed` (`admin_viewed`),
  KEY `viewed` (`viewed`),
  KEY `total_commission` (`total_commission`),
  KEY `merchant_earnings` (`merchant_earnings`),
  KEY `total_w_tax` (`total_w_tax`),
  KEY `taxable_total` (`taxable_total`),
  KEY `sub_total` (`sub_total`),
  KEY `payment_type` (`payment_type`),
  KEY `trans_type` (`trans_type`),
  KEY `payment_gateway_ref` (`payment_gateway_ref`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_order`
--

LOCK TABLES `mt_order` WRITE;
/*!40000 ALTER TABLE `mt_order` DISABLE KEYS */;
INSERT INTO `mt_order` VALUES (1,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":3,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mcd',3.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 22:19:43','2019-10-02 01:19:43','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.3000,1,2.7000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'U2SVW4NOUv',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(2,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":4,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',4.0000,0.0000,0.0000,4.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 22:25:19','2019-10-02 01:25:19','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.4000,1,3.6000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'j8GN9AdWOO',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(3,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":4,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','cod',4.0000,0.0000,0.0000,4.0000,'paid',0,2,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 22:25:33','2019-10-01 22:47:20','179.193.165.233',0.0000,'',0.00000,0.00000,10.0000,0.4000,1,3.6000,0.0000,0.0000,0.0000,0.0000,1,2,'web',NULL,0.0000,0,'bPHFETugIb',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(4,1,2,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',1.0000,0.0000,0.0000,1.0000,'paid',0,2,0.0000,'2019-10-01','10:28 PM','1','','',0.0000,'',0,'2019-10-01 22:29:15','2019-10-01 22:47:04','179.193.165.233',20.0000,'',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'w5YdvZPC3T',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(5,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"},{\"item_id\":\"2\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"2\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'paid',0,2,0.0000,'2019-10-01','10:34 PM','1','','',0.0000,'',0,'2019-10-01 22:36:26','2019-10-01 22:46:48','189.79.78.120',20.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"2\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"2\"}]',0.0000,0,'dBKNSiQGUq',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(6,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:13:31','2019-10-02 02:13:31','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'xm87jHIcVA',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(7,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:22:23','2019-10-02 02:22:23','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'MQUVvVzmQg',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(8,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mcd',2.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:23:48','2019-10-02 02:23:48','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'sU27xKKjpZ',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(9,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mcd',2.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:28:11','2019-10-02 02:28:11','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'7QKZjdFoBM',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(10,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:28:25','2019-10-02 02:28:25','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'SUJwSZevXk',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(11,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:30:47','2019-10-02 02:30:47','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'M3BMjpKa18',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(12,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:31:09','2019-10-02 02:31:09','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'Q3GU3vNy2w',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(13,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:32:42','2019-10-02 02:32:42','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'uihX4GqUe2',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(14,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:32:48','2019-10-02 02:32:48','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'9lxax7IrEs',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(15,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"2\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"2\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"be3qnv7t8nqsseoasuro3tg0h8\",\"YII_CSRF_TOKEN\":\"8b0e04e5d4796ce1583b92e774bcb19b41c2baa3\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','','1','','',0.0000,'',0,'2019-10-01 23:33:04','2019-10-02 02:33:04','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'DHtP9pzqc8',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(16,1,2,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-01','11:34 PM','1','','',0.0000,'',0,'2019-10-01 23:34:21','2019-10-02 02:34:21','201.95.66.116',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'vDSyUzbyqY',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(17,1,1,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"8619eac5b32d1cf0ce641258a99b067fa399cedc\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"sthlog2tlgvb3s90lgjjad6r4u\",\"YII_CSRF_TOKEN\":\"8619eac5b32d1cf0ce641258a99b067fa399cedc\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mercadopago',1.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-02','','1','','',0.0000,'',0,'2019-10-02 00:23:58','2019-10-02 03:23:58','187.116.108.144',0.0000,'',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,1.0000,1,1,'web',NULL,0.0000,0,'jWRltnnJaw',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(18,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',1.0000,0.0000,0.0000,1.0000,'successful',0,2,0.0000,'2019-10-02','11:00 PM','1','','',0.0000,'',0,'2019-10-02 23:01:12','2019-10-02 23:11:13','187.101.170.169',30.0000,'',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'IvFjR3iWeX',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(19,1,3,'[{\"item_id\":\"2\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"2\"},{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-02','11:11 PM','1','','',0.0000,'',0,'2019-10-02 23:12:14','2019-10-02 23:24:11','187.101.170.169',20.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"2\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"2\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'GO5bOrO4cQ',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(20,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',1.0000,0.0000,0.0000,1.0000,'successful',0,2,0.0000,'2019-10-02','11:14 PM','1','','',0.0000,'',0,'2019-10-02 23:14:51','2019-10-02 23:24:28','187.101.170.169',20.0000,'',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'sM6qa1kpRk',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(21,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',1.0000,0.0000,0.0000,1.0000,'successful',0,2,0.0000,'2019-10-02','11:30 PM','1','','',0.0000,'',0,'2019-10-02 23:31:10','2019-10-03 20:28:10','187.101.170.169',10.0000,'',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'rFYzFVncHh',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(22,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-03','08:24 PM','1','','',0.0000,'',0,'2019-10-03 20:25:23','2019-10-03 22:23:52','187.101.170.169',10.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'zhIXXtpVJW',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(23,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-03','10:19 PM','1','','',0.0000,'',0,'2019-10-03 22:19:58','2019-10-03 22:24:09','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'aNxAcw1KBJ',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(24,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-03','10:24 PM','1','','',0.0000,'',0,'2019-10-03 22:25:04','2019-10-03 22:26:11','187.101.170.169',10.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'RJkmuIFlzW',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(25,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-03','10:26 PM','1','','',0.0000,'',0,'2019-10-03 22:26:32','2019-10-04 21:12:19','187.101.170.169',1.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'NhmxNX9oPJ',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(26,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-03','10:34 PM','1','','',0.0000,'',0,'2019-10-03 22:35:21','2019-10-04 01:35:21','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'VF2meQthZE',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(27,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-03','10:34 PM','1','','',0.0000,'',0,'2019-10-03 22:35:29','2019-10-04 01:35:29','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'IOf3tWwPXF',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(28,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','vog',2.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-03','10:40 PM','1','','',0.0000,'',0,'2019-10-03 22:40:45','2019-10-04 01:40:45','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'WS5wuSQUxs',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(29,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','obd',2.0000,0.0000,0.0000,2.0000,'pending',0,2,0.0000,'2019-10-03','10:40 PM','1','','',0.0000,'',0,'2019-10-03 22:40:50','2019-10-04 01:40:51','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'eqRJ7C5jBh',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(30,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-03','10:45 PM','1','','',0.0000,'',0,'2019-10-03 22:45:35','2019-10-04 01:45:35','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'mAYS3auKF1',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(31,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','atz',2.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-03','10:45 PM','1','','',0.0000,'',0,'2019-10-03 22:45:40','2019-10-04 01:45:40','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'RKCox6EY64',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(32,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','obd',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-03','10:45 PM','1','','',0.0000,'',0,'2019-10-03 22:45:48','2019-10-04 21:11:48','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'B4AHCEXK1f',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(33,1,3,'[{\"item_id\":\"2\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"2\"}]','delivery','atz',2.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-03','10:49 PM','1','','',0.0000,'',0,'2019-10-03 22:50:05','2019-10-04 01:50:05','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"2\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"2\"},{\"item_id\":\"2\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"2\"}]',0.0000,0,'x7wAszxwiz',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(34,1,3,'[{\"item_id\":\"2\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"2\"}]','delivery','obd',2.0000,0.0000,0.0000,2.0000,'pending',0,2,0.0000,'2019-10-03','10:49 PM','1','','',0.0000,'',0,'2019-10-03 22:50:13','2019-10-04 01:50:13','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"2\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"2\"},{\"item_id\":\"2\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"2\"}]',0.0000,0,'XhVpu1wMbd',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(35,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','btr',2.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-03','10:50 PM','1','','',0.0000,'',0,'2019-10-03 22:50:37','2019-10-04 01:50:37','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'enoBUheigd',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(36,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','vog',2.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-03','10:50 PM','1','','',0.0000,'',0,'2019-10-03 22:50:40','2019-10-04 01:50:40','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'rvTHyiArrT',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(37,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',2.0000,0.0000,0.0000,3.0000,'initial_order',0,1,0.0000,'2019-10-04','06:12 AM','1','','',0.0000,'',0,'2019-10-04 07:06:18','2019-10-04 10:06:18','191.39.35.205',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'JYvL1ZMbDB',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(38,1,4,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'paid',0,2,0.0000,'2019-10-04','10:04 AM','1','','',0.0000,'',0,'2019-10-04 10:05:52','2019-10-04 11:08:42','187.116.108.144',0.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'CLEraluDO3',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(39,1,4,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":4,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',4.0000,0.0000,0.0000,4.0000,'paid',0,2,0.0000,'2019-10-04','10:06 AM','1','','',0.0000,'',0,'2019-10-04 10:10:16','2019-10-04 11:08:38','187.116.108.144',0.0000,'',0.00000,0.00000,10.0000,0.4000,1,3.6000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'qFONvstkkU',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(40,1,4,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',2.0000,0.0000,0.0000,2.0000,'paid',0,2,0.0000,'2019-10-04','10:10 AM','1','','',0.0000,'',0,'2019-10-04 10:19:15','2019-10-04 11:08:33','187.116.108.144',0.0000,'ello debito',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'GTsTneRhag',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(41,1,2,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',1.0000,0.0000,0.0000,1.0000,'paid',0,2,0.0000,'2019-10-04','10:50 AM','1','','',0.0000,'',0,'2019-10-04 10:50:39','2019-10-04 11:08:28','187.116.108.144',0.0000,'ello debito',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'sS3viGh3T1',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(42,1,2,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-04','11:19 AM','1','','',0.0000,'',0,'2019-10-04 11:20:11','2019-10-04 21:13:54','187.101.170.169',0.0000,'ello debito',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'XjPnzyTZ8J',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(43,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',2.0000,0.0000,0.0000,2.0000,'pending',0,2,0.0000,'2019-10-04','08:46 PM','1','','',0.0000,'',0,'2019-10-04 20:47:13','2019-10-04 23:47:13','187.101.170.169',0.0000,'visa debito',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'Q87rzedHay',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(44,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',1.0000,0.0000,0.0000,1.0000,'successful',0,2,0.0000,'2019-10-04','08:53 PM','1','','',0.0000,'',0,'2019-10-04 20:55:52','2019-10-04 21:13:44','187.101.170.169',0.0000,'Mastercard Crédito',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'OUFKk2Os5E',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(45,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',1.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-04','08:56 PM','1','','',0.0000,'',0,'2019-10-04 20:56:14','2019-10-04 23:56:14','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'eqIrDNBzpF',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(46,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',1.0000,0.0000,0.0000,2.0000,'initial_order',0,1,0.0000,'2019-10-04','09:02 PM','1','','',0.0000,'',0,'2019-10-04 21:02:25','2019-10-05 00:02:25','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'qeKKXknsir',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(47,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',1.0000,0.0000,0.0000,1.0000,'successful',0,2,0.0000,'2019-10-04','09:14 PM','1','','',0.0000,'',0,'2019-10-04 21:14:25','2019-10-04 21:17:20','187.101.170.169',0.0000,'Ello debito',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'ZJB33QjChm',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(48,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":8,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',8.0000,0.0000,0.0000,8.0000,'successful',0,2,0.0000,'2019-10-04','11:30 PM','1','','',0.0000,'',0,'2019-10-04 23:31:04','2019-10-05 23:22:30','187.101.170.169',0.0000,'Visa debito',0.00000,0.00000,10.0000,0.8000,1,7.2000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'LqNwPLYlej',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(49,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":3,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','mercadopago',3.0000,0.0000,0.0000,4.0000,'initial_order',0,1,0.0000,'2019-10-05','07:14 AM','1','','',0.0000,'',0,'2019-10-05 07:15:36','2019-10-05 10:15:36','187.101.170.169',0.0000,'',0.00000,0.00000,10.0000,0.3000,1,2.7000,0.0000,0.0000,0.0000,1.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'MNJ8SXWR26',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(50,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-05','06:59 PM','1','','',0.0000,'',0,'2019-10-05 19:00:24','2019-10-05 23:22:43','187.101.170.169',0.0000,'Mastercard Crédito',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'adkmWprkao',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(51,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','cod',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-05','09:58 PM','1','','',0.0000,'',0,'2019-10-05 22:05:41','2019-10-05 23:22:48','187.101.170.169',50.0000,'',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'caUXegaZE6',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(52,2,3,'[{\"item_id\":\"4\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"5|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"3\"}]','delivery','pyr',10.0000,0.0000,0.0000,10.0000,'paid',0,2,0.0000,'2019-10-05','11:11 PM','1','','',0.0000,'',0,'2019-10-05 23:13:43','2019-10-05 23:33:16','187.101.170.169',0.0000,'Visa debito',0.00000,0.00000,10.0000,1.0000,1,9.0000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]',0.0000,0,'n5YeSrty9V',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(53,1,3,'[{\"item_id\":\"1\",\"merchant_id\":\"1\",\"discount\":\"0\",\"price\":\"1|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"1\"}]','delivery','pyr',2.0000,0.0000,0.0000,2.0000,'successful',0,2,0.0000,'2019-10-05','11:26 PM','1','','',0.0000,'',0,'2019-10-05 23:26:37','2019-10-05 23:32:20','187.101.170.169',0.0000,'Visa debito',0.00000,0.00000,10.0000,0.2000,1,1.8000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"},{\"item_id\":\"1\",\"qty\":1,\"price\":\"1|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"1\"}]',0.0000,0,'HTpQgLS8mW',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(54,2,3,'[{\"item_id\":\"4\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"5|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"3\"}]','delivery','pyr',10.0000,0.0000,0.0000,10.0000,'paid',0,2,0.0000,'2019-10-05','11:27 PM','1','','',0.0000,'',0,'2019-10-05 23:27:40','2019-10-05 23:33:10','187.101.170.169',0.0000,'Mastercard Crédito',0.00000,0.00000,10.0000,1.0000,1,9.0000,0.0000,0.0000,0.0000,0.0000,1,2,'mobile_app','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]',0.0000,0,'wCtJlUQGxa',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(55,1,5,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":3,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"721cddd614c6e119e005d3696809dab25d0b0e0b\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"litnas6ndqlk7rvd6cd877m1si\",\"YII_CSRF_TOKEN\":\"721cddd614c6e119e005d3696809dab25d0b0e0b\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','cod',3.0000,0.0000,0.0000,3.0000,'preparando',0,1,0.0000,'2019-10-07','','1','','',0.0000,'',0,'2019-10-07 22:50:14','2019-10-08 01:50:14','187.101.170.169',20.0000,'',0.00000,0.00000,10.0000,0.3000,1,2.7000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'IMTtQPJoWR',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(56,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"3\",\"price\":\"2|medium|5\",\"qty\":2,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"5\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mcd',9.0000,0.0000,0.0000,13.0000,'initial_order',0,1,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 09:22:38','2019-10-20 12:22:38','189.79.85.100',0.0000,'',0.00000,0.00000,10.0000,0.9000,1,8.1000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'t7NWZ91L8q',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(57,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"3\",\"price\":\"2|medium|5\",\"qty\":2,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"5\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mcd',9.0000,0.0000,0.0000,13.0000,'initial_order',0,1,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 09:25:36','2019-10-20 12:25:36','189.79.85.100',0.0000,'',0.00000,0.00000,10.0000,0.9000,1,8.1000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'u9L6uA6Jxd',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(58,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"3\",\"price\":\"2|medium|5\",\"qty\":2,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"5\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','pyr',9.0000,0.0000,0.0000,13.0000,'Preparando',0,2,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 09:26:32','2019-10-20 10:27:01','189.79.85.100',0.0000,'Visa debito',0.00000,0.00000,10.0000,0.9000,1,8.1000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'mJYtJ6Wjet',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(59,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":2,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','pyr',10.0000,0.0000,0.0000,14.0000,'Preparando',0,2,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 09:33:36','2019-10-20 10:26:55','189.79.85.100',0.0000,'Ello debito',0.00000,0.00000,10.0000,1.0000,1,9.0000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'6JyhvensiM',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(60,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mcd',5.0000,0.0000,0.0000,9.0000,'initial_order',0,1,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 10:04:58','2019-10-20 13:04:58','189.79.85.100',0.0000,'',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'tqnKsUaS1A',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(61,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','mcd',5.0000,0.0000,0.0000,9.0000,'initial_order',0,1,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 10:06:04','2019-10-20 13:06:04','189.79.85.100',0.0000,'',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'hOvDXGdHm5',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(62,2,7,'[{\"item_id\":\"4\",\"row\":\"1\",\"merchant_id\":\"2\",\"discount\":\"\",\"currentController\":\"store\",\"category_id\":\"3\",\"with_size\":\"2\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"notes\":\"\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\"}]','delivery','mcd',5.0000,0.0000,0.0000,9.0000,'initial_order',0,1,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 10:16:00','2019-10-20 13:16:00','191.39.33.163',0.0000,'',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'ficObMfekY',0,0,'','',1,'percentage',1,2,2,'pending','','',''),(63,2,7,'[{\"item_id\":\"4\",\"row\":\"1\",\"merchant_id\":\"2\",\"discount\":\"\",\"currentController\":\"store\",\"category_id\":\"3\",\"with_size\":\"2\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"notes\":\"\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\"}]','delivery','cod',5.0000,0.0000,0.0000,9.0000,'successful',0,2,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 10:17:45','2019-10-20 10:51:54','189.79.85.100',10.0000,'',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'q7pYvovP3I',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(64,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','cod',5.0000,0.0000,0.0000,9.0000,'successful',0,2,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 10:23:50','2019-10-20 11:06:14','189.79.85.100',20.0000,'',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'m9p1a7Uhxp',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(65,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','pyr',5.0000,0.0000,0.0000,9.0000,'cancelled',0,2,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 11:49:52','2019-10-20 12:28:14','179.142.25.131',0.0000,'Ello debito',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'Gfg8Yx9tZ7',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(66,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','pyr',5.0000,0.0000,0.0000,9.0000,'Solicitando Entregador',0,2,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 18:46:20','2019-10-20 18:52:21','189.79.85.100',0.0000,'Mastercard Crédito',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'LpvToFCFwG',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(67,2,7,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"5\",\"price\":\"6|large|6\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"4\",\"csrf_token\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"qj12h7q2t4njijecijuvifbi51\",\"YII_CSRF_TOKEN\":\"52eaee3d33c99eabba742f6cde116022eb5ab9f2\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','pyr',11.0000,0.0000,0.0000,15.0000,'Solicitando Entregador',0,2,4.0000,'2019-10-20','','1','','',0.0000,'',0,'2019-10-20 19:26:53','2019-10-20 19:27:19','189.79.85.100',0.0000,'Mastercard Crédito',0.00000,0.00000,10.0000,1.1000,1,9.9000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'PlgjjzgHoV',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(68,1,10,'[{\"currentController\":\"store\",\"merchant_id\":\"1\",\"item_id\":\"1\",\"price\":\"1|small|1\",\"qty\":\"1\",\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"1\",\"csrf_token\":\"9ec8926cfcb01fac84f7c08c0e23b1842f3965bd\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"hds8q4fiioumummef9a8vchgn7\",\"YII_CSRF_TOKEN\":\"9ec8926cfcb01fac84f7c08c0e23b1842f3965bd\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','pyr',1.0000,0.0000,0.0000,1.0000,'preparando',0,1,0.0000,'2019-10-21','','1','','',0.0000,'',0,'2019-10-21 00:20:34','2019-10-21 03:20:34','189.79.85.100',0.0000,'Visa debito',0.00000,0.00000,10.0000,0.1000,1,0.9000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'bCyZmZPI8d',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(69,2,7,'[{\"item_id\":\"5\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"6|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"4\"},{\"item_id\":\"4\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"5|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"3\"}]','delivery','pyr',16.0000,0.0000,0.0000,20.0000,'Pedido Recebido',0,2,4.0000,'2019-10-21','06:37 AM','1','','',0.0000,'',0,'2019-10-21 06:38:19','2019-10-21 09:38:19','189.79.85.100',0.0000,'Visa debito',0.00000,0.00000,10.0000,1.6000,1,14.4000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"5\",\"qty\":1,\"price\":\"6|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"4\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]',0.0000,0,'b7fB7DJkYi',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(70,2,11,'[{\"item_id\":\"4\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"5|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"3\"}]','delivery','pyr',5.0000,0.0000,0.0000,9.0000,'Solicitando Entregador',0,2,4.0000,'2019-10-21','07:50 PM','','','',0.0000,'',0,'2019-10-21 19:52:28','2019-10-21 21:59:32','177.33.141.87',0.0000,'Visa debito',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]',0.0000,0,'QIJC5K8olh',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(71,2,11,'[{\"item_id\":\"5\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"6|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"4\"}]','delivery','pyr',6.0000,0.0000,0.0000,10.0000,'Solicitando Entregador',0,2,4.0000,'2019-10-21','07:55 PM','1','','',0.0000,'',0,'2019-10-21 19:56:34','2019-10-21 21:59:26','177.33.141.87',0.0000,'Visa debito',0.00000,0.00000,10.0000,0.6000,1,5.4000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"5\",\"qty\":1,\"price\":\"6|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"4\"}]',0.0000,0,'KPSZ8kok7n',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(72,2,11,'[{\"item_id\":\"4\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"5|\",\"qty\":1,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"3\"}]','delivery','cod',5.0000,0.0000,0.0000,9.0000,'Solicitando Entregador',0,2,4.0000,'2019-10-21','07:58 PM','','','',0.0000,'',0,'2019-10-21 19:58:44','2019-10-21 22:31:22','177.33.141.87',50.0000,'',0.00000,0.00000,10.0000,0.5000,1,4.5000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]',0.0000,0,'SmVnXya45K',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(73,2,3,'[{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"4\",\"price\":\"5|medium|5\",\"qty\":18,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"3\",\"csrf_token\":\"9ec8926cfcb01fac84f7c08c0e23b1842f3965bd\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"hds8q4fiioumummef9a8vchgn7\",\"YII_CSRF_TOKEN\":\"9ec8926cfcb01fac84f7c08c0e23b1842f3965bd\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"},{\"currentController\":\"store\",\"merchant_id\":\"2\",\"item_id\":\"5\",\"price\":\"6|medium|5\",\"qty\":5,\"discount\":\"\",\"notes\":\"\",\"row\":\"\",\"category_id\":\"4\",\"csrf_token\":\"9ec8926cfcb01fac84f7c08c0e23b1842f3965bd\",\"auto_add_cart\":\"1\",\"yii_session_token\":\"hds8q4fiioumummef9a8vchgn7\",\"YII_CSRF_TOKEN\":\"9ec8926cfcb01fac84f7c08c0e23b1842f3965bd\",\"two_flavors\":\"\",\"non_taxable\":\"1\",\"sub_item\":\"\"}]','delivery','pyr',120.0000,0.0000,0.0000,124.0000,'Pedido Recebido',0,2,4.0000,'2019-10-21','','1','','',0.0000,'',0,'2019-10-21 22:58:52','2019-10-22 01:58:52','189.79.85.100',0.0000,'Ello debito',0.00000,0.00000,10.0000,12.0000,1,108.0000,0.0000,0.0000,0.0000,0.0000,1,1,'web',NULL,0.0000,0,'eNABixB49Q',1,0,'','',1,'percentage',1,2,2,'pending','','',''),(74,2,8,'[{\"item_id\":\"4\",\"merchant_id\":\"2\",\"discount\":\"0\",\"price\":\"5|\",\"qty\":2,\"two_flavors\":\"0\",\"cooking_ref\":[],\"ingredients\":[],\"notes\":\"\",\"order_notes\":\"\",\"sub_item\":[],\"addon_qty\":[],\"addon_ids\":[],\"non_taxable\":\"1\",\"category_id\":\"3\"}]','delivery','pyr',10.0000,0.0000,0.0000,14.0000,'Pedido Recebido',0,1,4.0000,'2019-10-21','11:22 PM','1','','',0.0000,'',0,'2019-10-21 23:23:46','2019-10-22 02:23:46','189.79.85.100',0.0000,'Visa debito',0.00000,0.00000,10.0000,1.0000,1,9.0000,0.0000,0.0000,0.0000,0.0000,1,1,'mobile_app','[{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"},{\"item_id\":\"4\",\"qty\":1,\"price\":\"5|\",\"sub_item\":[],\"cooking_ref\":[],\"ingredients\":[],\"order_notes\":\"\",\"discount\":\"0\",\"category_id\":\"3\"}]',0.0000,0,'vo7iuatiHD',1,0,'','',1,'percentage',1,2,2,'pending','','','');
/*!40000 ALTER TABLE `mt_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_order_delivery_address`
--

DROP TABLE IF EXISTS `mt_order_delivery_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_order_delivery_address` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(255) NOT NULL DEFAULT '',
  `location_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `contact_phone` varchar(100) NOT NULL DEFAULT '',
  `formatted_address` text,
  `google_lat` varchar(50) NOT NULL DEFAULT '',
  `google_lng` varchar(50) NOT NULL DEFAULT '',
  `area_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `client_id` (`client_id`),
  KEY `google_lat` (`google_lat`),
  KEY `google_lng` (`google_lng`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_order_delivery_address`
--

LOCK TABLES `mt_order_delivery_address` WRITE;
/*!40000 ALTER TABLE `mt_order_delivery_address` DISABLE KEYS */;
INSERT INTO `mt_order_delivery_address` VALUES (1,1,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 22:19:43','201.95.66.116','+551122334455',NULL,'','',''),(2,2,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 22:25:19','201.95.66.116','+551122334455',NULL,'','',''),(3,3,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 22:25:33','201.95.66.116','+551122334455',NULL,'','',''),(4,4,2,'Av. Portugal, 894','Santo André','São Paulo','09040','','Brazil','2019-10-01 22:29:15','201.95.66.116','+5522334455','Padaria Portugal, Av. Portugal, 894, Santo André, São Paulo 09040, Brazil','','',''),(5,5,3,'Deputado Cássio Ciampolini, 127','São Paulo','São Paulo','02471130','','Brazil','2019-10-01 22:36:26','189.79.78.120','+5511988888888','Rua Deputado Cassio Ciampolini 127, São Paulo - São Paulo, 02471, Brazil','-23.4825173','-46.6499973',''),(6,6,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:13:31','201.95.66.116','+551122334455',NULL,'','',''),(7,7,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:22:23','201.95.66.116','+551122334455',NULL,'','',''),(8,8,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:23:48','201.95.66.116','+551122334455',NULL,'','',''),(9,9,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:28:12','201.95.66.116','+551122334455',NULL,'','',''),(10,10,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:28:25','201.95.66.116','+551122334455',NULL,'','',''),(11,11,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:30:47','201.95.66.116','+551122334455',NULL,'','',''),(12,12,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:31:09','201.95.66.116','+551122334455',NULL,'','',''),(13,13,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:32:42','201.95.66.116','+551122334455',NULL,'','',''),(14,14,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:32:48','201.95.66.116','+551122334455',NULL,'','',''),(15,15,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-01 23:33:04','201.95.66.116','+551122334455',NULL,'','',''),(16,16,2,'Rua Tito','Santo André','São Paulo','09040','','Brazil','2019-10-01 23:34:21','201.95.66.116','+5522334455','Escola Arte Ideal, Rua Tito, Santo André, São Paulo 09040, Brazil','','',''),(17,17,1,'rua campos sales, 215','santo andre','sp','09015-200','113','Brazil','2019-10-02 00:23:58','187.116.108.144','+551122334455',NULL,'','',''),(18,18,3,'Deputado Cássio Ciampolini, 127','São Paulo','São Paulo','02471130','','Brazil','2019-10-02 23:01:12','187.101.170.169','+5511988888888','Rua Deputado Cassio Ciampolini 127, São Paulo - São Paulo, 02471, Brazil','','',''),(19,19,3,'Deputado Cássio Ciampolini, 127','São Paulo','São Paulo','02471130','','Brazil','2019-10-02 23:12:14','187.101.170.169','+5511988888888','Rua Deputado Cassio Ciampolini 127, São Paulo - São Paulo, 02471, Brazil','','',''),(20,20,3,'Deputado Cássio Ciampolini, 127','São Paulo','São Paulo','02471139','','Brazil','2019-10-02 23:14:52','187.101.170.169','+5511988888888','Rua Deputado Cassio Ciampolini 127, São Paulo - São Paulo, 02471, Brazil','','',''),(21,21,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-02 23:31:10','187.101.170.169','+5511988888888','','','',''),(22,22,3,'Rua deputado Cássio ciampolini,127','São Paulo','Sp','02471130','','Brazil','2019-10-03 20:25:23','187.101.170.169','+5511988888888','','','',''),(23,23,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:19:58','187.101.170.169','+5511988888888','','','',''),(24,24,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:25:04','187.101.170.169','+5511988888888','','','',''),(25,25,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:26:32','187.101.170.169','+5511988888888','','','',''),(26,26,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:35:21','187.101.170.169','+5511988888888','','','',''),(27,27,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:35:29','187.101.170.169','+5511988888888','','','',''),(28,28,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:40:45','187.101.170.169','+5511988888888','','','',''),(29,29,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:40:51','187.101.170.169','+5511988888888','','','',''),(30,30,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:45:35','187.101.170.169','+5511988888888','','','',''),(31,31,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:45:40','187.101.170.169','+5511988888888','','','',''),(32,32,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:45:48','187.101.170.169','+5511988888888','','','',''),(33,33,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:50:05','187.101.170.169','+5511988888888','','','',''),(34,34,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:50:13','187.101.170.169','+5511988888888','','','',''),(35,35,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:50:37','187.101.170.169','+5511988888888','','','',''),(36,36,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-03 22:50:40','187.101.170.169','+5511988888888','','','',''),(37,37,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-04 07:06:18','191.39.35.205','+5511988888888','','','',''),(38,38,4,'Capuava','Santo André','São Paulo','09251','','Brazil','2019-10-04 10:05:52','187.116.108.144','+55183736','Rua Tunísia, Parque Oratório, Santo André - São Paulo, 09251, Brazil','','',''),(39,39,4,'Capuava','Santo André','São Paulo','09251','','Brazil','2019-10-04 10:10:16','187.116.108.144','+55183736','Rua Tunísia, Parque Oratório, Santo André - São Paulo, 09251, Brazil','','',''),(40,40,4,'Capuava','Santo André','São Paulo','09251','','Brazil','2019-10-04 10:19:15','187.116.108.144','+55183736','Rua Tunísia, Parque Oratório, Santo André - São Paulo, 09251, Brazil','','',''),(41,41,2,'Capuava','Santo André','São Paulo','09251','','Brazil','2019-10-04 10:50:39','187.116.108.144','+5522334455','Rua Tunísia, Parque Oratório, Santo André - São Paulo, 09251, Brazil','','',''),(42,42,2,'Sapopemba','Santo André','São Paulo','09251','','Brazil','2019-10-04 11:20:11','187.116.108.144','+5522334455','Rua Angola, Parque Oratório, Santo André - São Paulo, 09251, Brazil','','',''),(43,43,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-04 20:47:13','187.101.170.169','+5511988888888','','','',''),(44,44,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-04 20:55:52','187.101.170.169','+5511988888888','','','',''),(45,45,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-04 20:56:14','187.101.170.169','+5511988888888','','','',''),(46,46,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-04 21:02:25','187.101.170.169','+5511988888888','','','',''),(47,47,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-04 21:14:25','187.101.170.169','+5511988888888','','','',''),(48,48,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-04 23:31:04','187.101.170.169','+5511988888888','','','',''),(49,49,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-05 07:15:36','187.101.170.169','+5511988888888','','','',''),(50,50,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-05 19:00:24','191.39.25.184','+5511988888888','','','',''),(51,51,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-05 22:05:41','187.101.170.169','+5511988888888','','','',''),(52,52,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-05 23:13:43','187.101.170.169','+5511988888888','','','',''),(53,53,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-05 23:26:37','187.101.170.169','+5511988888888','','','',''),(54,54,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-05 23:27:40','187.101.170.169','+5511988888888','','','',''),(55,55,5,'Engeheiro Caetano Alvares, 123','São Paulo','SP','02546-000','','Brazil','2019-10-07 22:50:14','187.101.170.169','+5511970960399',NULL,'','',''),(56,56,7,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo',' 02471','','','Brazil','2019-10-20 09:22:38','189.79.85.100','+5511957702023',NULL,'','',''),(57,57,7,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo',' 02471','','','Brazil','2019-10-20 09:25:36','189.79.85.100','+5511957702023',NULL,'','',''),(58,58,7,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo','SP','02471130','','Brazil','2019-10-20 09:26:32','189.79.85.100','+5511957702023',NULL,'','',''),(59,59,7,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo','SP','02471130','','Brazil','2019-10-20 09:33:36','189.79.85.100','+5511957702023',NULL,'','',''),(60,60,7,'Rua Deputado Cassio Ciampolini 2655',' São Paulo - São Paulo',' 02471','','','Brazil','2019-10-20 10:04:58','189.79.85.100','+5511957702023',NULL,'','',''),(61,61,7,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo','SP','02471130','','Brazil','2019-10-20 10:06:04','189.79.85.100','+5511957702025',NULL,'','',''),(62,62,7,'Avenida Imirim, 1895',' São Paulo - São Paulo','SP','02465-200','','Brazil','2019-10-20 10:16:00','191.39.33.163','+5511957702025',NULL,'','',''),(63,63,7,'Avenida Imirim, 1895',' São Paulo - São Paulo','SP','02465-200','','Brazil','2019-10-20 10:17:45','189.79.85.100','+5511957702025',NULL,'','',''),(64,64,7,'Avenida Imirim, 1895',' São Paulo - São Paulo','SP','02465-200','','Brazil','2019-10-20 10:23:50','189.79.85.100','+5511957702025',NULL,'','',''),(65,65,7,'Avenida Imirim, 1895',' São Paulo - São Paulo','SP','02465-200','','Brazil','2019-10-20 11:49:52','189.79.85.100','+5511957702025',NULL,'','',''),(66,66,7,'Avenida Imirim, 1895',' São Paulo - São Paulo','SP','02465-200','','Brazil','2019-10-20 18:46:20','189.79.85.100','+5511957702025',NULL,'','',''),(67,67,7,'Avenida Imirim, 1895',' São Paulo - São Paulo','SP','02465-200','','Brazil','2019-10-20 19:26:53','189.79.85.100','+5511957702025',NULL,'','',''),(68,68,10,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo',' 02471','','','Brazil','2019-10-21 00:20:34','189.79.85.100','+5511958585858',NULL,'','',''),(69,69,7,'Rua Deputado Cassio Ciampolini 266',' São Paulo - São Paulo','SP','02471130','','Brazil','2019-10-21 06:38:19','189.79.85.100','+5511957702025','','','',''),(70,70,11,'Rua george chahestian 11 apto 123','São Paulo','São Paulo','02471120','','Brazil','2019-10-21 19:52:28','177.33.141.87','+5511957702023','Rua Deputado Cassio Ciampolini 153, São Paulo - São Paulo, 02471, Brazil','-23.4816835','-46.6490906',''),(71,71,11,'Rua george chahestian 11 apto 123','São Paulo','São Paulo','02471','','Brazil','2019-10-21 19:56:34','177.33.141.87','+5511957702023','Rua George Chahestian 11, São Paulo - São Paulo, 02471, Brazil','-23.4816756','-46.6490987',''),(72,72,11,'Rua george chahestian 11 apto 123','São Paulo','São Paulo','02471','','Brazil','2019-10-21 19:58:44','177.33.141.87','+5511957702023','Rua george chahestian 11 apto 123 São Paulo São Paulo 02471','','',''),(73,73,3,'Rua deputado Cássio ciampolini','São Paulo','Sp','02471130','','Brazil','2019-10-21 22:58:52','189.79.85.100','+5511988888888',NULL,'','',''),(74,74,8,'Deputado Cássio Ciampolini','Sp','São Paulo','02471130','','Brazil','2019-10-21 23:23:46','189.79.85.100','+5511988888888','Rua Deputado Cassio Ciampolini 127, São Paulo - São Paulo, 02471, Brazil','-23.4823324','-46.6500669','');
/*!40000 ALTER TABLE `mt_order_delivery_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_order_details`
--

DROP TABLE IF EXISTS `mt_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_order_details` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `item_id` int(14) NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `order_notes` text,
  `normal_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `discounted_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `size` varchar(255) NOT NULL DEFAULT '',
  `qty` int(14) NOT NULL DEFAULT '0',
  `cooking_ref` varchar(255) NOT NULL DEFAULT '',
  `addon` text,
  `ingredients` text,
  `non_taxable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `client_id` (`client_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_order_details`
--

LOCK TABLES `mt_order_details` WRITE;
/*!40000 ALTER TABLE `mt_order_details` DISABLE KEYS */;
INSERT INTO `mt_order_details` VALUES (1,1,1,1,'Pao de Leite','',1.0000,1.0000,'small',3,'','','\"\"',1),(2,2,1,1,'Pao de Leite','',1.0000,1.0000,'small',4,'','','\"\"',1),(3,3,1,1,'Pao de Leite','',1.0000,1.0000,'small',4,'','','\"\"',1),(4,4,2,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(5,5,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(6,5,3,2,'Pão','',1.0000,1.0000,'',1,'','[]','[]',1),(7,6,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(8,6,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(9,7,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(10,7,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(11,8,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(12,8,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(13,9,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(14,9,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(15,10,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(16,10,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(17,11,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(18,11,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(19,12,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(20,12,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(21,13,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(22,13,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(23,14,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(24,14,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(25,15,1,2,'Pão','',1.0000,1.0000,'small',1,'','','\"\"',1),(26,15,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(27,16,2,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(28,17,1,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(29,18,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(30,19,3,2,'Pão','',1.0000,1.0000,'',1,'','[]','[]',1),(31,19,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(32,20,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(33,21,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(34,22,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(35,23,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(36,24,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(37,25,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(38,26,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(39,27,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(40,28,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(41,29,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(42,30,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(43,31,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(44,32,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(45,33,3,2,'Pão','',1.0000,1.0000,'',2,'','[]','[]',1),(46,34,3,2,'Pão','',1.0000,1.0000,'',2,'','[]','[]',1),(47,35,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(48,36,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(49,37,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(50,38,4,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(51,39,4,1,'Pao de Leite','',1.0000,1.0000,'',4,'','[]','[]',1),(52,40,4,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(53,41,2,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(54,42,2,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(55,43,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(56,44,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(57,45,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(58,46,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(59,47,3,1,'Pao de Leite','',1.0000,1.0000,'',1,'','[]','[]',1),(60,48,3,1,'Pao de Leite','',1.0000,1.0000,'',8,'','[]','[]',1),(61,49,3,1,'Pao de Leite','',1.0000,1.0000,'',3,'','[]','[]',1),(62,50,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(63,51,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(64,52,3,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'',2,'','[]','[]',1),(65,53,3,1,'Pao de Leite','',1.0000,1.0000,'',2,'','[]','[]',1),(66,54,3,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'',2,'','[]','[]',1),(67,55,5,1,'Pao de Leite','',1.0000,1.0000,'small',3,'','','\"\"',1),(68,56,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(69,56,7,3,'Mortandela Marba','',2.0000,2.0000,'medium',2,'','','\"\"',1),(70,57,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(71,57,7,3,'Mortandela Marba','',2.0000,2.0000,'medium',2,'','','\"\"',1),(72,58,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(73,58,7,3,'Mortandela Marba','',2.0000,2.0000,'medium',2,'','','\"\"',1),(74,59,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',2,'','','\"\"',1),(75,60,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(76,61,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(77,62,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(78,63,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(79,64,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(80,65,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(81,66,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(82,67,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',1,'','','\"\"',1),(83,67,7,5,'Bolo de Chocolate','',6.0000,6.0000,'large',1,'','','\"\"',1),(84,68,10,1,'Pao de Leite','',1.0000,1.0000,'small',1,'','','\"\"',1),(85,69,7,5,'Bolo de Chocolate','',6.0000,6.0000,'',1,'','[]','[]',1),(86,69,7,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'',2,'','[]','[]',1),(87,70,11,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'',1,'','[]','[]',1),(88,71,11,5,'Bolo de Chocolate','',6.0000,6.0000,'',1,'','[]','[]',1),(89,72,11,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'',1,'','[]','[]',1),(90,73,3,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'medium',18,'','','\"\"',1),(91,73,3,5,'Bolo de Chocolate','',6.0000,6.0000,'medium',5,'','','\"\"',1),(92,74,8,4,'Leite de Caixinha Tipo A','',5.0000,5.0000,'',2,'','[]','[]',1);
/*!40000 ALTER TABLE `mt_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_order_history`
--

DROP TABLE IF EXISTS `mt_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_order_history` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '',
  `remarks` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `task_id` int(14) NOT NULL DEFAULT '0',
  `reason` text,
  `customer_signature` varchar(255) NOT NULL DEFAULT '',
  `notification_viewed` int(1) NOT NULL DEFAULT '2',
  `driver_id` int(14) NOT NULL DEFAULT '0',
  `driver_location_lat` varchar(50) NOT NULL DEFAULT '',
  `driver_location_lng` varchar(50) NOT NULL DEFAULT '',
  `remarks2` varchar(255) NOT NULL DEFAULT '',
  `remarks_args` varchar(255) NOT NULL DEFAULT '',
  `notes` varchar(255) NOT NULL DEFAULT '',
  `photo_task_id` int(14) NOT NULL DEFAULT '0',
  `receive_by` varchar(255) NOT NULL DEFAULT '',
  `signature_base30` text,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`),
  KEY `task_id` (`task_id`),
  KEY `driver_id` (`driver_id`),
  KEY `driver_location_lat` (`driver_location_lat`),
  KEY `driver_location_lng` (`driver_location_lng`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_order_history`
--

LOCK TABLES `mt_order_history` WRITE;
/*!40000 ALTER TABLE `mt_order_history` DISABLE KEYS */;
INSERT INTO `mt_order_history` VALUES (1,3,'accepted','','2019-10-01 22:25:51','201.95.66.116',0,NULL,'',2,0,'','','','','',0,'',NULL),(2,3,'assigned','Status updated from assigned to assigned','2019-10-01 22:26:08','201.95.66.116',100000,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(3,3,'acknowledged','Alex Freire Aquino accepted the task','2019-10-01 22:26:31','179.193.165.233',100000,NULL,'',2,1,'-23.6642392','-46.533632','{driver_name} accepted the task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(4,3,'started','Alex Freire Aquino started this task','2019-10-01 22:26:33','179.193.165.233',100000,NULL,'',2,1,'-23.664211666666667','-46.53362666666667','{driver_name} started this task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(5,3,'inprogress','Alex Freire Aquino reached the destination','2019-10-01 22:27:10','179.193.165.233',100000,NULL,'',2,1,'-23.6643259','-46.5335668','{driver_name} reached the destination','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(6,3,'sign','Alex Freire Aquino added a signature','2019-10-01 22:27:18','179.193.165.233',100000,NULL,'signature_100000-60466676436.png',2,1,'-23.664265','-46.533605','{driver_name} added a signature','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'','image/jsignature;base30,3wh1vc964201456541Z4acggda64Y12bkplha6Z1366772Y2bcc953Z29fijec7Y5q1ysibZ48knpib1Y8i1vrmd2Z253_5XZ91ylold8Yahsqmh74Z7egd7Y13898470Z3aeiihc60Y4ahroi74Z228ihc6Y1331Z21Y268frsl3Z91x1xpmc0Y5imid5'),(7,3,'successful','Alex Freire Aquino Completed the task successfully','2019-10-01 22:27:21','179.193.165.233',100000,NULL,'',2,1,'-23.664201666666667','-46.53361666666667','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(8,4,'pending',NULL,'2019-10-01 22:29:15','201.95.66.116',0,NULL,'',2,0,'','','','','',0,'',NULL),(9,4,'accepted','','2019-10-01 22:29:42','201.95.66.116',0,NULL,'',2,0,'','','','','',0,'',NULL),(10,4,'assigned','Status updated from assigned to assigned','2019-10-01 22:30:16','201.95.66.116',100001,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(11,4,'acknowledged','Alex Freire Aquino accepted the task','2019-10-01 22:30:35','179.193.165.233',100001,NULL,'',2,1,'-23.663974999999997','-46.53368666666667','{driver_name} accepted the task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(12,4,'started','Alex Freire Aquino started this task','2019-10-01 22:30:37','179.193.165.233',100001,NULL,'',2,1,'-23.66414166666667','-46.53367166666667','{driver_name} started this task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(13,4,'inprogress','Alex Freire Aquino reached the destination','2019-10-01 22:30:48','179.193.165.233',100001,NULL,'',2,1,'-23.664274999999996','-46.533685','{driver_name} reached the destination','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(14,4,'successful','Alex Freire Aquino Completed the task successfully','2019-10-01 22:32:46','179.193.165.233',100001,NULL,'',2,1,'-23.6639849','-46.5336451','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(15,5,'pending',NULL,'2019-10-01 22:36:26','189.79.78.120',0,NULL,'',2,0,'','','','','',0,'',NULL),(16,4,'sign','Alex Freire Aquino added a signature','2019-10-01 22:37:08','179.193.165.233',100001,NULL,'signature_100001-65292307899.png',2,1,'-23.664188333333332','-46.533530000000006','{driver_name} added a signature','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'','image/jsignature;base30,1Q9gefeeba54Z65611Y243Z4568764220Y1bhiieb74Z169b964Y13556668753Z12444420Y5bed95Z34863Y39a9853_5X5Z2bkqtqmd6Y8q1u1upkc6Z8ifc73Y134640Zafkjifb6Y39glpolhc840Z4ciigb92Y1257666689cbb85Z5hs1y1wria'),(17,5,'started','','2019-10-01 22:37:28','189.79.78.120',0,NULL,'',2,0,'','','','','',0,'',NULL),(18,5,'accepted','','2019-10-01 22:37:49','189.79.78.120',0,NULL,'',2,0,'','','','','',0,'',NULL),(19,5,'assigned','Status updated from assigned to assigned','2019-10-01 22:40:03','201.95.66.116',100002,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(20,5,'acknowledged','Marcio Takara accepted the task','2019-10-01 22:44:15','189.79.78.120',100002,NULL,'',2,2,'-23.4825202','-46.6499963','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(21,5,'started','Marcio Takara started this task','2019-10-01 22:44:19','189.79.78.120',100002,NULL,'',2,2,'-23.4825184','-46.6499931','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(22,5,'inprogress','Marcio Takara reached the destination','2019-10-01 22:44:21','189.79.78.120',100002,NULL,'',2,2,'-23.4825184','-46.6499931','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(23,5,'successful','Marcio Takara Completed the task successfully','2019-10-01 22:44:23','189.79.78.120',100002,NULL,'',2,2,'-23.4825184','-46.6499931','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(24,5,'paid','','2019-10-01 22:46:48','189.79.78.120',0,NULL,'',2,0,'','','','','',0,'',NULL),(25,4,'paid','','2019-10-01 22:47:04','189.79.78.120',0,NULL,'',2,0,'','','','','',0,'',NULL),(26,3,'paid','','2019-10-01 22:47:20','189.79.78.120',0,NULL,'',2,0,'','','','','',0,'',NULL),(27,16,'initial_order',NULL,'2019-10-01 23:34:21','201.95.66.116',0,NULL,'',2,0,'','','','','',0,'',NULL),(28,18,'pending',NULL,'2019-10-02 23:01:12','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(29,18,'inprogress','','2019-10-02 23:01:57','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(30,18,'accepted','','2019-10-02 23:03:24','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(31,18,'assigned','Status updated from assigned to assigned','2019-10-02 23:09:12','187.101.170.169',100003,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(32,18,'acknowledged','Marcio Takara accepted the task','2019-10-02 23:11:09','187.101.170.169',100003,NULL,'',2,2,'-23.482317','-46.6501058','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(33,18,'started','Marcio Takara started this task','2019-10-02 23:11:11','187.101.170.169',100003,NULL,'',2,2,'-23.482317','-46.6501058','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(34,18,'inprogress','Marcio Takara reached the destination','2019-10-02 23:11:12','187.101.170.169',100003,NULL,'',2,2,'-23.4823173','-46.6501055','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(35,18,'successful','Marcio Takara Completed the task successfully','2019-10-02 23:11:13','187.101.170.169',100003,NULL,'',2,2,'-23.4823173','-46.6501055','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(36,19,'pending',NULL,'2019-10-02 23:12:14','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(37,19,'inprogress','','2019-10-02 23:13:03','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(38,19,'accepted','','2019-10-02 23:13:14','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(39,19,'assigned','Status updated from assigned to assigned','2019-10-02 23:13:49','187.101.170.169',100004,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(40,20,'pending',NULL,'2019-10-02 23:14:52','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(41,20,'inprogress','','2019-10-02 23:15:14','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(42,20,'accepted','','2019-10-02 23:15:20','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(43,20,'assigned','Status updated from assigned to assigned','2019-10-02 23:16:33','187.101.170.169',100005,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(44,19,'successful','Status updated from assigned to successful','2019-10-02 23:24:11','187.101.170.169',100004,'','',2,0,'','','','','',0,'',NULL),(45,20,'successful','Status updated from assigned to successful','2019-10-02 23:24:28','187.101.170.169',100005,'','',2,0,'','','','','',0,'',NULL),(46,21,'pending',NULL,'2019-10-02 23:31:10','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(47,21,'accepted','','2019-10-02 23:31:43','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(48,21,'assigned','Status updated from assigned to assigned','2019-10-02 23:39:10','187.101.170.169',100006,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(49,22,'pending',NULL,'2019-10-03 20:25:23','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(50,21,'acknowledged','Marcio Takara accepted the task','2019-10-03 20:28:06','187.101.170.169',100006,NULL,'',2,2,'-23.482337','-46.6500789','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(51,21,'started','Marcio Takara started this task','2019-10-03 20:28:07','187.101.170.169',100006,NULL,'',2,2,'-23.482337','-46.6500789','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(52,21,'inprogress','Marcio Takara reached the destination','2019-10-03 20:28:09','187.101.170.169',100006,NULL,'',2,2,'-23.4823385','-46.6500787','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(53,21,'successful','Marcio Takara Completed the task successfully','2019-10-03 20:28:10','187.101.170.169',100006,NULL,'',2,2,'-23.4823385','-46.6500787','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(54,22,'accepted','','2019-10-03 22:07:30','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(55,23,'pending',NULL,'2019-10-03 22:19:58','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(56,23,'inprogress','','2019-10-03 22:20:28','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(57,23,'accepted','','2019-10-03 22:21:20','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(58,23,'assigned','Status updated from assigned to assigned','2019-10-03 22:21:43','187.101.170.169',100008,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(59,23,'accepted','','2019-10-03 22:23:01','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(60,22,'assigned','Status updated from assigned to assigned','2019-10-03 22:23:20','187.101.170.169',100007,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(61,22,'acknowledged','Marcio Takara accepted the task','2019-10-03 22:23:48','187.101.170.169',100007,NULL,'',2,2,'-23.4823318','-46.6500403','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(62,22,'started','Marcio Takara started this task','2019-10-03 22:23:49','187.101.170.169',100007,NULL,'',2,2,'-23.4823318','-46.6500403','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(63,22,'inprogress','Marcio Takara reached the destination','2019-10-03 22:23:52','187.101.170.169',100007,NULL,'',2,2,'-23.4823318','-46.6500403','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(64,22,'successful','Marcio Takara Completed the task successfully','2019-10-03 22:23:52','187.101.170.169',100007,NULL,'',2,2,'-23.4823318','-46.6500403','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(65,23,'acknowledged','Marcio Takara accepted the task','2019-10-03 22:24:07','187.101.170.169',100008,NULL,'',2,2,'-23.4823318','-46.6500401','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(66,23,'started','Marcio Takara started this task','2019-10-03 22:24:08','187.101.170.169',100008,NULL,'',2,2,'-23.4823318','-46.6500401','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(67,23,'inprogress','Marcio Takara reached the destination','2019-10-03 22:24:08','187.101.170.169',100008,NULL,'',2,2,'-23.4823318','-46.6500401','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(68,23,'successful','Marcio Takara Completed the task successfully','2019-10-03 22:24:09','187.101.170.169',100008,NULL,'',2,2,'-23.4823318','-46.6500401','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(69,24,'pending',NULL,'2019-10-03 22:25:04','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(70,24,'accepted','','2019-10-03 22:25:22','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(71,24,'assigned','Status updated from assigned to assigned','2019-10-03 22:25:34','187.101.170.169',100009,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(72,24,'acknowledged','Marcio Takara accepted the task','2019-10-03 22:26:08','187.101.170.169',100009,NULL,'',2,2,'-23.4823347','-46.6500564','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(73,24,'started','Marcio Takara started this task','2019-10-03 22:26:08','187.101.170.169',100009,NULL,'',2,2,'-23.4823347','-46.6500564','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(74,24,'inprogress','Marcio Takara reached the destination','2019-10-03 22:26:10','187.101.170.169',100009,NULL,'',2,2,'-23.4823347','-46.6500564','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(75,24,'successful','Marcio Takara Completed the task successfully','2019-10-03 22:26:11','187.101.170.169',100009,NULL,'',2,2,'-23.4823347','-46.6500564','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(76,25,'pending',NULL,'2019-10-03 22:26:32','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(77,25,'accepted','','2019-10-03 22:26:52','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(78,25,'assigned','Status updated from assigned to assigned','2019-10-03 22:28:40','187.101.170.169',100010,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(79,26,'initial_order',NULL,'2019-10-03 22:35:21','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(80,27,'initial_order',NULL,'2019-10-03 22:35:29','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(81,28,'initial_order',NULL,'2019-10-03 22:40:45','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(82,29,'pending',NULL,'2019-10-03 22:40:51','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(83,30,'initial_order',NULL,'2019-10-03 22:45:35','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(84,31,'initial_order',NULL,'2019-10-03 22:45:40','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(85,32,'pending',NULL,'2019-10-03 22:45:48','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(86,32,'accepted','','2019-10-03 22:46:10','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(87,32,'assigned','Status updated from assigned to assigned','2019-10-03 22:46:25','187.101.170.169',100011,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(88,33,'initial_order',NULL,'2019-10-03 22:50:05','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(89,34,'pending',NULL,'2019-10-03 22:50:13','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(90,35,'initial_order',NULL,'2019-10-03 22:50:37','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(91,36,'initial_order',NULL,'2019-10-03 22:50:40','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(92,37,'initial_order',NULL,'2019-10-04 07:06:18','191.39.35.205',0,NULL,'',2,0,'','','','','',0,'',NULL),(93,38,'pending',NULL,'2019-10-04 10:05:52','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(94,38,'accepted','','2019-10-04 10:08:09','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(95,39,'pending',NULL,'2019-10-04 10:10:16','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(96,39,'accepted','','2019-10-04 10:10:31','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(97,40,'pending',NULL,'2019-10-04 10:19:15','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(98,40,'accepted','','2019-10-04 10:23:42','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(99,40,'accepted','','2019-10-04 10:23:45','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(100,39,'assigned','Status updated from assigned to assigned','2019-10-04 10:29:37','187.116.108.144',100013,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(101,40,'assigned','Status updated from assigned to assigned','2019-10-04 10:33:49','187.116.108.144',100014,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(102,38,'assigned','Status updated from assigned to assigned','2019-10-04 10:33:57','187.116.108.144',100012,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(103,38,'acknowledged','Alex Freire Aquino accepted the task','2019-10-04 10:34:12','187.116.108.144',100012,NULL,'',2,1,'-23.6303688','-46.5088559','{driver_name} accepted the task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(104,38,'started','Alex Freire Aquino started this task','2019-10-04 10:34:14','187.116.108.144',100012,NULL,'',2,1,'-23.6303688','-46.5088559','{driver_name} started this task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(105,38,'inprogress','Alex Freire Aquino reached the destination','2019-10-04 10:34:18','187.116.108.144',100012,NULL,'',2,1,'-23.6303688','-46.5088559','{driver_name} reached the destination','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(106,38,'successful','Alex Freire Aquino Completed the task successfully','2019-10-04 10:43:14','187.116.108.144',100012,NULL,'',2,1,'-23.6304111','-46.5089402','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(107,39,'acknowledged','Alex Freire Aquino accepted the task','2019-10-04 10:43:18','187.116.108.144',100013,NULL,'',2,1,'-23.6303686','-46.5088693','{driver_name} accepted the task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(108,39,'started','Alex Freire Aquino started this task','2019-10-04 10:43:19','187.116.108.144',100013,NULL,'',2,1,'-23.6303686','-46.5088693','{driver_name} started this task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(109,39,'inprogress','Alex Freire Aquino reached the destination','2019-10-04 10:43:20','187.116.108.144',100013,NULL,'',2,1,'-23.6303686','-46.5088693','{driver_name} reached the destination','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(110,39,'successful','Alex Freire Aquino Completed the task successfully','2019-10-04 10:43:21','187.116.108.144',100013,NULL,'',2,1,'-23.6303686','-46.5088693','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(111,40,'acknowledged','Alex Freire Aquino accepted the task','2019-10-04 10:43:24','187.116.108.144',100014,NULL,'',2,1,'-23.6303686','-46.5088693','{driver_name} accepted the task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(112,40,'started','Alex Freire Aquino started this task','2019-10-04 10:43:27','187.116.108.144',100014,NULL,'',2,1,'-23.6303731','-46.5088638','{driver_name} started this task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(113,40,'inprogress','Alex Freire Aquino reached the destination','2019-10-04 10:43:35','187.116.108.144',100014,NULL,'',2,1,'-23.6303731','-46.5088638','{driver_name} reached the destination','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(114,40,'successful','Alex Freire Aquino Completed the task successfully','2019-10-04 10:43:42','187.116.108.144',100014,NULL,'',2,1,'-23.6303731','-46.5088638','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(115,41,'pending',NULL,'2019-10-04 10:50:39','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(116,41,'saiu para entrega','','2019-10-04 10:51:09','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(117,41,'assigned','Status updated from assigned to assigned','2019-10-04 11:01:03','187.116.108.144',100015,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(118,41,'acknowledged','Alex Freire Aquino accepted the task','2019-10-04 11:03:00','187.116.108.144',100015,NULL,'',2,1,'-23.6304959','-46.5090746','{driver_name} accepted the task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(119,41,'started','Alex Freire Aquino started this task','2019-10-04 11:03:05','187.116.108.144',100015,NULL,'',2,1,'-23.6304959','-46.5090746','{driver_name} started this task','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(120,41,'inprogress','Alex Freire Aquino reached the destination','2019-10-04 11:03:13','187.116.108.144',100015,NULL,'',2,1,'-23.6304959','-46.5090746','{driver_name} reached the destination','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(121,41,'sign','Alex Freire Aquino added a signature','2019-10-04 11:04:15','187.116.108.144',100015,NULL,'signature_100015-63710380936.png',2,1,'-23.6303848','-46.5088948','{driver_name} added a signature','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'','image/jsignature;base30,1Qjqba973Z13Y1Z2Y58841Z47a9ab840Yfhjhca51Z5bc74Y26cb98851Z12560Y5773Z2951Y29egea63Z7bdb85Y16b92Z5ad981Y6fljhc640Z2Y1255_7zZp1Wtokb6Yckrsohb1Zbgd8Y118885Z3bimmjd81Y8cgknnhb0Z5affb72Y2ddcb96Z349bdcb9954akpf9Y3jp1x1x1wnh4Z3cgkg71Y4653Z6bfa53'),(122,41,'successful','Alex Freire Aquino Completed the task successfully','2019-10-04 11:04:17','187.116.108.144',100015,NULL,'',2,1,'-23.6303848','-46.5088948','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Alex Freire Aquino\"}','',0,'',NULL),(123,41,'paid','','2019-10-04 11:08:28','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(124,40,'paid','','2019-10-04 11:08:33','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(125,39,'paid','','2019-10-04 11:08:38','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(126,38,'paid','','2019-10-04 11:08:42','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(127,42,'pending',NULL,'2019-10-04 11:20:11','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(128,42,'saiu para entrega','','2019-10-04 11:20:24','187.116.108.144',0,NULL,'',2,0,'','','','','',0,'',NULL),(129,43,'pending',NULL,'2019-10-04 20:47:13','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(130,44,'pending',NULL,'2019-10-04 20:55:52','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(131,45,'initial_order',NULL,'2019-10-04 20:56:14','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(132,46,'initial_order',NULL,'2019-10-04 21:02:25','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(133,32,'started','Status updated from assigned to started','2019-10-04 21:11:31','187.101.170.169',100011,'','',2,0,'','','','','',0,'',NULL),(134,32,'successful','Status updated from started to successful','2019-10-04 21:11:48','187.101.170.169',100011,'','',2,0,'','','','','',0,'',NULL),(135,25,'assigned','Status updated from assigned to assigned','2019-10-04 21:12:01','187.101.170.169',100010,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(136,25,'successful','Status updated from assigned to successful','2019-10-04 21:12:19','187.101.170.169',100010,'','',2,0,'','','','','',0,'',NULL),(137,44,'saiu para entrega','','2019-10-04 21:12:38','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(138,42,'assigned','Status updated from assigned to assigned','2019-10-04 21:13:01','187.101.170.169',100016,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(139,44,'assigned','Status updated from assigned to assigned','2019-10-04 21:13:31','187.101.170.169',100017,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(140,44,'acknowledged','Marcio Takara accepted the task','2019-10-04 21:13:41','187.101.170.169',100017,NULL,'',2,2,'-23.4823241','-46.6501022','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(141,44,'started','Marcio Takara started this task','2019-10-04 21:13:42','187.101.170.169',100017,NULL,'',2,2,'-23.4823241','-46.6501022','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(142,44,'inprogress','Marcio Takara reached the destination','2019-10-04 21:13:43','187.101.170.169',100017,NULL,'',2,2,'-23.4823241','-46.6501022','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(143,44,'successful','Marcio Takara Completed the task successfully','2019-10-04 21:13:44','187.101.170.169',100017,NULL,'',2,2,'-23.4823241','-46.6501022','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(144,42,'acknowledged','Marcio Takara accepted the task','2019-10-04 21:13:50','187.101.170.169',100016,NULL,'',2,2,'-23.4823245','-46.6501016','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(145,42,'started','Marcio Takara started this task','2019-10-04 21:13:50','187.101.170.169',100016,NULL,'',2,2,'-23.4823245','-46.6501016','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(146,42,'inprogress','Marcio Takara reached the destination','2019-10-04 21:13:53','187.101.170.169',100016,NULL,'',2,2,'-23.4823245','-46.6501016','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(147,42,'successful','Marcio Takara Completed the task successfully','2019-10-04 21:13:54','187.101.170.169',100016,NULL,'',2,2,'-23.4823245','-46.6501016','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(148,47,'pending',NULL,'2019-10-04 21:14:25','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(149,47,'preparando','','2019-10-04 21:15:01','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(150,47,'em progresso','','2019-10-04 21:15:24','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(151,47,'saiu para entrega','','2019-10-04 21:15:41','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(152,47,'assigned','Status updated from assigned to assigned','2019-10-04 21:16:30','187.101.170.169',100018,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(153,47,'acknowledged','Marcio Takara accepted the task','2019-10-04 21:17:17','187.101.170.169',100018,NULL,'',2,2,'-23.4823109','-46.6500891','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(154,47,'started','Marcio Takara started this task','2019-10-04 21:17:18','187.101.170.169',100018,NULL,'',2,2,'-23.4823109','-46.6500891','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(155,47,'inprogress','Marcio Takara reached the destination','2019-10-04 21:17:19','187.101.170.169',100018,NULL,'',2,2,'-23.4823109','-46.6500891','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(156,47,'successful','Marcio Takara Completed the task successfully','2019-10-04 21:17:20','187.101.170.169',100018,NULL,'',2,2,'-23.4823109','-46.6500891','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(157,48,'pending',NULL,'2019-10-04 23:31:04','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(158,48,'paid','','2019-10-04 23:32:59','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(159,49,'initial_order',NULL,'2019-10-05 07:15:36','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(160,50,'preparando',NULL,'2019-10-05 19:00:24','191.39.25.184',0,NULL,'',2,0,'','','','','',0,'',NULL),(161,51,'preparando',NULL,'2019-10-05 22:05:41','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(162,51,'paid','','2019-10-05 22:14:01','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(163,50,'paid','','2019-10-05 22:14:22','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(164,52,'Pedido Recebido',NULL,'2019-10-05 23:13:43','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(165,52,'Preparando','','2019-10-05 23:14:20','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(166,52,'Solicitando Entregador','','2019-10-05 23:17:00','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(167,50,'assigned','Status updated from assigned to assigned','2019-10-05 23:21:50','187.101.170.169',100021,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(168,51,'assigned','Status updated from assigned to assigned','2019-10-05 23:22:08','187.101.170.169',100020,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(169,48,'assigned','Status updated from assigned to assigned','2019-10-05 23:22:16','187.101.170.169',100019,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(170,48,'acknowledged','Marcio Takara accepted the task','2019-10-05 23:22:24','187.101.170.169',100019,NULL,'',2,2,'-23.482348','-46.6501002','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(171,48,'started','Marcio Takara started this task','2019-10-05 23:22:25','187.101.170.169',100019,NULL,'',2,2,'-23.482348','-46.6501002','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(172,48,'inprogress','Marcio Takara reached the destination','2019-10-05 23:22:26','187.101.170.169',100019,NULL,'',2,2,'-23.482348','-46.6501002','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(173,48,'successful','Marcio Takara Completed the task successfully','2019-10-05 23:22:30','187.101.170.169',100019,NULL,'',2,2,'-23.4823476','-46.6500997','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(174,50,'acknowledged','Marcio Takara accepted the task','2019-10-05 23:22:39','187.101.170.169',100021,NULL,'',2,2,'-23.4823271','-46.6500901','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(175,50,'started','Marcio Takara started this task','2019-10-05 23:22:41','187.101.170.169',100021,NULL,'',2,2,'-23.4823271','-46.6500901','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(176,50,'inprogress','Marcio Takara reached the destination','2019-10-05 23:22:42','187.101.170.169',100021,NULL,'',2,2,'-23.4823271','-46.6500901','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(177,50,'successful','Marcio Takara Completed the task successfully','2019-10-05 23:22:43','187.101.170.169',100021,NULL,'',2,2,'-23.4823271','-46.6500901','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(178,51,'acknowledged','Marcio Takara accepted the task','2019-10-05 23:22:46','187.101.170.169',100020,NULL,'',2,2,'-23.4823367','-46.6500838','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(179,51,'started','Marcio Takara started this task','2019-10-05 23:22:47','187.101.170.169',100020,NULL,'',2,2,'-23.4823367','-46.6500838','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(180,51,'inprogress','Marcio Takara reached the destination','2019-10-05 23:22:47','187.101.170.169',100020,NULL,'',2,2,'-23.4823367','-46.6500838','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(181,51,'successful','Marcio Takara Completed the task successfully','2019-10-05 23:22:48','187.101.170.169',100020,NULL,'',2,2,'-23.4823367','-46.6500838','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(182,52,'Solicitando Entregador','','2019-10-05 23:25:17','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(183,52,'Pedido Recebido','','2019-10-05 23:25:35','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(184,52,'Solicitando Entregador','','2019-10-05 23:25:40','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(185,53,'preparando',NULL,'2019-10-05 23:26:37','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(186,53,'Solicitando Entregador','','2019-10-05 23:27:06','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(187,54,'Pedido Recebido',NULL,'2019-10-05 23:27:40','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(188,54,'Solicitando Entregador','','2019-10-05 23:28:04','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(189,54,'assigned','Status updated from assigned to assigned','2019-10-05 23:30:52','187.101.170.169',100024,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(190,53,'assigned','Status updated from assigned to assigned','2019-10-05 23:30:59','187.101.170.169',100023,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(191,54,'Em trânsito','','2019-10-05 23:31:20','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(192,52,'Em trânsito','','2019-10-05 23:31:24','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(193,53,'acknowledged','Marcio Takara accepted the task','2019-10-05 23:32:18','187.101.170.169',100023,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(194,53,'started','Marcio Takara started this task','2019-10-05 23:32:18','187.101.170.169',100023,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(195,53,'inprogress','Marcio Takara reached the destination','2019-10-05 23:32:19','187.101.170.169',100023,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(196,53,'successful','Marcio Takara Completed the task successfully','2019-10-05 23:32:20','187.101.170.169',100023,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(197,54,'acknowledged','Marcio Takara accepted the task','2019-10-05 23:32:22','187.101.170.169',100024,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} accepted the task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(198,54,'started','Marcio Takara started this task','2019-10-05 23:32:22','187.101.170.169',100024,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} started this task','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(199,54,'inprogress','Marcio Takara reached the destination','2019-10-05 23:32:23','187.101.170.169',100024,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} reached the destination','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(200,54,'successful','Marcio Takara Completed the task successfully','2019-10-05 23:32:24','187.101.170.169',100024,NULL,'',2,2,'-23.4823435','-46.6500654','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Marcio Takara\"}','',0,'',NULL),(201,52,'Em trânsito','','2019-10-05 23:33:03','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(202,54,'paid','','2019-10-05 23:33:10','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(203,52,'paid','','2019-10-05 23:33:16','187.101.170.169',0,NULL,'',2,0,'','','','','',0,'',NULL),(204,64,'Preparando','','2019-10-20 10:26:37','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(205,63,'Preparando','','2019-10-20 10:26:49','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(206,59,'Preparando','','2019-10-20 10:26:55','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(207,58,'Preparando','','2019-10-20 10:27:01','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(208,64,'Solicitando Entregador','','2019-10-20 10:45:30','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(209,63,'Solicitando Entregador','','2019-10-20 10:46:29','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(210,63,'assigned','Status updated from assigned to assigned','2019-10-20 10:50:45','189.79.85.100',100026,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(211,63,'acknowledged','Minoru Kondo accepted the task','2019-10-20 10:51:47','189.79.85.100',100026,NULL,'',2,4,'-23.4823671','-46.650033','{driver_name} accepted the task','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(212,63,'started','Minoru Kondo started this task','2019-10-20 10:51:49','189.79.85.100',100026,NULL,'',2,4,'-23.4823671','-46.650033','{driver_name} started this task','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(213,63,'inprogress','Minoru Kondo reached the destination','2019-10-20 10:51:51','189.79.85.100',100026,NULL,'',2,4,'-23.4823883','-46.6500384','{driver_name} reached the destination','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(214,63,'successful','Minoru Kondo Completed the task successfully','2019-10-20 10:51:54','189.79.85.100',100026,NULL,'',2,4,'-23.4823883','-46.6500384','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(215,64,'assigned','Status updated from assigned to assigned','2019-10-20 10:52:04','189.79.85.100',100025,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(216,64,'acknowledged','Minoru Kondo accepted the task','2019-10-20 11:06:06','189.79.85.100',100025,NULL,'',2,4,'-23.4824326','-46.6500172','{driver_name} accepted the task','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(217,64,'started','Minoru Kondo started this task','2019-10-20 11:06:09','189.79.85.100',100025,NULL,'',2,4,'-23.4824326','-46.6500172','{driver_name} started this task','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(218,64,'inprogress','Minoru Kondo reached the destination','2019-10-20 11:06:12','189.79.85.100',100025,NULL,'',2,4,'-23.4824326','-46.6500172','{driver_name} reached the destination','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(219,64,'successful','Minoru Kondo Completed the task successfully','2019-10-20 11:06:14','189.79.85.100',100025,NULL,'',2,4,'-23.4824326','-46.6500172','{driver_name} Completed the task successfully','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(220,65,'Solicitando Entregador','','2019-10-20 11:55:21','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(221,65,'acknowledged','Minoru Kondo accepted the task','2019-10-20 11:57:20','189.79.85.100',100027,NULL,'',2,4,'-23.4823237','-46.6500942','{driver_name} accepted the task','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(222,65,'started','Minoru Kondo started this task','2019-10-20 11:57:22','189.79.85.100',100027,NULL,'',2,4,'-23.4823237','-46.6500942','{driver_name} started this task','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(223,65,'cancelled','Minoru Kondo marked the task as cancelled','2019-10-20 12:28:14','179.142.25.131',100027,'Ocupado','',2,4,'-23.4947486','-46.6604397','{driver_name} marked the task as cancelled','{\"{driver_name}\":\"Minoru Kondo\"}','',0,'',NULL),(224,66,'Preparando','','2019-10-20 18:51:50','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(225,66,'Solicitando Entregador','','2019-10-20 18:52:21','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(226,66,'assigned','Status updated from assigned to assigned','2019-10-20 19:04:24','189.79.85.100',100028,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(227,67,'Solicitando Entregador','','2019-10-20 19:27:19','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(228,67,'assigned','Status updated from assigned to assigned','2019-10-20 19:43:25','189.79.85.100',100029,NULL,'',2,0,'','','Status updated from {from} to {to}','{\"{from}\":\"assigned\",\"{to}\":\"assigned\"}','',0,'',NULL),(229,69,'Pedido Recebido',NULL,'2019-10-21 06:38:19','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(230,70,'Pedido Recebido',NULL,'2019-10-21 19:52:28','177.33.141.87',0,NULL,'',2,0,'','','','','',0,'',NULL),(231,71,'Pedido Recebido',NULL,'2019-10-21 19:56:34','177.33.141.87',0,NULL,'',2,0,'','','','','',0,'',NULL),(232,72,'Pedido Recebido',NULL,'2019-10-21 19:58:44','177.33.141.87',0,NULL,'',2,0,'','','','','',0,'',NULL),(233,72,'Solicitando Entregador','','2019-10-21 21:59:16','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(234,72,'Solicitando Entregador','','2019-10-21 21:59:21','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(235,71,'Solicitando Entregador','','2019-10-21 21:59:26','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(236,70,'Solicitando Entregador','','2019-10-21 21:59:32','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(237,72,'Solicitando Entregador','','2019-10-21 22:31:22','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL),(238,74,'Pedido Recebido',NULL,'2019-10-21 23:23:46','189.79.85.100',0,NULL,'',2,0,'','','','','',0,'',NULL);
/*!40000 ALTER TABLE `mt_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_order_sms`
--

DROP TABLE IF EXISTS `mt_order_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_order_sms` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `code` int(4) NOT NULL,
  `session` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `session` (`session`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_order_sms`
--

LOCK TABLES `mt_order_sms` WRITE;
/*!40000 ALTER TABLE `mt_order_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_order_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_order_status`
--

DROP TABLE IF EXISTS `mt_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_order_status` (
  `stats_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '',
  `date_created` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`stats_id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_order_status`
--

LOCK TABLES `mt_order_status` WRITE;
/*!40000 ALTER TABLE `mt_order_status` DISABLE KEYS */;
INSERT INTO `mt_order_status` VALUES (1,0,'pending','2019-10-01',NULL,'201.95.66.116'),(2,0,'Cancelado','2019-10-01','2019-10-05','187.101.170.169'),(3,0,'Entregue com sucesso','2019-10-01','2019-10-05','187.101.170.169'),(4,0,'paid','2019-10-01',NULL,'201.95.66.116'),(5,0,'Em trânsito','2019-10-01','2019-10-05','187.101.170.169'),(7,0,'Falhou','2019-10-01','2019-10-05','187.101.170.169'),(8,0,'Rejeitado','2019-10-01','2019-10-05','187.101.170.169'),(10,0,'Preparando','2019-10-01','2019-10-05','187.101.170.169'),(13,0,'Pedido Recebido','2019-10-05',NULL,'187.101.170.169'),(14,0,'Solicitando Entregador','2019-10-05',NULL,'187.101.170.169');
/*!40000 ALTER TABLE `mt_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_package_trans`
--

DROP TABLE IF EXISTS `mt_package_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_package_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `package_id` int(14) NOT NULL DEFAULT '0',
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `price` float(14,4) NOT NULL DEFAULT '0.0000',
  `payment_type` varchar(100) NOT NULL DEFAULT '',
  `mt_id` int(14) NOT NULL DEFAULT '0',
  `TOKEN` varchar(255) NOT NULL DEFAULT '',
  `membership_expired` date DEFAULT NULL,
  `TRANSACTIONID` varchar(255) NOT NULL DEFAULT '',
  `TRANSACTIONTYPE` varchar(100) NOT NULL DEFAULT '',
  `PAYMENTSTATUS` varchar(100) NOT NULL DEFAULT '',
  `PAYPALFULLRESPONSE` text,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `fee` float(14,4) NOT NULL DEFAULT '0.0000',
  `merchant_ref` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `TRANSACTIONID` (`TRANSACTIONID`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_package_trans`
--

LOCK TABLES `mt_package_trans` WRITE;
/*!40000 ALTER TABLE `mt_package_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_package_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_packages`
--

DROP TABLE IF EXISTS `mt_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_packages` (
  `package_id` int(14) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `price` float(14,4) NOT NULL DEFAULT '0.0000',
  `promo_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `expiration` int(14) NOT NULL DEFAULT '0',
  `expiration_type` varchar(50) NOT NULL DEFAULT 'days',
  `unlimited_post` int(1) NOT NULL DEFAULT '2',
  `post_limit` int(14) NOT NULL DEFAULT '0',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `sell_limit` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`),
  KEY `title` (`title`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_packages`
--

LOCK TABLES `mt_packages` WRITE;
/*!40000 ALTER TABLE `mt_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_payment_order`
--

DROP TABLE IF EXISTS `mt_payment_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_payment_order` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `payment_reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `order_id` int(14) NOT NULL DEFAULT '0',
  `raw_response` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merchant_ref` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `payment_type` (`payment_type`),
  KEY `payment_reference` (`payment_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_payment_order`
--

LOCK TABLES `mt_payment_order` WRITE;
/*!40000 ALTER TABLE `mt_payment_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_payment_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_payment_provider`
--

DROP TABLE IF EXISTS `mt_payment_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_payment_provider` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(255) NOT NULL DEFAULT '',
  `payment_logo` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT 'publish',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `payment_name` (`payment_name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_payment_provider`
--

LOCK TABLES `mt_payment_provider` WRITE;
/*!40000 ALTER TABLE `mt_payment_provider` DISABLE KEYS */;
INSERT INTO `mt_payment_provider` VALUES (2,'Visa debito','1570193911-Unknown.png',0,'publish','2019-10-04 09:58:41','2019-10-04 20:52:16','187.101.170.169'),(3,'Ello debito','1570194589-elo-logo-1-1.png',0,'publish','2019-10-04 10:09:53','2019-10-04 20:47:34','187.101.170.169'),(4,'Mastercard Crédito','1570233093-cartaodecredito.jpg',0,'publish','2019-10-04 20:51:35','2019-10-04 20:51:51','187.101.170.169');
/*!40000 ALTER TABLE `mt_payment_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_paypal_checkout`
--

DROP TABLE IF EXISTS `mt_paypal_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_paypal_checkout` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `paypal_request` text,
  `paypal_response` text,
  `status` varchar(255) NOT NULL DEFAULT 'checkout',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `token` (`token`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_paypal_checkout`
--

LOCK TABLES `mt_paypal_checkout` WRITE;
/*!40000 ALTER TABLE `mt_paypal_checkout` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_paypal_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_paypal_payment`
--

DROP TABLE IF EXISTS `mt_paypal_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_paypal_payment` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL DEFAULT '0',
  `TOKEN` varchar(255) NOT NULL DEFAULT '',
  `TRANSACTIONID` varchar(100) NOT NULL DEFAULT '',
  `TRANSACTIONTYPE` varchar(100) NOT NULL DEFAULT '',
  `PAYMENTTYPE` varchar(100) NOT NULL DEFAULT '',
  `ORDERTIME` varchar(100) NOT NULL DEFAULT '',
  `AMT` varchar(14) NOT NULL DEFAULT '',
  `FEEAMT` varchar(14) NOT NULL DEFAULT '',
  `TAXAMT` varchar(14) NOT NULL DEFAULT '',
  `CURRENCYCODE` varchar(3) NOT NULL DEFAULT '',
  `PAYMENTSTATUS` varchar(100) NOT NULL DEFAULT '',
  `CORRELATIONID` varchar(100) NOT NULL DEFAULT '',
  `TIMESTAMP` varchar(100) NOT NULL DEFAULT '',
  `json_details` text,
  `date_created` varchar(50) NOT NULL DEFAULT '',
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_paypal_payment`
--

LOCK TABLES `mt_paypal_payment` WRITE;
/*!40000 ALTER TABLE `mt_paypal_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_paypal_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_rating`
--

DROP TABLE IF EXISTS `mt_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_rating` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `ratings` float(14,1) NOT NULL DEFAULT '0.0',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `client_id` (`client_id`),
  KEY `ratings` (`ratings`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_rating`
--

LOCK TABLES `mt_rating` WRITE;
/*!40000 ALTER TABLE `mt_rating` DISABLE KEYS */;
INSERT INTO `mt_rating` VALUES (1,1,5.0,1,'2019-10-01 23:08:23','201.95.66.116'),(2,2,5.0,7,'2019-10-20 09:33:08','189.79.85.100');
/*!40000 ALTER TABLE `mt_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_rating_meaning`
--

DROP TABLE IF EXISTS `mt_rating_meaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_rating_meaning` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `rating_start` float(14,1) NOT NULL DEFAULT '0.0',
  `rating_end` float(14,1) NOT NULL DEFAULT '0.0',
  `meaning` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_rating_meaning`
--

LOCK TABLES `mt_rating_meaning` WRITE;
/*!40000 ALTER TABLE `mt_rating_meaning` DISABLE KEYS */;
INSERT INTO `mt_rating_meaning` VALUES (1,1.0,1.9,'poor','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),(2,2.0,2.9,'good','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),(3,3.0,4.0,'very good','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116'),(4,4.1,5.0,'excellent','2019-10-01 17:20:15','2019-10-02 00:20:15','201.95.66.116');
/*!40000 ALTER TABLE `mt_rating_meaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_receive_post`
--

DROP TABLE IF EXISTS `mt_receive_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_receive_post` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `receive_post` text,
  `status` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `receive_get` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_receive_post`
--

LOCK TABLES `mt_receive_post` WRITE;
/*!40000 ALTER TABLE `mt_receive_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_receive_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_review`
--

DROP TABLE IF EXISTS `mt_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_review` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `review` text,
  `rating` float(14,1) NOT NULL DEFAULT '0.0',
  `status` varchar(100) NOT NULL DEFAULT 'publish',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `order_id` varchar(14) NOT NULL DEFAULT '',
  `parent_id` int(14) NOT NULL DEFAULT '0',
  `reply_from` varchar(255) NOT NULL DEFAULT '',
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `rating` (`rating`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_review`
--

LOCK TABLES `mt_review` WRITE;
/*!40000 ALTER TABLE `mt_review` DISABLE KEYS */;
INSERT INTO `mt_review` VALUES (1,1,1,'teste',5.0,'publish','2019-10-01 23:08:23','','',0,'','2019-10-02 02:08:23'),(2,2,7,'TESTE',5.0,'publish','2019-10-20 09:33:08','','',0,'','2019-10-20 12:33:08');
/*!40000 ALTER TABLE `mt_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_shipping_rate`
--

DROP TABLE IF EXISTS `mt_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_shipping_rate` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `distance_from` float(14,2) NOT NULL DEFAULT '0.00',
  `distance_to` float(14,2) NOT NULL DEFAULT '0.00',
  `shipping_units` varchar(5) NOT NULL DEFAULT '',
  `distance_price` float(14,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_shipping_rate`
--

LOCK TABLES `mt_shipping_rate` WRITE;
/*!40000 ALTER TABLE `mt_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_size`
--

DROP TABLE IF EXISTS `mt_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_size` (
  `size_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `size_name` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'published',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `size_name_trans` text,
  PRIMARY KEY (`size_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `size_name` (`size_name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_size`
--

LOCK TABLES `mt_size` WRITE;
/*!40000 ALTER TABLE `mt_size` DISABLE KEYS */;
INSERT INTO `mt_size` VALUES (1,1,'small',0,'publish','2019-10-01 17:51:29','2019-10-02 00:51:29','189.79.78.120',''),(2,1,'medium',0,'publish','2019-10-01 17:51:29','2019-10-02 00:51:29','189.79.78.120',''),(3,1,'large',0,'publish','2019-10-01 17:51:29','2019-10-02 00:51:29','189.79.78.120',''),(4,2,'small',0,'publish','2019-10-04 21:29:02','2019-10-05 00:29:02','187.101.170.169',''),(5,2,'medium',0,'publish','2019-10-04 21:29:02','2019-10-05 00:29:02','187.101.170.169',''),(6,2,'large',0,'publish','2019-10-04 21:29:02','2019-10-05 00:29:02','187.101.170.169',''),(7,3,'small',0,'publish','2019-10-20 20:21:16','2019-10-20 23:21:16','189.79.85.100',''),(8,3,'medium',0,'publish','2019-10-20 20:21:16','2019-10-20 23:21:16','189.79.85.100',''),(9,3,'large',0,'publish','2019-10-20 20:21:16','2019-10-20 23:21:16','189.79.85.100','');
/*!40000 ALTER TABLE `mt_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_sms_broadcast`
--

DROP TABLE IF EXISTS `mt_sms_broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_sms_broadcast` (
  `broadcast_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `send_to` int(14) NOT NULL DEFAULT '0',
  `list_mobile_number` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sms_alert_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`broadcast_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `send_to` (`send_to`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_sms_broadcast`
--

LOCK TABLES `mt_sms_broadcast` WRITE;
/*!40000 ALTER TABLE `mt_sms_broadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_sms_broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_sms_broadcast_details`
--

DROP TABLE IF EXISTS `mt_sms_broadcast_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_sms_broadcast_details` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `broadcast_id` int(14) NOT NULL DEFAULT '0',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `client_name` varchar(255) NOT NULL DEFAULT '',
  `contact_phone` varchar(50) NOT NULL DEFAULT '',
  `sms_message` text,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `gateway_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_executed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `gateway` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `broadcast_id` (`broadcast_id`),
  KEY `client_id` (`client_id`),
  KEY `status` (`status`),
  KEY `gateway` (`gateway`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_sms_broadcast_details`
--

LOCK TABLES `mt_sms_broadcast_details` WRITE;
/*!40000 ALTER TABLE `mt_sms_broadcast_details` DISABLE KEYS */;
INSERT INTO `mt_sms_broadcast_details` VALUES (1,0,0,0,'','+551122334455','Hi alex cliente \nWe have receive your order,\nDetails:\nOrder ID : 3\nRestaurant : Taba Paes\nTotal Amount : R$ 4.00\nOrder Details : \n4 x Pao de Leite<p>small</p> 4.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-01 22:25:33','2019-10-01 22:25:33','35.198.24.213',''),(2,0,0,0,'','+5511970960399','Hi Yassunoria Takara \nWe have receive your order,\nDetails:\nOrder ID : 55\nRestaurant : Taba Paes\nTotal Amount : R$ 3.00\nOrder Details : \n3 x Pao de Leite<p>small</p> 3.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-07 22:50:14','2019-10-07 22:50:14','35.198.24.213',''),(3,0,0,0,'','+5511957702023','Hi Sayuri Takara \nWe have receive your order,\nDetails:\nOrder ID : 58\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 13.00\nOrder Details : \n1 x Leite de Caixinha Tipo A<p>medium</p> 5.00\n2 x Mortandela Marba<p>medium</p> 4.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-20 09:26:33','2019-10-20 09:31:36','35.198.24.213',''),(4,0,0,0,'','+5511957702023','Hi Sayuri Takara \nWe have receive your order,\nDetails:\nOrder ID : 59\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 14.00\nOrder Details : \n2 x Leite de Caixinha Tipo A<p>medium</p> 10.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-20 09:33:36','2019-10-20 09:33:39','35.198.24.213',''),(5,0,0,0,'','+5511957702025','Hi Midori Takara \nWe have receive your order,\nDetails:\nOrder ID : 63\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 9.00\nOrder Details : \n1 x Leite de Caixinha Tipo A<p>medium</p> 5.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-20 10:17:45','2019-10-20 10:22:49','35.198.24.213',''),(6,0,0,0,'','+5511957702025','Hi Midori Takara \nWe have receive your order,\nDetails:\nOrder ID : 64\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 9.00\nOrder Details : \n1 x Leite de Caixinha Tipo A<p>medium</p> 5.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-20 10:23:51','2019-10-20 10:23:54','35.198.24.213',''),(7,0,0,0,'','+5511957702025','Hi Midori Takara \nWe have receive your order,\nDetails:\nOrder ID : 65\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 9.00\nOrder Details : \n1 x Leite de Caixinha Tipo A<p>medium</p> 5.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-20 11:49:52','2019-10-20 11:54:55','35.198.24.213',''),(8,0,0,0,'','+5511957702025','Hi Midori Takara \nWe have receive your order,\nDetails:\nOrder ID : 66\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 9.00\nOrder Details : \n1 x Leite de Caixinha Tipo A<p>medium</p> 5.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-20 18:46:20','2019-10-20 18:51:23','35.198.24.213',''),(9,0,0,0,'','+5511957702025','Hi Midori Takara \nWe have receive your order,\nDetails:\nOrder ID : 67\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 15.00\nOrder Details : \n1 x Leite de Caixinha Tipo A<p>medium</p> 5.00\n1 x Bolo de Chocolate<p>large</p> 6.00\n\n\nRegards\nipaoo\n','No sms gateway selected','','2019-10-20 19:26:53','2019-10-20 19:26:56','35.198.24.213',''),(10,0,0,0,'','+5511958585858','Hi Marcio Takara \nWe have receive your order,\nDetails:\nOrder ID : 68\nRestaurant : Taba Paes\nTotal Amount : R$ 1.00\nOrder Details : \n1 x Pao de Leite<p>small</p> 1.00\n\n\nRegards\niPaoo\n','No sms gateway selected','','2019-10-21 00:20:34','2019-10-21 00:25:37','35.198.24.213',''),(11,0,0,0,'','+5511988888888','Hi Yassu Teste  \nWe have receive your order,\nDetails:\nOrder ID : 73\nRestaurant : PANETTERIA ZN\nTotal Amount : R$ 124.00\nOrder Details : \n18 x Leite de Caixinha Tipo A<p>medium</p> 90.00\n5 x Bolo de Chocolate<p>medium</p> 30.00\n\n\nRegards\niPaoo\n','No sms gateway selected','','2019-10-21 22:58:52','2019-10-21 23:03:56','35.198.24.213','');
/*!40000 ALTER TABLE `mt_sms_broadcast_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_sms_package`
--

DROP TABLE IF EXISTS `mt_sms_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_sms_package` (
  `sms_package_id` int(14) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `price` float(14,4) NOT NULL DEFAULT '0.0000',
  `promo_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `sms_limit` int(14) NOT NULL DEFAULT '0',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`sms_package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_sms_package`
--

LOCK TABLES `mt_sms_package` WRITE;
/*!40000 ALTER TABLE `mt_sms_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_sms_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_sms_package_trans`
--

DROP TABLE IF EXISTS `mt_sms_package_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_sms_package_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `sms_package_id` int(14) NOT NULL DEFAULT '0',
  `payment_type` varchar(50) NOT NULL DEFAULT '',
  `package_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `sms_limit` int(14) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `payment_reference` varchar(255) NOT NULL DEFAULT '',
  `payment_gateway_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `cc_id` int(14) NOT NULL DEFAULT '0',
  `merchant_ref` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cc_id` (`cc_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `sms_package_id` (`sms_package_id`),
  KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_sms_package_trans`
--

LOCK TABLES `mt_sms_package_trans` WRITE;
/*!40000 ALTER TABLE `mt_sms_package_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_sms_package_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_sms_trans_logs`
--

DROP TABLE IF EXISTS `mt_sms_trans_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_sms_trans_logs` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `sms_package_id` int(14) NOT NULL DEFAULT '0',
  `payment_type` varchar(100) NOT NULL DEFAULT '',
  `package_price` float(14,4) NOT NULL DEFAULT '0.0000',
  `sms_limit` varchar(14) NOT NULL DEFAULT '',
  `payment_reference` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_gateway_ref` varchar(255) NOT NULL DEFAULT '',
  `gateway_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_sms_trans_logs`
--

LOCK TABLES `mt_sms_trans_logs` WRITE;
/*!40000 ALTER TABLE `mt_sms_trans_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_sms_trans_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_stripe_logger`
--

DROP TABLE IF EXISTS `mt_stripe_logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_stripe_logger` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `trans_type` varchar(255) NOT NULL DEFAULT '',
  `payment_intent` varchar(255) NOT NULL DEFAULT '',
  `post_receive` text,
  `webhooks_response` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_receive_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `payment_intent` (`payment_intent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_stripe_logger`
--

LOCK TABLES `mt_stripe_logger` WRITE;
/*!40000 ALTER TABLE `mt_stripe_logger` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_stripe_logger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_stripe_logs`
--

DROP TABLE IF EXISTS `mt_stripe_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_stripe_logs` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL,
  `json_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_stripe_logs`
--

LOCK TABLES `mt_stripe_logs` WRITE;
/*!40000 ALTER TABLE `mt_stripe_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_stripe_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_subcategory`
--

DROP TABLE IF EXISTS `mt_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_subcategory` (
  `subcat_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `subcategory_name` varchar(255) NOT NULL DEFAULT '',
  `subcategory_description` text,
  `discount` varchar(20) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT 'publish',
  `subcategory_name_trans` text,
  `subcategory_description_trans` text,
  PRIMARY KEY (`subcat_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `subcategory_name` (`subcategory_name`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_subcategory`
--

LOCK TABLES `mt_subcategory` WRITE;
/*!40000 ALTER TABLE `mt_subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_subcategory_item`
--

DROP TABLE IF EXISTS `mt_subcategory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_subcategory_item` (
  `sub_item_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `sub_item_name` varchar(255) NOT NULL DEFAULT '',
  `item_description` text,
  `category` varchar(255) NOT NULL DEFAULT '',
  `price` varchar(15) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(14) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `sub_item_name_trans` text,
  `item_description_trans` text,
  PRIMARY KEY (`sub_item_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `sub_item_name` (`sub_item_name`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_subcategory_item`
--

LOCK TABLES `mt_subcategory_item` WRITE;
/*!40000 ALTER TABLE `mt_subcategory_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_subcategory_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mt_view_location_rate`
--

DROP TABLE IF EXISTS `mt_view_location_rate`;
/*!50001 DROP VIEW IF EXISTS `mt_view_location_rate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mt_view_location_rate` AS SELECT 
 1 AS `rate_id`,
 1 AS `merchant_id`,
 1 AS `country_id`,
 1 AS `country_name`,
 1 AS `state_id`,
 1 AS `state_name`,
 1 AS `city_id`,
 1 AS `city_name`,
 1 AS `postal_code`,
 1 AS `area_id`,
 1 AS `area_name`,
 1 AS `fee`,
 1 AS `sequence`,
 1 AS `date_created`,
 1 AS `date_modified`,
 1 AS `ip_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mt_view_merchant`
--

DROP TABLE IF EXISTS `mt_view_merchant`;
/*!50001 DROP VIEW IF EXISTS `mt_view_merchant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mt_view_merchant` AS SELECT 
 1 AS `merchant_id`,
 1 AS `restaurant_slug`,
 1 AS `restaurant_name`,
 1 AS `restaurant_phone`,
 1 AS `contact_name`,
 1 AS `contact_phone`,
 1 AS `contact_email`,
 1 AS `country_code`,
 1 AS `street`,
 1 AS `city`,
 1 AS `state`,
 1 AS `post_code`,
 1 AS `cuisine`,
 1 AS `service`,
 1 AS `free_delivery`,
 1 AS `delivery_estimation`,
 1 AS `username`,
 1 AS `password`,
 1 AS `activation_key`,
 1 AS `activation_token`,
 1 AS `status`,
 1 AS `date_created`,
 1 AS `date_modified`,
 1 AS `date_activated`,
 1 AS `last_login`,
 1 AS `ip_address`,
 1 AS `package_id`,
 1 AS `package_price`,
 1 AS `membership_expired`,
 1 AS `payment_steps`,
 1 AS `is_featured`,
 1 AS `is_ready`,
 1 AS `is_sponsored`,
 1 AS `sponsored_expiration`,
 1 AS `lost_password_code`,
 1 AS `user_lang`,
 1 AS `membership_purchase_date`,
 1 AS `sort_featured`,
 1 AS `is_commission`,
 1 AS `percent_commision`,
 1 AS `abn`,
 1 AS `session_token`,
 1 AS `commision_type`,
 1 AS `mobile_session_token`,
 1 AS `merchant_key`,
 1 AS `latitude`,
 1 AS `lontitude`,
 1 AS `delivery_charges`,
 1 AS `minimum_order`,
 1 AS `delivery_minimum_order`,
 1 AS `delivery_maximum_order`,
 1 AS `pickup_minimum_order`,
 1 AS `pickup_maximum_order`,
 1 AS `country_name`,
 1 AS `country_id`,
 1 AS `state_id`,
 1 AS `city_id`,
 1 AS `area_id`,
 1 AS `logo`,
 1 AS `merchant_type`,
 1 AS `invoice_terms`,
 1 AS `payment_gateway_ref`,
 1 AS `user_access`,
 1 AS `ratings`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mt_view_order_details`
--

DROP TABLE IF EXISTS `mt_view_order_details`;
/*!50001 DROP VIEW IF EXISTS `mt_view_order_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mt_view_order_details` AS SELECT 
 1 AS `id`,
 1 AS `order_id`,
 1 AS `client_id`,
 1 AS `item_id`,
 1 AS `item_name`,
 1 AS `order_notes`,
 1 AS `normal_price`,
 1 AS `discounted_price`,
 1 AS `size`,
 1 AS `qty`,
 1 AS `cooking_ref`,
 1 AS `addon`,
 1 AS `ingredients`,
 1 AS `non_taxable`,
 1 AS `merchant_id`,
 1 AS `status`,
 1 AS `date_created`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mt_view_ratings`
--

DROP TABLE IF EXISTS `mt_view_ratings`;
/*!50001 DROP VIEW IF EXISTS `mt_view_ratings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mt_view_ratings` AS SELECT 
 1 AS `merchant_id`,
 1 AS `ratings`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mt_voucher`
--

DROP TABLE IF EXISTS `mt_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_voucher` (
  `voucher_id` int(14) NOT NULL AUTO_INCREMENT,
  `voucher_name` varchar(255) NOT NULL DEFAULT '',
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `number_of_voucher` int(14) NOT NULL DEFAULT '0',
  `amount` float NOT NULL,
  `voucher_type` varchar(100) NOT NULL DEFAULT 'fixed amount',
  `status` varchar(100) NOT NULL DEFAULT '',
  `date_created` varchar(50) NOT NULL DEFAULT '',
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`voucher_id`),
  KEY `voucher_name` (`voucher_name`),
  KEY `merchant_id` (`merchant_id`),
  KEY `voucher_type` (`voucher_type`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_voucher`
--

LOCK TABLES `mt_voucher` WRITE;
/*!40000 ALTER TABLE `mt_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_voucher_list`
--

DROP TABLE IF EXISTS `mt_voucher_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_voucher_list` (
  `voucher_id` int(14) NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'unused',
  `client_id` int(14) NOT NULL DEFAULT '0',
  `date_used` varchar(50) NOT NULL DEFAULT '',
  `order_id` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`voucher_id`),
  KEY `voucher_code` (`voucher_code`),
  KEY `status` (`status`),
  KEY `client_id` (`client_id`),
  KEY `order_id` (`order_id`),
  KEY `date_used` (`date_used`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_voucher_list`
--

LOCK TABLES `mt_voucher_list` WRITE;
/*!40000 ALTER TABLE `mt_voucher_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_voucher_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_voucher_new`
--

DROP TABLE IF EXISTS `mt_voucher_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_voucher_new` (
  `voucher_id` int(14) NOT NULL AUTO_INCREMENT,
  `voucher_owner` varchar(255) NOT NULL DEFAULT 'merchant',
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `joining_merchant` text,
  `voucher_name` varchar(255) NOT NULL DEFAULT '',
  `voucher_type` varchar(255) NOT NULL DEFAULT '',
  `amount` float(14,4) NOT NULL DEFAULT '0.0000',
  `expiration` date DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  `used_once` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`voucher_id`),
  KEY `voucher_name` (`voucher_name`),
  KEY `status` (`status`),
  KEY `voucher_owner` (`voucher_owner`),
  KEY `merchant_id` (`merchant_id`),
  KEY `voucher_type` (`voucher_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_voucher_new`
--

LOCK TABLES `mt_voucher_new` WRITE;
/*!40000 ALTER TABLE `mt_voucher_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_voucher_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_withdrawal`
--

DROP TABLE IF EXISTS `mt_withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_withdrawal` (
  `withdrawal_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL DEFAULT '0',
  `payment_type` varchar(100) NOT NULL DEFAULT '',
  `payment_method` varchar(100) NOT NULL DEFAULT '',
  `amount` float(14,4) NOT NULL DEFAULT '0.0000',
  `current_balance` float(14,4) NOT NULL DEFAULT '0.0000',
  `balance` float(14,4) NOT NULL DEFAULT '0.0000',
  `currency_code` varchar(3) NOT NULL DEFAULT '',
  `account` varchar(255) NOT NULL DEFAULT '',
  `account_name` varchar(255) NOT NULL DEFAULT '',
  `bank_account_number` varchar(255) NOT NULL DEFAULT '',
  `swift_code` varchar(100) NOT NULL DEFAULT '',
  `bank_name` varchar(255) NOT NULL DEFAULT '',
  `bank_branch` varchar(255) NOT NULL DEFAULT '',
  `bank_country` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `viewed` int(2) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_to_process` date DEFAULT NULL,
  `date_process` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `api_raw_response` text,
  `withdrawal_token` text,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `bank_type` varchar(255) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`withdrawal_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `payment_type` (`payment_type`),
  KEY `payment_method` (`payment_method`),
  KEY `status` (`status`),
  KEY `viewed` (`viewed`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_withdrawal`
--

LOCK TABLES `mt_withdrawal` WRITE;
/*!40000 ALTER TABLE `mt_withdrawal` DISABLE KEYS */;
INSERT INTO `mt_withdrawal` VALUES (1,1,'single','bank',14.0000,14.4000,0.4000,'BRL','','Itau','8317','122045','Itau','São Paulo','BR','approved',2,'2019-10-04 23:14:14','2019-10-11','2019-10-05 02:14:14',NULL,'67af9a781abb50c7843c9f8ebb16cf77','187.101.170.169','default'),(2,1,'single','bank',7.0000,7.6000,0.6000,'BRL','','Itau','8317','122045','Itau','São Paulo','BR','approved',2,'2019-10-04 23:38:34','2019-10-11','2019-10-05 02:38:34',NULL,'5bd3fdaa7942abf787162cb62abad384','187.101.170.169','default'),(3,1,'all-earnings','bank',4.2000,4.2000,0.0000,'BRL','','Itau','8317','122045','Itau','São Paulo','BR','approved',2,'2019-10-05 22:30:22','2019-10-12','2019-10-06 01:30:22',NULL,'d262f4482e227dc8fa9c343613c6e7c5','187.101.170.169','default'),(4,2,'all-earnings','bank',18.0000,18.0000,0.0000,'BRL','','Banco do Brasil','1212121545545','221220202','BAnco24\'','dfdfd','BR','approved',2,'2019-10-20 11:36:21','2019-10-27','2019-10-20 14:36:21',NULL,'73eb0940d740521880e5808d96671db7','189.79.85.100','default');
/*!40000 ALTER TABLE `mt_withdrawal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_zipcode`
--

DROP TABLE IF EXISTS `mt_zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mt_zipcode` (
  `zipcode_id` int(14) NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(255) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `area` varchar(255) NOT NULL DEFAULT '',
  `stree_name` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`zipcode_id`),
  KEY `country_code` (`country_code`),
  KEY `area` (`area`),
  KEY `stree_name` (`stree_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_zipcode`
--

LOCK TABLES `mt_zipcode` WRITE;
/*!40000 ALTER TABLE `mt_zipcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_zipcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `mt_driver_order_view`
--

/*!50001 DROP VIEW IF EXISTS `mt_driver_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mt_driver_order_view` AS select `a`.`order_id` AS `order_id`,`a`.`client_id` AS `client_id`,`b`.`device_platform` AS `device_platform`,`b`.`device_id` AS `device_id`,`b`.`enabled_push` AS `enabled_push`,`b`.`status` AS `status`,`b`.`client_name` AS `client_name` from (`mt_order` `a` left join `mt_mobile_registered_view` `b` on((`a`.`client_id` = `b`.`client_id`))) where (`b`.`status` = 'active') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mt_driver_task_view`
--

/*!50001 DROP VIEW IF EXISTS `mt_driver_task_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mt_driver_task_view` AS select `a`.`task_id` AS `task_id`,`a`.`order_id` AS `order_id`,`a`.`user_type` AS `user_type`,`a`.`user_id` AS `user_id`,`a`.`task_description` AS `task_description`,`a`.`trans_type` AS `trans_type`,`a`.`contact_number` AS `contact_number`,`a`.`email_address` AS `email_address`,`a`.`customer_name` AS `customer_name`,`a`.`delivery_date` AS `delivery_date`,`a`.`delivery_address` AS `delivery_address`,`a`.`team_id` AS `team_id`,`a`.`driver_id` AS `driver_id`,`a`.`task_lat` AS `task_lat`,`a`.`task_lng` AS `task_lng`,`a`.`customer_signature` AS `customer_signature`,`a`.`status` AS `status`,`a`.`date_created` AS `date_created`,`a`.`date_modified` AS `date_modified`,`a`.`ip_address` AS `ip_address`,`a`.`auto_assign_type` AS `auto_assign_type`,`a`.`assign_started` AS `assign_started`,`a`.`assignment_status` AS `assignment_status`,`a`.`dropoff_merchant` AS `dropoff_merchant`,`a`.`dropoff_contact_name` AS `dropoff_contact_name`,`a`.`dropoff_contact_number` AS `dropoff_contact_number`,`a`.`drop_address` AS `drop_address`,`a`.`dropoff_lat` AS `dropoff_lat`,`a`.`dropoff_lng` AS `dropoff_lng`,`a`.`recipient_name` AS `recipient_name`,`a`.`critical` AS `critical`,concat(`b`.`first_name`,' ',`b`.`last_name`) AS `driver_name`,`b`.`device_id` AS `device_id`,`b`.`phone` AS `driver_phone`,`b`.`email` AS `driver_email`,`b`.`device_platform` AS `device_platform`,`b`.`enabled_push` AS `enabled_push`,`b`.`location_lat` AS `driver_lat`,`b`.`location_lng` AS `driver_lng`,`c`.`merchant_id` AS `merchant_id`,`d`.`restaurant_name` AS `merchant_name`,concat(`d`.`street`,' ',`d`.`city`,' ',`d`.`state`,' ',`d`.`post_code`) AS `merchant_address`,`e`.`team_name` AS `team_name`,`f`.`sub_total` AS `sub_total`,`f`.`total_w_tax` AS `total_w_tax`,`f`.`delivery_charge` AS `delivery_charge`,`f`.`payment_type` AS `payment_type`,`f`.`status` AS `order_status` from (((((`mt_driver_task` `a` left join `mt_driver` `b` on((`b`.`driver_id` = `a`.`driver_id`))) left join `mt_order` `c` on((`c`.`order_id` = `a`.`order_id`))) left join `mt_merchant` `d` on((`d`.`merchant_id` = `c`.`merchant_id`))) left join `mt_driver_team` `e` on((`e`.`team_id` = `a`.`team_id`))) left join `mt_order` `f` on((`f`.`order_id` = `a`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mt_mobile_registered_view`
--

/*!50001 DROP VIEW IF EXISTS `mt_mobile_registered_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mt_mobile_registered_view` AS select `a`.`id` AS `id`,`a`.`client_id` AS `client_id`,`a`.`device_platform` AS `device_platform`,`a`.`device_id` AS `device_id`,`a`.`enabled_push` AS `enabled_push`,`a`.`country_code_set` AS `country_code_set`,`a`.`date_created` AS `date_created`,`a`.`date_modified` AS `date_modified`,`a`.`ip_address` AS `ip_address`,`a`.`status` AS `status`,`a`.`app_version` AS `app_version`,concat(`b`.`first_name`,' ',`b`.`last_name`) AS `client_name` from (`mt_mobile_registered` `a` left join `mt_client` `b` on((`a`.`client_id` = `b`.`client_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mt_view_location_rate`
--

/*!50001 DROP VIEW IF EXISTS `mt_view_location_rate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mt_view_location_rate` AS select `a`.`rate_id` AS `rate_id`,`a`.`merchant_id` AS `merchant_id`,`a`.`country_id` AS `country_id`,`b`.`country_name` AS `country_name`,`a`.`state_id` AS `state_id`,`c`.`name` AS `state_name`,`a`.`city_id` AS `city_id`,`d`.`name` AS `city_name`,`d`.`postal_code` AS `postal_code`,`a`.`area_id` AS `area_id`,`e`.`name` AS `area_name`,`a`.`fee` AS `fee`,`a`.`sequence` AS `sequence`,`a`.`date_created` AS `date_created`,`a`.`date_modified` AS `date_modified`,`a`.`ip_address` AS `ip_address` from ((((`mt_location_rate` `a` left join `mt_location_countries` `b` on((`a`.`country_id` = `b`.`country_id`))) left join `mt_location_states` `c` on((`a`.`state_id` = `c`.`state_id`))) left join `mt_location_cities` `d` on((`a`.`city_id` = `d`.`city_id`))) left join `mt_location_area` `e` on((`a`.`area_id` = `e`.`area_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mt_view_merchant`
--

/*!50001 DROP VIEW IF EXISTS `mt_view_merchant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mt_view_merchant` AS select `a`.`merchant_id` AS `merchant_id`,`a`.`restaurant_slug` AS `restaurant_slug`,`a`.`restaurant_name` AS `restaurant_name`,`a`.`restaurant_phone` AS `restaurant_phone`,`a`.`contact_name` AS `contact_name`,`a`.`contact_phone` AS `contact_phone`,`a`.`contact_email` AS `contact_email`,`a`.`country_code` AS `country_code`,`a`.`street` AS `street`,`a`.`city` AS `city`,`a`.`state` AS `state`,`a`.`post_code` AS `post_code`,`a`.`cuisine` AS `cuisine`,`a`.`service` AS `service`,`a`.`free_delivery` AS `free_delivery`,`a`.`delivery_estimation` AS `delivery_estimation`,`a`.`username` AS `username`,`a`.`password` AS `password`,`a`.`activation_key` AS `activation_key`,`a`.`activation_token` AS `activation_token`,`a`.`status` AS `status`,`a`.`date_created` AS `date_created`,`a`.`date_modified` AS `date_modified`,`a`.`date_activated` AS `date_activated`,`a`.`last_login` AS `last_login`,`a`.`ip_address` AS `ip_address`,`a`.`package_id` AS `package_id`,`a`.`package_price` AS `package_price`,`a`.`membership_expired` AS `membership_expired`,`a`.`payment_steps` AS `payment_steps`,`a`.`is_featured` AS `is_featured`,`a`.`is_ready` AS `is_ready`,`a`.`is_sponsored` AS `is_sponsored`,`a`.`sponsored_expiration` AS `sponsored_expiration`,`a`.`lost_password_code` AS `lost_password_code`,`a`.`user_lang` AS `user_lang`,`a`.`membership_purchase_date` AS `membership_purchase_date`,`a`.`sort_featured` AS `sort_featured`,`a`.`is_commission` AS `is_commission`,`a`.`percent_commision` AS `percent_commision`,`a`.`abn` AS `abn`,`a`.`session_token` AS `session_token`,`a`.`commision_type` AS `commision_type`,`a`.`mobile_session_token` AS `mobile_session_token`,`a`.`merchant_key` AS `merchant_key`,`a`.`latitude` AS `latitude`,`a`.`lontitude` AS `lontitude`,`a`.`delivery_charges` AS `delivery_charges`,`a`.`minimum_order` AS `minimum_order`,`a`.`delivery_minimum_order` AS `delivery_minimum_order`,`a`.`delivery_maximum_order` AS `delivery_maximum_order`,`a`.`pickup_minimum_order` AS `pickup_minimum_order`,`a`.`pickup_maximum_order` AS `pickup_maximum_order`,`a`.`country_name` AS `country_name`,`a`.`country_id` AS `country_id`,`a`.`state_id` AS `state_id`,`a`.`city_id` AS `city_id`,`a`.`area_id` AS `area_id`,`a`.`logo` AS `logo`,`a`.`merchant_type` AS `merchant_type`,`a`.`invoice_terms` AS `invoice_terms`,`a`.`payment_gateway_ref` AS `payment_gateway_ref`,`a`.`user_access` AS `user_access`,`f`.`ratings` AS `ratings` from (`mt_merchant` `a` left join `mt_view_ratings` `f` on((`a`.`merchant_id` = `f`.`merchant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mt_view_order_details`
--

/*!50001 DROP VIEW IF EXISTS `mt_view_order_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mt_view_order_details` AS select `a`.`id` AS `id`,`a`.`order_id` AS `order_id`,`a`.`client_id` AS `client_id`,`a`.`item_id` AS `item_id`,`a`.`item_name` AS `item_name`,`a`.`order_notes` AS `order_notes`,`a`.`normal_price` AS `normal_price`,`a`.`discounted_price` AS `discounted_price`,`a`.`size` AS `size`,`a`.`qty` AS `qty`,`a`.`cooking_ref` AS `cooking_ref`,`a`.`addon` AS `addon`,`a`.`ingredients` AS `ingredients`,`a`.`non_taxable` AS `non_taxable`,`b`.`merchant_id` AS `merchant_id`,`b`.`status` AS `status`,`b`.`date_created` AS `date_created` from (`mt_order_details` `a` left join `mt_order` `b` on((`a`.`order_id` = `b`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mt_view_ratings`
--

/*!50001 DROP VIEW IF EXISTS `mt_view_ratings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mt_view_ratings` AS select `mt_review`.`merchant_id` AS `merchant_id`,(sum(`mt_review`.`rating`) / count(0)) AS `ratings` from `mt_review` where (`mt_review`.`status` in ('publish','published')) group by `mt_review`.`merchant_id` */;
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

-- Dump completed on 2019-10-23 14:14:13