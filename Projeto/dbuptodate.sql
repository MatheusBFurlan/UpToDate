CREATE DATABASE  IF NOT EXISTS `dbuptodate` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbuptodate`;
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: dbuptodate
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.17.04.1

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
-- Table structure for table `tbalunos`
--

DROP TABLE IF EXISTS `tbalunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbalunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `contato` varchar(15) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_responsavel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_responsavel` (`id_responsavel`),
  CONSTRAINT `tbalunos_ibfk_1` FOREIGN KEY (`id_responsavel`) REFERENCES `tbresponsaveis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbalunos`
--

LOCK TABLES `tbalunos` WRITE;
/*!40000 ALTER TABLE `tbalunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbalunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbaulas`
--

DROP TABLE IF EXISTS `tbaulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbaulas` (
  `data_aula` date NOT NULL,
  `presenca` tinyint(1) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_professor` int(11) NOT NULL,
  PRIMARY KEY (`data_aula`,`id_aluno`,`id_professor`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `tbaulas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `tbalunos` (`id`),
  CONSTRAINT `tbaulas_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tbprofessores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbaulas`
--

LOCK TABLES `tbaulas` WRITE;
/*!40000 ALTER TABLE `tbaulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbaulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbclasses`
--

DROP TABLE IF EXISTS `tbclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbclasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFinal` time NOT NULL,
  `diaUm` varchar(15) NOT NULL,
  `diaDois` varchar(15) NOT NULL,
  `id_professor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `tbclasses_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `tbprofessores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbclasses`
--

LOCK TABLES `tbclasses` WRITE;
/*!40000 ALTER TABLE `tbclasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbfuncionarios`
--

DROP TABLE IF EXISTS `tbfuncionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbfuncionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfuncionarios`
--

LOCK TABLES `tbfuncionarios` WRITE;
/*!40000 ALTER TABLE `tbfuncionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbfuncionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmensalidades`
--

DROP TABLE IF EXISTS `tbmensalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmensalidades` (
  `id_aluno` int(11) NOT NULL,
  `mesAno` date NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id_aluno`,`mesAno`),
  CONSTRAINT `tbmensalidades_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `tbalunos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmensalidades`
--

LOCK TABLES `tbmensalidades` WRITE;
/*!40000 ALTER TABLE `tbmensalidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbmensalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbnotas`
--

DROP TABLE IF EXISTS `tbnotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbnotas` (
  `id_aluno` int(11) NOT NULL,
  `id_prova` int(11) NOT NULL,
  `bimestre` int(11) NOT NULL,
  `nota` float DEFAULT NULL,
  PRIMARY KEY (`id_aluno`,`id_prova`,`bimestre`),
  KEY `id_prova` (`id_prova`),
  CONSTRAINT `tbnotas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `tbalunos` (`id`),
  CONSTRAINT `tbnotas_ibfk_2` FOREIGN KEY (`id_prova`) REFERENCES `tbprovas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbnotas`
--

LOCK TABLES `tbnotas` WRITE;
/*!40000 ALTER TABLE `tbnotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbnotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbprofessores`
--

DROP TABLE IF EXISTS `tbprofessores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbprofessores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprofessores`
--

LOCK TABLES `tbprofessores` WRITE;
/*!40000 ALTER TABLE `tbprofessores` DISABLE KEYS */;
INSERT INTO `tbprofessores` VALUES (1,'Thiago','9999-99999','1982-06-21','thiago@professor.com',2300);
/*!40000 ALTER TABLE `tbprofessores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbprovas`
--

DROP TABLE IF EXISTS `tbprovas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbprovas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprovas`
--

LOCK TABLES `tbprovas` WRITE;
/*!40000 ALTER TABLE `tbprovas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbprovas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbresponsaveis`
--

DROP TABLE IF EXISTS `tbresponsaveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbresponsaveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbresponsaveis`
--

LOCK TABLES `tbresponsaveis` WRITE;
/*!40000 ALTER TABLE `tbresponsaveis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbresponsaveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsalariofuncionarios`
--

DROP TABLE IF EXISTS `tbsalariofuncionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsalariofuncionarios` (
  `id_funcionario` int(11) NOT NULL,
  `mesAno` date NOT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`,`mesAno`),
  CONSTRAINT `tbsalariofuncionarios_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `tbfuncionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsalariofuncionarios`
--

LOCK TABLES `tbsalariofuncionarios` WRITE;
/*!40000 ALTER TABLE `tbsalariofuncionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbsalariofuncionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsalarioprofessores`
--

DROP TABLE IF EXISTS `tbsalarioprofessores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsalarioprofessores` (
  `id_professor` int(11) NOT NULL,
  `mesAno` date NOT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id_professor`,`mesAno`),
  CONSTRAINT `tbsalarioprofessores_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `tbprofessores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsalarioprofessores`
--

LOCK TABLES `tbsalarioprofessores` WRITE;
/*!40000 ALTER TABLE `tbsalarioprofessores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbsalarioprofessores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbusuarios`
--

DROP TABLE IF EXISTS `tbusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbusuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `login` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbusuarios`
--

LOCK TABLES `tbusuarios` WRITE;
/*!40000 ALTER TABLE `tbusuarios` DISABLE KEYS */;
INSERT INTO `tbusuarios` VALUES (1,'Usuario','user','123456'),(2,'Administrador','admin','123456');
/*!40000 ALTER TABLE `tbusuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-30 16:51:04
