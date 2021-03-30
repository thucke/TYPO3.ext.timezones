
-- Dump of TYPO3 Connection "Default"
-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.21

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

DROP DATABASE IF EXISTS t3acceptance;
CREATE DATABASE t3acceptance;
USE t3acceptance;
SET NAMES utf8;

--
-- Table structure for table `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_layout` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `config` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `icon` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_layout`
--

LOCK TABLES `backend_layout` WRITE;
/*!40000 ALTER TABLE `backend_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_groups` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `explicit_allowdeny` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `allowed_languages` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_options` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `db_mountpoints` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `pagetypes_select` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tables_select` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tables_modify` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `groupMods` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `availableWidgets` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `file_mountpoints` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `file_permissions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `lockToDomain` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TSconfig` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `subgroup` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `workspace_perms` smallint NOT NULL DEFAULT '1',
  `category_perms` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(190) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int unsigned NOT NULL DEFAULT '0',
  `ses_data` longblob,
  `ses_backuserid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
INSERT INTO `be_sessions` VALUES ('1a8632979ca4a542dd24065da0f03684','[DISABLED]',1,1616854728,'a:4:{s:26:\"formProtectionSessionToken\";s:64:\"da5c1c87e92fb8d6818dfc28ed00096196a5584c8a3071fda6edf1a98d815c91\";s:27:\"core.template.flashMessages\";N;s:52:\"TYPO3\\CMS\\Recordlist\\Controller\\RecordListController\";a:1:{s:12:\"search_field\";s:0:\"\";}s:80:\"extbase.flashmessages.tx_extensionmanager_tools_extensionmanagerextensionmanager\";N;}',0),('ec74a075959de71239c2c9a23c547f5a','[DISABLED]',1,1616849147,'a:4:{s:26:\"formProtectionSessionToken\";s:64:\"b95d48b2c53010acc0905e367e56963b076cee719dbf184033a80dd00c5fe6ef\";s:27:\"core.template.flashMessages\";N;s:52:\"TYPO3\\CMS\\Recordlist\\Controller\\RecordListController\";a:1:{s:12:\"search_field\";s:0:\"\";}s:80:\"extbase.flashmessages.tx_extensionmanager_tools_extensionmanagerextensionmanager\";N;}',0);
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `disable` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` int unsigned NOT NULL DEFAULT '0',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint unsigned NOT NULL DEFAULT '0',
  `usergroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `options` smallint unsigned NOT NULL DEFAULT '0',
  `realName` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userMods` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `allowed_languages` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob,
  `file_mountpoints` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `file_permissions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `workspace_perms` smallint NOT NULL DEFAULT '1',
  `lockToDomain` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disableIPlock` smallint unsigned NOT NULL DEFAULT '0',
  `TSconfig` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `lastlogin` int unsigned NOT NULL DEFAULT '0',
  `createdByAction` int NOT NULL DEFAULT '0',
  `usergroup_cached_list` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `workspace_id` int NOT NULL DEFAULT '0',
  `category_perms` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `password_reset_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1616338635,1616338506,0,0,0,0,0,NULL,'admin',0,'$2y$12$YaRgnj4Oc1lVVn2MrzJQXOE/6bWpXCyp4Ivx97qNdBporJhG4vK3W',1,'','','',NULL,0,'',NULL,'','a:24:{s:14:\"interfaceSetup\";s:7:\"backend\";s:10:\"moduleData\";a:7:{s:10:\"web_layout\";a:2:{s:8:\"function\";s:1:\"1\";s:8:\"language\";s:1:\"0\";}s:10:\"FormEngine\";a:2:{i:0;a:3:{s:32:\"af6a208f792a83220f87a953a62a081a\";a:4:{i:0;s:19:\"<em>[No title]</em>\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:6;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B6%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:6;s:3:\"pid\";i:3;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"b4ebb2474e05a65466f2a0872f322b9b\";a:4:{i:0;s:14:\"Index timezone\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:4;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";a:1:{s:5:\"pages\";a:1:{s:16:\"sys_language_uid\";s:1:\"0\";}}s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:76:\"&edit%5Bpages%5D%5B4%5D=edit&overrideVals%5Bpages%5D%5Bsys_language_uid%5D=0\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:4;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"629911c017052e9e049ce359020150c0\";a:4:{i:0;s:19:\"<em>[No title]</em>\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:7;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B7%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:7;s:3:\"pid\";i:4;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}i:1;s:32:\"629911c017052e9e049ce359020150c0\";}s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:0:{}s:9:\"tx_beuser\";s:532:\"O:40:\"TYPO3\\CMS\\Beuser\\Domain\\Model\\ModuleData\":2:{s:9:\"\0*\0demand\";O:36:\"TYPO3\\CMS\\Beuser\\Domain\\Model\\Demand\":12:{s:11:\"\0*\0userName\";s:0:\"\";s:11:\"\0*\0userType\";i:0;s:9:\"\0*\0status\";i:0;s:9:\"\0*\0logins\";i:0;s:19:\"\0*\0backendUserGroup\";i:0;s:6:\"\0*\0uid\";N;s:16:\"\0*\0_localizedUid\";N;s:15:\"\0*\0_languageUid\";N;s:16:\"\0*\0_versionedUid\";N;s:6:\"\0*\0pid\";N;s:61:\"\0TYPO3\\CMS\\Extbase\\DomainObject\\AbstractDomainObject\0_isClone\";b:0;s:69:\"\0TYPO3\\CMS\\Extbase\\DomainObject\\AbstractDomainObject\0_cleanProperties\";a:0:{}}s:18:\"\0*\0compareUserList\";a:0:{}}\";s:8:\"web_list\";a:1:{s:15:\"bigControlPanel\";s:1:\"1\";}s:16:\"opendocs::recent\";a:8:{s:32:\"b4ebb2474e05a65466f2a0872f322b9b\";a:4:{i:0;s:22:\"Show timezone (copy 1)\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:4;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";a:1:{s:5:\"pages\";a:1:{s:16:\"sys_language_uid\";s:1:\"0\";}}s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:76:\"&edit%5Bpages%5D%5B4%5D=edit&overrideVals%5Bpages%5D%5Bsys_language_uid%5D=0\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:4;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"86205c5935270b8ee413592ec1b62292\";a:4:{i:0;s:25:\"Main TypoScript Rendering\";i:1;a:5:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:35:\"&edit%5Bsys_template%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"494c59ed0b451cdb0042831766e2d4b1\";a:4:{i:0;s:19:\"<em>[No title]</em>\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:5;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B5%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:5;s:3:\"pid\";i:3;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"2258d9587529a9ea12f96ce7d90372b3\";a:4:{i:0;s:12:\"Set Timezone\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:3;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B3%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:3;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"a3b9454ecc0d182884b26f9c529ddb87\";a:4:{i:0;s:19:\"<em>[No title]</em>\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:4;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B4%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:4;s:3:\"pid\";i:2;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"20ed475662b97ac33d3aa853a74f9c9c\";a:4:{i:0;s:13:\"Show timezone\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:2;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B2%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:2;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"581106f297d9eed8dec1190ee4d6b04d\";a:4:{i:0;s:19:\"<em>[No title]</em>\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:3;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B3%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:3;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"deac478137dd48a97e299bd046412e21\";a:4:{i:0;s:19:\"<em>[No title]</em>\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:2;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B2%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:2;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}s:9:\"clipboard\";a:5:{s:5:\"tab_1\";a:0:{}s:5:\"tab_2\";a:0:{}s:5:\"tab_3\";a:0:{}s:7:\"current\";s:6:\"normal\";s:6:\"normal\";a:2:{s:2:\"el\";a:1:{s:7:\"pages|2\";s:1:\"1\";}s:4:\"mode\";s:4:\"copy\";}}}s:19:\"thumbnailsByDefault\";i:1;s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";s:2:\"50\";s:8:\"edit_RTE\";i:1;s:20:\"edit_docModuleUpload\";i:1;s:15:\"resizeTextareas\";i:1;s:25:\"resizeTextareas_MaxHeight\";s:3:\"500\";s:24:\"resizeTextareas_Flexible\";i:0;s:4:\"lang\";s:0:\"\";s:19:\"firstLoginTimeStamp\";i:1616338522;s:15:\"moduleSessionID\";a:7:{s:10:\"web_layout\";s:40:\"f60a61f4bfd32ed17d608b18009c5d5b2437dd85\";s:10:\"FormEngine\";s:40:\"134db08b45e7a6673331a2877b6fd652f7a293ae\";s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:40:\"134db08b45e7a6673331a2877b6fd652f7a293ae\";s:9:\"tx_beuser\";s:40:\"f60a61f4bfd32ed17d608b18009c5d5b2437dd85\";s:8:\"web_list\";s:40:\"39df23fc2b5f8b54e630f95b1212e65693b77289\";s:16:\"opendocs::recent\";s:40:\"134db08b45e7a6673331a2877b6fd652f7a293ae\";s:9:\"clipboard\";s:40:\"134db08b45e7a6673331a2877b6fd652f7a293ae\";}s:8:\"realName\";s:0:\"\";s:5:\"email\";s:0:\"\";s:8:\"password\";s:0:\"\";s:9:\"password2\";s:0:\"\";s:6:\"avatar\";s:0:\"\";s:11:\"startModule\";s:0:\"\";s:25:\"showHiddenFilesAndFolders\";i:0;s:10:\"copyLevels\";s:0:\"\";s:15:\"recursiveDelete\";i:0;s:18:\"resetConfiguration\";s:0:\"\";s:17:\"BackendComponents\";a:1:{s:6:\"States\";a:1:{s:8:\"Pagetree\";a:1:{s:9:\"stateHash\";a:1:{s:3:\"0_1\";s:1:\"1\";}}}}}',NULL,NULL,1,'',0,NULL,1616854692,0,NULL,0,NULL,'');
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash`
--

DROP TABLE IF EXISTS `cache_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash`
--

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;
INSERT INTO `cache_hash` VALUES (1,'d07b003d9fce07cd551ada22027bf881',2145909600,'a:3:{s:8:\"options.\";a:8:{s:15:\"enableBookmarks\";s:1:\"1\";s:10:\"file_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:23:\"enableDisplayThumbnails\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:10:\"thumbnail.\";a:2:{s:5:\"width\";s:2:\"64\";s:6:\"height\";s:2:\"64\";}}s:9:\"pageTree.\";a:1:{s:31:\"doktypesToShowInNewPageDragArea\";s:21:\"1,6,4,7,3,254,255,199\";}s:12:\"contextMenu.\";a:1:{s:6:\"table.\";a:3:{s:6:\"pages.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:9:\"sys_file.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:15:\"sys_filemounts.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}}}s:11:\"saveDocView\";s:1:\"1\";s:10:\"saveDocNew\";s:1:\"1\";s:11:\"saveDocNew.\";a:3:{s:5:\"pages\";s:1:\"0\";s:8:\"sys_file\";s:1:\"0\";s:17:\"sys_file_metadata\";s:1:\"0\";}s:14:\"disableDelete.\";a:1:{s:8:\"sys_file\";s:1:\"1\";}}s:9:\"admPanel.\";a:1:{s:7:\"enable.\";a:1:{s:3:\"all\";s:1:\"1\";}}s:12:\"TCAdefaults.\";a:1:{s:9:\"sys_note.\";a:2:{s:6:\"author\";s:0:\"\";s:5:\"email\";s:0:\"\";}}}'),(2,'92ae9e039e0feb5e6f1ddf9a7d594bf2',2145909600,'a:2:{s:9:\"constants\";a:2:{s:7:\"styles.\";a:2:{s:10:\"templates.\";a:3:{s:16:\"templateRootPath\";s:0:\"\";s:15:\"partialRootPath\";s:0:\"\";s:14:\"layoutRootPath\";s:0:\"\";}s:8:\"content.\";a:6:{s:17:\"defaultHeaderType\";s:1:\"2\";s:9:\"shortcut.\";a:1:{s:6:\"tables\";s:10:\"tt_content\";}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:6:\"image.\";a:1:{s:11:\"lazyLoading\";s:4:\"lazy\";}s:10:\"textmedia.\";a:9:{s:4:\"maxW\";s:3:\"600\";s:10:\"maxWInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:10:\"rowSpacing\";s:2:\"10\";s:10:\"textMargin\";s:2:\"10\";s:11:\"borderColor\";s:7:\"#000000\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";s:9:\"linkWrap.\";a:6:{s:5:\"width\";s:4:\"800m\";s:6:\"height\";s:4:\"600m\";s:9:\"newWindow\";s:1:\"0\";s:15:\"lightboxEnabled\";s:1:\"0\";s:16:\"lightboxCssClass\";s:8:\"lightbox\";s:20:\"lightboxRelAttribute\";s:21:\"lightbox[{field:uid}]\";}}s:6:\"links.\";a:2:{s:9:\"extTarget\";s:6:\"_blank\";s:4:\"keep\";s:4:\"path\";}}}s:7:\"plugin.\";a:1:{s:13:\"tx_timezones.\";a:1:{s:9:\"settings.\";a:1:{s:10:\"pluginPage\";s:1:\"0\";}}}}s:5:\"setup\";a:13:{s:7:\"config.\";a:2:{s:19:\"pageTitleProviders.\";a:2:{s:7:\"record.\";a:1:{s:8:\"provider\";s:48:\"TYPO3\\CMS\\Core\\PageTitle\\RecordPageTitleProvider\";}s:4:\"seo.\";a:2:{s:8:\"provider\";s:49:\"TYPO3\\CMS\\Seo\\PageTitle\\SeoTitlePageTitleProvider\";s:6:\"before\";s:6:\"record\";}}s:11:\"tx_extbase.\";a:3:{s:4:\"mvc.\";a:1:{s:48:\"throwPageNotFoundExceptionIfActionCantBeResolved\";s:1:\"0\";}s:12:\"persistence.\";a:2:{s:28:\"enableAutomaticCacheClearing\";s:1:\"1\";s:20:\"updateReferenceIndex\";s:1:\"0\";}s:9:\"features.\";a:2:{s:20:\"skipDefaultArguments\";s:1:\"0\";s:25:\"ignoreAllEnableFieldsInBe\";s:1:\"0\";}}}s:7:\"styles.\";a:1:{s:8:\"content.\";a:2:{s:3:\"get\";s:7:\"CONTENT\";s:4:\"get.\";a:2:{s:5:\"table\";s:10:\"tt_content\";s:7:\"select.\";a:2:{s:7:\"orderBy\";s:7:\"sorting\";s:5:\"where\";s:11:\"{#colPos}=0\";}}}}s:10:\"tt_content\";s:4:\"CASE\";s:11:\"tt_content.\";a:50:{s:4:\"key.\";a:1:{s:5:\"field\";s:5:\"CType\";}s:7:\"default\";s:4:\"TEXT\";s:8:\"default.\";a:4:{s:5:\"field\";s:5:\"CType\";s:16:\"htmlSpecialChars\";s:1:\"1\";s:4:\"wrap\";s:165:\"<p style=\"background-color: yellow; padding: 0.5em 1em;\"><strong>ERROR:</strong> Content Element with uid \"{field:uid}\" and type \"|\" has no rendering definition!</p>\";s:5:\"wrap.\";a:1:{s:10:\"insertData\";s:1:\"1\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editPanel\";s:1:\"1\";s:10:\"editPanel.\";a:5:{s:5:\"allow\";s:29:\"move, new, edit, hide, delete\";s:5:\"label\";s:2:\"%s\";s:14:\"onlyCurrentPid\";s:1:\"1\";s:13:\"previewBorder\";s:1:\"1\";s:5:\"edit.\";a:1:{s:13:\"displayRecord\";s:1:\"1\";}}}s:7:\"bullets\";s:20:\"< lib.contentElement\";s:8:\"bullets.\";a:3:{s:12:\"templateName\";s:7:\"Bullets\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\SplitProcessor\";s:3:\"10.\";a:4:{s:3:\"if.\";a:2:{s:5:\"value\";s:1:\"2\";s:11:\"isLessThan.\";a:1:{s:5:\"field\";s:12:\"bullets_type\";}}s:9:\"fieldName\";s:8:\"bodytext\";s:18:\"removeEmptyEntries\";s:1:\"1\";s:2:\"as\";s:7:\"bullets\";}i:20;s:62:\"TYPO3\\CMS\\Frontend\\DataProcessing\\CommaSeparatedValueProcessor\";s:3:\"20.\";a:4:{s:9:\"fieldName\";s:8:\"bodytext\";s:3:\"if.\";a:2:{s:5:\"value\";s:1:\"2\";s:7:\"equals.\";a:1:{s:5:\"field\";s:12:\"bullets_type\";}}s:14:\"fieldDelimiter\";s:1:\"|\";s:2:\"as\";s:7:\"bullets\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:59:\"tt_content: header [header_layout], bodytext [bullets_type]\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:92:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.bullets\";}}}}s:3:\"div\";s:20:\"< lib.contentElement\";s:4:\"div.\";a:1:{s:12:\"templateName\";s:3:\"Div\";}s:6:\"header\";s:20:\"< lib.contentElement\";s:7:\"header.\";a:2:{s:12:\"templateName\";s:6:\"Header\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:63:\"tt_content: header [header_layout|header_link], subheader, date\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:91:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.header\";}}}}s:4:\"html\";s:20:\"< lib.contentElement\";s:5:\"html.\";a:2:{s:12:\"templateName\";s:4:\"Html\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:20:\"tt_content: bodytext\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.html\";}}}}s:5:\"image\";s:20:\"< lib.contentElement\";s:6:\"image.\";a:3:{s:12:\"templateName\";s:5:\"Image\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}i:20;s:50:\"TYPO3\\CMS\\Frontend\\DataProcessing\\GalleryProcessor\";s:3:\"20.\";a:5:{s:15:\"maxGalleryWidth\";s:3:\"600\";s:21:\"maxGalleryWidthInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:92:\"tt_content : image [imageorient|imagewidth|imageheight], [imagecols|imageborder], image_zoom\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:90:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.image\";}}}}s:4:\"list\";s:20:\"< lib.contentElement\";s:5:\"list.\";a:3:{s:12:\"templateName\";s:4:\"List\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:72:\"tt_content: header [header_layout], list_type, layout, pages [recursive]\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.list\";}}}s:3:\"20.\";a:2:{s:13:\"timezones_pi1\";s:4:\"USER\";s:14:\"timezones_pi1.\";a:3:{s:8:\"userFunc\";s:37:\"TYPO3\\CMS\\Extbase\\Core\\Bootstrap->run\";s:13:\"extensionName\";s:9:\"Timezones\";s:10:\"pluginName\";s:3:\"Pi1\";}}}s:8:\"shortcut\";s:20:\"< lib.contentElement\";s:9:\"shortcut.\";a:3:{s:12:\"templateName\";s:8:\"Shortcut\";s:10:\"variables.\";a:2:{s:9:\"shortcuts\";s:7:\"RECORDS\";s:10:\"shortcuts.\";a:2:{s:7:\"source.\";a:1:{s:5:\"field\";s:7:\"records\";}s:6:\"tables\";s:10:\"tt_content\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:43:\"tt_content: header [header_layout], records\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:93:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.shortcut\";}}}}s:5:\"table\";s:20:\"< lib.contentElement\";s:6:\"table.\";a:3:{s:12:\"templateName\";s:5:\"Table\";s:15:\"dataProcessing.\";a:2:{i:10;s:62:\"TYPO3\\CMS\\Frontend\\DataProcessing\\CommaSeparatedValueProcessor\";s:3:\"10.\";a:5:{s:9:\"fieldName\";s:8:\"bodytext\";s:15:\"fieldDelimiter.\";a:1:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_delimiter\";}}}s:15:\"fieldEnclosure.\";a:2:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_enclosure\";}}s:3:\"if.\";a:3:{s:5:\"value\";s:1:\"0\";s:7:\"equals.\";a:1:{s:5:\"field\";s:15:\"table_enclosure\";}s:6:\"negate\";s:1:\"1\";}}s:15:\"maximumColumns.\";a:1:{s:5:\"field\";s:4:\"cols\";}s:2:\"as\";s:5:\"table\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:100:\"tt_content: header [header_layout], bodytext, [table_caption|cols|table_header_position|table_tfoot]\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:90:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.table\";}}}}s:4:\"text\";s:20:\"< lib.contentElement\";s:5:\"text.\";a:2:{s:12:\"templateName\";s:4:\"Text\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:20:\"tt_content: bodytext\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.html\";}}}}s:9:\"textmedia\";s:20:\"< lib.contentElement\";s:10:\"textmedia.\";a:3:{s:12:\"templateName\";s:9:\"Textmedia\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:6:\"assets\";}}i:20;s:50:\"TYPO3\\CMS\\Frontend\\DataProcessing\\GalleryProcessor\";s:3:\"20.\";a:5:{s:15:\"maxGalleryWidth\";s:3:\"600\";s:21:\"maxGalleryWidthInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:126:\"tt_content: header [header_layout], bodytext, assets [imageorient|imagewidth|imageheight], [imagecols|imageborder], image_zoom\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:94:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.textmedia\";}}}}s:7:\"textpic\";s:20:\"< lib.contentElement\";s:8:\"textpic.\";a:3:{s:12:\"templateName\";s:7:\"Textpic\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}i:20;s:50:\"TYPO3\\CMS\\Frontend\\DataProcessing\\GalleryProcessor\";s:3:\"20.\";a:5:{s:15:\"maxGalleryWidth\";s:3:\"600\";s:21:\"maxGalleryWidthInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:125:\"tt_content: header [header_layout], bodytext, image [imageorient|imagewidth|imageheight], [imagecols|imageborder], image_zoom\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:92:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.textpic\";}}}}s:7:\"uploads\";s:20:\"< lib.contentElement\";s:8:\"uploads.\";a:3:{s:12:\"templateName\";s:7:\"Uploads\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:3:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}s:12:\"collections.\";a:1:{s:5:\"field\";s:16:\"file_collections\";}s:8:\"sorting.\";a:2:{s:5:\"field\";s:16:\"filelink_sorting\";s:10:\"direction.\";a:1:{s:5:\"field\";s:26:\"filelink_sorting_direction\";}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:127:\"tt_content: header [header_layout], media, file_collections, filelink_sorting, [filelink_size|uploads_description|uploads_type]\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:92:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.uploads\";}}}}s:13:\"menu_abstract\";s:20:\"< lib.contentElement\";s:14:\"menu_abstract.\";a:3:{s:12:\"templateName\";s:12:\"MenuAbstract\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:24:\"menu_categorized_content\";s:20:\"< lib.contentElement\";s:25:\"menu_categorized_content.\";a:3:{s:12:\"templateName\";s:22:\"MenuCategorizedContent\";s:15:\"dataProcessing.\";a:2:{i:10;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"10.\";a:10:{s:5:\"table\";s:10:\"tt_content\";s:12:\"selectFields\";s:12:\"tt_content.*\";s:7:\"groupBy\";s:3:\"uid\";s:10:\"pidInList.\";a:1:{s:4:\"data\";s:12:\"leveluid : 0\";}s:9:\"recursive\";s:2:\"99\";s:5:\"join.\";a:2:{s:4:\"data\";s:25:\"field:selected_categories\";s:4:\"wrap\";s:109:\"sys_category_record_mm ON uid = sys_category_record_mm.uid_foreign AND sys_category_record_mm.uid_local IN(|)\";}s:6:\"where.\";a:2:{s:4:\"data\";s:20:\"field:category_field\";s:4:\"wrap\";s:41:\"tablenames=\'tt_content\' and fieldname=\'|\'\";}s:7:\"orderBy\";s:18:\"tt_content.sorting\";s:2:\"as\";s:7:\"content\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:71:\"tt_content: header [header_layout], selected_categories, category_field\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:22:\"menu_categorized_pages\";s:20:\"< lib.contentElement\";s:23:\"menu_categorized_pages.\";a:3:{s:12:\"templateName\";s:20:\"MenuCategorizedPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:10:\"categories\";s:8:\"special.\";a:4:{s:6:\"value.\";a:1:{s:5:\"field\";s:19:\"selected_categories\";}s:9:\"relation.\";a:1:{s:5:\"field\";s:14:\"category_field\";}s:7:\"sorting\";s:5:\"title\";s:5:\"order\";s:3:\"asc\";}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:71:\"tt_content: header [header_layout], selected_categories, category_field\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:10:\"menu_pages\";s:20:\"< lib.contentElement\";s:11:\"menu_pages.\";a:3:{s:12:\"templateName\";s:9:\"MenuPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:13:\"menu_subpages\";s:20:\"< lib.contentElement\";s:14:\"menu_subpages.\";a:3:{s:12:\"templateName\";s:12:\"MenuSubpages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:12:\"menu_section\";s:20:\"< lib.contentElement\";s:13:\"menu_section.\";a:3:{s:12:\"templateName\";s:11:\"MenuSection\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:17:\"includeNotInMenu.\";a:2:{s:8:\"override\";s:1:\"1\";s:9:\"override.\";a:1:{s:3:\"if.\";a:1:{s:8:\"isFalse.\";a:1:{s:5:\"field\";s:5:\"pages\";}}}}s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:2:{s:5:\"field\";s:5:\"pages\";s:9:\"override.\";a:3:{s:4:\"data\";s:8:\"page:uid\";s:3:\"if.\";a:1:{s:8:\"isFalse.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:9:\"override.\";a:2:{s:4:\"data\";s:21:\"page:content_from_pid\";s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:4:\"data\";s:21:\"page:content_from_pid\";}}}}}}s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:6:{s:5:\"table\";s:10:\"tt_content\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"uid\";}s:2:\"as\";s:7:\"content\";s:5:\"where\";s:16:\"sectionIndex = 1\";s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:18:\"menu_section_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_section_pages.\";a:3:{s:12:\"templateName\";s:16:\"MenuSectionPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:10:\"tt_content\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"uid\";}s:7:\"orderBy\";s:7:\"sorting\";s:2:\"as\";s:7:\"content\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:21:\"menu_recently_updated\";s:20:\"< lib.contentElement\";s:22:\"menu_recently_updated.\";a:3:{s:12:\"templateName\";s:19:\"MenuRecentlyUpdated\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:7:\"updated\";s:8:\"special.\";a:3:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}s:6:\"maxAge\";s:9:\"3600*24*7\";s:20:\"excludeNoSearchPages\";s:1:\"1\";}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:18:\"menu_related_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_related_pages.\";a:3:{s:12:\"templateName\";s:16:\"MenuRelatedPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:8:\"keywords\";s:8:\"special.\";a:2:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}s:20:\"excludeNoSearchPages\";s:1:\"1\";}s:23:\"alternativeSortingField\";s:5:\"title\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:12:\"menu_sitemap\";s:20:\"< lib.contentElement\";s:13:\"menu_sitemap.\";a:3:{s:12:\"templateName\";s:11:\"MenuSitemap\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:2:{s:6:\"levels\";s:1:\"7\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:18:\"menu_sitemap_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_sitemap_pages.\";a:3:{s:12:\"templateName\";s:16:\"MenuSitemapPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:6:\"levels\";s:1:\"7\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}}s:4:\"lib.\";a:6:{s:14:\"contentElement\";s:13:\"FLUIDTEMPLATE\";s:15:\"contentElement.\";a:5:{s:12:\"templateName\";s:7:\"Default\";s:18:\"templateRootPaths.\";a:2:{i:0;s:53:\"EXT:fluid_styled_content/Resources/Private/Templates/\";i:10;s:0:\"\";}s:17:\"partialRootPaths.\";a:2:{i:0;s:52:\"EXT:fluid_styled_content/Resources/Private/Partials/\";i:10;s:0:\"\";}s:16:\"layoutRootPaths.\";a:2:{i:0;s:51:\"EXT:fluid_styled_content/Resources/Private/Layouts/\";i:10;s:0:\"\";}s:9:\"settings.\";a:2:{s:17:\"defaultHeaderType\";s:1:\"2\";s:6:\"media.\";a:3:{s:11:\"lazyLoading\";s:4:\"lazy\";s:6:\"popup.\";a:9:{s:7:\"bodyTag\";s:41:\"<body style=\"margin:0; background:#fff;\">\";s:4:\"wrap\";s:37:\"<a href=\"javascript:close();\"> | </a>\";s:5:\"width\";s:4:\"800m\";s:6:\"height\";s:4:\"600m\";s:5:\"crop.\";a:1:{s:4:\"data\";s:17:\"file:current:crop\";}s:8:\"JSwindow\";s:1:\"1\";s:9:\"JSwindow.\";a:2:{s:9:\"newWindow\";s:1:\"0\";s:3:\"if.\";a:1:{s:7:\"isFalse\";s:1:\"0\";}}s:15:\"directImageLink\";s:1:\"0\";s:11:\"linkParams.\";a:1:{s:11:\"ATagParams.\";a:1:{s:8:\"dataWrap\";s:44:\"class=\"lightbox\" rel=\"lightbox[{field:uid}]\"\";}}}s:17:\"additionalConfig.\";a:2:{s:9:\"no-cookie\";s:1:\"1\";s:3:\"api\";s:1:\"0\";}}}}s:10:\"parseFunc.\";a:8:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:2:{s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:5:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:8:\"ifEmpty.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}s:10:\"extTarget.\";a:2:{s:8:\"ifEmpty.\";a:1:{s:8:\"override\";s:6:\"_blank\";}s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:31:\"<span class=\"ce-sword\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}}}s:14:\"parseFunc_RTE.\";a:10:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:2:{s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:5:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:8:\"ifEmpty.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}s:10:\"extTarget.\";a:2:{s:8:\"ifEmpty.\";a:1:{s:8:\"override\";s:6:\"_blank\";}s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:31:\"<span class=\"ce-sword\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:3:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}s:12:\"encapsLines.\";a:4:{s:13:\"encapsTagList\";s:29:\"p,pre,h1,h2,h3,h4,h5,h6,hr,dt\";s:9:\"remapTag.\";a:1:{s:3:\"DIV\";s:1:\"P\";}s:13:\"nonWrappedTag\";s:1:\"P\";s:17:\"innerStdWrap_all.\";a:1:{s:7:\"ifBlank\";s:6:\"&nbsp;\";}}}s:14:\"externalBlocks\";s:89:\"article, aside, blockquote, div, dd, dl, footer, header, nav, ol, section, table, ul, pre\";s:15:\"externalBlocks.\";a:14:{s:3:\"ol.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:9:\"parseFunc\";s:15:\"< lib.parseFunc\";}}s:3:\"ul.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:9:\"parseFunc\";s:15:\"< lib.parseFunc\";}}s:4:\"pre.\";a:1:{s:8:\"stdWrap.\";a:1:{s:10:\"parseFunc.\";a:8:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:2:{s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:5:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:8:\"ifEmpty.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}s:10:\"extTarget.\";a:2:{s:8:\"ifEmpty.\";a:1:{s:8:\"override\";s:6:\"_blank\";}s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:31:\"<span class=\"ce-sword\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}}}}}s:6:\"table.\";a:4:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:5:\"tags.\";a:1:{s:6:\"table.\";a:1:{s:10:\"fixAttrib.\";a:1:{s:6:\"class.\";a:3:{s:7:\"default\";s:12:\"contenttable\";s:6:\"always\";s:1:\"1\";s:4:\"list\";s:12:\"contenttable\";}}}}s:18:\"keepNonMatchedTags\";s:1:\"1\";}}s:14:\"HTMLtableCells\";s:1:\"1\";s:15:\"HTMLtableCells.\";a:2:{s:8:\"default.\";a:1:{s:8:\"stdWrap.\";a:2:{s:9:\"parseFunc\";s:19:\"< lib.parseFunc_RTE\";s:10:\"parseFunc.\";a:1:{s:18:\"nonTypoTagStdWrap.\";a:1:{s:12:\"encapsLines.\";a:2:{s:13:\"nonWrappedTag\";s:0:\"\";s:17:\"innerStdWrap_all.\";a:1:{s:7:\"ifBlank\";s:0:\"\";}}}}}}s:25:\"addChr10BetweenParagraphs\";s:1:\"1\";}}s:4:\"div.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:8:\"article.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:6:\"aside.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:11:\"blockquote.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"footer.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"header.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:4:\"nav.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:8:\"section.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:3:\"dl.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:3:\"dd.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}}}s:8:\"timezone\";s:4:\"USER\";s:9:\"timezone.\";a:11:{s:8:\"userFunc\";s:37:\"TYPO3\\CMS\\Extbase\\Core\\Bootstrap->run\";s:10:\"pluginName\";s:3:\"Pi1\";s:13:\"extensionName\";s:9:\"Timezones\";s:10:\"vendorName\";s:6:\"Thucke\";s:10:\"controller\";s:9:\"Timezones\";s:4:\"mvc.\";a:1:{s:39:\"callDefaultActionIfActionCantBeResolved\";s:1:\"0\";}s:28:\"switchableControllerActions.\";a:1:{s:10:\"Timezones.\";a:4:{i:1;s:5:\"index\";i:2;s:4:\"show\";i:3;s:6:\"select\";i:4;s:5:\"tzset\";}}s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:1:{i:0;s:42:\"EXT:timezones/Resources/Private/Templates/\";}s:17:\"partialRootPaths.\";a:1:{i:0;s:41:\"EXT:timezones/Resources/Private/Partials/\";}s:16:\"layoutRootPaths.\";a:1:{i:0;s:40:\"EXT:timezones/Resources/Private/Layouts/\";}}s:9:\"settings.\";a:1:{s:10:\"pluginPage\";s:1:\"0\";}s:12:\"_LOCAL_LANG.\";a:1:{s:8:\"default.\";a:1:{s:9:\"read_more\";s:7:\"more >>\";}}s:6:\"action\";s:5:\"index\";}}s:7:\"plugin.\";a:3:{s:12:\"tx_frontend.\";a:1:{s:18:\"_CSS_DEFAULT_STYLE\";s:3359:\"    .ce-align-left { text-align: left; }\n    .ce-align-center { text-align: center; }\n    .ce-align-right { text-align: right; }\n\n    .ce-table td, .ce-table th { vertical-align: top; }\n\n    .ce-textpic, .ce-image, .ce-nowrap .ce-bodytext, .ce-gallery, .ce-row, .ce-uploads li, .ce-uploads div { overflow: hidden; }\n\n    .ce-left .ce-gallery, .ce-column { float: left; }\n    .ce-center .ce-outer { position: relative; float: right; right: 50%; }\n    .ce-center .ce-inner { position: relative; float: right; right: -50%; }\n    .ce-right .ce-gallery { float: right; }\n\n    .ce-gallery figure { display: table; margin: 0; }\n    .ce-gallery figcaption { display: table-caption; caption-side: bottom; }\n    .ce-gallery img { display: block; }\n    .ce-gallery iframe { border-width: 0; }\n    .ce-border img,\n    .ce-border iframe {\n        border: 2px solid #000000;\n        padding: 0px;\n    }\n\n    .ce-intext.ce-right .ce-gallery, .ce-intext.ce-left .ce-gallery, .ce-above .ce-gallery {\n        margin-bottom: 10px;\n    }\n    .ce-image .ce-gallery { margin-bottom: 0; }\n    .ce-intext.ce-right .ce-gallery { margin-left: 10px; }\n    .ce-intext.ce-left .ce-gallery { margin-right: 10px; }\n    .ce-below .ce-gallery { margin-top: 10px; }\n\n    .ce-column { margin-right: 10px; }\n    .ce-column:last-child { margin-right: 0; }\n\n    .ce-row { margin-bottom: 10px; }\n    .ce-row:last-child { margin-bottom: 0; }\n\n    .ce-above .ce-bodytext { clear: both; }\n\n    .ce-intext.ce-left ol, .ce-intext.ce-left ul { padding-left: 40px; overflow: auto; }\n\n    /* Headline */\n    .ce-headline-left { text-align: left; }\n    .ce-headline-center { text-align: center; }\n    .ce-headline-right { text-align: right; }\n\n    /* Uploads */\n    .ce-uploads { margin: 0; padding: 0; }\n    .ce-uploads li { list-style: none outside none; margin: 1em 0; }\n    .ce-uploads img { float: left; padding-right: 1em; vertical-align: top; }\n    .ce-uploads span { display: block; }\n\n    /* Table */\n    .ce-table { width: 100%; max-width: 100%; }\n    .ce-table th, .ce-table td { padding: 0.5em 0.75em; vertical-align: top; }\n    .ce-table thead th { border-bottom: 2px solid #dadada; }\n    .ce-table th, .ce-table td { border-top: 1px solid #dadada; }\n    .ce-table-striped tbody tr:nth-of-type(odd) { background-color: rgba(0,0,0,.05); }\n    .ce-table-bordered th, .ce-table-bordered td { border: 1px solid #dadada; }\n\n    /* Space */\n    .frame-space-before-extra-small { margin-top: 1em; }\n    .frame-space-before-small { margin-top: 2em; }\n    .frame-space-before-medium { margin-top: 3em; }\n    .frame-space-before-large { margin-top: 4em; }\n    .frame-space-before-extra-large { margin-top: 5em; }\n    .frame-space-after-extra-small { margin-bottom: 1em; }\n    .frame-space-after-small { margin-bottom: 2em; }\n    .frame-space-after-medium { margin-bottom: 3em; }\n    .frame-space-after-large { margin-bottom: 4em; }\n    .frame-space-after-extra-large { margin-bottom: 5em; }\n\n    /* Frame */\n    .frame-ruler-before:before { content: \'\'; display: block; border-top: 1px solid rgba(0,0,0,0.25); margin-bottom: 2em; }\n    .frame-ruler-after:after { content: \'\'; display: block; border-bottom: 1px solid rgba(0,0,0,0.25); margin-top: 2em; }\n    .frame-indent { margin-left: 15%; margin-right: 15%; }\n    .frame-indent-left { margin-left: 33%; }\n    .frame-indent-right { margin-right: 33%; }\";}s:12:\"tx_timezones\";s:4:\"USER\";s:13:\"tx_timezones.\";a:11:{s:8:\"userFunc\";s:37:\"TYPO3\\CMS\\Extbase\\Core\\Bootstrap->run\";s:10:\"pluginName\";s:3:\"Pi1\";s:13:\"extensionName\";s:9:\"Timezones\";s:10:\"vendorName\";s:6:\"Thucke\";s:10:\"controller\";s:9:\"Timezones\";s:4:\"mvc.\";a:1:{s:39:\"callDefaultActionIfActionCantBeResolved\";s:1:\"0\";}s:28:\"switchableControllerActions.\";a:1:{s:10:\"Timezones.\";a:4:{i:1;s:5:\"index\";i:2;s:4:\"show\";i:3;s:6:\"select\";i:4;s:5:\"tzset\";}}s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:1:{i:0;s:42:\"EXT:timezones/Resources/Private/Templates/\";}s:17:\"partialRootPaths.\";a:1:{i:0;s:41:\"EXT:timezones/Resources/Private/Partials/\";}s:16:\"layoutRootPaths.\";a:1:{i:0;s:40:\"EXT:timezones/Resources/Private/Layouts/\";}}s:9:\"settings.\";a:2:{s:10:\"pluginPage\";s:1:\"0\";s:8:\"logging.\";a:8:{s:10:\"emergency.\";a:2:{s:4:\"file\";s:28:\"typo3temp/logs/Timezones.log\";s:5:\"table\";s:7:\"sys_log\";}s:6:\"alert.\";a:1:{s:5:\"table\";s:7:\"sys_log\";}s:9:\"critical.\";a:1:{s:5:\"table\";s:7:\"sys_log\";}s:6:\"error.\";a:1:{s:5:\"table\";s:7:\"sys_log\";}s:8:\"warning.\";a:0:{}s:7:\"notice.\";a:0:{}s:5:\"info.\";a:0:{}s:6:\"debug.\";a:0:{}}}s:12:\"_LOCAL_LANG.\";a:1:{s:8:\"default.\";a:1:{s:9:\"read_more\";s:7:\"more >>\";}}s:12:\"persistence.\";a:1:{s:27:\"enhancedLazyLoadingStrategy\";s:1:\"0\";}}}s:5:\"page.\";a:3:{s:11:\"includeCSS.\";a:1:{s:9:\"timezones\";s:48:\"EXT:timezones/Resources/Public/Css/timezones.css\";}i:100;s:7:\"CONTENT\";s:4:\"100.\";a:2:{s:5:\"table\";s:10:\"tt_content\";s:7:\"select.\";a:2:{s:7:\"orderBy\";s:7:\"sorting\";s:5:\"where\";s:11:\"{#colPos}=0\";}}}s:23:\"fluidAjaxWidgetResponse\";s:4:\"PAGE\";s:24:\"fluidAjaxWidgetResponse.\";a:4:{s:7:\"typeNum\";s:4:\"7076\";s:7:\"config.\";a:4:{s:8:\"no_cache\";s:1:\"1\";s:20:\"disableAllHeaderCode\";s:1:\"1\";s:18:\"additionalHeaders.\";a:1:{s:3:\"10.\";a:2:{s:6:\"header\";s:24:\"Content-Type: text/plain\";s:7:\"replace\";s:1:\"1\";}}s:5:\"debug\";s:1:\"0\";}i:10;s:8:\"USER_INT\";s:3:\"10.\";a:1:{s:8:\"userFunc\";s:42:\"TYPO3\\CMS\\Fluid\\Core\\Widget\\Bootstrap->run\";}}s:7:\"module.\";a:3:{s:9:\"tx_belog.\";a:1:{s:9:\"settings.\";a:3:{s:29:\"selectableNumberOfLogEntries.\";a:7:{i:20;s:2:\"20\";i:50;s:2:\"50\";i:100;s:3:\"100\";i:200;s:3:\"200\";i:500;s:3:\"500\";i:1000;s:4:\"1000\";i:1000000;s:3:\"any\";}s:21:\"selectableTimeFrames.\";a:8:{i:0;s:8:\"thisWeek\";i:1;s:8:\"lastWeek\";i:2;s:9:\"last7Days\";i:10;s:9:\"thisMonth\";i:11;s:9:\"lastMonth\";i:12;s:10:\"last31Days\";i:20;s:7:\"noLimit\";i:30;s:11:\"userDefined\";}s:18:\"selectableActions.\";a:7:{i:0;s:3:\"any\";i:1;s:14:\"actionDatabase\";i:2;s:10:\"actionFile\";i:3;s:11:\"actionCache\";i:254;s:14:\"actionSettings\";i:255;s:11:\"actionLogin\";i:-1;s:12:\"actionErrors\";}}}s:10:\"tx_beuser.\";a:2:{s:12:\"persistence.\";a:1:{s:10:\"storagePid\";s:1:\"0\";}s:9:\"settings.\";a:1:{s:5:\"dummy\";s:3:\"foo\";}}s:20:\"tx_extensionmanager.\";a:1:{s:9:\"features.\";a:1:{s:20:\"skipDefaultArguments\";s:1:\"0\";}}}s:4:\"page\";s:4:\"PAGE\";s:9:\"sitetitle\";s:14:\"New TYPO3 site\";s:6:\"types.\";a:2:{i:7076;s:23:\"fluidAjaxWidgetResponse\";i:0;s:4:\"page\";}}}'),(3,'da4e787af2263d40bc4daf3ae33ec5ce',2145909600,'a:0:{}'),(4,'75ee55664f41258d9a2ab089d0b3c7f0',1616934344,'a:1:{i:0;a:3:{s:11:\"doNotLinkIt\";s:1:\"1\";s:14:\"wrapItemAndSub\";s:3:\"{|}\";s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:3:\"COA\";s:8:\"cObject.\";a:27:{i:1;s:13:\"LOAD_REGISTER\";s:2:\"1.\";a:1:{s:11:\"languageId.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:4:\"data\";s:24:\"register:languages_HMENU\";}s:8:\"listNum.\";a:2:{s:8:\"stdWrap.\";a:2:{s:4:\"data\";s:28:\"register:count_HMENU_MENUOBJ\";s:4:\"wrap\";s:3:\"|-1\";}s:9:\"splitChar\";s:1:\",\";}}}}i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:8:\"stdWrap.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:4:\"wrap\";s:14:\"\"languageId\":|\";}i:11;s:4:\"USER\";s:3:\"11.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:6:\"locale\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:11:\",\"locale\":|\";}}i:20;s:4:\"USER\";s:3:\"20.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:5:\"title\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:10:\",\"title\":|\";}}i:21;s:4:\"USER\";s:3:\"21.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:15:\"navigationTitle\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:20:\",\"navigationTitle\":|\";}}i:22;s:4:\"USER\";s:3:\"22.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:16:\"twoLetterIsoCode\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:21:\",\"twoLetterIsoCode\":|\";}}i:23;s:4:\"USER\";s:3:\"23.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:8:\"hreflang\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:13:\",\"hreflang\":|\";}}i:24;s:4:\"USER\";s:3:\"24.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:9:\"direction\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:14:\",\"direction\":|\";}}i:25;s:4:\"USER\";s:3:\"25.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:4:\"flag\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:9:\",\"flag\":|\";}}i:90;s:4:\"TEXT\";s:3:\"90.\";a:2:{s:5:\"value\";s:21:\"###LINKPLACEHOLDER###\";s:4:\"wrap\";s:9:\",\"link\":|\";}i:91;s:4:\"TEXT\";s:3:\"91.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:11:\",\"active\":|\";}i:92;s:4:\"TEXT\";s:3:\"92.\";a:2:{s:5:\"value\";s:1:\"0\";s:4:\"wrap\";s:12:\",\"current\":|\";}i:93;s:4:\"TEXT\";s:3:\"93.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:14:\",\"available\":|\";}i:99;s:16:\"RESTORE_REGISTER\";}}}}'),(5,'d2d0a044fa76037f9dd31e136b965336',1616934355,'a:1:{i:0;a:3:{s:11:\"doNotLinkIt\";s:1:\"1\";s:14:\"wrapItemAndSub\";s:3:\"{|}\";s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:3:\"COA\";s:8:\"cObject.\";a:27:{i:1;s:13:\"LOAD_REGISTER\";s:2:\"1.\";a:1:{s:11:\"languageId.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:4:\"data\";s:24:\"register:languages_HMENU\";}s:8:\"listNum.\";a:2:{s:8:\"stdWrap.\";a:2:{s:4:\"data\";s:28:\"register:count_HMENU_MENUOBJ\";s:4:\"wrap\";s:3:\"|-1\";}s:9:\"splitChar\";s:1:\",\";}}}}i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:8:\"stdWrap.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:4:\"wrap\";s:14:\"\"languageId\":|\";}i:11;s:4:\"USER\";s:3:\"11.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:6:\"locale\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:11:\",\"locale\":|\";}}i:20;s:4:\"USER\";s:3:\"20.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:5:\"title\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:10:\",\"title\":|\";}}i:21;s:4:\"USER\";s:3:\"21.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:15:\"navigationTitle\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:20:\",\"navigationTitle\":|\";}}i:22;s:4:\"USER\";s:3:\"22.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:16:\"twoLetterIsoCode\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:21:\",\"twoLetterIsoCode\":|\";}}i:23;s:4:\"USER\";s:3:\"23.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:8:\"hreflang\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:13:\",\"hreflang\":|\";}}i:24;s:4:\"USER\";s:3:\"24.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:9:\"direction\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:14:\",\"direction\":|\";}}i:25;s:4:\"USER\";s:3:\"25.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:4:\"flag\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:9:\",\"flag\":|\";}}i:90;s:4:\"TEXT\";s:3:\"90.\";a:2:{s:5:\"value\";s:21:\"###LINKPLACEHOLDER###\";s:4:\"wrap\";s:9:\",\"link\":|\";}i:91;s:4:\"TEXT\";s:3:\"91.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:11:\",\"active\":|\";}i:92;s:4:\"TEXT\";s:3:\"92.\";a:2:{s:5:\"value\";s:1:\"0\";s:4:\"wrap\";s:12:\",\"current\":|\";}i:93;s:4:\"TEXT\";s:3:\"93.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:14:\",\"available\":|\";}i:99;s:16:\"RESTORE_REGISTER\";}}}}'),(6,'34f3e89cf8586d9998ea72391ba73878',1616934357,'a:1:{i:0;a:3:{s:11:\"doNotLinkIt\";s:1:\"1\";s:14:\"wrapItemAndSub\";s:3:\"{|}\";s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:3:\"COA\";s:8:\"cObject.\";a:27:{i:1;s:13:\"LOAD_REGISTER\";s:2:\"1.\";a:1:{s:11:\"languageId.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:4:\"data\";s:24:\"register:languages_HMENU\";}s:8:\"listNum.\";a:2:{s:8:\"stdWrap.\";a:2:{s:4:\"data\";s:28:\"register:count_HMENU_MENUOBJ\";s:4:\"wrap\";s:3:\"|-1\";}s:9:\"splitChar\";s:1:\",\";}}}}i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:8:\"stdWrap.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:4:\"wrap\";s:14:\"\"languageId\":|\";}i:11;s:4:\"USER\";s:3:\"11.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:6:\"locale\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:11:\",\"locale\":|\";}}i:20;s:4:\"USER\";s:3:\"20.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:5:\"title\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:10:\",\"title\":|\";}}i:21;s:4:\"USER\";s:3:\"21.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:15:\"navigationTitle\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:20:\",\"navigationTitle\":|\";}}i:22;s:4:\"USER\";s:3:\"22.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:16:\"twoLetterIsoCode\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:21:\",\"twoLetterIsoCode\":|\";}}i:23;s:4:\"USER\";s:3:\"23.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:8:\"hreflang\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:13:\",\"hreflang\":|\";}}i:24;s:4:\"USER\";s:3:\"24.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:9:\"direction\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:14:\",\"direction\":|\";}}i:25;s:4:\"USER\";s:3:\"25.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:4:\"flag\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:9:\",\"flag\":|\";}}i:90;s:4:\"TEXT\";s:3:\"90.\";a:2:{s:5:\"value\";s:21:\"###LINKPLACEHOLDER###\";s:4:\"wrap\";s:9:\",\"link\":|\";}i:91;s:4:\"TEXT\";s:3:\"91.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:11:\",\"active\":|\";}i:92;s:4:\"TEXT\";s:3:\"92.\";a:2:{s:5:\"value\";s:1:\"0\";s:4:\"wrap\";s:12:\",\"current\":|\";}i:93;s:4:\"TEXT\";s:3:\"93.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:14:\",\"available\":|\";}i:99;s:16:\"RESTORE_REGISTER\";}}}}'),(7,'6bd1617f573c885300a3689b647f5c5d',1616934358,'a:1:{i:0;a:3:{s:11:\"doNotLinkIt\";s:1:\"1\";s:14:\"wrapItemAndSub\";s:3:\"{|}\";s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:3:\"COA\";s:8:\"cObject.\";a:27:{i:1;s:13:\"LOAD_REGISTER\";s:2:\"1.\";a:1:{s:11:\"languageId.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:4:\"data\";s:24:\"register:languages_HMENU\";}s:8:\"listNum.\";a:2:{s:8:\"stdWrap.\";a:2:{s:4:\"data\";s:28:\"register:count_HMENU_MENUOBJ\";s:4:\"wrap\";s:3:\"|-1\";}s:9:\"splitChar\";s:1:\",\";}}}}i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:8:\"stdWrap.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:4:\"wrap\";s:14:\"\"languageId\":|\";}i:11;s:4:\"USER\";s:3:\"11.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:6:\"locale\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:11:\",\"locale\":|\";}}i:20;s:4:\"USER\";s:3:\"20.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:5:\"title\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:10:\",\"title\":|\";}}i:21;s:4:\"USER\";s:3:\"21.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:15:\"navigationTitle\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:20:\",\"navigationTitle\":|\";}}i:22;s:4:\"USER\";s:3:\"22.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:16:\"twoLetterIsoCode\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:21:\",\"twoLetterIsoCode\":|\";}}i:23;s:4:\"USER\";s:3:\"23.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:8:\"hreflang\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:13:\",\"hreflang\":|\";}}i:24;s:4:\"USER\";s:3:\"24.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:9:\"direction\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:14:\",\"direction\":|\";}}i:25;s:4:\"USER\";s:3:\"25.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:4:\"flag\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:9:\",\"flag\":|\";}}i:90;s:4:\"TEXT\";s:3:\"90.\";a:2:{s:5:\"value\";s:21:\"###LINKPLACEHOLDER###\";s:4:\"wrap\";s:9:\",\"link\":|\";}i:91;s:4:\"TEXT\";s:3:\"91.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:11:\",\"active\":|\";}i:92;s:4:\"TEXT\";s:3:\"92.\";a:2:{s:5:\"value\";s:1:\"0\";s:4:\"wrap\";s:12:\",\"current\":|\";}i:93;s:4:\"TEXT\";s:3:\"93.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:14:\",\"available\":|\";}i:99;s:16:\"RESTORE_REGISTER\";}}}}'),(8,'d086ca68c27b5984bf91267abbb64ddc',1616934365,'a:1:{i:0;a:3:{s:11:\"doNotLinkIt\";s:1:\"1\";s:14:\"wrapItemAndSub\";s:3:\"{|}\";s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:3:\"COA\";s:8:\"cObject.\";a:27:{i:1;s:13:\"LOAD_REGISTER\";s:2:\"1.\";a:1:{s:11:\"languageId.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:4:\"data\";s:24:\"register:languages_HMENU\";}s:8:\"listNum.\";a:2:{s:8:\"stdWrap.\";a:2:{s:4:\"data\";s:28:\"register:count_HMENU_MENUOBJ\";s:4:\"wrap\";s:3:\"|-1\";}s:9:\"splitChar\";s:1:\",\";}}}}i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:8:\"stdWrap.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:4:\"wrap\";s:14:\"\"languageId\":|\";}i:11;s:4:\"USER\";s:3:\"11.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:6:\"locale\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:11:\",\"locale\":|\";}}i:20;s:4:\"USER\";s:3:\"20.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:5:\"title\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:10:\",\"title\":|\";}}i:21;s:4:\"USER\";s:3:\"21.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:15:\"navigationTitle\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:20:\",\"navigationTitle\":|\";}}i:22;s:4:\"USER\";s:3:\"22.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:16:\"twoLetterIsoCode\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:21:\",\"twoLetterIsoCode\":|\";}}i:23;s:4:\"USER\";s:3:\"23.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:8:\"hreflang\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:13:\",\"hreflang\":|\";}}i:24;s:4:\"USER\";s:3:\"24.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:9:\"direction\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:14:\",\"direction\":|\";}}i:25;s:4:\"USER\";s:3:\"25.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:4:\"flag\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:9:\",\"flag\":|\";}}i:90;s:4:\"TEXT\";s:3:\"90.\";a:2:{s:5:\"value\";s:21:\"###LINKPLACEHOLDER###\";s:4:\"wrap\";s:9:\",\"link\":|\";}i:91;s:4:\"TEXT\";s:3:\"91.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:11:\",\"active\":|\";}i:92;s:4:\"TEXT\";s:3:\"92.\";a:2:{s:5:\"value\";s:1:\"0\";s:4:\"wrap\";s:12:\",\"current\":|\";}i:93;s:4:\"TEXT\";s:3:\"93.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:14:\",\"available\":|\";}i:99;s:16:\"RESTORE_REGISTER\";}}}}'),(9,'e61fcbb5702068d957a3816aa894faac',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:3:{s:4:\"mod.\";a:4:{s:9:\"web_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:5:{s:7:\"common.\";a:3:{s:9:\"elements.\";a:8:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:57:\"header,text,textpic,image,textmedia,bullets,table,uploads\";s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";}s:5:\"menu.\";a:3:{s:9:\"elements.\";a:11:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}}s:4:\"show\";s:191:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages\";s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";}s:8:\"special.\";a:3:{s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";}s:6:\"forms.\";a:1:{s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:1:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}}s:4:\"show\";s:1:\"*\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:5:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:102:\"title,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:63:\"title,og_title,og_description,twitter_title,twitter_description\";}}}}s:8:\"TCEMAIN.\";a:2:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:6:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:9:\"page,file\";s:9:\"scanAfter\";s:9:\"page,file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:16:\"page,file,folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:20:\"page,file,folder,url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:25:\"page,file,folder,url,mail\";s:10:\"scanBefore\";s:3:\"url\";}}}s:8:\"TCEFORM.\";a:1:{s:11:\"tt_content.\";a:1:{s:12:\"imageorient.\";a:1:{s:6:\"types.\";a:1:{s:6:\"image.\";a:1:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";}}}}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"9197d75d22693b7d9878adecd2041a45\";}'),(10,'8c67f9e9eef63119c6b83a4a1181302e',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:3:{s:4:\"mod.\";a:4:{s:9:\"web_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:5:{s:7:\"common.\";a:3:{s:9:\"elements.\";a:8:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:57:\"header,text,textpic,image,textmedia,bullets,table,uploads\";s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";}s:5:\"menu.\";a:3:{s:9:\"elements.\";a:11:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}}s:4:\"show\";s:191:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages\";s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";}s:8:\"special.\";a:3:{s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";}s:6:\"forms.\";a:1:{s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:1:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}}s:4:\"show\";s:1:\"*\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:5:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:102:\"title,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:63:\"title,og_title,og_description,twitter_title,twitter_description\";}}}}s:8:\"TCEMAIN.\";a:2:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:6:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:9:\"page,file\";s:9:\"scanAfter\";s:9:\"page,file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:16:\"page,file,folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:20:\"page,file,folder,url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:25:\"page,file,folder,url,mail\";s:10:\"scanBefore\";s:3:\"url\";}}}s:8:\"TCEFORM.\";a:1:{s:11:\"tt_content.\";a:1:{s:12:\"imageorient.\";a:1:{s:6:\"types.\";a:1:{s:6:\"image.\";a:1:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";}}}}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"9197d75d22693b7d9878adecd2041a45\";}');
/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash_tags`
--

DROP TABLE IF EXISTS `cache_hash_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash_tags`
--

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;
INSERT INTO `cache_hash_tags` VALUES (1,'d07b003d9fce07cd551ada22027bf881','UserTSconfig'),(2,'92ae9e039e0feb5e6f1ddf9a7d594bf2','ident_TS_TEMPLATE'),(3,'da4e787af2263d40bc4daf3ae33ec5ce','ident_TMPL_CONDITIONS_ALL'),(4,'75ee55664f41258d9a2ab089d0b3c7f0','ident_MENUDATA'),(5,'d2d0a044fa76037f9dd31e136b965336','ident_MENUDATA'),(6,'34f3e89cf8586d9998ea72391ba73878','ident_MENUDATA'),(7,'6bd1617f573c885300a3689b647f5c5d','ident_MENUDATA'),(8,'d086ca68c27b5984bf91267abbb64ddc','ident_MENUDATA'),(9,'e61fcbb5702068d957a3816aa894faac','pageTSconfig'),(10,'8c67f9e9eef63119c6b83a4a1181302e','pageTSconfig');
/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes`
--

LOCK TABLES `cache_imagesizes` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes_tags`
--

DROP TABLE IF EXISTS `cache_imagesizes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes_tags`
--

LOCK TABLES `cache_imagesizes_tags` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages`
--

DROP TABLE IF EXISTS `cache_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages`
--

LOCK TABLES `cache_pages` WRITE;
/*!40000 ALTER TABLE `cache_pages` DISABLE KEYS */;
INSERT INTO `cache_pages` VALUES (2,'b79ccd75d4854a2dbd6e3eeb4a87a428',1616934355,'x��<ks7��z��{��*���!�[2E�r$J%ҹ\\m�X�H�\Z�%:��n��`L)ٺ������\Z�F����2�\r~���A��4�قQQ=��Ơ:��=���V��\"\r�wh��y������a�!K:c~��\r�\n��0b�o��@������oG�U�^�8��*	���4<�0�\"�����k\Z���\"\"��j/�z�����⿦+U�<b1���\r�������o���\n�\r,\\V6�oZ�y%r�k�.�@?RYJ+|C�J����Pq]�&!�h�?/Y�.�(�	�]���j��H���2�\'D���\n	�J�<\ZF�OBpo�joo�^:C{|�l��+�~�w�8n�+|�\'��2zv\"�C�VP�4�W�����ŋ�&�R�0�ႋ5�����B�y�\01,@���Z����K.��GG �J��|���rz5�H�Yo6z�9���w�^�6H���5��X@�\n�3��GӳC��N��dvu�f������xx����|��W��{ڮ����g���٬�������_�Ӛ�~�s��R����ߩ϶濪z�j�H��.pT��#�.H��	ԋ!IPi	Ȏ\'��1��J�ߗ����A�*��|�ڔ/�9]5�0J&v�yt��KL#�\r�W\r�%S[5�����G�ʳZQ3��	�w_�/�<����~��W��id�q�\",����p���it	g�㿢��$f�r<�M�w��ӗt1��N���z����&~��n��7������K�őg�Y=�玌����tt�������U��#��\0@G=@�-=���\'1���A]Ύtl����/9eq@o߂G\n.\r���RP�_���A��j��t�~^O~rA�5��}o�TO>C�A5�<*O��ҝP\'E�HXNrN���A�C���\Z?��c<\'�c7ql�e���9���8�<��#,��].�<�H��\r���ԗrT�������g�\r�p��l\0e\Z�y@ϒ����\rq��%�?k*u���*&XAc7��$3�i�q~�3\n����\\��3�Lз�Ҟ%@��APgA0�,]0\Z�`��Pg�MŸ�[�	��`�\n��\"$�a���$��1����	R�R��8��G=>Q�\"�fx+����r�NU�Q�Ϲ��\n�D�ݕB̬�ӕR�����5���W0!M9	K7ap��,�)I�1X����b��8{|�h�@��ـA�1��I�\r�vfQZ�zM}F�:t\rE\0���\0-R�1[�a�����v͖�\'Ww����?�d��9D|~��J�cb��C�8R�� ��X�E35Q��Dװ�#sT\r�����/Y8[s�N5~N�{`{��3a��ni`��Yo_8���\'�&N�)��������gIQq����������yRz��łl�^�$���Q���U\r�q�`$ �zݲ�1�������?���-��!�r�G�Cc�y�Ow�m�7�F�dH\0E�Ѫ��1�.��hI0�����.bk4����썐;����s�kQ`&`�z`D��Xq~�E ϼ;��r(<�\"\Zk��|���%@x�9X��ذ��/�6#B���\0ėFDZ�)YFz��b;�-6*R�#�ei�]t�w�y�,�a���\\�x\n\Z�!�������m4����0�O�=�+�t��ԳO�n�\n��(b����R�L�;��1�``s�5�cp�Y�~�+2Е\\.F�M���c�������+iV ���8	�]�)�)ST�zU��\rh�}y/�*��a�>��$P7}Ui+D�8��-)U<��ŧ�}*�R˱\"e&�|�Sr�l�Sd�r�U��wΝC4����L�2}�\"0I�2}P�B�׋���\0f��}�!�ʞ�I�Yz7���-DQ��R|��&`%���R�ē���q7�q��$���M�e:�Yl��`ŗ���B��0�*6;Tנ�FY�hUX����W�Dq��Ɣ�X�94�Z.}ܐ�G3R.��瀠Z���O�	Q4q�a1W���Lgy�`���Rh�φ@?�m28J�SmIx�.����V?��h����TX#�)�H2w�j��`_��c�0ۤL���F�IxԔ\rf�:��;�J���A��D��l���{�<|z�/�<�ۢ�O��m��#�o�J�t��\n�\Z-�Np��ɖ(��{$%�����u����\"�7��¾FA8�\"k0t��l\"�T�JG�hD�:�\\�&�X�(У{�{���D��Y�J,�0G\'H�A����Wj|,���Zw�{,<��\0�/7��J4�����e�FN�T���-�7�,�7x+��;?��g�B>��L�uY�?%R�hp�v���G�c?},�`!6�\\Y?]�ʎT�)��5�}�j�ϪY��q�?��	���mS��<���\0�۳�����8+w����-�JzH�ⶻ�M�rI�q����X��kQ&��N�p�����zKB��X��Ra��}뼭���-H��qG��Γeq�Ɣ1,F�E�-zo�=k�s}?���o���d�Q�N�g9��臩�}|@n�DKhx6Ld�Q�����L���I�3�u�bWR�]�����gQ�U�l�&���\'�{�@���۽	��\nT���j$����0u����>{;:���\Z�Oy22�y�vv7��|�*r�C����/�x:�Bk��e��FÛ�����Tb�Tf�G�R�Q�w�\n\"��HpMä(>`�������r2��v��\\q��J��2����n���9d�aQ�z�%�܍�o�Φj���x�@0X*�������(�E�0/] ;�����!Ҝ��������[8\"`͊\n\0|��/��g㑌���h��q�#��ɮ�A��/���OC���?��H�pF��f&�7���)�b��H@��i6��zCa<��;!�i��͍\'�� [\0��\0�N�����L�_�E,v��Z�p��޼����f��N�B1��t�^8�Y:\'.�8�)��ޖ)�����l��mk�>[,X\"TF2h4���p*/��Z�<\0_�>��	=J�<��\r�X����1���\'�bn�Lg�I��I�c�U�t[�dT�f��>b)a\n�43Yf���m�Gg�;��\ZY�	Ƞ0�B�è�-#���O10޻��B��4�)�8�J�Ƙ�@xKXS{X�y�\'�M����U3�e	���D�~Q��-j�o�g騩��{-��sLM/[\ZTݧ]v��л�w���1�9O����\\�J��X0��|W����[�8r&�֮��5����<N�&��z���\Z\n{,��4�su�g��ז��uahK\'����8ǿ�9Қ���\Z:U/����J���Hmj���Q�f �I�>q�v5*gsһ�����g4h�au��e���7w6xj��\\���\n�>Qj��]f�D�]vV�4�c��;\r�#bIcf\r�)�KDĶ��i+j�\r8c4�7rz���uP�b�\r_U�/���dX����+��C� �W�,p�o�_�N�@3�*o;�s>��;�V���\"~U��G�ʿSc7M���F��7>����:2�k\\q���W��b\"����A�Y9��e|\"Q\'YX��yE��O`\rNkr��k����kf掴jR\\{�wK�U~����ч��v*�8���D����|]��kxe9��q�OkjϜ���T���0{��,`�PɄ����FZ贂�?�uy�1���5���2C�v3[����wb��hZ٤��\n8[3S��he�`%\"-F�~�+�\rⅮ�2g�;#��b����J�7�LϜ���d��Ö��Ϻ��2a�/��l�sV��Y�WӖv|O����)0��{�������-�tI���,���I�e\ZNyL���`����\0T�Q�md��\Z�݊z��̟͉�J���*�W�L�A��<~g����e���I���6�:w��2��	��:*a�;��U \Z�vb����3N�3�ҩK::��r�(=�/�K��ɴD���ϱx�u���s%ꮤ�q�BL���zGs�7��L�������xx�����k�!N���.��d��f�6@��K�}��J�/�}��ښ%ߗۓ��~5;�aJݚ�A��U\r^ݐ��@�VV�.^Uk����	z?��Ա�g�_�^O�k�dZ����=��N&��|X[�\'mK�o�J\ne埴��-k���^`#�l�%oe\Z�|*LSuU5�x��FPr]�6� �4͎���DK���8c5Gz/GP�5�J��Ʊl�(	Ў�,�Y\\!�}�o��h:�9+�ׇ��C��w\"x\Z�K��e�;�:���`����D���3A���й�z��(d�r��$�M,�H����\n)xe��^\"��_&$O�j\ZD:U:�D=ëO4K�$Lg`k��R��#�k �VPzo�����EK��nD�iM6.ijR�#�\r�ti��|C���}?^���ޢ�o/�_�С��L��%b�~��+=���\r�Lh�0��IH|b$�4�oAG�t���;:��@�IE���PhC�A�R�ۻ$̬.�4�ң���Uf��V=m�����s:�{��2m\'W1�q��3�n�Vf�\\O�;�/��R}�bW,^%�Y�`��\"�6��x�	86xo�\\C��\n��l��a�Fϓ��phTp��u�1����ٞ��-��2��n��7w�<x#�\'���d�a��½�kw�\"�S�K\"G]Ń��w,�񀁩�E�0s�-1�*\n��J�����g��92�)*�ج����T} &�V�,El(Lq�6ML���{A�3�1~�h�i��ie�!k��������*����^��F{��ٱ�����3�S�t�k��qME���\0�ɨ��63>�����6vC�����ݛ��6L�M�C�Q��Ȯ.�0�W�$S<�����4ޚ%�die��?�fñ�*��.�W\r�p4eۧ>�:6�e�F�ο�N��i�wf����=�F3�ݷ�=W��9�)z�Ρ���s{i��qL�H��\0�ɫV�c���rؾF^�y�\r��>9����t$�Q[U51uQS9�\Z��u��m�絈�ҋ�ԎuQ�������I(�WՁ;��u�\0��!�!cB�y/}y�u���P��F�@�Ԙ����>�\r��&޹M�b��P���~��O�V�\Z~V7�r�X5Z��f�5�D��d�r\r\\��W����?G����<~���YюU�tl45��:�`�E+=�����֠b^R3$`����J����bQf�;O2�6I\Z1`��Jֺj�^9ޏ��V��/�B�=s��0��s�bP@c�^ձ[S�%]��%����(��o���y�	���[\r\\Σ�w�/�GG�]��L] x���T�uݮ�e��׿���	�Z5�����r���������-�Ӓ����AXi����D7ݍd�O��y�_���k�UP�a����M�o�bfޭ��y�Z�$��V��It�������Ɵ\"3N]�������93膱E��\r/E�i�����?�������ʳI�󏯩��5�ʿ��T�9g��b�0^3����B�й��`[hY3�ݨvMX�y�+�撎��K���}�<dڊ��-:�i��6T>F����=��i��ˎ3��@Q�IS��t�����I@��>*\\Pl$Cw���`U��W:d�\"s\Z����\Z�R�!8�Xc�,͘�\0���h�àp4,��xuZ����_��}{��߇�	���^���)־��?^촦\Z��>\\�u���8*�\r2$r��)?����\r�7�q�HvX0������Z��&�~aӹ�K��.�Fj_�\Z�Z�2�+G]�Nu!`�8�k9s���$cUE���@�2.՞�ު~�aMwQ�~P\"K�x�cH�k��<��Gs�i˺\ZTVM�S���_�=l���1�N��TK����JfQ�kB���(�?v��&,��f�����nC\"�ߋ��>y�J�V���Y5~�b�<�àc�[��\r��!���4N�{��?%�7=������i0�g�\n<m6C�#��[uA�m�����.-EF�9:nKkd\Zg���l��ς�?\\��	荧��Lu&C�%s=�݄b�E�M�k�Du��4��{�N�yj��Eޫ��[p�����9�:�N+�#�wn�\ZU\'�*Z��I@��:@�_�n�D�c���$���#*�4DT��S	4m\n�H�YO� KQp���>���l~Ϟ>���ѓ����Ż#|���=�Vo ��6\\�u|����Z�QѳD-�<�T��)t�H�\\��L[\"g��v��δ�f��	1Tӑ]%ϟg�y7�N�T�����J�D�^�v�gΗc��A�ʆ�I)���44\'����`�� O�$>�y ~�����p���+\nuMg�X��\"Q�_.�����ҽ��_]��)�{�;�_���Lٗ�\\�(�t�,��`�i�r��);\n���Sͩ���Yݾ|��L5��yq+]���ʈU-~�0�����!�R=�Z?�V�i�i��^wPV��#�o�pb����a�2o�}Y��[���3���Q�q;hȾ�sц\r�f�ݬ<�����[a����T��-]MÅ��� �/9_�A�]vy�L)���q�����\r�kG:����D�9П���yz}��Vk�Y�����w�����$:Ġ�럸��{\'�,�\0��\'�d\0�:�\\�.����&e%K9���,=�~]��%(kuϲ�:���&K�\\�q.WXha.�0p�`þޓ�&�&�2(o����[��f�)k�oB�Zݾ��o:���kf�Ԩ�3�h�.TVZ|N�j�l:��ƺ�g���������'),(3,'6b952ea57841f3117a81d35685ceffdc',1616934357,'x��<ks�8����+4�ݫݩR�~�ɖ#ˉ2�첔����RA$$!�\rH�Vf�߯|(�=3w[{���\Z@��o�z���A�6(3��![2*�g����;�~�AI��k՗�z�Kzu�����].]�u�Y�9s�gl�P-�C@��z��\Z�Ͽ�����nTZ�[���s�S�zU�~�ô�m���_�8�Ґ��5\r_��pY�!��J���?fk��\"`!-������š�o��J����	�J;�w-��\0:�-�}`)-�%��~)��phi�V]�!>�h�?���.6����xޡ�JB5��$�QQ�nk��D|��1���#���ɇ�ۻ����[��R���U\Z�F�ėYd/K�GXN����\Z��5e�$(qB���<�T0��_r�%!�����l�� ��j5<�x�%��J��BQ���l<��Z���-������N��p��V�6jN�]�kЯ��̠�����1��t:���>u27��?\\>y�j��xr��x���-�������K}7���_^�~&�Uu���=\0��S���.ۗ�����%�#A���Q��W\\�$��\'`/Z�X`�=r�QX��M.e�}�A-�ųG�>�E��9�������n���i���z��8�z���-[J�S#�F�կ!�T����2�\n��:˺��������k #?s�\Z�4vV|l�\nGj\"�qq�t��Ƞ���#�Ւ��E)þ�i3z�N�=hF�o ���l�cSF�8U����qx3�q���� ��^���NP>���d�,޾�wJ����<b���@��Z?L	s��r�8���T��Ĺa-۽��7��&<���F�ݡj//�;$~���Ӏ{{�J��5��:���\n�wh��`�>Yx�\"\n9�.g�5�(A=����oN1��	�K���h��15�i	J:�h�#�\r�]*9u!V�� 	}�`�| ԅ�䒮��`쿡���6�q��T#|?�����\'�Y.�=��ix�hcF��+�Q4��)�v+\r��Z;S�\"�\0vx\'����q�NY���/��r�\0��,ޕDL��әP6��?�B����O����<�f>�$Ƶ�Il�S&!��\"��{��	�{*�<�tP���Z7�A\'n���!�R���ʟ��\'�y�$��[�2b5�\rP��`��5s�\06\r��!�ٴu�K]���|6_	�l.�w��O��G`!q�F��\"�Ԉ�	�>a�Z��w����M���E�[��m�͑I��9����\\��W̟o�oyA�\r,{��3�as���3Θ?�z���)��?�y�;���Np�y�|���{�7uۅ�liJ�����cp��3\'\n���|�\\6���\Z)\r�D��B\n����ox�\Z�iBb�0�,#`�E@�Fݱ�Ѿ�����Un햽�+!]D�G�*Bgp��O��>��F�h�:E�1�?�C��+P��ognL��e�� t�6{+�P��:�T�� � ��#Z,�9�hH����-p���g|	��v@���o�XAǗ��!��\\�J=\"�ό�}ᰌ*��;�1���q�mpnt/��ʵ�ޕ�\'7���8FwB@�%\Z\0���ᜎ~�\r��1J�bX�0�C��^�� ?���\"��~��+�̴�ߡuIД1bX0רV�(0� ���\'���r��h��`�M��ޝ�<�{�r�`V��D��[B�@�h��ܠ^*�8hS<J��Fy�v؋��x��1���hX�)d<}���^��?��%E�D�z���	eѧ��O�9�M�V~���9�����E�:��H����H�N4� f��W;�c\ra���w��k�C䉁7.�-9�y�@p6��;�82�X8�N0.ؐxN�	���0�jx��J���\0�w��ʉIO�5��Y�$X玣�ڋ��@\'2?GGC\nY����r�>��)&T?� �fz����!�\"NZ�\"��NT+��`��Lc��2��H�\r�~�Tt�@��ڒ텼\0fT�g[�,:��!T�S�$��\"�����F���\'���.E�p��52��G��@��۽����k��$z\n�g[�,�����F����#�=\n�$t�;�0�\r1�Q����C�h������xO�D��?/*X���z�.�}#�H��k$��/\r�.��Ml.d��Y:\ZPx��0���ц�ph�O�E��|�\n�:����L�X������к\r<\"����m��+P�y�Hu(�4��B�*�ߢ��Fb2�c6���g[�,���g`���n��础��\\�h�[���O��,8��W�Nװ\"�Jvţ�tlW��]5M9�N\"u��,A4��}���G��Î�\00}����ʨ�^x��IO�X�~c?<ڵ)�d��|�-�%[�E�.Ǡ��ٚ=6���Z���Ĕ��4ԡ{�wO�;�D��F]D���\r)Z������=r�5��Y)�o��Ʊ�)CL3� ����rs���frt��:��M���tt2�!XF9$�W��I�\'�.p�9�]�q>���u��:�U��h�����7�w+�����5�{\'\":�*`����H�N���a�$(B3��x;:�x��,\Z�y;�Mo?�����0녕$�;��4њ�l������rz2*��)�ٻ���d�S����g���P?ʓ�s}{q	�{;��4���#ל�����`���Z���ޏR�;�4\nJϣ�qu���닙:�S�2f�<p	pu�a|�By\n]ys�����o�O��s�?�oAE���\0�5���.&#�i��\'�u�A�ي��A���C:#��zV��K\ZH�t4N�I*���S�d����N��l5�\r\rq���DRo�i���$%������.�����!\0owTO��w6q��C0ǐt��rQ:���{�<di���5�$��@S�*S693I�9le�mk�.[.\r8\"dF2h4ujb8�����,�����\"�D���ynRi=�n{��C��Y���4�U\'g&L`��WA�y�Iz5l���#V�%���h.��t#�C;�й*tH��F� R ��Pi0�2�x!�f�g	�=�I��&9v�d�i�e�I�c̉:@��i��-�<������U��T���t��_T��5�EՎE�dք�T^K��,KҜE�C{hN��P�l�3D��`n�r=}��@�s�&[�\r����4�峭M��nx`.��b�V<��X}�\n7+0�-��*�ϣ���B�I��k�&�O4q�<�/\\�Tҹ�^��M\nil�ڒ \'/I�\\�T�:u������[��2�&)�H��t&�;߱������$�k���%�����BrL�H<���y�>��0�?�U�\0RX(�VGTrD���̱،I\n�\"�=�qښ���iN�J�+=����+��������rIF\0_���\\d�%�U�\0\\����� �8{��\Z�Q�\'�����ҰĐį����*S�yn�������~2�#z`��F�-��\".������{_��{9I�����*<���,�${g��,�i?�48��9\n�^���l�jvnQ�*�u�|w$\\g7�<�}xjS��Q?�tO������z�������g��A�W՝9�ڷ���q0f��c�!WȄE���NJ�n�>�*HY停M�y�]������!�ļ�h��K�>�ߪ�n�e�¥�JA�x<�DR�O����-\";�K��)k)a��M��od�g�pn����{�vVj��uA\'�d�ߨ01,KW�I�xT3.���x�ӃQIcD��~􂾻	��Xo���W[V�:-�Ku��x����NdnԶ\0�_Qm��ɦ\Z��5u6w̝/�{�J�TF���0H�iǯA�}�M�^\Z:�j:d<����EԖ�<��n����w��|���@��.��:]O]��!T���E��{�]��N�\'�<�-]��T�3��]�-^(Rw%&�N`fU�;z%|��Ǥ=/�e��^YܿV�y���&6�Շ�P��u�%{s)�A׵�.�k��7��V^�%ודx��}57�a\n�Zhy�T�{w��>��ʥ���W�*j�J\\�Y}�B[D�C�R�Ȑpj�+���T�:�IB3}A����5�A���{������(,���%5~mY��y).�ez��[�C��\n�TCU%9�1�J6���[\r2]�\09�<�R�`�n��5WCq��rux3�(��n���*Т���5B�\'���z��V@��x��j�����O#漬��wS�p�lC�J� ���p!Ȃ9�ua\\�7<��oC��J{y+\"�crC`!/i^��p�ydZ����_L�@GK���c����K�\';����R��gP�@�VP�1�܄��?��~�mMw6jj��#�vi��|C��T��`f�wh�ǝ�L7_1�½䦙N��!��g�֛X����8�\nR����%�b+O��-���L�6�yG�>�Vf��`�1�(4����d	�H��]�N�\Z0v(��	3�6�SO�$z���lzc�߂+�J�o<c�)��)6[����[%F����~�%F�X��5��N���^�p�4o\rynX9�qc�܀����\r��^\\�����}Â.��ם)�������K��6ZE4.����(�7�|bH�R���pM�{���.\"���(��U<����jX`j3��s�Oo	[�5C���[�3�@eJ��j6g1}�nBU\"�)�51G\Z�Hl���)����Y3�!���>X�1y>��e��� �_�F�Xe�������iS`?[2:9����]�#�E����(0�����a�U��`��إ���/���1�nc���,rk��2ED���C|uN2ޓ�;�0+ٛ�{s��!�M���z>�B���wߧz�a+��t�ĠTj�Rր�ldJ�5t�]oK�6�]u�>�dO�QF[��U�q�2E��R���c|�(mY�	I\Z�?2�jYL�.-�����l��*kL�-� �I�Y�VEEM�cTU@�\n���Z����q^:��ZM�,�r�N+�NB1�*<�\Z�y��G�6�gDh�O�%���&Ԓ��p��X������\Z��c�ޣ|�M�al�I�wGV�lx�kx�h�h�^.T?�d��;�V�֯��Ѫ�`��]�\0�\\�0%�E��P�~�\'�\"�$Mډr�j�S��c\rf�\rT��A���\Z�ro�\\0�4&�\n�&�%�cIQ�B��O��6��:�3򷵬{Ն����ޝ�_]���;&�2�A�f�;�!Q���wT�E]\"�*�����9~�Os�Bz�r�c�\Zx��ʻ�����J嵍p�r�s������]�+s���/�U�C�wc6�o��p�2�~���ںȩ�/ܲ�o�؝�XI5����7�d���αIG\'~)����UAև����;˿l���5��Nd��j�BZB$&�����\Z�<u�#�Z�d�Q�9p��D�\r��$���B��Q�W��ǋd�Ų&�se�8��o��RW�ت[�=���xSP���\\/��e\nm������d�䧶�ꀋ�7�p\\u�D]�Z!qͫ]�����g�CquS�G]Mxo�熻�G��7�EOwrA���j�Yi�kmB_��lT�c��F���;&��#�%<e�dC�\nV���y���$���E���o�>����;T:�T�~��������Z����˃ ?+J/i�ٓ�!��M}��̉��\rk^D���p#!��R`K ����Y���.I����2a����U���\rT���\\���	O�(�j����;�.=��G�{�ƥ�5^ޢv��{\Ze>�lP�J�,�ԧ\\�n]�t5�,�0\\��󨻢G�Q?����V�/�]��#KI*~�Ƭ��Z��n9�Յ�Ƃ�t�-f��\r�p��`ޓ\'�4\\e,�pt�]�nO;��\'t��t��;֣.�` �I�AI��JD*x��敹X÷8AP_�����\"��+(��*{�e�6;&�!-�F�]��6yR���%l�����n����Q)UIS�P�u�B��0��\r����q�KQ�ܿ\'��ۧ�8�\\dү�^D}(=�����N���5�2��5@��Ί�H�Vd���;�Q�����ʭw�#����yD���ʀ>A3�U��z2Y\'>k�~���3pI��=}f��כ05��C_�sO���ҙ�+)v|��xW�@\rvT�,R��*�*�z2���EV[��S��g�]=���6b���WJ B�df[BI���5�N�E՗D}�NHʗ[MF�r�Tt�����P��8ư�9��HxY�$r�6��ӬF����Lo���\0Qi���e]2u���2L`���Q-=���UA�P5���}u���a�GI7�C���X�4�k���ڢ��o��?�e�a��o����1 o�5����g�3��;p�]�eC��OgF̲����R?3	ecI�,l�[�m&�w���:����A��ȁ��+���Y\\�XL�65k=�����?e؀����[	n�o+\\Ӣ�\Z����q�m=��nD^��W��<���!}<���R����R��B~I��K�vK���������h\r�k��g���߭z��_��z�fG`���;�F!,�}�@[����ŠYk�5!+�Z��F�&�uY;�����HP�����q�Ԏ�2��\\��@�e�I�c��E=LhM&`�1(kٶ�Ջ��f������ku�\"��`�!��.�����D)!�LU~���䓆&O�Xzj��;o�6��$�'),(4,'1292ba6ea088fee373a2825359c261af',1616934358,'x��=ks�8����+4�ݫݩR�~��#ˉ3�첔����RA$$!�\rH�Vf�߯�D�<nvW��Hh��h4\Z��Hz��OA�Z��K���œ�W����Z�6%-J*�Ό�z�Nj�Z���:�V�̰_�W\\�9�0�x�zu��p?d�U���������E���^�����WE�ޏ��F�{���銆��,�h����R�_�J��5^���@�i>���-L��[/�\n��L0^XS��h!�\0�ѯa���Ha&(-�5���C}Eu����~�dE�XR2�yۂ#(	Ռߒ`MEa�$D,���݂��\0�|`o���o�_ZS;|�l��n�S�Uj���\"{Y<9�>P+�5:��DAP�ly�`�+�Ŋ�0N҃{!�4R\r!l@�z�r�]��K.��������������zPk��άީ��F�N�n��hWj���C���p�t3�:&��&�W�GO��]\r���/�L�\Zz}5<xd<���}�lZ�=�Է�������{rZV��t��-`*�?���;u٦��WE�Y,8	�W�����[r�D^���xђ���#[��\n���ο/7(b^<{���_����W��dԿ���l�+�۩�V��n:���m9�a:k��.�QO��/�#O˰[gI������v*�YwZk7��z���Jݩ�*�z�v:��oGw�����v<��N�%P5=s�\Z�4�4(*4!ж@��!΂N\\��	�5ИiId��آ̛��R�,����u�Dx\r�`��p�ʦ*6u`��S5໼��ߌ~�sA�3��c�v\'(�|���b@y2�.ޮ�wD���)|Y�r�S\n7=�_�0%�Y�����>�SP9w�ZV\'Y#.*\\��3yx��f<:t����������_�{\ZpoC]��^�\"W#l�\0�������O�=�B�ֈ�Ǎ�{��e��T����aa��r��\nL���L���]X<�,02X����S�b��$#�O,۹�:���$�Q�\r���ԚW�D6���j��F������g�e��|:\n����j}�<��o�%_����]����)2\r`�w�Θ\\l�5����;�g�\r�HPÒ]����=](�BG�˱0f+���Tq\0�	��k�S�d�>Hvׁe���[���a����	Oz \'T�C`�VMk�f )D:5c���x}��� �轢.#V�u#�а`.85�p��\"�*���r��-���\\�hm�Q����w�|MqG�˗j�;pcFF	\rq8�	�2a��E.�j��`�\r2���\n�c8�x�b7N���%��3��n���)q�@�Dqg��*&�P/f�\'�1����.��]Ε�?���s��\rOp��z�n}�w�z���&�F�`�0֯��j����9�̉*.#ߑ������R��5p!Y��D����q��$�\nFdc��X`z��;V57�s;� �u����^�aSp)�����\0��2�힢7�Wk�\0\r��^�k��|����\n�P�c��5��<:�3�����\n��A�7Z�\\i� �-@s;p�hŸ�|�Y M�{��v@h�4��y?BGc\0�s��}s��t|���l�Q ��K�4&�@@�,s�������	EiU�����3�ve\0��i8�ѝ��h�F�f��l$���ga\\k\';1,w����N�-3@~���9L��\rI�[G\n�i�C될~5�X0�\\�FP`nAR[�M`Yڒ���`���`�\r��^��|�vr�e���l6�</CB�@�x��̠N��\Z$h�?J��Fy�V؉���$`7c,Qi*@�<@��<���o��[v�\Z��S!h��#&�U�&��\03��ȭ�|u}r�-����Juʓ\'\0��ɓɌ��h|@�py��$\\�7�钫�ގo�e�e���Gr��X��!�qd89w޵`\\�>��yx��a���6h񹢾�\0�g�7ʑIO�6��Y$Xd�����@G2;GKCrE����]�2�>���\Z�gT�sAP-��Q�\'�Ȫ8i9��+;QQ7���63�y\Z��C-�nt���CWiv�\rٞ+`F�|l��y{4݆�x�쑄�r$�Zw�:Qp�������K;��x���Uc6�=���o�7�����e�����T��*yx/���p7��(v�\\;	��њ:�x}La�ig{eP�\Z��,p\"ޑ\rQ��wċr(C[_�\\����ԣ�i�s����Y�`�Y��\\A˝����\0k!�\0�Y΀-���7����\'J���0W\'p�A��O�U>1��;�j�hx��gj[���\n�`����R����+_��[m10o$�=�cY�>6��\\�|FO�60O~r����yҁ�e�_���<+6bM�+m�kXޕJ�����oU��U�sM9�N\"uG�,A4��}�G�����\00}��ڹ~x�F!=�c��]��ޮu�%3���U�/������\nn�w�bA�\r�#>�s-��\\fJ�}���\'�p\"�pG��N�yv斆�,��Y�c�ޱ{��b�w�~R�W�|����>�\ZoP�.�\'������]9 6�~�Es�>\Z���Q	�U��\\���A�s\\uc[b�\\\r��ڵga��U\"o��G����g+����\Z���\nD���z �\'���0�䡹�938��\n�O�hd�����~0�}�W躇�����o�p<�L���y���������T~\'�goo��R����\n\"�s�wC�(�> �������j4��v��\\s��ӃY�Ckvd|{?Han�Ѱ)�=�\"G�7w��c�ۇ�e��y��2�����E\n�!t�E�݋Ў�{#�|7G�A����p��س�\0\0]������p =�f�\0�s]��dEWI���\"�j�{V��\ZH��h�T\'8�dR]�Na��Z��[�V�Q��4��NHS���كI�������t���U\\��`�[�TO��=�,����`�!�K �t�˫v�	x��8��+�Di;���U�lxb�j.�����x]6�$�E(��W���D,SSC�Y�-�:/\r�d���J�it3�cLm���\n��ĥ�0�:<1a{��\n�N&�հ�̣�X��4�¢��Dҍh��C\'��!k��\nH�0�B���K	bB�嘏10ܻ�ô@\r3�4���(\rw%��̛Þƹߜ�3<�d��_�kM5�s�L\'��E՜Q�_T�X1IfM�L�t\\��$͙\'N1��椻\ru�ƌ�0C��)&&�*��b��K0qm�%�0`{�iA@��\"��l�Tt�s1d�0K��%���V8Y����]�\\���yt�:&$���Ƚ�o�E3��S�̑H%�s΅��T������/	2�\"ѤɁN��S�?�NN>r���hG�$�i���$x\'kV5�>�q��u��<�d��Ԙ �x�!��}��C���xU�0ha��[�#bNma��f�R��mhF��d�MsJU�h����+����+�*V_V�dXR�j�p�}�x��W�-lp��g/N��K@�q�@�6����p�J�C�*�˝�S�-M/�G��y����/ha�q�7&;V��`�Ҍ��I����I �GNv\Z�a�I��i?�68-�9rh/K�w^6+��U���˾;.v�<n}xjS��Q?�uO[������ ���W��7���}ZVg�l�������16e��B&,�H��n�RC\'u;y���)�<�\0Pw�gW��$.u�Tw�\'1{u�cY\'V�ߪ�n�b�¥�HA�x<�DR�O���-[DvgV�Ӯ����:�o����=��Y#�ٸ�^hg���IuO�)�9ò�*;������[�5W@��ɒ����.�!��t�{]��-���^ӄ�R�<$�m㤠C��-\0�W�Bkih��\ZR���򎹓)q/T	�ʨ���4	B0��5�u�g󫓆�wo:<�����Ԇ�<��n��RaB�;�r�T�g�����C��X�΅��*��������Z�Mp\'�e�.�j*�1��.�O��z�\n0�*�-M	_��1iO�D4l:�5��kU�\'^abc_���K�.���S�¼caޱ0/oر0�X�w,�3D�y�¼d�caޱ0oձ0�X�g��¼caޱ0�X�w,�;��y�¼ca��0�u�_[tha^�Ѩv�\'9�yiwO�\0�y�j��X�w,�;���yf��5y���SM�]Wv,�;��k�V��[�w,���Z��,�;��~Qa^˄���y�¼g�}R���қH�\0��aZ�m�����oc���x�<��$�L���)Z@A�WpF}�cبXX:{U,+�T2�[�|�B�D�F}�Tʠpj�K8��d�?�IJ3}D����Ք]�ɓ�ƺ�[ɐ�_3��*����S-M���&CK@#ա��TA�j���W�d��,�K�W&d�&!rTz��h�D��>�\\5ę�������l��\"��GJ<T���f��e���/е\'�V��Fy��M��Ɩ���zY3��Hk��g�-	Q���>d��:5��k�Lg���ԥ���9	�1Y�>���4/L����L2-�uĀ��o�C�����1��D�tA�dq��*V�*��J���� �g���w`�5Zۨ��W@UX˥���5	~TI̃��ޡ�w�1�|�|���f\"8\rb$���3������ύ�� ����O\\b86�4�o@F�d��a�[:���2�[��F�Q�!KPD�mo#?��,Ѐ+��溱�0#lW��I�DO��\0��E/M����I��gl\"�E?5�r�W��b��6r��o��h����f�\"\"�NzM�5	7I�ʰ熀�c\Z��\r��-� ��ŕ���(�e�7\"8��Zk]�\"�;n�uL����<�q��,�����Z��9]H�����{�W��E��~�����o��%��T\rLu���bNU��%a+�f~�3�{S{�������Z�f/F�MX��1I� f+B�a�e�52��0k�\r3l�����2f�ǅ��bU4��[�\\��VY��):����X\0�O�N��O�iq>�T~�u�g�)�94�h�|w3>�֩�}���_\ZU�4gee�\\���D�LQ����0_퓌����%�yc��٤�ɓ\\L�CèE����TO�5l��)�?1)յy!�@@72u��t�]/K�b�v~���d�=\rF5�	��v|�j��.S4ڭKww��=J[G�a�E����̷ZS˴K�a���k6\rҞ�5f�-� �I��wS��1�QVq�2�*�+զ�q\Z�y�ji]0c��;x��;	%��Dp4��� ��o�!=�Bw=�N���	5��/��2�85�,�����X��(�M�~l�I�w\Z�V�p���x�i?k�~�_u��ҭr�X:Zk��G�Ƈ	�w���2��	x/;)�߆�Ճ�<|��i��+U1���`m0Ԣ=?���_�S�B���l0�(f�\n�&��`YQ�H�3P��6��<�;��B־jS_���+�Np���}p����#��4sѢ@C�݉O��<�!�L*�V�\r{|�o�64[M/R�v��F\r��Tz{1��_*��g)�:���	��9�u�2� �~>-����Y_�V���A�u{?Ϭ��j��ym����T���Ip�>H�t�M:B�s�P>3GEv���8�6�,��u\"��F#�0�\"1!��T��R�s`��[�Jk���g���f�R�hÜi?�}v@��j��/�:�V��mG��^�f��LV��Xfp�ߏ{3]�e�c�m�g����\r8��|�Џ�h[^?��N� ��j*�4k�%!�r_]^e�B���%�p\'=O?~��Su�au��M�\rw#�b1w����%A���j�H�,��-�&S�٨��:�:>vG��0��,��*#���M�`<i����+H�g/�ߜ~��>�����������7������U�3m�l�,���}$�n{R4�wgSo�5s�G�gÚ���5F�@.�W#�%�j��\'��Pbi&�[)};������,@ꩠ���\'� r�S��0V��S��W�\\��z�|oԸ���S�SԌ� �2�90(����.����ҮzL��TV��S%�ԝ�=dT��1�A���X�s,4�CJjS񵂆�[(+T=r�G��BݘCL{1c5�O��k��mxN�$�p��$�ѩ�?m3o�8��2/0D�<���8��&$��K)�/Ff�\r��E}*�&vsѧ)��ި��֕���i(424Ҳ{j#6չ�z�w�a�?�<�p����J�K�jY�DS���b�?�&�ҳ܅u���=��>u��\"S�U�x܇ҷ,)��	�Q��V�[>�i�FZ1<)Њ\rV�#y��j��La\'諭xKJ&�DQN�A���OEP�Ü%yg=�,���Ŷx����K���%{�̲�B/>��?�%|���>W�\'������A�)�k��x���g�Z>�VrT�ޓ1��<2_��L]\"W�{��N�c�f()�\n1X��m\r%�g\\��f�!��������\rK�M��b���y��X�`�����h��i�N\0�Q�IF3 �.v���6�k�F仜.���\"�E�RA��Z$�v���)A�F5��=�WU�!E��W7/$����?�c�Gi7�C\'����4��˪P�ⶩZ��?�dK`��\'����1 o�5����T�h�����φ��.�X9�&�8�$f�5ճ�ul����t�=�(����ؕ7�8��G���U�G��,��qqJV�Y�ɬ`�4e�����zl��v�8q3�xZ����X�%-m��n�v#ʂ?�|��/m��hrA\r�-��ou����]��<N�Z�=�Br����c�\r�K��\'�\\��ߕ�n��&�!z�>�D`���9ٍB �y�@�|���^�R�Ԅ�d�@_=\r�٭�z�,e=�yz��W�>��R;VXىfz��:.#L��=��aBk2���AY˶������f�$���vWB�/h�BǨ�1i��|����,��2���ޟ��4��8��Q4\\��:.��\0!�Mh'),(5,'bb4bf65cf73c6881e6e9d040a994ccfb',1616934365,'x��=kw㶱�z�W(j�����O{�c���[�������сHH�\"���M��w/�\"�+;Io�j?x%0�yQ$�N藺W��K�țy���^��+N����tf���t��E�n�Q!�n�qfS���WdN\'�[<�zu�� d�U�����������E��O^���7E\Z�ޏ��F�{����F��,i��G�R�_�J�W�3^xa�NC/���b��S�0�\0�m�P*xA���+�V>-D�:�5}`)�8���A!d1wh�/�.ܐ\0V�ď�,�#��ԋ<�����)��ߑpEya�@_���sh<\\���/���~mM�Ն{�ET�v��R�R��l����	�	=\0��Zàs��/p\nC��[�B�C��*�1�$���^po\Zˆ6 Z��r9ڬX�5���R	��Jr����j|=hW;�K�n����F�Qit��z��tj��+�8=�f0>�w���&�Wg��N�㮆����ϦS��\Z�=�}�2b߽��w/&�rpz>�??�O����O��L�\'��Ǯ�.x�,�����GA�-�tFb?R�@�h��B��\'G�\n���ֿ/7Hb^�x���_����W��dԿ����8�J��ۭ͚�j��n��ל�ը�[S䣚�7_�F�a�N�N�>������uk��۪7��N�Ի��Әv:Nũ5:�v����[�hrq{;ܿ\\\'���^8^�z����	�h[���gA\'.�H��\Zh̴�2���\"͛��R�^��;��`��e��\Z��d��a�MUl����j�wq��п��g��p��p/��mOP<�{Ő�d�m�]�2-|�����\"�nz��H�aJ��Z���	}��$�b�:�\r�,�N�F\\T���g�肁�2xr�\n���٩���I��{\Z2M]��^�\"W#l��\r����i@�>=�#�ֈ�Ǎ����e��T����`a��r��\nL���L���]1X<�,02|�V�RO��y�V[���>M�l�0�������nx�Qk\n\\Mٸdk��a\\\nXb< �&�|/��h��ژ.W�O���j�d�P\Z���r$9E�!���ә\'�A�;E~B�>g�Yl<԰dW01��J����r,��%��*9\0�8cѵP�d�>vׁi���[,��a����	Kz \'d�ch�Vuk���f )B:c.�R|�YOH1z/���	΀��4FhXx.85�p��<������r��-��ɜ�xe�Q�%� p�lOqGB���Iv�ƌ�\Z�p���e���8~��th��G�p���s�8a�i��}6��ɒ�f1(�S�<\0�ɝI\0���tM}üO8cv���]��ڻ�+���������������ʿx���9�[EF�6����k�3�f����_ā#Bm[m\r�-%��p!�8Y�Nx���v���h-2�6V~,�=`ԝW�7�s;� �u����^�aSp������\0��2�힢7�Wk�\0\r��^Qk4���JVJ^(����Tl>�E��#�a��\\(f�ꍖ0W��hn���=(����-Z;!��c֏9W�@<e.�@_e9_��F8\'}�+�q��<T6K_��l�,&5cBQ\ZG�gF7���L;�]\Z�b�s\Z�AbT\'�!���)>k�i��A���Ɏ���2���1�2�\0��{����*ڐ��u�P�f�9�	�W-`������U\n��,Hj+�	,K@[p5,W��\Z��a�T��o�NN�2�՛\rc�ϐ�֐<�zkfPǀ�G��=���Q��v̷<��z�%*M	ț�#����1��c�ew�ai�<���1�����dv`s�����Nν�t�t!Q�Ny������y� !�1½�!5���jE���!t�\\�t9��=x�x�x����rg\r���#�ɹ�Ǹ�\'��?oϓ1�k�->��7% ���Z:2��\Z�7˂���v4e{�r��Hf�h)H�耶��B��\\Fѧ	\\T#��J�;.��?J�D�Y\',G1i\'J\nM�,n3ݘ��83j�w���4�2�J�Km��\\Y\03j�cS~�ۣ�&��Sf�$�#�Ժ�剂s\r���L�<v8���i\"�¬!;��[]�o�����5���)?�U������an�Q��v:�u<��1������AUk������xG�D���?Ρm�]�s���S��q0�2�\Za�����9:��͹��;KKr��BV!�!��9z��G���v`�(yA@��:�Ï�HjX��1���Ъ\rܡ�i��l��+P�Y�_Ku�[4Rz*}�o��`�HL�^�Md���ؔsy�1=y����<�y��zK5�IZ��yd�&_�,؈5W�NW��+���G�5hת�����r�D�vY�h���m)���\'��v�\00}����ں~x�F!��c��]�ήu�%3�ϖ�\\_���#����+��s�ي�5�tǵd�����(R�{�wO�;�D��F�����-�#X\04���α;��b���~��W�~����>�\ZoP�.�\'����oc1��Gl�T��P�t4�I,������峃D���ƶ�8�\Z��k/�z�Dޢߏ�{/\Z�VIG\"�46;{\"�I�����@�O��=�a%�Csus�v�7��%���ш\0�����`t���/�u�E��/�����x��V�c�P����磽Q��N.�.o��B���K�r����q�}@����9����h��m�f�9��B��2����~����g�aSP{�D��\rn�O�r��9˘����e�������}�=w\'^@;���X�>��a��{���[�\"`ϲ\0t\rί�w�Á��=p�u���]%�vKe�TN���Y��i(|��qR��H�Iuy;EaD�+oU[u�(��]�(Ґ�J99��$)������&�����!��oՒ=�F���`2/h/l�	��c,����/��	&�!��n��Q��l����N�M��6ަ��z��F[��Hz��JM��\"55T�e>��+�ya�h�$[~��T�PM�������@�N\\��U�G:L`�ѕA�Idh^�7���	k�FQX4�H�͡q�D;�`m\r#3P)�Z�0U)�!$x�1F�;�p��aF��[�4�����u�ys�S���9<ãO���E��T�<���t��_�����Eَ��d�D�d^K��,KҜy�d�4\'�M�r6z�bNy8щVAO�E|�Xk�-Y����MC\Z����fKE5<z.��f�Vܳ�Y]�\n\'+Թ=�u�d:�̣�ֆ�t�:#�J��\n�\\=O�3G\"�t�9�z��BJ���$��D�&:��N��99���Җ�-M�W�U�:����������6�ֱNt�LJ�qߗc�D�!�LB�#�\"Z��U�r����Dnu�K��9��٨M�R��[ӌ�-���攪��H��_��~a��W,xS���\"�aI���/�A\\��7������:�/\0��CY�x��{R�y.(�\n��M1<\\lxkm����>����D�^�,�|A���S�1ٱb�\Z×z�ZLb���?ͣ�PT�m5.��V�@��}mp\\s��^�o-��Wnq�,ص�}w$Zl/�e\\{��u�L�{�\"D��=o�;�s�����^j��|�/n�qY���}���z\"�l���{�&SȄE���Jh�n\'>پ E�\0�N��\nն��RKuGx�WG�@�*������`v{KOW��\Z) ���1OJ��D��߲ED�hf�?m[J�*����+�_�3Q4��5�����rV*��TQ\'�E����1,뮲�XfT�t|O���F_IcL\'�����C�>�{K��W��ʲ2t��:̗�8f�m\'�ܨmH�\"ZKC�EՐ�u�<w2%�,a�Utt��� a�����=�m~u����M��gw�>���Ж�v�-�Z2L~�%c��e?��p����)��TB�zY]��W˹�z��c��eXm@y4f*ڥ��du[`B�T�VE`��(a+Y<&�	CDæ�^Z,���yB���%6���a_���¼/=�p(�;�\n��\n��y��<Mԡ0�P�w(�Kf9�\n�Q\n��y\Z|(�;�\n��y�¼Caޡ0�P�w(�;��>\n�ZG��E��u\Z�j�}�S���v��wP�׬֎�y�¼Ca޿�0O�ޡ&O��_T�gו\n��y��y������\n�>���\n��y�¼_T���a�Caޡ0�E�y�$r���&B7���~����Jh����۷F-��8�Ŀ�U���.p��A���*p꿁C\Z�\0�F��ٛbYj��6��\Z=MR��7�3\"n�o��o��\'p6�r�9�L����ݝK.޴:�N���f.mצ��t�5ǭ��n}ڙ�\'��E�n�)ݡI��z�\'Y�ڝT�$��VI��hd�jҪ6%�Bϴ���VlG�o��?I�aS�e�+�@F��P��Hu�.���*f�g��������F�I�U.hI�3Q{��5WMq�wb)<c&9kpTD7����Jx����\Z��G�Z���DXي���,t��~V���� ��;!*V��pu���{��d�/�r2��:�~�O�סYWŝ������HD�O�:��_`��<���/�C������Ѵ�D�tN�d�<�-�K3��<������t��@�����\Z�l�TGK�����XMyF�e�f��Z���0�g�j�����f�\r\r����ZČO��:X !�?�I@\\�96��oAF�d��f�%�r��[=\rK�Ӎ\\��sB����.� ��^�\0W��u��xZخ`ד����>\'�~��o)�����-2�� 5��R���R�ldj���y1h������EL���׊�k���f�\r+K7>h47ġ�-����MH�E�<��Z��?Rk�+]�yǬ�2�߁W�cjJ��^;�ח�\'=�t!��v�b�=[�K�Z�}Z��5Ͽ�\r��%+X�kCG>[}�B_-	[�5C����ԟ�3��@fD��j�{1z�n�Y��)��[i�?$]c]����Ϛq�i6~��(\0�ְ��B[fF�9q�Rԗ!�U/d��	�V�T�O�N��O�nq>�T~0���W%�C�?j1��n\Z��a�:>��({��Vu��,5�K]u�H�.b2��4��>�xS���AS�֝�z>�MZ�,��Ť?ԌZ$��ߥz�a+\\M���A+��sQ��ѓ�_M��ղ��+�K�O6��`TßЖl�{UI�u���`]���|�(eY�	�I�?�\"�kYL-�.,�-hW��i���1[@e9��L�GǛ����q���\n��W�]�6��� �k\'�K�����\'�ͽǊ���/7@�\0�G��*t;N�I~��6�f���@�:����E���(�>�_G��o,7�}OMd˖�������~����\'��k���2�\Zec������)��e0\r�Nv�R��\r��{qy�\"ӬJG��%5-�*֡�E{~Hջ����{�����`��a�\'�YcQS�H�X����#�<�;򷅨�U��������fl~\Z����Y <�[o`�-�4\"��!sJ��QEZi�Ro��û�~�w��jz�r�\r�5��R��|�\0B�tb#��\\�g �&�@U��h8���,?�����|��\0gi�e?O������yi�����3˗	\np�>H\Z�t�M*<�s�P>�GEv���8�.-��ub��F#{��\"��o������y�ꖼRZg����3�i���H�0c�O\"���~x�[a�+�/u�O�����Y;j)!�S�Ж����ƽ����1gY���\r8��|�P�([^=;�N$@��jJ��4k�%!�r_^^e�B����%�p\'=O߼�MꩺҰ�B�ަ熹�O��<�D�W���]h�C$m�k�]�)�mT�]���#XlXT�,��J#�\n�7�&����7E��?$qܓW�o���{߄��o��WI\n�b����ڎ˲�2Z�u��Y�>f�=)\Z�۳�w��9ѣųa͋H��j�|�9�٫�X5��s�Vv*�4��ѭ���P���� 7�z2���IJ����/�թ�����I(W���1�[9.=����5��&�Qf3\Z%>���F�zw_�U7��IE���:Y�I�9�AFu\'��Q����>�2���6_j�)����>��#zD�^�\Zs�i�\"f,��	w-r�\r�ɳD\Z�29*u\"���m��3�Z���h8�g�SGpy�$�$��S)&%<��ň�������O#��7}�j�̈*]�̎����D#B#-��2bS�۩W��v�S�g�7��7�֑iz�S�\"K:�x�V�Q�0�����,wa��>�<���Ǿ�DrU>����-K���vB`-��}��ڕ�VO�d��H�\Z9�����Ֆْ�F>SF�S��Ȭ�s�M��$�gc�3��ϟ\\�t\n��=fQ��b��mJ�x��y6�NO�c��M�gSfWZ��C�`G�/b�xH���\0����������w����cW5oZUF�E�~��\0*DcMf�5��^p�n�a�R���\"_v,$6�s���V��=����6q��К��P�\0����f@��m�$v=�݈�˵\Z��bJ��`z��L�=�*(H�mo�]\0g�j�Q;į*sC�BU-�_��š�\'�<Cd�Gj7�C\'�vS\0���iY�oq[�L�O,����Iշ�K��\r�����7���9Į$�!(��#VN��ƨ�Q=	�ٍ�z�n�-��֓�g��ߏ�my��C#[�dC�[�~���\".V�d�����\n��^Sv���:������.n�O+Ӽ�\n����p�m��nDY���}�ݤMz{\0M.�!�ea�������+���K�7�\\��Y�>��A~���$�j}�����-�W:x����M��t;G�Q�7���\0h}vޫWjx�ꐕ(��g��\"�UQ�堨=M�����,�c���Xa���*��2�D��ѣ�:�&��j��l[����n�Qo5�r�mwD�~,t�:�v9˗�ݎ���*�ϟ��)��L�}6a����ʝ�q)�	v');
/*!40000 ALTER TABLE `cache_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages_tags`
--

DROP TABLE IF EXISTS `cache_pages_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages_tags`
--

LOCK TABLES `cache_pages_tags` WRITE;
/*!40000 ALTER TABLE `cache_pages_tags` DISABLE KEYS */;
INSERT INTO `cache_pages_tags` VALUES (2,'b79ccd75d4854a2dbd6e3eeb4a87a428','pageId_1'),(3,'6b952ea57841f3117a81d35685ceffdc','pageId_2'),(4,'1292ba6ea088fee373a2825359c261af','pageId_3'),(5,'bb4bf65cf73c6881e6e9d040a994ccfb','pageId_3');
/*!40000 ALTER TABLE `cache_pages_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection`
--

DROP TABLE IF EXISTS `cache_pagesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection`
--

LOCK TABLES `cache_pagesection` WRITE;
/*!40000 ALTER TABLE `cache_pagesection` DISABLE KEYS */;
INSERT INTO `cache_pagesection` VALUES (2,'1_222419149',1619439955,'x�Řݎ�:�_��J�� �U�ӣ=R[U�T�r`6k�`�M�t�w�W�L{�p�03����Иď<ʹwC�E�x�q{��+@����<	�λd�w�mͨnG�����	�D<y��x��5�RQ�y�V�8�e���[�7�����d��)��;��Qô�=N/�V}F4<�,��7`.��R��ô�؃\"3-��=$�JԥN������B��Շ�A\ZI2�M]J���$�]*�{v�n>�p�Q��$�Hy���O� L&�)����.Tbh��1|����#+�\\d�̈́(ԁ��;i�I\n����	� ��ڨU���u�ɺ�<iO4R��3~��x���b�V�T��0=T�8�iC�քl�mps�aC�-���ʑ��!CEPS�k��+��(���~/�\nI���Ml�\'��CT���*�3����=�DCcf騈IE�M��Q�tKB:w�1�ҜpӬ���µ-]�ʒ�Sn��w��g���i���c����ZB�X�.\"2#��)�sZ���w�˳��!�v�O������r�>Ԍg�>noA|y�������/��׵�{9^�r(O�n�Um7�m�m6\\�p�i%�ߺH�\\�͵y.[-�m�9(�m:2	�?��&#�,�gd�@���[�p�i�0�me��&A�/�G��m=�l�����h�$h�Q����Q�==�U��Q�=fp��Ϛ�v2��}��7Ks�|%s��0���K��ܭ+�~tMA����A���#���&�t���[�(*����nd1�g���F]ϱ�5�H��\\K���v#�\r%|���_!B��܄v[	�y4�՚�-&�n-�A�����pen�`.A�k����L� ����̶2[BZ�\'\Z������{,	����M����]��ٯן�׉r'),(3,'2_222419149',1619439957,'x�͘mo�0ǿJ���W[���ڪj2i�nj�`�M���wߙ���&�m��	p>?���Ap��g?f�9��$|>�0��syE3��~�LÉ:��&ι�UWe}���2t$ڑ\"�\'o�\Z�B�z�UH,Ik���J�\"���%O�S���]�\rAH��NIB�f���^�6\"h���5@,�e!%M��.B�d�n\r�I�-x���@;���|���r��-Z��?�CNZ9 �z��n��5|��-�bV&j�M#���(�5ES^f2�4�|�q��Q���fQʓn1>���#`G�:Q���։wTw�9˞�e�_gYA���L��ĳ�#�M��H�)Ưs~\Z�9��d+�~U���Ѽ-yT����kT�1��և�������f�z���ܛ#���^���8P�P��6��F�ԕ�E%OY`Iy�b���3 ��mVs�zr�k��uT�b濎bn��M�\'4z��\n�T����\n�]�@اh7��7\\T�{�E��MK3gfH�(�I�]7���;S�����?W� E;�043}FW�V��������&����T!���Å�����2�ݦ�,q�d�B�s䊃�p���~IXN\n5��>1���\n(��xu�̂`��.����pޛ���B��e۹<�k�6\\�Z1\"���7�� t��N��l/�.	�g�nj�M����v���6�K\n�\n;�|ٮ����X�h� h�&Wȸ����5ްY]���5D���/��r0�����7JsP|9��.���k�8N��7|�\rAwM���F��=���&�p�����}\"I3j�5��{�>��1�Z���[��5ۯn;��P�7z]�\"�����l+�0/�\Za�\\#������;�);|�(��N�%�a�����h;�J���N�Fۙ5aO!���~e��o�=� �졑�M����]��ݏ��(p'),(4,'3_222419149',1619439958,'x�͘mo�0ǿJ���W{��I�45��wȀ�Z3a�,���w�)v��l]ao>����q��^���s.q8�O\"B��\\~�9QF?���L���wAS�R��QՌ<�CG�=)#~��f�� 4��Y�Ēt�X�d0�<t�yV�B����t\Zk�e�0|��\"�Ꭶ)�;Ă%K)i�/�\n���4�%Ѯ�U���>B8�C��o���;\"� )�.��� �M��[�s.?���#Ec�h��*U�?��P	*�_S4�U.#Ms�׌g��Ќ�he<�o��b�|�Q\'��.\"F����Ԋ�g�3���u�=l#��؂�?y�d������c<�����S?9��Z��6U�j-��G͉���U�O���c�7IIyq�II�Z�W�Ko���[{ݶj�@YC]�2�NBIAPW�oky�K�s���]\0�շmXύ��Ѡ�>�I4���gp��;�C�Gi��N���h�@�%A-�}���\\_pU���~��v��U��B����1���������/��J���`��>�/Rw������Ե6����T!���ǥ{8�;�1�U\\Q���P���( ��gy�&� ��������J}z��lA�^��u��L8�E��R��U�ع<�k�2\\�Z1\"���7��(t���N�F�lȮ	�g�nn��ǁ��v�����C�\n;�r\n�>R1��2тQ�6w��I5\0/�\"�[�Y]O��-D�����z4�����7IsP|��.ߟ��k�8N��7|��A�����X�\'���&�x�o�r�K����U;��8�l\n�/�ю�����@��T[���#�\r�����I���f[��y���\Z�-�o/ސN��k�B�vRo*AoS��\'ۙT�vB4��l\nit�`�+c���X��j�FF7	K��w��O�_T)');
/*!40000 ALTER TABLE `cache_pagesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection_tags`
--

DROP TABLE IF EXISTS `cache_pagesection_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection_tags`
--

LOCK TABLES `cache_pagesection_tags` WRITE;
/*!40000 ALTER TABLE `cache_pagesection_tags` DISABLE KEYS */;
INSERT INTO `cache_pagesection_tags` VALUES (3,'1_222419149','pageId_1'),(4,'1_222419149','mpvarHash_222419149'),(5,'2_222419149','pageId_2'),(6,'2_222419149','mpvarHash_222419149'),(7,'3_222419149','pageId_3'),(8,'3_222419149','mpvarHash_222419149');
/*!40000 ALTER TABLE `cache_pagesection_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline`
--

DROP TABLE IF EXISTS `cache_rootline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline`
--

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;
INSERT INTO `cache_rootline` VALUES (1,'1__0_0',1619439944,'x�M�Mr� ���	�Ӧ�|���I�1��#�n3�ܽ�]��@�\'�(��hT<\"ԠgU3��JkUJ���	GM�����w�h��ȆqïB{�#����~��o0�ޟ�R���3:���N�7G_�Z/i92�~o�\n���;�+�n�4̶2m��b�?,�3��e0���ҍ�nq����R��N5���h8�D���d��ǿ@\\��1�D�%�S\n����*�����ehO��\'�/SIP��dl����l�=N����_X[�/'),(3,'2__0_0',1619439957,'x�͑MN�0F��|�$���`�M���x�Zu<Q<I)�wg���X�����y<���|�2�hY�W�+)Zk�fdS��U�գ�\Z�S8��Y�Ex	�#\r�	\"^3���v�G<ߐm�����4�\\��5`�NНN_���fp�ƀ��]|yG�?�{)���<Hq\0Uwط�=g<������!$�\'���Ď]Y�?�:up#�+�+כQ�~�;�AK�!R2v��\'�&�,��-|5Mﰶ^5h�W����N�\05�Iy~�r0�[f��͟��>��v�R<a�?��i���>���)����\r�b:-'),(4,'3__0_0',1619439958,'x�͑MN�0���|��P~���&�[n<\rVOO��L\Z9+b��y�<3O�B�Z�o�,�d)Eo�����E��r�A��2fy�SHhi M�%ǚKXTࠡ��v������\'����X^v`�NЍN�p�����\Z>���\"���V\n�&%wR@��}➳<��X��^��G:���uՠ?�6��B\nV�7n4���=o�,��HI���T�,�H�B���ҽ��zաY�*xc{�y\0��Iy�G9���=�����g��;�k)��qs����}����?N��\07:�'),(5,'1__0_-99',1619446687,'x�M�Mr� ���	�Ӧ�|���I�1��#�n3�ܽ�]��@�\'�(��hT<\"ԠgU3��JkUJ���	GM�����w�h��ȆqïB{�#����~��o0�ޟ�R���3:���N�7G_�Z/i92�~o�\n���;�+�n�4̶2m��b�?,�3��e0���ҍ�nq����R��N5���h8�D���d��ǿ@\\��1�D�%�S\n����*�����ehO��\'�/SIP��dl����l�=N����_X[�/');
/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline_tags`
--

DROP TABLE IF EXISTS `cache_rootline_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline_tags`
--

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;
INSERT INTO `cache_rootline_tags` VALUES (1,'1__0_0','pageId_1'),(4,'2__0_0','pageId_2'),(5,'2__0_0','pageId_1'),(6,'3__0_0','pageId_3'),(7,'3__0_0','pageId_1'),(8,'1__0_-99','pageId_1');
/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_treelist`
--

DROP TABLE IF EXISTS `cache_treelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` int NOT NULL DEFAULT '0',
  `treelist` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tstamp` int NOT NULL DEFAULT '0',
  `expires` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_treelist`
--

LOCK TABLES `cache_treelist` WRITE;
/*!40000 ALTER TABLE `cache_treelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_treelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_groups` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tx_extbase_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lockToDomain` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subgroup` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TSconfig` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_groups`
--

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(190) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int unsigned NOT NULL DEFAULT '0',
  `ses_data` mediumblob,
  `ses_permanent` smallint unsigned NOT NULL DEFAULT '0',
  `ses_anonymous` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_sessions`
--

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `disable` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tx_extbase_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usergroup` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `name` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lockToDomain` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` blob,
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TSconfig` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `lastlogin` int unsigned NOT NULL DEFAULT '0',
  `is_online` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_users`
--

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `rowDescription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `editlock` smallint unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_source` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `perms_userid` int unsigned NOT NULL DEFAULT '0',
  `perms_groupid` int unsigned NOT NULL DEFAULT '0',
  `perms_user` smallint unsigned NOT NULL DEFAULT '0',
  `perms_group` smallint unsigned NOT NULL DEFAULT '0',
  `perms_everybody` smallint unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `doktype` int unsigned NOT NULL DEFAULT '0',
  `TSconfig` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_siteroot` smallint NOT NULL DEFAULT '0',
  `php_tree_stop` smallint NOT NULL DEFAULT '0',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortcut` int unsigned NOT NULL DEFAULT '0',
  `shortcut_mode` int unsigned NOT NULL DEFAULT '0',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `layout` int unsigned NOT NULL DEFAULT '0',
  `target` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `media` int unsigned NOT NULL DEFAULT '0',
  `lastUpdated` int unsigned NOT NULL DEFAULT '0',
  `keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `cache_timeout` int unsigned NOT NULL DEFAULT '0',
  `cache_tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newUntil` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `no_search` smallint unsigned NOT NULL DEFAULT '0',
  `SYS_LASTCHANGED` int unsigned NOT NULL DEFAULT '0',
  `abstract` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint NOT NULL DEFAULT '0',
  `content_from_pid` int unsigned NOT NULL DEFAULT '0',
  `mount_pid` int unsigned NOT NULL DEFAULT '0',
  `mount_pid_ol` smallint NOT NULL DEFAULT '0',
  `l18n_cfg` smallint NOT NULL DEFAULT '0',
  `fe_login_mode` smallint NOT NULL DEFAULT '0',
  `backend_layout` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `legacy_overlay_uid` int unsigned NOT NULL DEFAULT '0',
  `seo_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_index` smallint NOT NULL DEFAULT '0',
  `no_follow` smallint NOT NULL DEFAULT '0',
  `og_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `og_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `og_image` int unsigned NOT NULL DEFAULT '0',
  `twitter_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `twitter_image` int unsigned NOT NULL DEFAULT '0',
  `twitter_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `canonical_link` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT '0.5',
  `sitemap_changefreq` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categories` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `legacy_overlay` (`legacy_overlay_uid`),
  KEY `slug` (`slug`(127)),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,1616338513,1616338513,1,0,0,0,0,'0',0,NULL,0,0,0,0,NULL,0,NULL,0,0,0,0,0,0,0,1,1,31,31,1,'Home','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1616339412,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'','',0.5,'',0),(2,1,1616342090,1616342082,1,0,0,0,0,'',256,'',0,0,0,0,NULL,0,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,0,0,0,1,0,31,27,0,'Show timezone','/show-timezone',1,'',0,0,'',0,0,'',0,'',0,0,'',0,'',0,'',0,1616342122,'','',0,'','','',0,0,0,0,0,0,'','','',0,'',0,0,'','',0,'','',0,'summary','',0.5,'',0),(3,1,1616342394,1616342328,1,0,0,0,0,'',512,'',0,0,0,0,NULL,0,'a:50:{s:7:\"doktype\";N;s:5:\"title\";N;s:4:\"slug\";N;s:9:\"nav_title\";N;s:8:\"subtitle\";N;s:9:\"seo_title\";N;s:11:\"description\";N;s:8:\"no_index\";N;s:9:\"no_follow\";N;s:14:\"canonical_link\";N;s:18:\"sitemap_changefreq\";N;s:16:\"sitemap_priority\";N;s:8:\"og_title\";N;s:14:\"og_description\";N;s:8:\"og_image\";N;s:13:\"twitter_title\";N;s:19:\"twitter_description\";N;s:13:\"twitter_image\";N;s:12:\"twitter_card\";N;s:8:\"abstract\";N;s:8:\"keywords\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:11:\"lastUpdated\";N;s:6:\"layout\";N;s:8:\"newUntil\";N;s:14:\"backend_layout\";N;s:25:\"backend_layout_next_level\";N;s:16:\"content_from_pid\";N;s:6:\"target\";N;s:13:\"cache_timeout\";N;s:10:\"cache_tags\";N;s:11:\"is_siteroot\";N;s:9:\"no_search\";N;s:13:\"php_tree_stop\";N;s:6:\"module\";N;s:5:\"media\";N;s:17:\"tsconfig_includes\";N;s:8:\"TSconfig\";N;s:8:\"l18n_cfg\";N;s:6:\"hidden\";N;s:8:\"nav_hide\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:16:\"extendToSubpages\";N;s:8:\"fe_group\";N;s:13:\"fe_login_mode\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,0,0,0,1,0,31,27,0,'Select Timezone','/select-timezone',1,'',0,0,'',0,0,'',0,'',0,0,'',0,'',0,'',0,1616844197,'','',0,'','','',0,0,0,0,0,0,'','','',0,'',0,0,'','',0,'','',0,'summary','',0.5,'',0),(4,1,1616848078,1616847258,1,1,0,0,0,'',768,'',0,0,0,0,NULL,2,'a:50:{s:7:\"doktype\";N;s:5:\"title\";N;s:4:\"slug\";N;s:9:\"nav_title\";N;s:8:\"subtitle\";N;s:9:\"seo_title\";N;s:11:\"description\";N;s:8:\"no_index\";N;s:9:\"no_follow\";N;s:14:\"canonical_link\";N;s:18:\"sitemap_changefreq\";N;s:16:\"sitemap_priority\";N;s:8:\"og_title\";N;s:14:\"og_description\";N;s:8:\"og_image\";N;s:13:\"twitter_title\";N;s:19:\"twitter_description\";N;s:13:\"twitter_image\";N;s:12:\"twitter_card\";N;s:8:\"abstract\";N;s:8:\"keywords\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:11:\"lastUpdated\";N;s:6:\"layout\";N;s:8:\"newUntil\";N;s:14:\"backend_layout\";N;s:25:\"backend_layout_next_level\";N;s:16:\"content_from_pid\";N;s:6:\"target\";N;s:13:\"cache_timeout\";N;s:10:\"cache_tags\";N;s:11:\"is_siteroot\";N;s:9:\"no_search\";N;s:13:\"php_tree_stop\";N;s:6:\"module\";N;s:5:\"media\";N;s:17:\"tsconfig_includes\";N;s:8:\"TSconfig\";N;s:8:\"l18n_cfg\";N;s:6:\"hidden\";N;s:8:\"nav_hide\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:16:\"extendToSubpages\";N;s:8:\"fe_group\";N;s:13:\"fe_login_mode\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,0,0,0,1,0,31,27,0,'Timezone index','/timezone-index',1,'',0,0,'',0,0,'',0,'',0,0,'',0,'',0,'',0,1616847314,'','',0,'','','',0,0,0,0,0,0,'','','',0,'',0,0,'','',0,'','',0,'summary','',0.5,'',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int NOT NULL DEFAULT '0',
  `sc_group` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_be_shortcuts`
--

LOCK TABLES `sys_be_shortcuts` WRITE;
/*!40000 ALTER TABLE `sys_be_shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_be_shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent` int NOT NULL DEFAULT '0',
  `items` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int NOT NULL DEFAULT '0',
  `uid_foreign` int NOT NULL DEFAULT '0',
  `tablenames` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int NOT NULL DEFAULT '0',
  `sorting_foreign` int NOT NULL DEFAULT '0',
  KEY `uid_local_foreign` (`uid_local`,`uid_foreign`),
  KEY `uid_foreign_tablefield` (`uid_foreign`,`tablenames`(40),`fieldname`(3),`sorting_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category_record_mm`
--

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_collection`
--

DROP TABLE IF EXISTS `sys_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_collection` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `table_name` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `items` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_collection`
--

LOCK TABLES `sys_collection` WRITE;
/*!40000 ALTER TABLE `sys_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_collection_entries`
--

DROP TABLE IF EXISTS `sys_collection_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_collection_entries` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uid_local` int NOT NULL DEFAULT '0',
  `uid_foreign` int NOT NULL DEFAULT '0',
  `tablenames` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_collection_entries`
--

LOCK TABLES `sys_collection_entries` WRITE;
/*!40000 ALTER TABLE `sys_collection_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_collection_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `last_indexed` int NOT NULL DEFAULT '0',
  `missing` smallint NOT NULL DEFAULT '0',
  `storage` int NOT NULL DEFAULT '0',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metadata` int NOT NULL DEFAULT '0',
  `identifier` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `identifier_hash` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` bigint unsigned NOT NULL DEFAULT '0',
  `creation_date` int NOT NULL DEFAULT '0',
  `modification_date` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_collection` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `files` int NOT NULL DEFAULT '0',
  `storage` int NOT NULL DEFAULT '0',
  `folder` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `recursive` smallint NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_collection`
--

LOCK TABLES `sys_file_collection` WRITE;
/*!40000 ALTER TABLE `sys_file_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_metadata` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `file` int NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `width` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `alternative` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `categories` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_processedfile` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `tstamp` int NOT NULL DEFAULT '0',
  `crdate` int NOT NULL DEFAULT '0',
  `storage` int NOT NULL DEFAULT '0',
  `original` int NOT NULL DEFAULT '0',
  `identifier` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `processing_url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `configuration` blob,
  `configurationsha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int DEFAULT '0',
  `height` int DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_processedfile`
--

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_reference` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `uid_local` int NOT NULL DEFAULT '0',
  `uid_foreign` int NOT NULL DEFAULT '0',
  `tablenames` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int NOT NULL DEFAULT '0',
  `table_local` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `alternative` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `link` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crop` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autoplay` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_storage` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `driver` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `configuration` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_default` smallint NOT NULL DEFAULT '0',
  `is_browsable` smallint NOT NULL DEFAULT '0',
  `is_public` smallint NOT NULL DEFAULT '0',
  `is_writable` smallint NOT NULL DEFAULT '0',
  `is_online` smallint NOT NULL DEFAULT '1',
  `auto_extract_metadata` smallint NOT NULL DEFAULT '1',
  `processingfolder` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES (1,0,1616338547,1616338547,0,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin/ (auto-created)','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_filemounts` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base` int unsigned NOT NULL DEFAULT '0',
  `read_only` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_filemounts`
--

LOCK TABLES `sys_filemounts` WRITE;
/*!40000 ALTER TABLE `sys_filemounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filemounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_history` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `actiontype` smallint NOT NULL DEFAULT '0',
  `usertype` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BE',
  `userid` int unsigned DEFAULT NULL,
  `originaluserid` int unsigned DEFAULT NULL,
  `recuid` int NOT NULL DEFAULT '0',
  `tablename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `history_data` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `workspace` int DEFAULT '0',
  `correlation_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_history`
--

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;
INSERT INTO `sys_history` VALUES (1,1616338543,1,'BE',1,0,1,'tt_content','{\"uid\":1,\"rowDescription\":\"\",\"pid\":1,\"tstamp\":1616338543,\"crdate\":1616338543,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"CType\":\"header\",\"header\":\"Acceptance test first header\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":null,\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"selected_categories\":null,\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0}',0,'0400$30beca1b9f83480ab930652728492404:7fa2c035f26826fe83eeecaaeddc4d40'),(2,1616338635,2,'BE',1,0,1,'be_users','{\"oldRecord\":{\"password\":\"$argon2i$v=19$m=65536,t=16,p=1$S251bkU3U0dtQ1JidnRMLg$fM79zoQRiW7fTbSjXA5t4m7k\\/8nPeX2f8bHdw7mZegE\"},\"newRecord\":{\"password\":\"$2y$12$YaRgnj4Oc1lVVn2MrzJQXOE\\/6bWpXCyp4Ivx97qNdBporJhG4vK3W\"}}',0,'0400$439a61ef34733cf5a59f6d1e184b58ee:084907bc914ff27cf2301aec50eb66b2'),(3,1616339170,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"config\":\"page = PAGE\\npage.10 = TEXT\\npage.10.value (\\n   <div style=\\\"width: 800px; margin: 15% auto;\\\">\\n      <div style=\\\"width: 300px;\\\">\\n        <svg xmlns=\\\"http:\\/\\/www.w3.org\\/2000\\/svg\\\" viewBox=\\\"0 0 150 42\\\"><path d=\\\"M60.2 14.4v27h-3.8v-27h-6.7v-3.3h17.1v3.3h-6.6zm20.2 12.9v14h-3.9v-14l-7.7-16.2h4.1l5.7 12.2 5.7-12.2h3.9l-7.8 16.2zm19.5 2.6h-3.6v11.4h-3.8V11.1s3.7-.3 7.3-.3c6.6 0 8.5 4.1 8.5 9.4 0 6.5-2.3 9.7-8.4 9.7m.4-16c-2.4 0-4.1.3-4.1.3v12.6h4.1c2.4 0 4.1-1.6 4.1-6.3 0-4.4-1-6.6-4.1-6.6m21.5 27.7c-7.1 0-9-5.2-9-15.8 0-10.2 1.9-15.1 9-15.1s9 4.9 9 15.1c.1 10.6-1.8 15.8-9 15.8m0-27.7c-3.9 0-5.2 2.6-5.2 12.1 0 9.3 1.3 12.4 5.2 12.4 3.9 0 5.2-3.1 5.2-12.4 0-9.4-1.3-12.1-5.2-12.1m19.9 27.7c-2.1 0-5.3-.6-5.7-.7v-3.1c1 .2 3.7.7 5.6.7 2.2 0 3.6-1.9 3.6-5.2 0-3.9-.6-6-3.7-6H138V24h3.1c3.5 0 3.7-3.6 3.7-5.3 0-3.4-1.1-4.8-3.2-4.8-1.9 0-4.1.5-5.3.7v-3.2c.5-.1 3-.7 5.2-.7 4.4 0 7 1.9 7 8.3 0 2.9-1 5.5-3.3 6.3 2.6.2 3.8 3.1 3.8 7.3 0 6.6-2.5 9-7.3 9\\\"\\/><path fill=\\\"#FF8700\\\" d=\\\"M31.7 28.8c-.6.2-1.1.2-1.7.2-5.2 0-12.9-18.2-12.9-24.3 0-2.2.5-3 1.3-3.6C12 1.9 4.3 4.2 1.9 7.2 1.3 8 1 9.1 1 10.6c0 9.5 10.1 31 17.3 31 3.3 0 8.8-5.4 13.4-12.8M28.4.5c6.6 0 13.2 1.1 13.2 4.8 0 7.6-4.8 16.7-7.2 16.7-4.4 0-9.9-12.1-9.9-18.2C24.5 1 25.6.5 28.4.5\\\"\\/><\\/svg>\\n      <\\/div>\\n      <h4 style=\\\"font-family: sans-serif;\\\">Welcome to a default website made with <a href=\\\"https:\\/\\/typo3.org\\\">TYPO3<\\/a><\\/h4>\\n   <\\/div>\\n)\\npage.100 = CONTENT\\npage.100 {\\n    table = tt_content\\n    select {\\n        orderBy = sorting\\n        where = {#colPos}=0\\n    }\\n}\\n\",\"description\":\"This is an Empty Site Package TypoScript template.\\n\\nFor each website you need a TypoScript template on the main page of your website (on the top level). For better maintenance all TypoScript should be extracted into external files via @import \'EXT:site_myproject\\/Configuration\\/TypoScript\\/setup.typoscript\'\"},\"newRecord\":{\"config\":\"page = PAGE\\r\\npage.100 = CONTENT\\r\\npage.100 {\\r\\n    table = tt_content\\r\\n    select {\\r\\n        orderBy = sorting\\r\\n        where = {#colPos}=0\\r\\n    }\\r\\n}\\r\\n\",\"description\":\"This is an Empty Site Package TypoScript template.\\r\\n\\r\\nFor each website you need a TypoScript template on the main page of your website (on the top level). For better maintenance all TypoScript should be extracted into external files via @import \'EXT:site_myproject\\/Configuration\\/TypoScript\\/setup.typoscript\'\"}}',0,'0400$0755f14fa8b106538e92df571dd873f2:35af6288617af54964e77af08c30949a'),(4,1616339191,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"include_static_file\":\"EXT:fluid_styled_content\\/Configuration\\/TypoScript\\/,EXT:fluid_styled_content\\/Configuration\\/TypoScript\\/Styling\\/\"},\"newRecord\":{\"include_static_file\":\"EXT:fluid_styled_content\\/Configuration\\/TypoScript\\/,EXT:fluid_styled_content\\/Configuration\\/TypoScript\\/Styling\\/,EXT:timezones\\/Configuration\\/TypoScript\"}}',0,'0400$5f51f2a7c8dfd99839ac315408546fe7:35af6288617af54964e77af08c30949a'),(5,1616339210,1,'BE',1,0,2,'tt_content','{\"uid\":2,\"rowDescription\":\"\",\"pid\":1,\"tstamp\":1616339210,\"crdate\":1616339210,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":512,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"CType\":\"list\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":null,\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"selected_categories\":null,\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0}',0,'0400$61f6786e6f1164aac3aa9b0736ed3543:01dbc21fdb1263685b9147b3b1596ea8'),(6,1616339215,2,'BE',1,0,2,'tt_content','{\"oldRecord\":{\"list_type\":\"\",\"l18n_diffsource\":\"\"},\"newRecord\":{\"list_type\":\"timezones_pi1\",\"l18n_diffsource\":\"a:25:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:5:\\\"pages\\\";N;s:9:\\\"recursive\\\";N;s:6:\\\"layout\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$a44aebc72919ca096fd93f559ef4a711:01dbc21fdb1263685b9147b3b1596ea8'),(7,1616339223,2,'BE',1,0,2,'tt_content','{\"oldRecord\":{\"pi_flexform\":null,\"l18n_diffsource\":\"a:25:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:5:\\\"pages\\\";N;s:9:\\\"recursive\\\";N;s:6:\\\"layout\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"switchableControllerActions\\\">\\n                    <value index=\\\"vDEF\\\">Timezones-&gt;index;Timezones-&gt;show;Timezones-&gt;select;Timezones-&gt;tzset<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n        <sheet index=\\\"sPaths\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"view.templateRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.partialRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.layoutRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"a:23:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:11:\\\"pi_flexform\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$e653f1bcae04e73945d724697f101e24:01dbc21fdb1263685b9147b3b1596ea8'),(8,1616339412,2,'BE',1,0,2,'tt_content','{\"oldRecord\":{\"header\":\"\"},\"newRecord\":{\"header\":\"TimezonesIndex\"}}',0,'0400$7974085922b927e45e997b2beb1a7116:01dbc21fdb1263685b9147b3b1596ea8'),(9,1616341965,1,'BE',1,0,3,'tt_content','{\"uid\":3,\"rowDescription\":\"\",\"pid\":1,\"tstamp\":1616341965,\"crdate\":1616341965,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":768,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"CType\":\"list\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":\"\",\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"timezones_pi1\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":null,\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"selected_categories\":null,\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0}',0,'0400$fff731c9663931df7693424da29a1a36:b92300cfb5d1d3645c9cb212a7f56c1f'),(10,1616342027,4,'BE',1,0,3,'tt_content',NULL,0,'0400$289cf90bd1682b42a3868383f21d71a5:b92300cfb5d1d3645c9cb212a7f56c1f'),(11,1616342082,1,'BE',1,0,2,'pages','{\"uid\":2,\"pid\":1,\"tstamp\":1616342082,\"crdate\":1616342082,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"rowDescription\":\"\",\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Show timezone\",\"slug\":\"\\/show-timezone\",\"doktype\":1,\"TSconfig\":\"\",\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":\"\",\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":\"\",\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":\"\",\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":\"\",\"legacy_overlay_uid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":\"\",\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":\"\",\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"categories\":0}',0,'0400$3d8ca6c4ab5b10404a933444bc809c7a:f11830df10b4b0bca2db34810c2241b3'),(12,1616342090,2,'BE',1,0,2,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"a:1:{s:6:\\\"hidden\\\";N;}\"}}',0,'0400$efe2e2394c88511ce78405a079f5ed13:f11830df10b4b0bca2db34810c2241b3'),(13,1616342112,1,'BE',1,0,4,'tt_content','{\"uid\":4,\"rowDescription\":\"\",\"pid\":2,\"tstamp\":1616342112,\"crdate\":1616342112,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"CType\":\"list\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":\"\",\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":null,\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"selected_categories\":null,\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0}',0,'0400$49715c509962d13d8a7721a0e8b2c6c3:4d391f5ef79b8d5d10dffa8a07ca167d'),(14,1616342118,2,'BE',1,0,4,'tt_content','{\"oldRecord\":{\"list_type\":\"\",\"l18n_diffsource\":\"\"},\"newRecord\":{\"list_type\":\"timezones_pi1\",\"l18n_diffsource\":\"a:25:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:5:\\\"pages\\\";N;s:9:\\\"recursive\\\";N;s:6:\\\"layout\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$983d3d5ffd68e8de5ec3e37135c9d4c6:4d391f5ef79b8d5d10dffa8a07ca167d'),(15,1616342122,2,'BE',1,0,4,'tt_content','{\"oldRecord\":{\"pi_flexform\":null,\"l18n_diffsource\":\"a:25:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:5:\\\"pages\\\";N;s:9:\\\"recursive\\\";N;s:6:\\\"layout\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"switchableControllerActions\\\">\\n                    <value index=\\\"vDEF\\\">Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;select;Timezones-&gt;tzset<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n        <sheet index=\\\"sPaths\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"view.templateRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.partialRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.layoutRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"a:23:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:11:\\\"pi_flexform\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$d9f5b0680d02b81ee41d07abb94db340:4d391f5ef79b8d5d10dffa8a07ca167d'),(16,1616342328,1,'BE',1,0,3,'pages','{\"uid\":3,\"pid\":1,\"tstamp\":1616342328,\"crdate\":1616342328,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":512,\"rowDescription\":\"\",\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Set Timezone\",\"slug\":\"\\/set-timezone\",\"doktype\":1,\"TSconfig\":\"\",\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":\"\",\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":\"\",\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":\"\",\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":\"\",\"legacy_overlay_uid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":\"\",\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":\"\",\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"categories\":0}',0,'0400$68c6b96bfaf2de2e271d8850af7a35bd:fe15eeb7d49e64e2cea91ab53fcf0db1'),(17,1616342353,1,'BE',1,0,5,'tt_content','{\"uid\":5,\"rowDescription\":\"\",\"pid\":3,\"tstamp\":1616342353,\"crdate\":1616342353,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"CType\":\"list\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":\"\",\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":null,\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"selected_categories\":null,\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0}',0,'0400$1c5a153d888a9cc0855202d2b67934c4:c7626fc9bcba6f70beb6ebc085a400db'),(18,1616342358,2,'BE',1,0,5,'tt_content','{\"oldRecord\":{\"list_type\":\"\",\"l18n_diffsource\":\"\"},\"newRecord\":{\"list_type\":\"timezones_pi1\",\"l18n_diffsource\":\"a:25:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:5:\\\"pages\\\";N;s:9:\\\"recursive\\\";N;s:6:\\\"layout\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$89ec877f88b2a808ad716b0fdcd340f5:c7626fc9bcba6f70beb6ebc085a400db'),(19,1616342363,2,'BE',1,0,5,'tt_content','{\"oldRecord\":{\"pi_flexform\":null,\"l18n_diffsource\":\"a:25:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:5:\\\"pages\\\";N;s:9:\\\"recursive\\\";N;s:6:\\\"layout\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"switchableControllerActions\\\">\\n                    <value index=\\\"vDEF\\\">Timezones-&gt;select;Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;tzset<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n        <sheet index=\\\"sPaths\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"view.templateRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.partialRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.layoutRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"a:23:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:11:\\\"pi_flexform\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$fdbb00655dfb0c58ebe6d8f1919ee5a3:c7626fc9bcba6f70beb6ebc085a400db'),(20,1616342376,2,'BE',1,0,3,'pages','{\"oldRecord\":{\"title\":\"Set Timezone\",\"l10n_diffsource\":\"\"},\"newRecord\":{\"title\":\"Select Timezone\",\"l10n_diffsource\":\"a:50:{s:7:\\\"doktype\\\";N;s:5:\\\"title\\\";N;s:4:\\\"slug\\\";N;s:9:\\\"nav_title\\\";N;s:8:\\\"subtitle\\\";N;s:9:\\\"seo_title\\\";N;s:11:\\\"description\\\";N;s:8:\\\"no_index\\\";N;s:9:\\\"no_follow\\\";N;s:14:\\\"canonical_link\\\";N;s:18:\\\"sitemap_changefreq\\\";N;s:16:\\\"sitemap_priority\\\";N;s:8:\\\"og_title\\\";N;s:14:\\\"og_description\\\";N;s:8:\\\"og_image\\\";N;s:13:\\\"twitter_title\\\";N;s:19:\\\"twitter_description\\\";N;s:13:\\\"twitter_image\\\";N;s:12:\\\"twitter_card\\\";N;s:8:\\\"abstract\\\";N;s:8:\\\"keywords\\\";N;s:6:\\\"author\\\";N;s:12:\\\"author_email\\\";N;s:11:\\\"lastUpdated\\\";N;s:6:\\\"layout\\\";N;s:8:\\\"newUntil\\\";N;s:14:\\\"backend_layout\\\";N;s:25:\\\"backend_layout_next_level\\\";N;s:16:\\\"content_from_pid\\\";N;s:6:\\\"target\\\";N;s:13:\\\"cache_timeout\\\";N;s:10:\\\"cache_tags\\\";N;s:11:\\\"is_siteroot\\\";N;s:9:\\\"no_search\\\";N;s:13:\\\"php_tree_stop\\\";N;s:6:\\\"module\\\";N;s:5:\\\"media\\\";N;s:17:\\\"tsconfig_includes\\\";N;s:8:\\\"TSconfig\\\";N;s:8:\\\"l18n_cfg\\\";N;s:6:\\\"hidden\\\";N;s:8:\\\"nav_hide\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:16:\\\"extendToSubpages\\\";N;s:8:\\\"fe_group\\\";N;s:13:\\\"fe_login_mode\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$00866189a087cd1151b88abb5a202b97:fe15eeb7d49e64e2cea91ab53fcf0db1'),(21,1616342394,2,'BE',1,0,3,'pages','{\"oldRecord\":{\"slug\":\"\\/set-timezone\"},\"newRecord\":{\"slug\":\"\\/select-timezone\"}}',0,'0400$9e1be6a24cc1a36183e7b004cd4f2f14:fe15eeb7d49e64e2cea91ab53fcf0db1'),(22,1616844179,1,'BE',1,0,6,'tt_content','{\"uid\":6,\"rowDescription\":\"\",\"pid\":3,\"tstamp\":1616844179,\"crdate\":1616844179,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":512,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"CType\":\"list\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":\"\",\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"timezones_pi1\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":null,\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"selected_categories\":null,\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0}',0,'0400$d12717d71b72d80cbf778ed88bc9d6af:c0db6803ab1ec5f70c36e2a72187867b'),(23,1616844197,2,'BE',1,0,6,'tt_content','{\"oldRecord\":{\"pi_flexform\":null,\"l18n_diffsource\":\"\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"switchableControllerActions\\\">\\n                    <value index=\\\"vDEF\\\">Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;select;Timezones-&gt;tzset<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n        <sheet index=\\\"sPaths\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"view.templateRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.partialRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.layoutRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"a:23:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:11:\\\"pi_flexform\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$6c74967f86afc6383818f101f45a296e:c0db6803ab1ec5f70c36e2a72187867b'),(24,1616847258,1,'BE',1,0,4,'pages','{\"uid\":4,\"pid\":1,\"tstamp\":1616847258,\"crdate\":1616847258,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":768,\"rowDescription\":\"\",\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":2,\"l10n_diffsource\":\"a:1:{s:6:\\\"hidden\\\";N;}\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Show timezone (copy 1)\",\"slug\":\"\\/show-timezone-1\",\"doktype\":1,\"TSconfig\":\"\",\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":\"\",\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":\"\",\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":\"\",\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":\"\",\"legacy_overlay_uid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":\"\",\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":\"\",\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"categories\":0}',0,'0400$999026fb7248cf1f96873a07fcf60564:412add0b3eb6ec8f1cb6710aea92e21e'),(25,1616847258,1,'BE',1,0,7,'tt_content','{\"uid\":7,\"rowDescription\":\"\",\"pid\":4,\"tstamp\":1616847258,\"crdate\":1616847258,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":4,\"l18n_diffsource\":\"a:23:{s:5:\\\"CType\\\";N;s:6:\\\"colPos\\\";N;s:6:\\\"header\\\";N;s:13:\\\"header_layout\\\";N;s:15:\\\"header_position\\\";N;s:4:\\\"date\\\";N;s:11:\\\"header_link\\\";N;s:9:\\\"subheader\\\";N;s:9:\\\"list_type\\\";N;s:11:\\\"pi_flexform\\\";N;s:11:\\\"frame_class\\\";N;s:18:\\\"space_before_class\\\";N;s:17:\\\"space_after_class\\\";N;s:12:\\\"sectionIndex\\\";N;s:9:\\\"linkToTop\\\";N;s:16:\\\"sys_language_uid\\\";N;s:6:\\\"hidden\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:8:\\\"fe_group\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"t3ver_count\":0,\"t3ver_tstamp\":0,\"t3ver_move_id\":0,\"CType\":\"list\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":\"\",\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":\"\",\"pages\":\"\",\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"timezones_pi1\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":\"\",\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"switchableControllerActions\\\">\\n                    <value index=\\\"vDEF\\\">Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;select;Timezones-&gt;tzset<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n        <sheet index=\\\"sPaths\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"view.templateRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.partialRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.layoutRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"selected_categories\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0}',0,'0400$6440a9e19e1f637ade7e13ffa59509db:ea41b626baac59a1fe0716bc344af5d9'),(26,1616847274,2,'BE',1,0,4,'pages','{\"oldRecord\":{\"title\":\"Show timezone (copy 1)\",\"l10n_diffsource\":\"a:1:{s:6:\\\"hidden\\\";N;}\"},\"newRecord\":{\"title\":\"Index timezone\",\"l10n_diffsource\":\"a:50:{s:7:\\\"doktype\\\";N;s:5:\\\"title\\\";N;s:4:\\\"slug\\\";N;s:9:\\\"nav_title\\\";N;s:8:\\\"subtitle\\\";N;s:9:\\\"seo_title\\\";N;s:11:\\\"description\\\";N;s:8:\\\"no_index\\\";N;s:9:\\\"no_follow\\\";N;s:14:\\\"canonical_link\\\";N;s:18:\\\"sitemap_changefreq\\\";N;s:16:\\\"sitemap_priority\\\";N;s:8:\\\"og_title\\\";N;s:14:\\\"og_description\\\";N;s:8:\\\"og_image\\\";N;s:13:\\\"twitter_title\\\";N;s:19:\\\"twitter_description\\\";N;s:13:\\\"twitter_image\\\";N;s:12:\\\"twitter_card\\\";N;s:8:\\\"abstract\\\";N;s:8:\\\"keywords\\\";N;s:6:\\\"author\\\";N;s:12:\\\"author_email\\\";N;s:11:\\\"lastUpdated\\\";N;s:6:\\\"layout\\\";N;s:8:\\\"newUntil\\\";N;s:14:\\\"backend_layout\\\";N;s:25:\\\"backend_layout_next_level\\\";N;s:16:\\\"content_from_pid\\\";N;s:6:\\\"target\\\";N;s:13:\\\"cache_timeout\\\";N;s:10:\\\"cache_tags\\\";N;s:11:\\\"is_siteroot\\\";N;s:9:\\\"no_search\\\";N;s:13:\\\"php_tree_stop\\\";N;s:6:\\\"module\\\";N;s:5:\\\"media\\\";N;s:17:\\\"tsconfig_includes\\\";N;s:8:\\\"TSconfig\\\";N;s:8:\\\"l18n_cfg\\\";N;s:6:\\\"hidden\\\";N;s:8:\\\"nav_hide\\\";N;s:9:\\\"starttime\\\";N;s:7:\\\"endtime\\\";N;s:16:\\\"extendToSubpages\\\";N;s:8:\\\"fe_group\\\";N;s:13:\\\"fe_login_mode\\\";N;s:8:\\\"editlock\\\";N;s:10:\\\"categories\\\";N;s:14:\\\"rowDescription\\\";N;}\"}}',0,'0400$d72ba601c066528725a4367eed24d827:412add0b3eb6ec8f1cb6710aea92e21e'),(27,1616847280,2,'BE',1,0,4,'pages','{\"oldRecord\":{\"slug\":\"\\/show-timezone-1\"},\"newRecord\":{\"slug\":\"\\/index-timezone\"}}',0,'0400$2796f08e11c3f37fc4268bcf795fa080:412add0b3eb6ec8f1cb6710aea92e21e'),(28,1616847295,2,'BE',1,0,4,'pages','{\"oldRecord\":{\"title\":\"Index timezone\",\"slug\":\"\\/index-timezone\"},\"newRecord\":{\"title\":\"Timezone index\",\"slug\":\"\\/timezone-index\"}}',0,'0400$7e298011170374b347e1ea407c5952bf:412add0b3eb6ec8f1cb6710aea92e21e'),(29,1616847303,2,'BE',1,0,4,'pages','{\"oldRecord\":{\"hidden\":1},\"newRecord\":{\"hidden\":\"0\"}}',0,'0400$152945a9e292d45cfa5cc8127acebab6:412add0b3eb6ec8f1cb6710aea92e21e'),(30,1616847314,2,'BE',1,0,7,'tt_content','{\"oldRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"switchableControllerActions\\\">\\n                    <value index=\\\"vDEF\\\">Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;select;Timezones-&gt;tzset<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n        <sheet index=\\\"sPaths\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"view.templateRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.partialRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.layoutRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"switchableControllerActions\\\">\\n                    <value index=\\\"vDEF\\\">Timezones-&gt;index;Timezones-&gt;show;Timezones-&gt;select;Timezones-&gt;tzset<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n        <sheet index=\\\"sPaths\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"view.templateRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.partialRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n                <field index=\\\"view.layoutRootPath\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\"}}',0,'0400$cf84c6686543e25f72eef6641d61a204:ea41b626baac59a1fe0716bc344af5d9'),(31,1616848078,4,'BE',1,0,7,'tt_content',NULL,0,'0400$6fa68dcd63086405e85296d65069b5bd:ea41b626baac59a1fe0716bc344af5d9'),(32,1616848078,4,'BE',1,0,4,'pages',NULL,0,'0400$6fa68dcd63086405e85296d65069b5bd:412add0b3eb6ec8f1cb6710aea92e21e');
/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_language`
--

DROP TABLE IF EXISTS `sys_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_language` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_isocode` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_language`
--

LOCK TABLES `sys_language` WRITE;
/*!40000 ALTER TABLE `sys_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lockedrecords` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `record_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int NOT NULL DEFAULT '0',
  `record_pid` int NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lockedrecords`
--

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `userid` int unsigned NOT NULL DEFAULT '0',
  `action` smallint unsigned NOT NULL DEFAULT '0',
  `recuid` int unsigned NOT NULL DEFAULT '0',
  `tablename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recpid` int NOT NULL DEFAULT '0',
  `error` smallint unsigned NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` smallint unsigned NOT NULL DEFAULT '0',
  `details_nr` smallint NOT NULL DEFAULT '0',
  `IP` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `event_pid` int NOT NULL DEFAULT '-1',
  `workspace` int NOT NULL DEFAULT '0',
  `NEWid` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT '0',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` smallint unsigned NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `errorcount` (`tstamp`,`error`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,0,1616338522,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(2,0,1616338543,1,1,1,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:28:\"Acceptance test first header\";i:1;s:12:\"tt_content:1\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW60575e62837bd178056519','',0,'',0,NULL,NULL),(3,0,1616338635,1,1,0,'',0,0,'Personal settings changed',254,1,'172.18.0.6','a:0:{}',-1,0,'','',0,'',0,NULL,NULL),(4,0,1616338635,1,2,1,'be_users',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:5:\"admin\";i:1;s:10:\"be_users:1\";s:7:\"history\";s:1:\"2\";}',0,0,'','',0,'',0,NULL,NULL),(5,0,1616338717,1,1,0,'',0,0,'User %s has cleared the cache (cacheCmd=%s)',3,0,'172.18.0.6','a:2:{i:0;s:5:\"admin\";i:1;s:3:\"all\";}',-1,0,'','',0,'',0,NULL,NULL),(6,0,1616338804,1,2,0,'',0,0,'User %s logged out from TYPO3 Backend',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,0,'','',0,'',0,NULL,NULL),(7,0,1616338809,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(8,0,1616338818,1,2,0,'',0,0,'User %s logged out from TYPO3 Backend',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,0,'','',0,'',0,NULL,NULL),(9,0,1616338905,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(10,0,1616339109,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(11,0,1616339170,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:25:\"Main TypoScript Rendering\";i:1;s:14:\"sys_template:1\";s:7:\"history\";s:1:\"3\";}',1,0,'','',0,'',0,NULL,NULL),(12,0,1616339191,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:25:\"Main TypoScript Rendering\";i:1;s:14:\"sys_template:1\";s:7:\"history\";s:1:\"4\";}',1,0,'','',0,'',0,NULL,NULL),(13,0,1616339210,1,1,2,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:2\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW6057610452fc5635579502','',0,'',0,NULL,NULL),(14,0,1616339215,1,2,2,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:2\";s:7:\"history\";s:1:\"6\";}',1,0,'','',0,'',0,NULL,NULL),(15,0,1616339223,1,2,2,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:2\";s:7:\"history\";s:1:\"7\";}',1,0,'','',0,'',0,NULL,NULL),(16,0,1616339412,1,2,2,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:14:\"TimezonesIndex\";i:1;s:12:\"tt_content:2\";s:7:\"history\";s:1:\"8\";}',1,0,'','',0,'',0,NULL,NULL),(17,0,1616341965,1,1,3,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:3\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW60576bc805b81398725747','',0,'',0,NULL,NULL),(18,0,1616342027,1,3,3,'tt_content',0,0,'Record \'%s\' (%s) was deleted from page \'%s\' (%s)',1,0,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:3\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'','',0,'',0,NULL,NULL),(19,0,1616342082,1,1,2,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:13:\"Show timezone\";i:1;s:7:\"pages:2\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW60576c2b17f59197769677','',0,'',0,NULL,NULL),(20,0,1616342090,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:13:\"Show timezone\";i:1;s:7:\"pages:2\";s:7:\"history\";s:2:\"12\";}',2,0,'','',0,'',0,NULL,NULL),(21,0,1616342112,1,1,4,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:4\";i:2;s:13:\"Show timezone\";i:3;i:2;}',2,0,'NEW60576c5b33289787642364','',0,'',0,NULL,NULL),(22,0,1616342118,1,2,4,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:4\";s:7:\"history\";s:2:\"14\";}',2,0,'','',0,'',0,NULL,NULL),(23,0,1616342122,1,2,4,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:4\";s:7:\"history\";s:2:\"15\";}',2,0,'','',0,'',0,NULL,NULL),(24,0,1616342328,1,1,3,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:12:\"Set Timezone\";i:1;s:7:\"pages:3\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW60576d27c9334920623108','',0,'',0,NULL,NULL),(25,0,1616342353,1,1,5,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:5\";i:2;s:12:\"Set Timezone\";i:3;i:3;}',3,0,'NEW60576d4cb7207598517361','',0,'',0,NULL,NULL),(26,0,1616342358,1,2,5,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:5\";s:7:\"history\";s:2:\"18\";}',3,0,'','',0,'',0,NULL,NULL),(27,0,1616342363,1,2,5,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:5\";s:7:\"history\";s:2:\"19\";}',3,0,'','',0,'',0,NULL,NULL),(28,0,1616342376,1,2,3,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:15:\"Select Timezone\";i:1;s:7:\"pages:3\";s:7:\"history\";s:2:\"20\";}',3,0,'','',0,'',0,NULL,NULL),(29,0,1616342394,1,2,3,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:15:\"Select Timezone\";i:1;s:7:\"pages:3\";s:7:\"history\";s:2:\"21\";}',3,0,'','',0,'',0,NULL,NULL),(30,0,1616842255,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(31,0,1616844179,1,1,6,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:6\";i:2;s:15:\"Select Timezone\";i:3;i:3;}',3,0,'NEW605f158e3d4a9083749869','',0,'',0,NULL,NULL),(32,0,1616844197,1,2,6,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:6\";s:7:\"history\";s:2:\"23\";}',3,0,'','',0,'',0,NULL,NULL),(33,0,1616847258,1,1,4,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:22:\"Show timezone (copy 1)\";i:1;s:7:\"pages:4\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW605f219b01cb7187927628','',0,'',0,NULL,NULL),(34,0,1616847258,1,1,7,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:7\";i:2;s:22:\"Show timezone (copy 1)\";i:3;i:4;}',4,0,'NEW605f219b2785d716587180','',0,'',0,NULL,NULL),(35,0,1616847274,1,2,4,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:14:\"Index timezone\";i:1;s:7:\"pages:4\";s:7:\"history\";s:2:\"26\";}',4,0,'','',0,'',0,NULL,NULL),(36,0,1616847280,1,2,4,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:14:\"Index timezone\";i:1;s:7:\"pages:4\";s:7:\"history\";s:2:\"27\";}',4,0,'','',0,'',0,NULL,NULL),(37,0,1616847295,1,2,4,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:14:\"Timezone index\";i:1;s:7:\"pages:4\";s:7:\"history\";s:2:\"28\";}',4,0,'','',0,'',0,NULL,NULL),(38,0,1616847303,1,2,4,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:14:\"Timezone index\";i:1;s:7:\"pages:4\";s:7:\"history\";s:2:\"29\";}',4,0,'','',0,'',0,NULL,NULL),(39,0,1616847314,1,2,7,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:7\";s:7:\"history\";s:2:\"30\";}',4,0,'','',0,'',0,NULL,NULL),(40,0,1616847942,1,1,0,'',0,0,'User %s has cleared the cache (cacheCmd=%s)',3,0,'172.18.0.6','a:2:{i:0;s:5:\"admin\";i:1;s:3:\"all\";}',-1,0,'','',0,'',0,NULL,NULL),(41,0,1616848078,1,3,7,'tt_content',0,0,'Record \'%s\' (%s) was deleted from page \'%s\' (%s)',1,0,'172.18.0.6','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:7\";i:2;s:14:\"Timezone index\";i:3;i:4;}',4,0,'','',0,'',0,NULL,NULL),(42,0,1616848078,1,3,4,'pages',0,0,'Record \'%s\' (%s) was deleted from page \'%s\' (%s)',1,0,'172.18.0.6','a:4:{i:0;s:14:\"Timezone index\";i:1;s:7:\"pages:4\";i:2;s:4:\"Home\";i:3;i:1;}',4,0,'','',0,'',0,NULL,NULL),(43,0,1616854692,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(44,0,0,0,0,0,'',0,0,NULL,0,0,'',NULL,-1,0,'','6f96bde7a4660',1616854698.5252,'TYPO3.CMS.Core.Resource.ResourceStorage',3,'Failed initializing storage [1] \"fileadmin/ (auto-created)\", error: Base path \"/var/www/html/.build/web/fileadmin/\" does not exist or is no directory.','');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_news` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_news`
--

LOCK TABLES `sys_news` WRITE;
/*!40000 ALTER TABLE `sys_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recuid` int NOT NULL DEFAULT '0',
  `field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int NOT NULL DEFAULT '0',
  `deleted` smallint NOT NULL DEFAULT '0',
  `workspace` int NOT NULL DEFAULT '0',
  `ref_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int NOT NULL DEFAULT '0',
  `ref_string` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(100),`recuid`),
  KEY `lookup_uid` (`ref_table`(100),`ref_uid`),
  KEY `lookup_string` (`ref_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_refindex`
--

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registry` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_registry`
--

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;
INSERT INTO `sys_registry` VALUES (1,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Typo3DbExtractionUpdate','i:1;'),(2,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FuncExtractionUpdate','i:1;'),(3,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigrateUrlTypesInPagesUpdate','i:1;'),(4,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RedirectExtractionUpdate','i:1;'),(5,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserStartModuleUpdate','i:1;'),(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigratePagesLanguageOverlayUpdate','i:1;'),(7,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigratePagesLanguageOverlayBeGroupsAccessRights','i:1;'),(8,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendLayoutIconUpdateWizard','i:1;'),(9,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RedirectsExtensionUpdate','i:1;'),(10,'installUpdate','TYPO3\\CMS\\Install\\Updates\\AdminPanelInstall','i:1;'),(11,'installUpdate','TYPO3\\CMS\\Install\\Updates\\PopulatePageSlugs','i:1;'),(12,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Argon2iPasswordHashes','i:1;'),(13,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserConfigurationUpdate','i:1;'),(14,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RsaauthExtractionUpdate','i:1;'),(15,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FeeditExtractionUpdate','i:1;'),(16,'installUpdate','TYPO3\\CMS\\Install\\Updates\\TaskcenterExtractionUpdate','i:1;'),(17,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysActionExtractionUpdate','i:1;'),(18,'installUpdateRows','rowUpdatersDone','a:1:{i:0;s:69:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceVersionRecordsMigration\";}'),(21,'core','formProtectionSessionToken:1','s:64:\"da5c1c87e92fb8d6818dfc28ed00096196a5584c8a3071fda6edf1a98d815c91\";');
/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_template` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitetitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `root` smallint unsigned NOT NULL DEFAULT '0',
  `clear` smallint unsigned NOT NULL DEFAULT '0',
  `include_static_file` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `constants` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `config` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `basedOn` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `includeStaticAfterBasedOn` smallint unsigned NOT NULL DEFAULT '0',
  `static_file_mode` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES (1,1,1616339191,1616338513,1,0,0,0,0,0,'This is an Empty Site Package TypoScript template.\r\n\r\nFor each website you need a TypoScript template on the main page of your website (on the top level). For better maintenance all TypoScript should be extracted into external files via @import \'EXT:site_myproject/Configuration/TypoScript/setup.typoscript\'',0,0,0,0,0,0,0,0,'Main TypoScript Rendering','New TYPO3 site',1,1,'EXT:fluid_styled_content/Configuration/TypoScript/,EXT:fluid_styled_content/Configuration/TypoScript/Styling/,EXT:timezones/Configuration/TypoScript','','page = PAGE\r\npage.100 = CONTENT\r\npage.100 {\r\n    table = tt_content\r\n    select {\r\n        orderBy = sorting\r\n        where = {#colPos}=0\r\n    }\r\n}\r\n',NULL,0,0);
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_content` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `pid` int NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `cruser_id` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `editlock` smallint unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l18n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_source` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `t3_origuid` int unsigned NOT NULL DEFAULT '0',
  `l18n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `t3ver_count` int unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int unsigned NOT NULL DEFAULT '0',
  `CType` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `bullets_type` smallint unsigned NOT NULL DEFAULT '0',
  `uploads_description` smallint unsigned NOT NULL DEFAULT '0',
  `uploads_type` smallint unsigned NOT NULL DEFAULT '0',
  `assets` int unsigned NOT NULL DEFAULT '0',
  `image` int unsigned NOT NULL DEFAULT '0',
  `imagewidth` int unsigned NOT NULL DEFAULT '0',
  `imageorient` smallint unsigned NOT NULL DEFAULT '0',
  `imagecols` smallint unsigned NOT NULL DEFAULT '0',
  `imageborder` smallint unsigned NOT NULL DEFAULT '0',
  `media` int unsigned NOT NULL DEFAULT '0',
  `layout` int unsigned NOT NULL DEFAULT '0',
  `frame_class` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `cols` int unsigned NOT NULL DEFAULT '0',
  `space_before_class` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `records` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `pages` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `colPos` int unsigned NOT NULL DEFAULT '0',
  `subheader` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_link` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_zoom` smallint unsigned NOT NULL DEFAULT '0',
  `header_layout` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `list_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint unsigned NOT NULL DEFAULT '0',
  `linkToTop` smallint unsigned NOT NULL DEFAULT '0',
  `file_collections` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `filelink_size` smallint unsigned NOT NULL DEFAULT '0',
  `filelink_sorting` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` int unsigned NOT NULL DEFAULT '0',
  `recursive` smallint unsigned NOT NULL DEFAULT '0',
  `imageheight` int unsigned NOT NULL DEFAULT '0',
  `pi_flexform` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `accessibility_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint unsigned NOT NULL DEFAULT '0',
  `accessibility_bypass_text` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `selected_categories` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `category_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_delimiter` smallint unsigned NOT NULL DEFAULT '0',
  `table_enclosure` smallint unsigned NOT NULL DEFAULT '0',
  `table_header_position` smallint unsigned NOT NULL DEFAULT '0',
  `table_tfoot` smallint unsigned NOT NULL DEFAULT '0',
  `categories` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
INSERT INTO `tt_content` VALUES (1,'',1,1616338543,1616338543,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'header','Acceptance test first header','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0),(2,'',1,1616339412,1616339210,1,0,0,0,0,'',512,0,0,0,0,NULL,0,'a:23:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:9:\"list_type\";N;s:11:\"pi_flexform\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,0,0,0,'list','TimezonesIndex','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','timezones_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">Timezones-&gt;index;Timezones-&gt;show;Timezones-&gt;select;Timezones-&gt;tzset</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPaths\">\n            <language index=\"lDEF\">\n                <field index=\"view.templateRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.partialRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.layoutRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0),(3,'',1,1616342027,1616341965,1,1,0,0,0,'',768,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'list','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,'',0,'','',0,'0','timezones_pi1',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0),(4,'',2,1616342122,1616342112,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'a:23:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:9:\"list_type\";N;s:11:\"pi_flexform\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,0,0,0,'list','','','',0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','timezones_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;select;Timezones-&gt;tzset</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPaths\">\n            <language index=\"lDEF\">\n                <field index=\"view.templateRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.partialRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.layoutRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0),(5,'',3,1616342363,1616342353,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'a:23:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:9:\"list_type\";N;s:11:\"pi_flexform\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,0,0,0,'list','','','',0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','timezones_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">Timezones-&gt;select;Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;tzset</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPaths\">\n            <language index=\"lDEF\">\n                <field index=\"view.templateRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.partialRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.layoutRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0),(6,'',3,1616844197,1616844179,1,0,0,0,0,'',512,0,0,0,0,NULL,0,'a:23:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:9:\"list_type\";N;s:11:\"pi_flexform\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,0,0,0,'list','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,'',0,'','',0,'0','timezones_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">Timezones-&gt;show;Timezones-&gt;index;Timezones-&gt;select;Timezones-&gt;tzset</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPaths\">\n            <language index=\"lDEF\">\n                <field index=\"view.templateRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.partialRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.layoutRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0),(7,'',4,1616848078,1616847258,1,1,0,0,0,'',256,0,0,0,0,NULL,4,'a:23:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:9:\"list_type\";N;s:11:\"pi_flexform\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,0,0,0,'list','','','',0,0,0,0,0,0,0,2,0,0,0,'default',0,'','','','',0,'','',0,'0','timezones_pi1',1,0,'',0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">Timezones-&gt;index;Timezones-&gt;show;Timezones-&gt;select;Timezones-&gt;tzset</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPaths\">\n            <language index=\"lDEF\">\n                <field index=\"view.templateRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.partialRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"view.layoutRootPath\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','','',NULL,124,0,0,0,0);
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `extension_key` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository` int unsigned NOT NULL DEFAULT '1',
  `version` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int unsigned NOT NULL DEFAULT '0',
  `downloadcounter` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `state` int NOT NULL DEFAULT '0',
  `review_state` int NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0',
  `last_updated` int unsigned NOT NULL DEFAULT '0',
  `serialized_dependencies` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_comment` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `authorcompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int NOT NULL DEFAULT '0',
  `current_version` int NOT NULL DEFAULT '0',
  `lastreviewedversion` int NOT NULL DEFAULT '0',
  `documentation_link` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`repository`),
  KEY `index_extrepo` (`extension_key`,`repository`),
  KEY `index_versionrepo` (`integer_version`,`repository`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_extensionmanager_domain_model_extension`
--

LOCK TABLES `tx_extensionmanager_domain_model_extension` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_extensionmanager_domain_model_repository`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_repository` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `wsdl_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mirror_list_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_update` int unsigned NOT NULL DEFAULT '0',
  `extension_count` int NOT NULL DEFAULT '0',
  `pid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_extensionmanager_domain_model_repository`
--

LOCK TABLES `tx_extensionmanager_domain_model_repository` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_repository` DISABLE KEYS */;
INSERT INTO `tx_extensionmanager_domain_model_repository` VALUES (1,'TYPO3.org Main Repository','Main repository on typo3.org. This repository has some mirrors configured which are available with the mirror url.','https://typo3.org/wsdl/tx_ter_wsdl.php','https://repositories.typo3.org/mirrors.xml.gz',1346191200,0,0);
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_repository` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-27 15:22:24
