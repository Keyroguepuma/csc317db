-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_userId` int unsigned NOT NULL,
  `text` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_postId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post_author_idx` (`fk_postId`),
  KEY `author_id_idx` (`fk_userId`),
  CONSTRAINT `author_id` FOREIGN KEY (`fk_userId`) REFERENCES `users` (`id`),
  CONSTRAINT `post_id` FOREIGN KEY (`fk_postId`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,13,'cghcj','2023-08-10 23:59:03','2023-08-10 23:59:03',5),(2,13,'guikfcyit','2023-08-11 00:02:03','2023-08-11 00:02:03',5),(3,13,'guikfcyit','2023-08-11 00:02:41','2023-08-11 00:02:41',5),(4,13,'new comment','2023-08-11 00:04:43','2023-08-11 00:04:43',6),(5,13,'This is a comment','2023-08-11 00:12:13','2023-08-11 00:12:13',6),(6,13,'This is a comment','2023-08-11 00:12:14','2023-08-11 00:12:14',6),(7,13,'This is a comment','2023-08-11 00:12:15','2023-08-11 00:12:15',6),(8,13,'This is a comment','2023-08-11 00:12:16','2023-08-11 00:12:16',6),(9,13,'This is a comment','2023-08-11 00:12:16','2023-08-11 00:12:16',6),(10,13,'This is a comment','2023-08-11 00:12:29','2023-08-11 00:12:29',6),(11,13,'ycyfcyki','2023-08-11 00:16:24','2023-08-11 00:16:24',6),(12,13,'this is a comment','2023-08-11 00:19:18','2023-08-11 00:19:18',6),(13,13,'this is a comment','2023-08-11 00:22:09','2023-08-11 00:22:09',6),(14,13,'wef','2023-08-11 00:25:48','2023-08-11 00:25:48',6),(15,13,'sdv','2023-08-11 00:26:43','2023-08-11 00:26:43',6),(16,13,' awfvsewg','2023-08-11 00:27:52','2023-08-11 00:27:52',6),(17,13,'gvcvkj','2023-08-11 00:28:48','2023-08-11 00:28:48',6),(18,13,'vasdvadaf','2023-08-11 00:29:11','2023-08-11 00:29:11',6),(19,13,' sebgwrs','2023-08-11 00:29:14','2023-08-11 00:29:14',6),(20,13,'abegva','2023-08-11 00:29:54','2023-08-11 00:29:54',6),(21,13,'avfa\n','2023-08-11 00:31:10','2023-08-11 00:31:10',6),(22,13,'fw','2023-08-11 00:32:20','2023-08-11 00:32:20',6),(23,13,'sg','2023-08-11 00:33:23','2023-08-11 00:33:23',6),(24,13,' dss','2023-08-11 00:33:54','2023-08-11 00:33:54',6),(25,13,'adsfgvsd','2023-08-11 00:34:50','2023-08-11 00:34:50',6),(26,13,'sdvbsd','2023-08-11 00:35:23','2023-08-11 00:35:23',6),(27,13,'gc','2023-08-11 00:36:21','2023-08-11 00:36:21',6),(28,13,'tjrdyktdfutlfykrsxkj','2023-08-11 00:37:13','2023-08-11 00:37:13',6),(29,13,'cjcj,hgcj','2023-08-11 00:37:39','2023-08-11 00:37:39',6),(30,13,'chcjx','2023-08-11 00:38:03','2023-08-11 00:38:03',6),(31,13,'hchjgc','2023-08-11 00:40:29','2023-08-11 00:40:29',6),(32,13,'zbzd\n','2023-08-11 00:42:13','2023-08-11 00:42:13',6),(33,13,' dfhsrsrwhws','2023-08-11 00:42:24','2023-08-11 00:42:24',6),(34,13,'woiafghviwe','2023-08-11 00:43:01','2023-08-11 00:43:01',6),(35,13,' wefw','2023-08-11 00:43:05','2023-08-11 00:43:05',6),(36,13,' wegqwegv','2023-08-11 00:43:11','2023-08-11 00:43:11',6),(37,13,'cgjhc','2023-08-11 00:44:24','2023-08-11 00:44:24',6),(38,13,' gvkvkc','2023-08-11 00:44:29','2023-08-11 00:44:29',6),(39,13,' vkhcghc','2023-08-11 00:44:36','2023-08-11 00:44:36',6),(40,13,'scsa','2023-08-11 00:46:59','2023-08-11 00:46:59',6),(41,13,'jfcgcj','2023-08-11 00:48:20','2023-08-11 00:48:20',4),(42,13,'csblcblsa','2023-08-11 00:48:53','2023-08-11 00:48:53',4),(43,13,'cs','2023-08-11 00:49:24','2023-08-11 00:49:24',4),(44,13,' cscascasc','2023-08-11 00:49:43','2023-08-11 00:49:43',4),(45,13,'vkgvkhvj','2023-08-11 00:51:14','2023-08-11 00:51:14',8),(46,13,' ghcvhk','2023-08-11 00:51:22','2023-08-11 00:51:22',8),(47,13,'vkjvjh','2023-08-11 00:53:00','2023-08-11 00:53:00',3),(48,13,'vhc','2023-08-11 00:56:10','2023-08-11 00:56:10',3),(49,13,' vjkv\n','2023-08-11 00:56:14','2023-08-11 00:56:14',3),(50,13,' ghvk','2023-08-11 00:56:19','2023-08-11 00:56:19',3),(51,13,'vkjvkj','2023-08-11 00:58:25','2023-08-11 00:58:25',3),(52,13,'vkjvkj','2023-08-11 00:58:27','2023-08-11 00:58:27',3),(53,13,'sgsbvs','2023-08-11 00:59:34','2023-08-11 00:59:34',3),(54,13,'rever','2023-08-11 01:00:40','2023-08-11 01:00:40',3),(55,13,' wece2w','2023-08-11 01:00:44','2023-08-11 01:00:44',3),(56,13,'sdvs','2023-08-11 01:01:40','2023-08-11 01:01:40',3),(57,13,' dsvwvcws','2023-08-11 01:01:47','2023-08-11 01:01:47',3),(58,13,'vsdvsdv','2023-08-11 01:02:07','2023-08-11 01:02:07',3),(59,13,' sdbsd','2023-08-11 01:02:10','2023-08-11 01:02:10',3),(60,13,'sgvs','2023-08-11 01:05:20','2023-08-11 01:05:20',8);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `video` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_userId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post_author_idx` (`fk_userId`),
  CONSTRAINT `post_author` FOREIGN KEY (`fk_userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'sample 1','sample 1 description ','public\\uploads\\videos\\videofile-1691461859150-225085441.mp4','public/uploads/images/thumbnail-videofile-1691461859150-225085441.png','2023-08-07 19:30:59','2023-08-07 19:30:59',13),(2,'lalala','lalala description','public\\uploads\\videos\\videofile-1691466335729-641918478.mp4','public/uploads/images/thumbnail-videofile-1691466335729-641918478.png','2023-08-07 20:45:35','2023-08-07 20:45:35',13),(3,'sample 4','sample 4 description','public\\uploads\\videos\\videofile-1691471266493-311696124.mp4','public/uploads/images/thumbnail-videofile-1691471266493-311696124.png','2023-08-07 22:07:46','2023-08-07 22:07:46',13),(4,'This is sample 5','this is a description for sample 5 video','public\\uploads\\videos\\videofile-1691472695756-750892691.mp4','public/uploads/images/thumbnail-videofile-1691472695756-750892691.png','2023-08-07 22:31:35','2023-08-07 22:31:35',13),(5,'luna and brisa','this is a random description','public\\uploads\\videos\\videofile-1691473193240-324928361.mp4','public/uploads/images/thumbnail-videofile-1691473193240-324928361.png','2023-08-07 22:39:53','2023-08-07 22:39:53',17),(6,'i dont know ','this is another sample ','public\\uploads\\videos\\videofile-1691630019646-439626127.mp4','public/uploads/images/thumbnail-videofile-1691630019646-439626127.png','2023-08-09 18:13:40','2023-08-09 18:13:40',13),(7,'gukyvu','gfygcfykcx','public\\uploads\\videos\\videofile-1691726894445-273861817.mp4','public/uploads/images/thumbnail-videofile-1691726894445-273861817.png','2023-08-10 21:08:15','2023-08-10 21:08:15',13),(8,'dsvsdfb','sbswrbner','public\\uploads\\videos\\videofile-1691740262540-815846710.mp4','public/uploads/images/thumbnail-videofile-1691740262540-815846710.png','2023-08-11 00:51:02','2023-08-11 00:51:02',13);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('gLTijRB7iyxgPOtUGCg9ZsthzazhSJas',1691819411,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('y4fPNChUq7Bw1K0JH3lGDOvOBTYdz_Na',1691827520,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"user\":{\"userId\":13,\"username\":\"sample17\",\"email\":\"sample17@gmail.com\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sample1','sample1@gmail.com','12345','2023-08-05 23:01:14','2023-08-05 23:01:14'),(2,'sample2','sample2@gmail.com','12345','2023-08-05 23:02:22','2023-08-05 23:02:22'),(3,'sample4','sample4@gmail.com','12345','2023-08-05 23:07:09','2023-08-05 23:07:09'),(7,'sample10','sample10@gmail.com','12345','2023-08-05 23:19:56','2023-08-05 23:19:56'),(8,'sample0','sample0@gmail.com','12345','2023-08-05 23:23:24','2023-08-05 23:23:24'),(9,'sample5','sample5@gmail.com','1234','2023-08-05 23:25:23','2023-08-05 23:25:23'),(13,'sample17','sample17@gmail.com','$2b$05$CKhW3U.s4MgmZpx6PRjlKegAUOLEaPk/T0BPjMw452xFTglfU9d0u','2023-08-06 09:22:47','2023-08-06 09:22:47'),(15,'sample18','sample18@gmail.com','$2b$05$fe94y6OqBvhW5m9cQpekxOzuOAdGgvh6FN41R2JuyjzU41JvgsGBi','2023-08-06 09:24:48','2023-08-06 09:24:48'),(17,'tere','terejimenez@gmail.com','$2b$05$HWGi2Xe.b2mK09X97aEg3OHrlVoBQ3fLqMe1GmWuufKWX70kHikbG','2023-08-07 22:39:06','2023-08-07 22:39:06'),(18,'','awgwe@gmail.com','$2b$05$WnrpUw0e.H4bDgfVwwlcZ.4s4Gc1RCC5mnZTuWhLsDT5OWQ76rYc.','2023-08-10 12:52:06','2023-08-10 12:52:06'),(22,'12334','jpoiupoi@gmail.com','$2b$05$Ix90btkmtkHlBWZKYg3cReFQ3ZOMpn/EZbEq/yjd5.2nHLDMAdGf6','2023-08-10 13:18:46','2023-08-10 13:18:46'),(23,'1234','ipupo@gmail.com','$2b$05$IcAtZ6CzUkE.BXcocASlFuQ6AOGLPt52LSsNtZi3rZtYKHbjWBreS','2023-08-10 13:19:22','2023-08-10 13:19:22'),(24,'sample40','ipoup@gmail.com','$2b$05$fpEs2KQLdIW8b4F4a9cDIuhcQhTZ4Nf91nFPoz1rHJS1QmkhPlv..','2023-08-10 13:24:20','2023-08-10 13:24:20'),(25,'sample20','jpuhpi@gmail.com','$2b$05$mq2uokI2QjwQcFtbxAyL4OQoDh2yKqCAE7Je1nXSuc/ke68Esdyie','2023-08-10 13:24:58','2023-08-10 13:24:58'),(27,'sample36','bncvkn@gmail.com','$2b$05$F0XT6Ggz6H3klBQ6KdcZyedhsiy3looNbG79EMjhjYqDrw/aWt4Di','2023-08-10 13:44:42','2023-08-10 13:44:42'),(28,'sample65','bnnbk@gmail.com','$2b$05$xzpg6tw5LRhqNHyvYw3IfucBFGTevAL7zOLOR9PrNKVoNxv3zgNmC','2023-08-10 13:53:22','2023-08-10 13:53:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-11  1:10:12
