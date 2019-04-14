# repo_project

mysql query

CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `구입내역`
--

DROP TABLE IF EXISTS `구입내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `구입내역` (
  `은행명` varchar(30) DEFAULT NULL,
  `입금자` varchar(20) DEFAULT NULL,
  `입금금액` int(11) DEFAULT NULL,
  `입금일자` date DEFAULT NULL,
  `회원ID` varchar(45) DEFAULT NULL,
  `책이름` varchar(45) NOT NULL,
  PRIMARY KEY (`책이름`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `구입내역`
--

LOCK TABLES `구입내역` WRITE;
/*!40000 ALTER TABLE `구입내역` DISABLE KEYS */;
INSERT INTO `구입내역` VALUES ('국민은행','김예지',19289,'2018-06-02','yeji111','C 프로그래밍');
/*!40000 ALTER TABLE `구입내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `비회원`
--

DROP TABLE IF EXISTS `비회원`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `비회원` (
  `이름` varchar(10) DEFAULT NULL,
  `주민번호` varchar(14) NOT NULL DEFAULT '',
  `휴대폰번호` varchar(13) DEFAULT NULL,
  `이메일` varchar(30) DEFAULT NULL,
  `주소` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`주민번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `비회원`
--

LOCK TABLES `비회원` WRITE;
/*!40000 ALTER TABLE `비회원` DISABLE KEYS */;
/*!40000 ALTER TABLE `비회원` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `책`
--

DROP TABLE IF EXISTS `책`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `책` (
  `책이름` varchar(30) NOT NULL,
  `저자` varchar(45) DEFAULT NULL,
  `출판사` varchar(30) DEFAULT NULL,
  `가격` int(11) DEFAULT NULL,
  `출판일` date DEFAULT NULL,
  `분류` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`책이름`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `책`
--

LOCK TABLES `책` WRITE;
/*!40000 ALTER TABLE `책` DISABLE KEYS */;
INSERT INTO `책` VALUES 
('3쿠션 패턴 100','김동환','북코리아',18000,'2014-01-04','스포츠'),
('C 프로그래밍','윤성우','오렌지미디어',18750,'2010-11-01','공학'),
('Why Jesus','조정민','두란노서원',11700,'2014-02-27','종교'),
('감정수업','강신주','민음사',17550,'2013-11-20','인문'),
('결혼은 운명이다','이지연','감',21600,'2014-05-30','소설'),
('대통령의 글쓰기','강원국','메디치미디어',12640,'2014-02-25','인문'),
('리버싱 핵심 원리','이승원','인사이트',40800,'2012-09-30','공학'),
('린 스타트업','이창수','인사이트',15300,'2012-11-12','공학'),
('마학','김병선','대한미디어',22500,'2012-09-10','스포츠'),
('메이저리그 가이드','손혁','알에이치',11200,'2014-04-30','스포츠'),
('별안간 아씨','서자영','고즈넉',19800,'2014-05-25','소설'),
('보시기에 좋았더라','김양재','두란노서원',11700,'2014-05-19','종교'),
('보헤미안 랩소디','정재민','나무옆의자',11700,'2014-06-13','소설'),
('숨은 길 찾기','이금이','푸른책들',11250,'2014-05-30','소설'),
('스님의 주례사','법륜','휴',7560,'2010-09-13','종교'),
('여덟 단어','박웅현','북하우스',13500,'2013-05-20','인문'),
('이미지 인문학','진중권','쳔년의상상',15300,'2014-06-20','인문'),
('인생수업','법륜','휴',11700,'2013-10-09','종교'),
('축구 전술 70','김정환','한스미디어',10800,'2012-10-22','스포츠'),
('패턴 인식','오일석','교보문고',25000,'2008-08-20','공학');
/*!40000 ALTER TABLE `책` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원`
--

DROP TABLE IF EXISTS `회원`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `회원` (
  `이름` varchar(10) DEFAULT NULL,
  `회원ID` varchar(20) NOT NULL,
  `비밀번호` varchar(12) DEFAULT NULL,
  `주민등록번호` varchar(14) DEFAULT NULL,
  `휴대폰번호` varchar(13) DEFAULT NULL,
  `이메일` varchar(30) DEFAULT NULL,
  `주소` varchar(50) DEFAULT NULL,
  `마일리지` int(11) DEFAULT NULL,
  PRIMARY KEY (`회원ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원`
--

LOCK TABLES `회원` WRITE;
/*!40000 ALTER TABLE `회원` DISABLE KEYS */;
INSERT INTO `회원` VALUES ('김예지','yeji111','ghfkddl1','910','1','1','1',1000);
/*!40000 ALTER TABLE `회원` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
