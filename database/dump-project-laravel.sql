-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: project_laravel
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'Cash','1','USD',0.0000,'Cash',NULL,NULL,1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,'Transfer','other','#3c3f72',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(2,1,'Deposit','income','#efad32',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(3,1,'Sales','income','#6da252',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(4,1,'Other','expense','#e5e5e5',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(5,1,'General','item','#328aef',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(6,4,'Transferência','other','#0e6696',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(7,4,'Depósito','income','#efad32',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(8,4,'Vendas','income','#6da252',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(9,4,'Outro ','expense','#e5e5e5',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(10,4,'Geral','item','#328aef',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'',1,'core::console',NULL,'2023-05-17 07:09:01','2023-05-17 07:09:01',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contacts_company_id_type_email_deleted_at_unique` (`company_id`,`type`,`email`,`deleted_at`),
  KEY `contacts_company_id_type_index` (`company_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  KEY `currencies_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,1,'US Dollar','USD',1.00000000,'2','$',1,'.',',',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(2,1,'Euro','EUR',1.25000000,'2','€',1,',','.',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:55','2023-05-17 08:09:55'),(3,1,'British Pound','GBP',1.60000000,'2','£',1,'.',',',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:10:01','2023-05-17 08:10:01'),(4,1,'Turkish Lira','TRY',0.80000000,'2','₺',1,',','.',1,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:10:07','2023-05-17 08:10:07'),(5,1,'Real','BRL',1.00000000,NULL,NULL,1,NULL,NULL,1,'core::ui',1,'2023-05-17 08:10:33','2023-05-17 08:10:33',NULL),(6,4,'Dólar Americano','USD',1.00000000,'2','$',1,'.',',',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(7,4,'Euro','EUR',1.25000000,'2','€',1,',','.',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(8,4,'Libras Britânicas','GBP',1.60000000,'2','£',1,'.',',',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(9,4,'Lira Turca','TRY',0.80000000,'2','₺',1,',','.',1,'core::seed',2,'2023-07-13 06:12:29','2023-07-13 06:12:29',NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards`
--

DROP TABLE IF EXISTS `dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboards_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards`
--

LOCK TABLES `dashboards` WRITE;
/*!40000 ALTER TABLE `dashboards` DISABLE KEYS */;
INSERT INTO `dashboards` VALUES (1,1,'Dashboard',1,'core::seed',NULL,'2023-05-17 08:09:10','2023-05-17 08:09:10',NULL),(2,1,'Painel ',1,'core::seed',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(3,1,'Painel ',1,'core::seed',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(4,4,'Dashboard',1,'core::seed',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(5,4,'Painel ',1,'core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(6,1,'Painel ',1,'core::seed',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(7,4,'Painel ',1,'core::seed',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL);
/*!40000 ALTER TABLE `dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_histories`
--

DROP TABLE IF EXISTS `document_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_histories_company_id_index` (`company_id`),
  KEY `document_histories_type_index` (`type`),
  KEY `document_histories_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_histories`
--

LOCK TABLES `document_histories` WRITE;
/*!40000 ALTER TABLE `document_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_item_taxes`
--

DROP TABLE IF EXISTS `document_item_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_item_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `document_item_id` int(10) unsigned NOT NULL,
  `tax_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_item_taxes_company_id_index` (`company_id`),
  KEY `document_item_taxes_type_index` (`type`),
  KEY `document_item_taxes_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_item_taxes`
--

LOCK TABLES `document_item_taxes` WRITE;
/*!40000 ALTER TABLE `document_item_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_item_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_items`
--

DROP TABLE IF EXISTS `document_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `total` double(15,4) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_items_company_id_index` (`company_id`),
  KEY `document_items_type_index` (`type`),
  KEY `document_items_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_items`
--

LOCK TABLES `document_items` WRITE;
/*!40000 ALTER TABLE `document_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_totals`
--

DROP TABLE IF EXISTS `document_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_totals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_totals_company_id_index` (`company_id`),
  KEY `document_totals_type_index` (`type`),
  KEY `document_totals_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_totals`
--

LOCK TABLES `document_totals` WRITE;
/*!40000 ALTER TABLE `document_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT 1,
  `contact_id` int(10) unsigned NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_document_number_deleted_at_company_id_type_unique` (`document_number`,`deleted_at`,`company_id`,`type`),
  KEY `documents_company_id_index` (`company_id`),
  KEY `documents_type_index` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_templates_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  KEY `email_templates_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,1,'invoice_new_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_new_customer','{invoice_number} invoice created','Dear {customer_name},<br /><br />We have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(2,1,'invoice_remind_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_remind_customer','{invoice_number} invoice overdue notice','Dear {customer_name},<br /><br />This is an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(3,1,'invoice_remind_admin','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_remind_admin','{invoice_number} invoice overdue notice','Hello,<br /><br />{customer_name} has received an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(4,1,'invoice_recur_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_recur_customer','{invoice_number} recurring invoice created','Dear {customer_name},<br /><br />Based on your recurring circle, we have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(5,1,'invoice_recur_admin','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_recur_admin','{invoice_number} recurring invoice created','Hello,<br /><br />Based on {customer_name} recurring circle, <strong>{invoice_number}</strong> invoice has been automatically created.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(6,1,'invoice_payment_customer','App\\Notifications\\Portal\\PaymentReceived','settings.email.templates.invoice_payment_customer','Payment received for {invoice_number} invoice','Dear {customer_name},<br /><br />Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br />Amount: <strong>{transaction_total}</strong><br />Date: <strong>{transaction_paid_date}</strong><br />Invoice Number: <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />You can always see the invoice details from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(7,1,'invoice_payment_admin','App\\Notifications\\Portal\\PaymentReceived','settings.email.templates.invoice_payment_admin','Payment received for {invoice_number} invoice','Hello,<br /><br />{customer_name} recorded a payment for <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(8,1,'bill_remind_admin','App\\Notifications\\Purchase\\Bill','settings.email.templates.bill_remind_admin','{bill_number} bill reminding notice','Hello,<br /><br />This is a reminding notice for <strong>{bill_number}</strong> bill to {vendor_name}.<br /><br />The bill total is {bill_total} and is due <strong>{bill_due_date}</strong>.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(9,1,'bill_recur_admin','App\\Notifications\\Purchase\\Bill','settings.email.templates.bill_recur_admin','{bill_number} recurring bill created','Hello,<br /><br />Based on {vendor_name} recurring circle, <strong>{bill_number}</strong> bill has been automatically created.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(10,1,'revenue_new_customer','App\\Notifications\\Sale\\Revenue','settings.email.templates.revenue_new_customer','{revenue_date} payment created','Dear {customer_name},<br /><br />We have prepared the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Feel free to contact us with any questions..<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-05-17 08:09:01','2023-05-17 08:09:01',NULL),(11,4,'invoice_new_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_new_customer','{invoice_number} fatura criada','Caro {customer_name},<br /><br />Nós preparamos a seguinte fatura para você: <strong>{invoice_number}</strong>.<br /><br />Você pode ver os detalhes da fatura e prosseguir com o pagamento a partir do seguinte link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Sinta-se a vontade para entrar em contato conosco para qualquer pergunta.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(12,4,'invoice_remind_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_remind_customer','{invoice_number} aviso de fatura vencida','Caro {customer_name},<br /><br />Este é um aviso de fatura em atraso <strong>{invoice_number}</strong>.<br /><br />O total da fatura é {invoice_total} e venceu em <strong>{invoice_due_date}</strong>.<br /><br />Você pode ver os detalhes da fatura e prosseguir com o pagamento a partir do seguinte link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(13,4,'invoice_remind_admin','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_remind_admin','{invoice_number} aviso de fatura vencida','Olá,<br /><br />{customer_name} recebeu um aviso de fatura em atraso <strong>{invoice_number}</strong>.<br /><br />O total da fatura é {invoice_total} e venceu em <strong>{invoice_due_date}</strong>.<br /><br />Você pode ver os detalhes da fatura do seguinte link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(14,4,'invoice_recur_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_recur_customer','Fatura recorrente {invoice_number} criada','Caro {customer_name},<br /><br />Baseado no seu círculo recorrente, nós preparamos a seguinte fatura para você: <strong>{invoice_number}</strong>.<br /><br />Você pode ver os detalhes da fatura e prosseguir com o pagamento a partir do seguinte link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Sinta-se a vontade para entrar em contato conosco para qualquer pergunta.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(15,4,'invoice_recur_admin','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_recur_admin','Fatura recorrente {invoice_number} criada','Olá,<br /><br /> Baseado no círculo recorrente de {customer_name}, a fatura <strong>{invoice_number}</strong> foi criada automaticamente.<br /><br />Você pode ver os detalhes da fatura a partir do seguinte link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:29','2023-07-13 06:12:29',NULL),(16,4,'invoice_payment_customer','App\\Notifications\\Portal\\PaymentReceived','settings.email.templates.invoice_payment_customer','Pagamento recebido para fatura {invoice_number}','Caro {customer_name},<br /><br />Obrigado pelo pagamento. Encontrando os detalhes do pagamento abaixo:<br /><br />-------------------------------------------------<br /><br />Valor: <strong>{transaction_total}<br /></strong>Data: <strong>{transaction_paid_date}</strong><br />Número da fatura: <strong>{invoice_number}<br /><br /></strong>-------------------------------------------------<br /><br />Você pode sempre ver os detalhes da fatura: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Sinta-se à vontade para entrar em contato conosco para qualquer pergunta.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:30','2023-07-13 06:12:30',NULL),(17,4,'invoice_payment_admin','App\\Notifications\\Portal\\PaymentReceived','settings.email.templates.invoice_payment_admin','Pagamento recebido para fatura {invoice_number}','Olá,<br /><br />{customer_name} registrou um pagamento para a fatura <strong>{invoice_number}</strong>.<br /><br />Você pode ver os detalhes da fatura no seguinte link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:30','2023-07-13 06:12:30',NULL),(18,4,'bill_remind_admin','App\\Notifications\\Purchase\\Bill','settings.email.templates.bill_remind_admin','Notificação lembrete de cobrança {bill_number}','Olá,<br /><br /> Este é um lembrete de vencimento da fatura <strong>{bill_number}</strong> de {vendor_name}.<br /><br />O total da fatura é {bill_total} e vence em <strong>{bill_due_date} </strong>.<br /><br />Você poderá visualizar os detalhes da fatura no seguinte link: <a href=\"{bill_admin_link}\"> {bill_number} </a>.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:30','2023-07-13 06:12:30',NULL),(19,4,'bill_recur_admin','App\\Notifications\\Purchase\\Bill','settings.email.templates.bill_recur_admin','Fatura recorrente {bill_number} criada','Olá,<br /><br /> Baseado no círculo recorrente de {vendor_name}, a fatura <strong>{bill_number}</strong> foi criada automaticamente.<br /><br />Você pode ver os detalhes da fatura a partir do seguinte link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:30','2023-07-13 06:12:30',NULL),(20,4,'revenue_new_customer','App\\Notifications\\Sale\\Revenue','settings.email.templates.revenue_new_customer','{revenue_date} pagamento criado','Caro {customer_name},<br /><br />Nós preparamos a seguinte fatura para você: <strong>{invoice_number}</strong>.<br /><br />Você pode ver os detalhes da fatura e prosseguir com o pagamento a partir do seguinte link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Sinta-se a vontade para entrar em contato conosco para qualquer pergunta.<br /><br />Atenciosamente,<br />{company_name}',NULL,'core::seed','2','2023-07-13 06:12:30','2023-07-13 06:12:30',NULL);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewall_ips`
--

DROP TABLE IF EXISTS `firewall_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewall_ips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_id` int(11) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `firewall_ips_ip_deleted_at_unique` (`ip`,`deleted_at`),
  KEY `firewall_ips_ip_index` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall_ips`
--

LOCK TABLES `firewall_ips` WRITE;
/*!40000 ALTER TABLE `firewall_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewall_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewall_logs`
--

DROP TABLE IF EXISTS `firewall_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewall_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `middleware` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firewall_logs_ip_index` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall_logs`
--

LOCK TABLES `firewall_logs` WRITE;
/*!40000 ALTER TABLE `firewall_logs` DISABLE KEYS */;
INSERT INTO `firewall_logs` VALUES (1,'::1','medium','login',0,'http://localhost/pacs-solution/auth/login','http://localhost/pacs-solution/auth/login','_token=aaqjOX4Qa6ytU6FOMGNDEQmEUEBr7UEL4GR0LQ48&email=admin@company.com&password=******&remember[0]=1','2023-05-17 07:08:57','2023-05-17 07:08:57',NULL),(2,'172.105.89.161','medium','agent',0,'http://dev-afigueredo.xyz/0bef','NULL','','2023-05-20 21:51:14','2023-05-20 21:51:14',NULL),(3,'193.35.18.61','medium','agent',0,'http://152.67.35.77','NULL','','2023-05-20 23:22:06','2023-05-20 23:22:06',NULL),(4,'167.94.145.59','medium','agent',0,'http://152.67.35.77','NULL','','2023-05-21 01:59:53','2023-05-21 01:59:53',NULL),(5,'::1','medium','login',0,'http://localhost/pacs-solution/auth/login','http://localhost/pacs-solution/auth/login','_token=bQyd6cm4mK2iCrQzRBeOPS3Ij4FHLPJmGR6e4xdc&email=axelfiguerredo07@gmail.com&password=******&remember[0]=1','2023-06-14 00:59:07','2023-06-14 00:59:07',NULL),(6,'::1','medium','login',0,'https://localhost/pacs-solution/auth/login','https://localhost/pacs-solution/auth/login','_token=jm1JpMcV6ahBRvE3JlNJrdNFsZdF6W2B1pnovfJe&email=pacs@solution.com&password=******','2023-07-13 06:07:54','2023-07-13 06:07:54',NULL),(7,'::1','medium','login',0,'https://localhost/pacs-solution/auth/login','https://localhost/pacs-solution/auth/login','_token=jm1JpMcV6ahBRvE3JlNJrdNFsZdF6W2B1pnovfJe&email=pacs@solution.com&password=******','2023-07-13 06:08:04','2023-07-13 06:08:04',NULL),(8,'::1','medium','login',0,'https://localhost/pacs-solution/auth/login','https://localhost/pacs-solution/auth/login','_token=jm1JpMcV6ahBRvE3JlNJrdNFsZdF6W2B1pnovfJe&email=pacs@solution.com&password=******','2023-07-13 06:08:11','2023-07-13 06:08:11',NULL),(9,'::1','medium','login',0,'https://localhost/pacs-solution/auth/login','https://localhost/pacs-solution/auth/login','_token=jm1JpMcV6ahBRvE3JlNJrdNFsZdF6W2B1pnovfJe&email=pacs@solution.com&password=******','2023-07-13 06:08:55','2023-07-13 06:08:55',NULL),(10,'::1','medium','login',0,'https://localhost/pacs-solution/auth/login','https://localhost/pacs-solution/auth/login','_token=jm1JpMcV6ahBRvE3JlNJrdNFsZdF6W2B1pnovfJe&email=pacs@solution.com&password=******','2023-07-13 06:09:07','2023-07-13 06:09:07',NULL),(11,'::1','medium','login',0,'https://localhost/pacs-solution/auth/login','https://localhost/pacs-solution/auth/login','_token=rpc0IwZAFF36RMVZUu0y2w6TUwoonXsWJCZZTC2i&email=pacssolution@admn.com&password=******','2023-07-13 07:56:04','2023-07-13 07:56:04',NULL),(12,'::1','medium','agent',0,'http://localhost/pacs-solution/1/uploads/18','NULL','','2023-09-21 08:07:21','2023-09-21 08:07:21',NULL),(13,'::1','medium','agent',0,'http://localhost/pacs-solution/1/uploads/30','NULL','','2023-09-21 08:13:19','2023-09-21 08:13:19',NULL),(14,'::1','medium','agent',0,'http://localhost/pacs-solution/1/uploads/30','NULL','','2023-09-21 08:15:15','2023-09-21 08:15:15',NULL),(15,'::1','medium','agent',0,'http://localhost/pacs-solution/1/uploads/30','NULL','','2023-09-21 08:17:01','2023-09-21 08:17:01',NULL),(16,'::1','medium','agent',0,'http://localhost/pacs-solution/1/uploads/18','NULL','','2023-09-21 08:18:15','2023-09-21 08:18:15',NULL),(17,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=admin@admin.com&password=******','2023-09-25 00:39:53','2023-09-25 00:39:53',NULL),(18,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=admin@admin.com&password=******','2023-09-25 00:41:01','2023-09-25 00:41:01',NULL),(19,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=axelfigueredo07@gmail.com&password=******','2023-09-25 00:41:07','2023-09-25 00:41:07',NULL),(20,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=company@company.com&password=******','2023-09-25 00:41:53','2023-09-25 00:41:53',NULL),(21,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=axelfigueredo07@gmail.com&password=******','2023-09-25 00:42:40','2023-09-25 00:42:40',NULL),(22,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=axelfigueredo07@gmail.com&password=******','2023-09-25 00:43:00','2023-09-25 00:43:00',NULL),(23,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=admin@admin.com&password=******','2023-09-25 00:43:18','2023-09-25 00:43:18',NULL),(24,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=admin@admin.com&password=******','2023-09-25 00:43:37','2023-09-25 00:43:37',NULL),(25,'::1','medium','login',0,'http://localhost/smartDrogariaSaude/auth/login','http://localhost/smartDrogariaSaude/auth/login','_token=ZvFWYgGdmPCifrNe9aE6X5YzMCGUfYj0A9KxaZli&email=admin@admin.com&password=******','2023-09-25 00:44:22','2023-09-25 00:44:22',NULL);
/*!40000 ALTER TABLE `firewall_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_histories`
--

DROP TABLE IF EXISTS `invoice_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_histories_company_id_index` (`company_id`),
  KEY `invoice_histories_invoice_id_index` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_histories`
--

LOCK TABLES `invoice_histories` WRITE;
/*!40000 ALTER TABLE `invoice_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_item_taxes`
--

DROP TABLE IF EXISTS `invoice_item_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_item_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_item_taxes_company_id_index` (`company_id`),
  KEY `invoice_item_taxes_invoice_id_index` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_item_taxes`
--

LOCK TABLES `invoice_item_taxes` WRITE;
/*!40000 ALTER TABLE `invoice_item_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_item_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_company_id_index` (`company_id`),
  KEY `invoice_items_invoice_id_index` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_totals`
--

DROP TABLE IF EXISTS `invoice_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_totals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_totals_company_id_index` (`company_id`),
  KEY `invoice_totals_invoice_id_index` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_totals`
--

LOCK TABLES `invoice_totals` WRITE;
/*!40000 ALTER TABLE `invoice_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  KEY `invoices_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_taxes`
--

DROP TABLE IF EXISTS `item_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_taxes_company_id_item_id_index` (`company_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_taxes`
--

LOCK TABLES `item_taxes` WRITE;
/*!40000 ALTER TABLE `item_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL DEFAULT 0,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_media_id` int(10) unsigned DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_disk_directory_filename_extension_unique` (`disk`,`directory`,`filename`,`extension`),
  UNIQUE KEY `media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  KEY `media_aggregate_type_index` (`aggregate_type`),
  KEY `media_disk_directory_index` (`disk`,`directory`),
  KEY `original_media_id` (`original_media_id`),
  KEY `media_company_id_index` (`company_id`),
  CONSTRAINT `original_media_id` FOREIGN KEY (`original_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (32,1,'uploads','2023/09/24/1/settings','developer','png','image/png','image',6693,NULL,NULL,'core::ui','1','2023-09-24 21:51:33','2023-09-24 21:51:33',NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediables`
--

DROP TABLE IF EXISTS `mediables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediables` (
  `media_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mediable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) unsigned NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  KEY `mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  KEY `mediables_tag_index` (`tag`),
  KEY `mediables_order_index` (`order`),
  KEY `mediables_company_id_index` (`company_id`),
  CONSTRAINT `mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediables`
--

LOCK TABLES `mediables` WRITE;
/*!40000 ALTER TABLE `mediables` DISABLE KEYS */;
INSERT INTO `mediables` VALUES (32,1,'App\\Models\\Common\\Company',1,'company_logo',1,'core::ui','1');
/*!40000 ALTER TABLE `mediables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_06_27_000000_create_mediable_tables',1),(2,'2017_09_14_000000_core_v1',1),(3,'2020_01_08_000000_core_v200',1),(4,'2020_03_20_183732_core_v208',1),(5,'2020_06_09_000000_core_v2014',1),(6,'2020_07_20_000000_core_v2017',1),(7,'2020_10_12_000000_add_variants_to_media',1),(8,'2020_10_13_000000_core_v210',1),(9,'2021_04_01_000000_core_v219',1),(10,'2021_05_17_000000_core_v2114',1),(11,'2021_06_17_000000_core_v2117',1),(12,'2021_09_01_000000_core_v2124',1),(13,'2021_09_10_000000_core_v2125',1),(14,'2021_09_10_000000_core_v2126',1),(15,'2021_09_10_000000_core_v2127',1),(16,'2022_03_02_000000_core_v2133',1),(17,'2022_03_23_000000_core_v2134',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_histories`
--

DROP TABLE IF EXISTS `module_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_histories_company_id_module_id_index` (`company_id`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_histories`
--

LOCK TABLES `module_histories` WRITE;
/*!40000 ALTER TABLE `module_histories` DISABLE KEYS */;
INSERT INTO `module_histories` VALUES (1,1,1,'2.0.3','offline-payments installed','core::console',NULL,'2023-05-17 08:09:02','2023-05-17 08:09:02',NULL),(2,1,2,'2.0.0','paypal-standard installed','core::console',NULL,'2023-05-17 08:09:06','2023-05-17 08:09:06',NULL),(3,4,3,'2.0.3','offline-payments installed','core::ui','2','2023-07-13 06:12:30','2023-07-13 06:12:30',NULL),(4,4,4,'2.0.0','paypal-standard installed','core::ui','2','2023-07-13 06:12:31','2023-07-13 06:12:31',NULL);
/*!40000 ALTER TABLE `module_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  KEY `modules_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,1,'offline-payments',1,'core::console',NULL,'2023-05-17 08:09:02','2023-05-17 08:09:02',NULL),(2,1,'paypal-standard',1,'core::console',NULL,'2023-05-17 08:09:06','2023-05-17 08:09:06',NULL),(3,4,'offline-payments',1,'core::ui','2','2023-07-13 06:12:30','2023-07-13 06:12:30',NULL),(4,4,'paypal-standard',1,'core::ui','2','2023-07-13 06:12:31','2023-07-13 06:12:31',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'read-admin-panel','Visualizar o painel de administrador','Visualizar o painel de administrador','2023-05-17 07:07:48','2023-05-17 07:07:48'),(3,'create-auth-permissions','Criar permissões de autenticação','Criar permissões de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(4,'read-auth-permissions','Visualizar as permissões de autenticação','Visualizar as permissões de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(5,'update-auth-permissions','Atualizar permissões de autenticação','Atualizar permissões de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(6,'delete-auth-permissions','Excluir permissões de autenticação','Excluir permissões de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(7,'read-auth-profile','Visualizar o perfil de autenticação','Visualizar o perfil de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(8,'update-auth-profile','Atualizar perfil de autenticação','Atualizar perfil de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(9,'create-auth-roles','Criar funções de autenticação','Criar funções de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(10,'read-auth-roles','Visualizar funções de autenticação','Visualizar funções de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(11,'update-auth-roles','Atualizar funções de autenticação','Atualizar funções de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(12,'delete-auth-roles','Excluir papéis de autenticação','Excluir papéis de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(13,'create-auth-users','Criar usuários de auth','Criar usuários de auth','2023-05-17 07:07:49','2023-05-17 07:07:49'),(14,'read-auth-users','Visualizar os usuários de auth','Visualizar os usuários de auth','2023-05-17 07:07:49','2023-05-17 07:07:49'),(15,'update-auth-users','Atualize usuários de autenticação','Atualize usuários de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(16,'delete-auth-users','Excluir usuários de autenticação','Excluir usuários de autenticação','2023-05-17 07:07:49','2023-05-17 07:07:49'),(33,'create-common-companies','Criar empresas comuns','Criar empresas comuns','2023-05-17 07:07:51','2023-05-17 07:07:51'),(34,'read-common-companies','Visualizar empresas comuns','Visualizar empresas comuns','2023-05-17 07:07:51','2023-05-17 07:07:51'),(35,'update-common-companies','Atualizar empresas comuns','Atualizar empresas comuns','2023-05-17 07:07:51','2023-05-17 07:07:51'),(36,'delete-common-companies','Excluir empresas comuns','Excluir empresas comuns','2023-05-17 07:07:51','2023-05-17 07:07:51'),(37,'create-common-dashboards','Criar painéis comuns','Criar painéis comuns','2023-05-17 07:07:51','2023-05-17 07:07:51'),(38,'read-common-dashboards','Visualizar os painéis comuns','Visualizar os painéis comuns','2023-05-17 07:07:51','2023-05-17 07:07:51'),(39,'update-common-dashboards','Atualize os painéis comuns','Atualize os painéis comuns','2023-05-17 07:07:52','2023-05-17 07:07:52'),(40,'delete-common-dashboards','Excluir painéis comuns','Excluir painéis comuns','2023-05-17 07:07:52','2023-05-17 07:07:52'),(46,'create-common-notifications','Criar notificações comuns','Criar notificações comuns','2023-05-17 07:07:53','2023-05-17 07:07:53'),(47,'read-common-notifications','Visualizar notificações comuns','Visualizar notificações comuns','2023-05-17 07:07:53','2023-05-17 07:07:53'),(48,'update-common-notifications','Atualizar notificações comuns','Atualizar notificações comuns','2023-05-17 07:07:53','2023-05-17 07:07:53'),(49,'delete-common-notifications','Excluir notificações comuns','Excluir notificações comuns','2023-05-17 07:07:53','2023-05-17 07:07:53'),(54,'read-common-search','Visualizar a pesquisa comum','Visualizar a pesquisa comum','2023-05-17 07:07:54','2023-05-17 07:07:54'),(55,'read-common-uploads','Visualizar uploads comuns','Visualizar uploads comuns','2023-05-17 07:07:54','2023-05-17 07:07:54'),(56,'delete-common-uploads','Excluir uploads comuns','Excluir uploads comuns','2023-05-17 07:07:55','2023-05-17 07:07:55'),(57,'create-common-widgets','Criar widgets comuns','Criar widgets comuns','2023-05-17 07:07:55','2023-05-17 07:07:55'),(58,'read-common-widgets','Visualizar widgets comuns','Visualizar widgets comuns','2023-05-17 07:07:55','2023-05-17 07:07:55'),(59,'update-common-widgets','Atualizar widgets comuns','Atualizar widgets comuns','2023-05-17 07:07:55','2023-05-17 07:07:55'),(60,'delete-common-widgets','Excluir widgets comuns','Excluir widgets comuns','2023-05-17 07:07:56','2023-05-17 07:07:56'),(96,'read-notifications','Visualizar notificações','Visualizar notificações','2023-05-17 07:08:07','2023-05-17 07:08:07'),(97,'update-notifications','Atualizar notificações','Atualizar notificações','2023-05-17 07:08:07','2023-05-17 07:08:07'),(107,'read-settings-company','Visualizar a empresa de configurações','Visualizar a empresa de configurações','2023-05-17 07:08:12','2023-05-17 07:08:12'),(112,'read-settings-defaults','Visualizar os padrões de configurações','Visualizar os padrões de configurações','2023-05-17 07:08:15','2023-05-17 07:08:15'),(115,'read-settings-localisation','Visualizar a localização das configurações','Visualizar a localização das configurações','2023-05-17 07:08:17','2023-05-17 07:08:17'),(118,'read-settings-settings','Visualizar as configurações das configurações','Visualizar as configurações das configurações','2023-05-17 07:08:19','2023-05-17 07:08:19'),(119,'update-settings-settings','Atualizar configurações de configurações','Atualizar configurações de configurações','2023-05-17 07:08:19','2023-05-17 07:08:19');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reconciliations`
--

DROP TABLE IF EXISTS `reconciliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reconciliations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `reconciled` tinyint(1) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reconciliations_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reconciliations`
--

LOCK TABLES `reconciliations` WRITE;
/*!40000 ALTER TABLE `reconciliations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reconciliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurring`
--

DROP TABLE IF EXISTS `recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurring` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurable_id` bigint(20) unsigned NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recurring_recurable_type_recurable_id_index` (`recurable_type`,`recurable_id`),
  KEY `recurring_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurring`
--

LOCK TABLES `recurring` WRITE;
/*!40000 ALTER TABLE `recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_company_id_index` (`company_id`),
  KEY `reports_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,1,'App\\Reports\\IncomeSummary','Income Summary','Monthly income summary by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}','core::seed',NULL,'2023-05-17 08:09:09','2023-05-17 08:09:09',NULL),(2,1,'App\\Reports\\ExpenseSummary','Expense Summary','Monthly expense summary by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}','core::seed',NULL,'2023-05-17 08:09:09','2023-05-17 08:09:09',NULL),(3,1,'App\\Reports\\IncomeExpenseSummary','Income vs Expense','Monthly income vs expense by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}','core::seed',NULL,'2023-05-17 08:09:09','2023-05-17 08:09:09',NULL),(4,1,'App\\Reports\\ProfitLoss','Profit & Loss','Quarterly profit & loss by category.','{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}','core::seed',NULL,'2023-05-17 08:09:09','2023-05-17 08:09:09',NULL),(5,1,'App\\Reports\\TaxSummary','Tax Summary','Quarterly tax summary.','{\"period\":\"quarterly\",\"basis\":\"accrual\"}','core::seed',NULL,'2023-05-17 08:09:09','2023-05-17 08:09:09',NULL),(6,4,'App\\Reports\\IncomeSummary','Income Summary','Monthly income summary by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}','core::seed',2,'2023-07-13 06:12:31','2023-07-13 06:12:31',NULL),(7,4,'App\\Reports\\ExpenseSummary','Expense Summary','Monthly expense summary by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}','core::seed',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(8,4,'App\\Reports\\IncomeExpenseSummary','Income vs Expense','Monthly income vs expense by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}','core::seed',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(9,4,'App\\Reports\\ProfitLoss','Profit & Loss','Quarterly profit & loss by category.','{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}','core::seed',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(10,4,'App\\Reports\\TaxSummary','Tax Summary','Quarterly tax summary.','{\"period\":\"quarterly\",\"basis\":\"accrual\"}','core::seed',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permissions` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,46),(1,47),(1,48),(1,49),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,96),(1,97),(1,107),(1,112),(1,115),(1,118),(1,119),(3,1),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,46),(3,47),(3,48),(3,49),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,96),(3,97),(3,107),(3,112),(3,115),(3,118),(3,119);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'manager','Manager','Gerente',NULL,NULL,'2023-05-17 07:07:48','2023-05-20 22:22:36'),(3,'admin-system','Admin Sistema','Administrador do Sistema',NULL,NULL,'2023-05-17 07:09:01','2023-05-20 22:22:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  KEY `settings_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,1,'invoice.title','Invoice',NULL),(2,1,'default.account','1',NULL),(3,1,'default.income_category','2',NULL),(4,1,'default.expense_category','4',NULL),(5,1,'wizard.completed','1',NULL),(6,1,'offline-payments.methods','[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]',NULL),(7,1,'company.name','Company',NULL),(8,1,'company.email','company@company.com',NULL),(9,1,'company.country','BR',NULL),(11,1,'default.locale','pt-BR',NULL),(12,1,'default.use_gravatar','0',NULL),(13,1,'localisation.timezone','America/Sao_Paulo',NULL),(14,1,'localisation.date_format','d m Y',NULL),(15,1,'localisation.date_separator','slash',NULL),(16,1,'default.list_limit','10',NULL),(17,1,'default.currency','BRL',NULL),(30,1,'company.phone','84 988538523',NULL),(31,1,'company.address','Endereco',NULL),(32,1,'company.city','Cidade',NULL),(33,1,'company.zip_code','59999-999',NULL),(34,1,'company.state','Estado',NULL),(41,1,'company.logo','32',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `account_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_company_id_type_index` (`company_id`,`type`),
  KEY `transactions_account_id_index` (`account_id`),
  KEY `transactions_category_id_index` (`category_id`),
  KEY `transactions_contact_id_index` (`contact_id`),
  KEY `transactions_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `expense_transaction_id` int(11) NOT NULL,
  `income_transaction_id` int(11) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_companies`
--

DROP TABLE IF EXISTS `user_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_companies` (
  `user_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_companies`
--

LOCK TABLES `user_companies` WRITE;
/*!40000 ALTER TABLE `user_companies` DISABLE KEYS */;
INSERT INTO `user_companies` VALUES (1,1);
/*!40000 ALTER TABLE `user_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dashboards`
--

DROP TABLE IF EXISTS `user_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_dashboards` (
  `user_id` int(10) unsigned NOT NULL,
  `dashboard_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dashboards`
--

LOCK TABLES `user_dashboards` WRITE;
/*!40000 ALTER TABLE `user_dashboards` DISABLE KEYS */;
INSERT INTO `user_dashboards` VALUES (1,1),(1,5);
/*!40000 ALTER TABLE `user_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `user_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,'users');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB',
  `landing_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT 'dashboard',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@admin.com','$2y$10$3oH13LFpkUpIFGNYs0ITeuMwUvasHx.oCuBlzwSQoTNvUbZ1qCVEe','','2023-09-25 00:45:27','pt-BR','dashboard',1,'core::console',NULL,'2023-05-17 08:09:09','2023-09-25 00:45:27',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `dashboard_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widgets_company_id_dashboard_id_index` (`company_id`,`dashboard_id`),
  KEY `widgets_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,1,'App\\Widgets\\TotalIncome','Total Income',1,'{\"width\":\"col-md-4\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-17 08:09:10',NULL),(2,1,1,'App\\Widgets\\TotalExpenses','Total Expenses',2,'{\"width\":\"col-md-4\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-17 08:09:10',NULL),(3,1,1,'App\\Widgets\\TotalProfit','Total Profit',3,'{\"width\":\"col-md-4\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-17 08:09:10',NULL),(4,1,1,'App\\Widgets\\CashFlow','Cash Flow',4,'{\"width\":\"col-md-12\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-17 08:09:10',NULL),(5,1,1,'App\\Widgets\\IncomeByCategory','Income By Category',5,'{\"width\":\"col-md-6\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-17 08:09:10',NULL),(6,1,1,'App\\Widgets\\ExpensesByCategory','Expenses By Category',6,'{\"width\":\"col-md-6\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-17 08:09:10',NULL),(7,1,1,'App\\Widgets\\AccountBalance','Account Balance',7,'{\"width\":\"col-md-4\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-20 06:34:02','2023-05-20 06:34:02'),(8,1,1,'App\\Widgets\\LatestIncome','Latest Income',8,'{\"width\":\"col-md-4\"}','core::console',NULL,'2023-05-17 08:09:10','2023-05-20 06:34:42','2023-05-20 06:34:42'),(9,1,1,'App\\Widgets\\LatestExpenses','Latest Expenses',9,'{\"width\":\"col-md-4\"}','core::console',NULL,'2023-05-17 08:09:11','2023-05-20 06:34:20','2023-05-20 06:34:20'),(10,1,2,'App\\Widgets\\TotalIncome','Receitas totais',1,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(11,1,2,'App\\Widgets\\TotalExpenses','Despesas Totais',2,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(12,1,2,'App\\Widgets\\TotalProfit','Lucro Total',3,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(13,1,2,'App\\Widgets\\CashFlow','Fluxo de Caixa',4,'{\"width\":\"col-md-12\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(14,1,2,'App\\Widgets\\IncomeByCategory','Resultados por Categoria',5,'{\"width\":\"col-md-6\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(15,1,2,'App\\Widgets\\ExpensesByCategory','Despesas por Categoria',6,'{\"width\":\"col-md-6\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(16,1,2,'App\\Widgets\\AccountBalance','Saldo da Conta',7,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(17,1,2,'App\\Widgets\\LatestIncome','Últimas Receitas',8,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(18,1,2,'App\\Widgets\\LatestExpenses','Últimas Despesas',9,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:23:39','2023-05-20 22:23:39',NULL),(19,1,3,'App\\Widgets\\TotalIncome','Receitas totais',1,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(20,1,3,'App\\Widgets\\TotalExpenses','Despesas Totais',2,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(21,1,3,'App\\Widgets\\TotalProfit','Lucro Total',3,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(22,1,3,'App\\Widgets\\CashFlow','Fluxo de Caixa',4,'{\"width\":\"col-md-12\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(23,1,3,'App\\Widgets\\IncomeByCategory','Resultados por Categoria',5,'{\"width\":\"col-md-6\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(24,1,3,'App\\Widgets\\ExpensesByCategory','Despesas por Categoria',6,'{\"width\":\"col-md-6\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(25,1,3,'App\\Widgets\\AccountBalance','Saldo da Conta',7,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(26,1,3,'App\\Widgets\\LatestIncome','Últimas Receitas',8,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(27,1,3,'App\\Widgets\\LatestExpenses','Últimas Despesas',9,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-05-20 22:25:08','2023-05-20 22:25:08',NULL),(28,4,4,'App\\Widgets\\TotalIncome','Total Income',1,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(29,4,4,'App\\Widgets\\TotalExpenses','Total Expenses',2,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(30,4,4,'App\\Widgets\\TotalProfit','Total Profit',3,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(31,4,4,'App\\Widgets\\CashFlow','Cash Flow',4,'{\"width\":\"col-md-12\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(32,4,4,'App\\Widgets\\IncomeByCategory','Income By Category',5,'{\"width\":\"col-md-6\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(33,4,4,'App\\Widgets\\ExpensesByCategory','Expenses By Category',6,'{\"width\":\"col-md-6\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(34,4,4,'App\\Widgets\\AccountBalance','Account Balance',7,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(35,4,4,'App\\Widgets\\LatestIncome','Latest Income',8,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(36,4,4,'App\\Widgets\\LatestExpenses','Latest Expenses',9,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-07-13 06:12:32','2023-07-13 06:12:32',NULL),(37,4,5,'App\\Widgets\\TotalIncome','Receitas totais',1,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(38,4,5,'App\\Widgets\\TotalExpenses','Despesas Totais',2,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(39,4,5,'App\\Widgets\\TotalProfit','Lucro Total',3,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(40,4,5,'App\\Widgets\\CashFlow','Fluxo de Caixa',4,'{\"width\":\"col-md-12\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(41,4,5,'App\\Widgets\\IncomeByCategory','Resultados por Categoria',5,'{\"width\":\"col-md-6\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(42,4,5,'App\\Widgets\\ExpensesByCategory','Despesas por Categoria',6,'{\"width\":\"col-md-6\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(43,4,5,'App\\Widgets\\AccountBalance','Saldo da Conta',7,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(44,4,5,'App\\Widgets\\LatestIncome','Últimas Receitas',8,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(45,4,5,'App\\Widgets\\LatestExpenses','Últimas Despesas',9,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(46,4,5,'App\\Widgets\\Currencies','Moedas',10,'{\"width\":\"col-md-4\"}','core::ui',1,'2023-07-13 09:02:29','2023-07-13 09:02:29',NULL),(47,1,6,'App\\Widgets\\TotalIncome','Receitas totais',1,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(48,1,6,'App\\Widgets\\TotalExpenses','Despesas Totais',2,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(49,1,6,'App\\Widgets\\TotalProfit','Lucro Total',3,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(50,1,6,'App\\Widgets\\CashFlow','Fluxo de Caixa',4,'{\"width\":\"col-md-12\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(51,1,6,'App\\Widgets\\IncomeByCategory','Resultados por Categoria',5,'{\"width\":\"col-md-6\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(52,1,6,'App\\Widgets\\ExpensesByCategory','Despesas por Categoria',6,'{\"width\":\"col-md-6\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(53,1,6,'App\\Widgets\\AccountBalance','Saldo da Conta',7,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(54,1,6,'App\\Widgets\\LatestIncome','Últimas Receitas',8,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(55,1,6,'App\\Widgets\\LatestExpenses','Últimas Despesas',9,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:23','2023-08-27 16:45:23',NULL),(56,4,7,'App\\Widgets\\TotalIncome','Receitas totais',1,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(57,4,7,'App\\Widgets\\TotalExpenses','Despesas Totais',2,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(58,4,7,'App\\Widgets\\TotalProfit','Lucro Total',3,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(59,4,7,'App\\Widgets\\CashFlow','Fluxo de Caixa',4,'{\"width\":\"col-md-12\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(60,4,7,'App\\Widgets\\IncomeByCategory','Resultados por Categoria',5,'{\"width\":\"col-md-6\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(61,4,7,'App\\Widgets\\ExpensesByCategory','Despesas por Categoria',6,'{\"width\":\"col-md-6\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(62,4,7,'App\\Widgets\\AccountBalance','Saldo da Conta',7,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(63,4,7,'App\\Widgets\\LatestIncome','Últimas Receitas',8,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL),(64,4,7,'App\\Widgets\\LatestExpenses','Últimas Despesas',9,'{\"width\":\"col-md-4\"}','core::ui',2,'2023-08-27 16:45:24','2023-08-27 16:45:24',NULL);
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smart_drogaria_saude'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-24 19:17:30
