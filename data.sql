-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: douguo
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add email address',7,'add_emailaddress'),(20,'Can change email address',7,'change_emailaddress'),(21,'Can delete email address',7,'delete_emailaddress'),(22,'Can add email confirmation',8,'add_emailconfirmation'),(23,'Can change email confirmation',8,'change_emailconfirmation'),(24,'Can delete email confirmation',8,'delete_emailconfirmation'),(25,'Can add social account',9,'add_socialaccount'),(26,'Can change social account',9,'change_socialaccount'),(27,'Can delete social account',9,'delete_socialaccount'),(28,'Can add social application',10,'add_socialapp'),(29,'Can change social application',10,'change_socialapp'),(30,'Can delete social application',10,'delete_socialapp'),(31,'Can add social application token',11,'add_socialtoken'),(32,'Can change social application token',11,'change_socialtoken'),(33,'Can delete social application token',11,'delete_socialtoken'),(34,'Can add 文章',12,'add_article'),(35,'Can change 文章',12,'change_article'),(36,'Can delete 文章',12,'delete_article'),(37,'Can add 大分类',13,'add_bigcategory'),(38,'Can change 大分类',13,'change_bigcategory'),(39,'Can delete 大分类',13,'delete_bigcategory'),(40,'Can add 图片轮播',14,'add_carousel'),(41,'Can change 图片轮播',14,'change_carousel'),(42,'Can delete 图片轮播',14,'delete_carousel'),(43,'Can add 分类',15,'add_category'),(44,'Can change 分类',15,'change_category'),(45,'Can delete 分类',15,'delete_category'),(46,'Can add 友情链接',16,'add_friendlink'),(47,'Can change 友情链接',16,'change_friendlink'),(48,'Can delete 友情链接',16,'delete_friendlink'),(49,'Can add 关键词',17,'add_keyword'),(50,'Can change 关键词',17,'change_keyword'),(51,'Can delete 关键词',17,'delete_keyword'),(52,'Can add 标签',18,'add_tag'),(53,'Can change 标签',18,'change_tag'),(54,'Can delete 标签',18,'delete_tag'),(55,'Can add 公告',19,'add_activate'),(56,'Can change 公告',19,'change_activate'),(57,'Can delete 公告',19,'delete_activate'),(58,'Can add 死链',20,'add_silian'),(59,'Can change 死链',20,'change_silian'),(60,'Can delete 死链',20,'delete_silian'),(61,'Can add 用户',21,'add_ouser'),(62,'Can change 用户',21,'change_ouser'),(63,'Can delete 用户',21,'delete_ouser'),(64,'Can add comment user',22,'add_commentuser'),(65,'Can change comment user',22,'change_commentuser'),(66,'Can delete comment user',22,'delete_commentuser'),(67,'Can add 给我留言',23,'add_messagecomment'),(68,'Can change 给我留言',23,'change_messagecomment'),(69,'Can delete 给我留言',23,'delete_messagecomment'),(70,'Can add 关于自己评论',24,'add_aboutcomment'),(71,'Can change 关于自己评论',24,'change_aboutcomment'),(72,'Can delete 关于自己评论',24,'delete_aboutcomment'),(73,'Can add 文章评论',25,'add_articlecomment'),(74,'Can change 文章评论',25,'change_articlecomment'),(75,'Can delete 文章评论',25,'delete_articlecomment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_activate`
--

DROP TABLE IF EXISTS `blog_activate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_activate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  `add_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_activate`
--

LOCK TABLES `blog_activate` WRITE;
/*!40000 ALTER TABLE `blog_activate` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_activate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `img_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `views` int(11) NOT NULL,
  `loves` int(11) NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blog_article_author_id_905add38_fk_oauth_ouser_id` (`author_id`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_author_id_905add38_fk_oauth_ouser_id` FOREIGN KEY (`author_id`) REFERENCES `oauth_ouser` (`id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'这是第一篇文章','王维（701年－761年，一说699年—761年），字摩诘，号摩诘居士。河东蒲州（今山西运城）人，祖籍山西祁县。唐朝著名诗人、画家。','王维（701年－761年，一说699年—761年），字摩诘，号摩诘居士。河东蒲州（今山西运城）人，祖籍山西祁县。唐朝著名诗人、画家。\r\n王维出身河东王氏，于开元十九年（731年）状元及第。历官右拾遗、监察御史、河西节度使判官。唐玄宗天宝年间，王维拜吏部郎中、给事中。安禄山攻陷长安时，王维被迫受伪职。长安收复后，被责授太子中允。唐肃宗乾元年间任尚书右丞，故世称“王右丞”。\r\n王维参禅悟理，学庄信道，精通诗、书、画、音乐等，以诗名盛于开元、天宝间，尤长五言，多咏山水田园，与孟浩然合称“王孟”，有“诗佛”之称 [1]  。书画特臻其妙，后人推其为南宗山水画之祖。苏轼评价其：“味摩诘之诗，诗中有画；观摩诘之画，画中有诗。” [2]  存诗400余首，代表诗作有《相思》、《山居秋暝》等。著作有《王右丞集》、《画学秘诀》。','/static/images/right1.jpg','2019-05-15 09:24:54.306948','2019-05-16 06:41:01.011397',1,1,'cata_1',1,1),(2,'这是第二篇文章','狄仁杰（630~700年），字怀英，并州太原（今山西太原市）人。唐朝武周时期政治家。\r\n出身太原狄氏 [1]  ，早年以明经及第，历任汴州判佐、并州法曹、大理寺丞、侍御史、度支郎中、宁州刺史、冬官侍郎、江南巡抚使、文昌右丞、豫州刺史、复州刺史、洛州司马等职，以不畏权贵著称。','狄仁杰（630~700年），字怀英，并州太原（今山西太原市）人。唐朝武周时期政治家。\r\n出身太原狄氏 [1]  ，早年以明经及第，历任汴州判佐、并州法曹、大理寺丞、侍御史、度支郎中、宁州刺史、冬官侍郎、江南巡抚使、文昌右丞、豫州刺史、复州刺史、洛州司马等职，以不畏权贵著称。\r\n天授二年（691年）九月，升任宰相，担任地官侍郎、同平章事。四个月后，为酷吏来俊臣诬以谋反，夺职下狱，贬为彭泽县令。营州之乱时，得到起复。神功元年（697年），再度拜相，担任鸾台侍郎、同平章事，迁纳言。用于犯颜直谏，力劝武则天复立庐陵王李显为太子，培植举荐忠于唐朝的势力，成为大唐社稷得以延续的重要支柱。\r\n久视元年（700年），拜内史令。同年九月，病逝，追赠文昌右相，谥号文惠。唐中宗复位后，追赠司空、梁国公，累赠太师，配享中宗庙廷','/static/images/right2.jpg','2019-05-15 09:26:07.529826','2019-06-11 02:32:24.138281',1,5,'cata_2',1,1),(3,'史湘云','史湘云是《红楼梦》中的主要人物，首次出场于第二十回，是金陵十二钗之一，也是十二钗中最后一个出场的。她是史太君（贾母）的侄孙女，别号枕霞旧友。身型蜂腰猿臂、鹤势螂形，容态十分美丽。','史湘云是《红楼梦》中的主要人物，首次出场于第二十回，是金陵十二钗之一，也是十二钗中最后一个出场的。她是史太君（贾母）的侄孙女，别号枕霞旧友。身型蜂腰猿臂、鹤势螂形，容态十分美丽。\r\n\r\n原著62回《憨湘云醉眠芍药裀》，描写湘云在宝玉生日宴上酒醉卧睡于芍药花丛石板凳之上，足与葬花、扑蝶并列红楼梦最唯美情节，也成为后世绘画的题材──包括两岸四地发行之红楼梦邮票，也都以此为题。','/static/images/right3.jpg','2019-05-15 09:28:45.040419','2019-05-25 02:46:30.997318',2,4,'cata_3',1,1);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_keywords`
--

DROP TABLE IF EXISTS `blog_article_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_article_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_keywords_article_id_keyword_id_9de3a8ff_uniq` (`article_id`,`keyword_id`),
  KEY `blog_article_keywords_keyword_id_43076791_fk_blog_keyword_id` (`keyword_id`),
  CONSTRAINT `blog_article_keywords_article_id_b4779209_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_keywords_keyword_id_43076791_fk_blog_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `blog_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_keywords`
--

LOCK TABLES `blog_article_keywords` WRITE;
/*!40000 ALTER TABLE `blog_article_keywords` DISABLE KEYS */;
INSERT INTO `blog_article_keywords` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `blog_article_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_bigcategory`
--

DROP TABLE IF EXISTS `blog_bigcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_bigcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `keywords` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_bigcategory`
--

LOCK TABLES `blog_bigcategory` WRITE;
/*!40000 ALTER TABLE `blog_bigcategory` DISABLE KEYS */;
INSERT INTO `blog_bigcategory` VALUES (1,'豆小果','life','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(2,'技术杂谈','technique','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(3,'福利专区','resources','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(4,'关于自己','about','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(5,'给我留言','message','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(6,'赞助作者','donate','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(7,'技术交流','exchange','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(8,'提问交流','question','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python'),(9,'项目交流','project','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','douxiaoguo,豆小果,网络,IT,技术,博客,Python');
/*!40000 ALTER TABLE `blog_bigcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_carousel`
--

DROP TABLE IF EXISTS `blog_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `title` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `img_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_carousel`
--

LOCK TABLES `blog_carousel` WRITE;
/*!40000 ALTER TABLE `blog_carousel` DISABLE KEYS */;
INSERT INTO `blog_carousel` VALUES (1,1,'1','1','/static/images/index2.jpg','#'),(2,2,'2','2','/static/images/index2.jpg','#'),(3,3,'3','3','/static/images/index2.jpg','#'),(4,4,'4','4','/static/images/index2.jpg','#'),(5,5,'5','5','/static/images/index2.jpg','#');
/*!40000 ALTER TABLE `blog_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bigcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blog_category_bigcategory_id_39871761_fk_blog_bigcategory_id` (`bigcategory_id`),
  CONSTRAINT `blog_category_bigcategory_id_39871761_fk_blog_bigcategory_id` FOREIGN KEY (`bigcategory_id`) REFERENCES `blog_bigcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'随笔','cata_bi','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好',1);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_friendlink`
--

DROP TABLE IF EXISTS `blog_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_friendlink`
--

LOCK TABLES `blog_friendlink` WRITE;
/*!40000 ALTER TABLE `blog_friendlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_keyword`
--

DROP TABLE IF EXISTS `blog_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_keyword`
--

LOCK TABLES `blog_keyword` WRITE;
/*!40000 ALTER TABLE `blog_keyword` DISABLE KEYS */;
INSERT INTO `blog_keyword` VALUES (1,'随笔'),(2,'唐诗');
/*!40000 ALTER TABLE `blog_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_silian`
--

DROP TABLE IF EXISTS `blog_silian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_silian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badurl` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_silian`
--

LOCK TABLES `blog_silian` WRITE;
/*!40000 ALTER TABLE `blog_silian` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_silian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'随笔','cata_suibi','豆小果的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好'),(2,'唐诗','cata_tangshi','唐诗');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_aboutcomment`
--

DROP TABLE IF EXISTS `comment_aboutcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_aboutcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_aboutcomment_author_id_d11e841e_fk_comment_c` (`author_id`),
  KEY `comment_aboutcomment_parent_id_a12294ac_fk_comment_a` (`parent_id`),
  KEY `comment_aboutcomment_rep_to_id_e44ab5ad_fk_comment_a` (`rep_to_id`),
  CONSTRAINT `comment_aboutcomment_author_id_d11e841e_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`),
  CONSTRAINT `comment_aboutcomment_parent_id_a12294ac_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_aboutcomment` (`id`),
  CONSTRAINT `comment_aboutcomment_rep_to_id_e44ab5ad_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_aboutcomment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_aboutcomment`
--

LOCK TABLES `comment_aboutcomment` WRITE;
/*!40000 ALTER TABLE `comment_aboutcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_aboutcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_articlecomment`
--

DROP TABLE IF EXISTS `comment_articlecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_articlecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `belong_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_articlecomme_author_id_46e6fdb8_fk_comment_c` (`author_id`),
  KEY `comment_articlecomment_belong_id_58e0232c_fk_blog_article_id` (`belong_id`),
  KEY `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` (`parent_id`),
  KEY `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` (`rep_to_id`),
  CONSTRAINT `comment_articlecomme_author_id_46e6fdb8_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`),
  CONSTRAINT `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomment_belong_id_58e0232c_fk_blog_article_id` FOREIGN KEY (`belong_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_articlecomment`
--

LOCK TABLES `comment_articlecomment` WRITE;
/*!40000 ALTER TABLE `comment_articlecomment` DISABLE KEYS */;
INSERT INTO `comment_articlecomment` VALUES (1,'2019-05-18 06:01:25.524741','111111111',1,2,NULL,NULL),(2,'2019-05-18 06:01:41.055051','2222222222',1,2,NULL,NULL);
/*!40000 ALTER TABLE `comment_articlecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_commentuser`
--

DROP TABLE IF EXISTS `comment_commentuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_commentuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_commentuser`
--

LOCK TABLES `comment_commentuser` WRITE;
/*!40000 ALTER TABLE `comment_commentuser` DISABLE KEYS */;
INSERT INTO `comment_commentuser` VALUES (1,'douguo','xuerobec@foxmail.com','');
/*!40000 ALTER TABLE `comment_commentuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_messagecomment`
--

DROP TABLE IF EXISTS `comment_messagecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_messagecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_messagecomme_author_id_0bb97e6c_fk_comment_c` (`author_id`),
  KEY `comment_messagecomme_parent_id_d4633983_fk_comment_m` (`parent_id`),
  KEY `comment_messagecomme_rep_to_id_029597ed_fk_comment_m` (`rep_to_id`),
  CONSTRAINT `comment_messagecomme_author_id_0bb97e6c_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`),
  CONSTRAINT `comment_messagecomme_parent_id_d4633983_fk_comment_m` FOREIGN KEY (`parent_id`) REFERENCES `comment_messagecomment` (`id`),
  CONSTRAINT `comment_messagecomme_rep_to_id_029597ed_fk_comment_m` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_messagecomment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_messagecomment`
--

LOCK TABLES `comment_messagecomment` WRITE;
/*!40000 ALTER TABLE `comment_messagecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_messagecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-15 09:17:14.278465','2','127.0.0.1',2,'[{\"changed\": {\"fields\": [\"domain\", \"name\"]}}]',6,1),(2,'2019-05-15 09:18:03.450197','1','1',1,'[{\"added\": {}}]',14,1),(3,'2019-05-15 09:18:12.375080','2','2',1,'[{\"added\": {}}]',14,1),(4,'2019-05-15 09:18:21.525150','3','3',1,'[{\"added\": {}}]',14,1),(5,'2019-05-15 09:18:33.287666','4','4',1,'[{\"added\": {}}]',14,1),(6,'2019-05-15 09:18:43.752067','5','5',1,'[{\"added\": {}}]',14,1),(7,'2019-05-15 09:18:52.263908','1','1',2,'[{\"changed\": {\"fields\": [\"img_url\"]}}]',14,1),(8,'2019-05-15 09:18:57.216220','2','2',2,'[{\"changed\": {\"fields\": [\"img_url\"]}}]',14,1),(9,'2019-05-15 09:19:26.512135','1','随笔',1,'[{\"added\": {}}]',18,1),(10,'2019-05-15 09:20:28.331876','2','唐诗',1,'[{\"added\": {}}]',18,1),(11,'2019-05-15 09:22:34.013241','1','随笔',1,'[{\"added\": {}}]',17,1),(12,'2019-05-15 09:22:40.301636','2','唐诗',1,'[{\"added\": {}}]',17,1),(13,'2019-05-15 09:24:14.911371','1','豆小果',1,'[{\"added\": {}}]',13,1),(14,'2019-05-15 09:24:26.799016','1','随笔',1,'[{\"added\": {}}]',15,1),(15,'2019-05-15 09:24:54.312933','1','这是第一篇文章',1,'[{\"added\": {}}]',12,1),(16,'2019-05-15 09:26:07.538802','2','这是第二篇文章',1,'[{\"added\": {}}]',12,1),(17,'2019-05-15 09:28:45.046371','3','史湘云',1,'[{\"added\": {}}]',12,1),(18,'2019-05-15 11:51:55.802346','1','豆小果',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',13,1),(19,'2019-05-15 11:52:35.306764','2','技术杂谈',1,'[{\"added\": {}}]',13,1),(20,'2019-05-15 11:52:56.204882','3','福利专区',1,'[{\"added\": {}}]',13,1),(21,'2019-05-15 11:53:18.641901','4','敢于自己',1,'[{\"added\": {}}]',13,1),(22,'2019-05-15 11:53:42.574920','5','给我留言',1,'[{\"added\": {}}]',13,1),(23,'2019-05-15 11:54:01.589094','6','赞助作者',1,'[{\"added\": {}}]',13,1),(24,'2019-05-15 11:54:24.501841','7','技术交流',1,'[{\"added\": {}}]',13,1),(25,'2019-05-15 11:54:43.565880','8','提问交流',1,'[{\"added\": {}}]',13,1),(26,'2019-05-15 11:55:06.083712','9','项目交流',1,'[{\"added\": {}}]',13,1),(27,'2019-05-15 11:55:20.684661','4','关于自己',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',13,1),(28,'2019-05-15 12:13:51.820001','2','127.0.0.1:8000',2,'[{\"changed\": {\"fields\": [\"domain\", \"name\"]}}]',6,1),(29,'2019-05-16 06:17:26.318847','1','这是第一篇文章',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',12,1),(30,'2019-05-16 06:17:41.965263','3','史湘云',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',12,1),(31,'2019-05-16 06:41:01.023365','1','这是第一篇文章',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',12,1),(32,'2019-05-16 06:41:13.483680','2','这是第二篇文章',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',12,1),(33,'2019-05-16 06:41:23.657808','3','史湘云',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',12,1),(34,'2019-05-16 07:20:25.606974','8','提问交流',2,'[]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'account','emailaddress'),(8,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(19,'blog','activate'),(12,'blog','article'),(13,'blog','bigcategory'),(14,'blog','carousel'),(15,'blog','category'),(16,'blog','friendlink'),(17,'blog','keyword'),(20,'blog','silian'),(18,'blog','tag'),(24,'comment','aboutcomment'),(25,'comment','articlecomment'),(22,'comment','commentuser'),(23,'comment','messagecomment'),(4,'contenttypes','contenttype'),(21,'oauth','ouser'),(5,'sessions','session'),(6,'sites','site'),(9,'socialaccount','socialaccount'),(10,'socialaccount','socialapp'),(11,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-15 09:15:46.828849'),(2,'contenttypes','0002_remove_content_type_name','2019-05-15 09:15:46.980439'),(3,'auth','0001_initial','2019-05-15 09:15:47.472125'),(4,'auth','0002_alter_permission_name_max_length','2019-05-15 09:15:47.578840'),(5,'auth','0003_alter_user_email_max_length','2019-05-15 09:15:47.594796'),(6,'auth','0004_alter_user_username_opts','2019-05-15 09:15:47.609784'),(7,'auth','0005_alter_user_last_login_null','2019-05-15 09:15:47.626720'),(8,'auth','0006_require_contenttypes_0002','2019-05-15 09:15:47.636686'),(9,'auth','0007_alter_validators_add_error_messages','2019-05-15 09:15:47.647656'),(10,'auth','0008_alter_user_username_max_length','2019-05-15 09:15:47.660648'),(11,'oauth','0001_initial','2019-05-15 09:15:51.082623'),(12,'account','0001_initial','2019-05-15 09:15:51.388805'),(13,'account','0002_email_max_length','2019-05-15 09:15:51.513471'),(14,'admin','0001_initial','2019-05-15 09:15:51.760810'),(15,'admin','0002_logentry_remove_auto_add','2019-05-15 09:15:51.778763'),(16,'blog','0001_initial','2019-05-15 09:15:53.029421'),(17,'blog','0002_activate','2019-05-15 09:15:53.076294'),(18,'blog','0003_silian','2019-05-15 09:15:53.122174'),(19,'sessions','0001_initial','2019-05-15 09:15:53.189990'),(20,'sites','0001_initial','2019-05-15 09:15:53.236865'),(21,'sites','0002_alter_domain_unique','2019-05-15 09:15:53.273766'),(22,'socialaccount','0001_initial','2019-05-15 09:15:54.045703'),(23,'socialaccount','0002_token_max_lengths','2019-05-15 09:15:54.123497'),(24,'socialaccount','0003_extra_data_default_dict','2019-05-15 09:15:54.143445'),(25,'comment','0001_initial','2019-05-16 09:01:58.463667'),(26,'blog','0004_auto_20190518_0908','2019-05-18 01:08:49.087057');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('m3sgu2jopkqmv010cj6dwbsbuayr8vgg','YjI3OTViMjEwNzc0ZDVkZWM5ZWMwZjlkNjVhNzAwZGMwOWE2OWNmMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNmEwYWJjZmY5Njk1MDhmMGY5NTkzNmQ4YjEzOTMzMGJkOTZlYTJiIiwibmljayI6bnVsbCwidGlkIjpudWxsLCJ1c2VybmFtZSI6ImRvdWd1byIsInVpZCI6MX0=','2019-06-01 06:03:39.309087'),('x5466ry3rmwftkvkenjxcv9xp7jkaikl','NTg1ZjVjN2Y1OGI1MWUwNTg2MjViMDM3Yjc0MWYzZjNlNTYzYmIzNzp7ImlzX3JlYWRfMiI6MTU2MDIyMDM0MC45NDQ1NDV9','2019-06-25 02:32:21.053251');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (2,'127.0.0.1:8000','127.0.0.1:8000');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_ouser`
--

DROP TABLE IF EXISTS `oauth_ouser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_ouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_ouser`
--

LOCK TABLES `oauth_ouser` WRITE;
/*!40000 ALTER TABLE `oauth_ouser` DISABLE KEYS */;
INSERT INTO `oauth_ouser` VALUES (1,'pbkdf2_sha256$36000$EC9iX3XdDO72$p7chHwFAGzEbOV6JX3qu7IQaFhowkxU/btZft3QgEEk=','2019-05-18 06:03:39.286173',1,'douguo','','','xuerobec@foxmail.com',1,1,'2019-05-15 09:16:35.523932','','avatar/default.png'),(2,'pbkdf2_sha256$36000$Zk7z7UyKFpS2$/NG8zD3/tJI74cfp6yT8F2gUPVb1UEuLOqKbRhRAUqw=','2019-05-16 06:59:05.577377',0,'ymj123465','','','705603723@qq.com',0,1,'2019-05-16 06:52:42.827119','','avatar/default.png');
/*!40000 ALTER TABLE `oauth_ouser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_ouser_groups`
--

DROP TABLE IF EXISTS `oauth_ouser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_ouser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_groups_ouser_id_group_id_4a9e5409_uniq` (`ouser_id`,`group_id`),
  KEY `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` (`group_id`),
  CONSTRAINT `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `oauth_ouser_groups_ouser_id_c543bcdc_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_ouser_groups`
--

LOCK TABLES `oauth_ouser_groups` WRITE;
/*!40000 ALTER TABLE `oauth_ouser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_ouser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_ouser_user_permissions`
--

DROP TABLE IF EXISTS `oauth_ouser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_ouser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_user_permiss_ouser_id_permission_id_ab6b2ccc_uniq` (`ouser_id`,`permission_id`),
  KEY `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `oauth_ouser_user_permissions_ouser_id_12e23549_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_ouser_user_permissions`
--

LOCK TABLES `oauth_ouser_user_permissions` WRITE;
/*!40000 ALTER TABLE `oauth_ouser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_ouser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext COLLATE utf8_unicode_ci NOT NULL,
  `token_secret` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-25 16:27:38
