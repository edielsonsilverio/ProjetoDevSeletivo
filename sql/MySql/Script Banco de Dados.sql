-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: grupo_estudo_web
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20220313194359_AdicionarUsuario','6.0.1'),('20220313194639_TabelaAdministrativo','6.0.1'),('20220313194731_TabelaCadastroBase','6.0.1'),('20220313194743_TabelaTributo','6.0.1');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(95) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(95) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(95) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(95) NOT NULL,
  `ProviderKey` varchar(95) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(95) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(95) NOT NULL,
  `RoleId` varchar(95) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(95) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(95) NOT NULL,
  `LoginProvider` varchar(95) NOT NULL,
  `Name` varchar(95) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco_agencia`
--

DROP TABLE IF EXISTS `banco_agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banco_agencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) DEFAULT NULL,
  `digito` varchar(1) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  `gerente` varchar(100) DEFAULT NULL,
  `banco_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_banco_agencia_banco_id` (`banco_id`),
  CONSTRAINT `FK_banco_agencia_banco_banco_id` FOREIGN KEY (`banco_id`) REFERENCES `banco` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco_agencia`
--

LOCK TABLES `banco_agencia` WRITE;
/*!40000 ALTER TABLE `banco_agencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco_agencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco_conta_caixa`
--

DROP TABLE IF EXISTS `banco_conta_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banco_conta_caixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) DEFAULT NULL,
  `digito` varchar(1) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `banco_agencia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_banco_conta_caixa_banco_agencia_id` (`banco_agencia_id`),
  CONSTRAINT `FK_banco_conta_caixa_banco_agencia_banco_agencia_id` FOREIGN KEY (`banco_agencia_id`) REFERENCES `banco_agencia` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco_conta_caixa`
--

LOCK TABLES `banco_conta_caixa` WRITE;
/*!40000 ALTER TABLE `banco_conta_caixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco_conta_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `salario` decimal(65,30) DEFAULT NULL,
  `cbo_1994` varchar(10) DEFAULT NULL,
  `cbo_2002` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'ADMINISTRADOR','ADMINISTRADOR',5000.000000000000000000000000000000,NULL,'252105'),(2,'VENDEDOR','VENDEDOR',5000.000000000000000000000000000000,'252105','252105'),(3,'DESENVOLVEDOR','DESENVOLVEDOR',5000.000000000000000000000000000000,NULL,'252105'),(5,'ESTAGIARIO','ESTAGIARIO',5000.000000000000000000000000000000,NULL,'252105'),(6,'DIRETOR','DIRETOR',5000.000000000000000000000000000000,NULL,'252105'),(8,'ENTREGADOR','ENTREGADOR',5000.000000000000000000000000000000,NULL,'252105');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbo`
--

DROP TABLE IF EXISTS `cbo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cbo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `codigo_1994` varchar(10) DEFAULT NULL,
  `nome` varchar(250) DEFAULT NULL,
  `observacao` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbo`
--

LOCK TABLES `cbo` WRITE;
/*!40000 ALTER TABLE `cbo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cep`
--

DROP TABLE IF EXISTS `cep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(8) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `codigo_ibge_municipio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cep`
--

LOCK TABLES `cep` WRITE;
/*!40000 ALTER TABLE `cep` DISABLE KEYS */;
/*!40000 ALTER TABLE `cep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfop`
--

DROP TABLE IF EXISTS `cfop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `aplicacao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfop`
--

LOCK TABLES `cfop` WRITE;
/*!40000 ALTER TABLE `cfop` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `desde` datetime(6) DEFAULT NULL,
  `data_cadastro` datetime(6) DEFAULT NULL,
  `taxa_desconto` decimal(18,6) DEFAULT NULL,
  `limite_credito` decimal(18,6) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_cliente_pessoa_id` (`pessoa_id`),
  CONSTRAINT `FK_cliente_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnae`
--

DROP TABLE IF EXISTS `cnae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cnae` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(7) DEFAULT NULL,
  `denominacao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnae`
--

LOCK TABLES `cnae` WRITE;
/*!40000 ALTER TABLE `cnae` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo_gps`
--

DROP TABLE IF EXISTS `codigo_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigo_gps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_gps`
--

LOCK TABLES `codigo_gps` WRITE;
/*!40000 ALTER TABLE `codigo_gps` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigo_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csosn`
--

DROP TABLE IF EXISTS `csosn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csosn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `observacao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csosn`
--

LOCK TABLES `csosn` WRITE;
/*!40000 ALTER TABLE `csosn` DISABLE KEYS */;
/*!40000 ALTER TABLE `csosn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cst_cofins`
--

DROP TABLE IF EXISTS `cst_cofins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cst_cofins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cst_cofins`
--

LOCK TABLES `cst_cofins` WRITE;
/*!40000 ALTER TABLE `cst_cofins` DISABLE KEYS */;
/*!40000 ALTER TABLE `cst_cofins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cst_icms`
--

DROP TABLE IF EXISTS `cst_icms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cst_icms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cst_icms`
--

LOCK TABLES `cst_icms` WRITE;
/*!40000 ALTER TABLE `cst_icms` DISABLE KEYS */;
/*!40000 ALTER TABLE `cst_icms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cst_ipi`
--

DROP TABLE IF EXISTS `cst_ipi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cst_ipi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cst_ipi`
--

LOCK TABLES `cst_ipi` WRITE;
/*!40000 ALTER TABLE `cst_ipi` DISABLE KEYS */;
/*!40000 ALTER TABLE `cst_ipi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cst_pis`
--

DROP TABLE IF EXISTS `cst_pis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cst_pis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cst_pis`
--

LOCK TABLES `cst_pis` WRITE;
/*!40000 ALTER TABLE `cst_pis` DISABLE KEYS */;
/*!40000 ALTER TABLE `cst_pis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(150) DEFAULT NULL,
  `nome_fantasia` varchar(150) DEFAULT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `inscricao_estadual` varchar(45) DEFAULT NULL,
  `inscricao_municipal` varchar(45) DEFAULT NULL,
  `tipo_regime` varchar(1) DEFAULT NULL,
  `crt` varchar(1) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `site` varchar(250) DEFAULT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `data_constituicao` datetime(6) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `inscricao_junta_comercial` varchar(30) DEFAULT NULL,
  `data_insc_junta_comercial` datetime(6) DEFAULT NULL,
  `codigo_ibge_cidade` int(11) DEFAULT NULL,
  `codigo_ibge_uf` int(11) DEFAULT NULL,
  `cei` varchar(12) DEFAULT NULL,
  `codigo_cnae_principal` varchar(7) DEFAULT NULL,
  `imagem_logo_tipo` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_cnae`
--

DROP TABLE IF EXISTS `empresa_cnae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_cnae` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `principal` varchar(1) DEFAULT NULL,
  `ramo_atividade` varchar(50) DEFAULT NULL,
  `objeto_social` varchar(500) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_empresa_cnae_empresa_id` (`empresa_id`),
  CONSTRAINT `FK_empresa_cnae_empresa_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_cnae`
--

LOCK TABLES `empresa_cnae` WRITE;
/*!40000 ALTER TABLE `empresa_cnae` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_cnae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_contato`
--

DROP TABLE IF EXISTS `empresa_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_empresa_contato_empresa_id` (`empresa_id`),
  CONSTRAINT `FK_empresa_contato_empresa_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_contato`
--

LOCK TABLES `empresa_contato` WRITE;
/*!40000 ALTER TABLE `empresa_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_endereco`
--

DROP TABLE IF EXISTS `empresa_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `municipio_ibge` int(11) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `principal` varchar(1) DEFAULT NULL,
  `entrega` varchar(1) DEFAULT NULL,
  `cobranca` varchar(1) DEFAULT NULL,
  `correspondencia` varchar(1) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_empresa_endereco_empresa_id` (`empresa_id`),
  CONSTRAINT `FK_empresa_endereco_empresa_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_endereco`
--

LOCK TABLES `empresa_endereco` WRITE;
/*!40000 ALTER TABLE `empresa_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_telefone`
--

DROP TABLE IF EXISTS `empresa_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_empresa_telefone_empresa_id` (`empresa_id`),
  CONSTRAINT `FK_empresa_telefone_empresa_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_telefone`
--

LOCK TABLES `empresa_telefone` WRITE;
/*!40000 ALTER TABLE `empresa_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_civil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feriado`
--

DROP TABLE IF EXISTS `feriado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feriado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ano` varchar(4) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `abrangencia` varchar(1) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `municipio_ibge` int(11) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `data_feriado` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feriado`
--

LOCK TABLES `feriado` WRITE;
/*!40000 ALTER TABLE `feriado` DISABLE KEYS */;
/*!40000 ALTER TABLE `feriado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `desde` datetime(6) DEFAULT NULL,
  `data_cadastro` datetime(6) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_fornecedor_pessoa_id` (`pessoa_id`),
  CONSTRAINT `FK_fornecedor_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uf_id` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `codigo_ibge` int(11) DEFAULT NULL,
  `codigo_receita_federal` int(11) DEFAULT NULL,
  `codigo_estadual` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_municipio_uf_id` (`uf_id`),
  CONSTRAINT `FK_municipio_uf_uf_id` FOREIGN KEY (`uf_id`) REFERENCES `uf` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ncm`
--

DROP TABLE IF EXISTS `ncm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ncm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `observacao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncm`
--

LOCK TABLES `ncm` WRITE;
/*!40000 ALTER TABLE `ncm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ncm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_formacao`
--

DROP TABLE IF EXISTS `nivel_formacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_formacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_formacao`
--

LOCK TABLES `nivel_formacao` WRITE;
/*!40000 ALTER TABLE `nivel_formacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivel_formacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) DEFAULT NULL,
  `nome_en` varchar(250) DEFAULT NULL,
  `nome_ptbr` varchar(250) DEFAULT NULL,
  `sigla2` varchar(2) DEFAULT NULL,
  `sigla3` varchar(3) DEFAULT NULL,
  `codigo_bacen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `site` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `eh_cliente` varchar(1) DEFAULT NULL,
  `eh_fornecedor` varchar(1) DEFAULT NULL,
  `eh_transportadora` varchar(1) DEFAULT NULL,
  `eh_colaborador` varchar(1) DEFAULT NULL,
  `eh_contador` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_contato`
--

DROP TABLE IF EXISTS `pessoa_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_pessoa_contato_pessoa_id` (`pessoa_id`),
  CONSTRAINT `FK_pessoa_contato_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_endereco`
--

DROP TABLE IF EXISTS `pessoa_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `municipio_ibge` int(11) NOT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `principal` varchar(1) DEFAULT NULL,
  `entrega` varchar(1) DEFAULT NULL,
  `cobranca` varchar(1) DEFAULT NULL,
  `correspondencia` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_pessoa_endereco_pessoa_id` (`pessoa_id`),
  CONSTRAINT `FK_pessoa_endereco_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_fisica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `nivel_formacao_id` int(11) NOT NULL,
  `estado_civil_id` int(11) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `orgao_rg` varchar(20) DEFAULT NULL,
  `data_emissao_rg` datetime(6) DEFAULT NULL,
  `data_nascimento` datetime(6) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `raca` varchar(1) DEFAULT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL,
  `naturalidade` varchar(100) DEFAULT NULL,
  `nome_pai` varchar(200) DEFAULT NULL,
  `nome_mae` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_pessoa_fisica_pessoa_id` (`pessoa_id`),
  KEY `IX_pessoa_fisica_estado_civil_id` (`estado_civil_id`),
  KEY `IX_pessoa_fisica_nivel_formacao_id` (`nivel_formacao_id`),
  CONSTRAINT `FK_pessoa_fisica_estado_civil_estado_civil_id` FOREIGN KEY (`estado_civil_id`) REFERENCES `estado_civil` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_pessoa_fisica_nivel_formacao_nivel_formacao_id` FOREIGN KEY (`nivel_formacao_id`) REFERENCES `nivel_formacao` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_pessoa_fisica_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_fisica`
--

LOCK TABLES `pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `pessoa_fisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_juridica`
--

DROP TABLE IF EXISTS `pessoa_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_juridica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `nome_fantasia` varchar(100) DEFAULT NULL,
  `inscricao_estadual` varchar(45) DEFAULT NULL,
  `inscricao_municipal` varchar(45) DEFAULT NULL,
  `data_constituicao` datetime(6) DEFAULT NULL,
  `tipo_regime` varchar(1) DEFAULT NULL,
  `crt` varchar(1) DEFAULT NULL,
  `cnae` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_pessoa_juridica_pessoa_id` (`pessoa_id`),
  CONSTRAINT `FK_pessoa_juridica_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_juridica`
--

LOCK TABLES `pessoa_juridica` WRITE;
/*!40000 ALTER TABLE `pessoa_juridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_telefone`
--

DROP TABLE IF EXISTS `pessoa_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_pessoa_telefone_pessoa_id` (`pessoa_id`),
  CONSTRAINT `FK_pessoa_telefone_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_telefone`
--

LOCK TABLES `pessoa_telefone` WRITE;
/*!40000 ALTER TABLE `pessoa_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `gtin` varchar(14) DEFAULT NULL,
  `codigo_interno` varchar(10) DEFAULT NULL,
  `valor_compra` decimal(18,6) DEFAULT NULL,
  `valor_venda` decimal(18,6) DEFAULT NULL,
  `codigo_ncm` varchar(8) DEFAULT NULL,
  `estoque_minimo` decimal(18,6) DEFAULT NULL,
  `estoque_maximo` decimal(18,6) DEFAULT NULL,
  `quantidade_estoque` decimal(18,6) DEFAULT NULL,
  `data_cadastro` datetime(6) DEFAULT NULL,
  `tributo_icms_custom_cab_id` int(11) DEFAULT NULL,
  `tributo_grupo_tributario_id` int(11) DEFAULT NULL,
  `produto_sub_grupo_id` int(11) NOT NULL,
  `produto_marca_id` int(11) NOT NULL,
  `produto_unidade_id` int(11) NOT NULL,
  `foto` longblob,
  PRIMARY KEY (`id`),
  KEY `IX_produto_produto_marca_id` (`produto_marca_id`),
  KEY `IX_produto_produto_sub_grupo_id` (`produto_sub_grupo_id`),
  KEY `IX_produto_produto_unidade_id` (`produto_unidade_id`),
  CONSTRAINT `FK_produto_produto_marca_produto_marca_id` FOREIGN KEY (`produto_marca_id`) REFERENCES `produto_marca` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_produto_produto_subgrupo_produto_sub_grupo_id` FOREIGN KEY (`produto_sub_grupo_id`) REFERENCES `produto_subgrupo` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_produto_produto_unidade_produto_unidade_id` FOREIGN KEY (`produto_unidade_id`) REFERENCES `produto_unidade` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_grupo`
--

DROP TABLE IF EXISTS `produto_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_marca`
--

DROP TABLE IF EXISTS `produto_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_marca`
--

LOCK TABLES `produto_marca` WRITE;
/*!40000 ALTER TABLE `produto_marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_subgrupo`
--

DROP TABLE IF EXISTS `produto_subgrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_subgrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `produto_grupo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_produto_subgrupo_produto_grupo_id` (`produto_grupo_id`),
  CONSTRAINT `FK_produto_subgrupo_produto_grupo_produto_grupo_id` FOREIGN KEY (`produto_grupo_id`) REFERENCES `produto_grupo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_subgrupo`
--

LOCK TABLES `produto_subgrupo` WRITE;
/*!40000 ALTER TABLE `produto_subgrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_subgrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_unidade`
--

DROP TABLE IF EXISTS `produto_unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_unidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(10) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `pode_fracionar` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unidade`
--

LOCK TABLES `produto_unidade` WRITE;
/*!40000 ALTER TABLE `produto_unidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_unidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario_minimo`
--

DROP TABLE IF EXISTS `salario_minimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario_minimo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vigencia` datetime(6) DEFAULT NULL,
  `valor_mensal` decimal(18,6) DEFAULT NULL,
  `valor_diario` decimal(18,6) DEFAULT NULL,
  `valor_hora` decimal(18,6) DEFAULT NULL,
  `norma_legal` varchar(100) DEFAULT NULL,
  `dou` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario_minimo`
--

LOCK TABLES `salario_minimo` WRITE;
/*!40000 ALTER TABLE `salario_minimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario_minimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportadora`
--

DROP TABLE IF EXISTS `transportadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL,
  `data_cadastro` datetime(6) DEFAULT NULL,
  `observacao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_transportadora_pessoa_id` (`pessoa_id`),
  CONSTRAINT `FK_transportadora_pessoa_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadora`
--

LOCK TABLES `transportadora` WRITE;
/*!40000 ALTER TABLE `transportadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_cofins`
--

DROP TABLE IF EXISTS `tributo_cofins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_cofins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tributo_configura_ofgt_id` int(11) DEFAULT NULL,
  `cst_cofins` varchar(2) DEFAULT NULL,
  `efd_tabela_435` varchar(2) DEFAULT NULL,
  `modalidade_base_calculo` varchar(1) DEFAULT NULL,
  `porcento_base_calculo` decimal(18,6) DEFAULT NULL,
  `aliquota_porcento` decimal(18,6) DEFAULT NULL,
  `aliquota_unidade` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo` decimal(18,6) DEFAULT NULL,
  `valor_pauta_fiscal` decimal(18,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_tributo_cofins_tributo_configura_ofgt_id` (`tributo_configura_ofgt_id`),
  CONSTRAINT `FK_tributo_cofins_tributo_configura_of_gt_tributo_configura_ofg~` FOREIGN KEY (`tributo_configura_ofgt_id`) REFERENCES `tributo_configura_of_gt` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_cofins`
--

LOCK TABLES `tributo_cofins` WRITE;
/*!40000 ALTER TABLE `tributo_cofins` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_cofins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_configura_of_gt`
--

DROP TABLE IF EXISTS `tributo_configura_of_gt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_configura_of_gt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tributo_grupo_tributario_id` int(11) DEFAULT NULL,
  `tributo_operacao_fiscal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_tributo_configura_of_gt_tributo_grupo_tributario_id` (`tributo_grupo_tributario_id`),
  KEY `IX_tributo_configura_of_gt_tributo_operacao_fiscal_id` (`tributo_operacao_fiscal_id`),
  CONSTRAINT `FK_tributo_configura_of_gt_tributo_grupo_tributario_tributo_gru~` FOREIGN KEY (`tributo_grupo_tributario_id`) REFERENCES `tributo_grupo_tributario` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_tributo_configura_of_gt_tributo_operacao_fiscal_tributo_oper~` FOREIGN KEY (`tributo_operacao_fiscal_id`) REFERENCES `tributo_operacao_fiscal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_configura_of_gt`
--

LOCK TABLES `tributo_configura_of_gt` WRITE;
/*!40000 ALTER TABLE `tributo_configura_of_gt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_configura_of_gt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_grupo_tributario`
--

DROP TABLE IF EXISTS `tributo_grupo_tributario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_grupo_tributario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `origem_mercadoria` varchar(1) DEFAULT NULL,
  `observacao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_grupo_tributario`
--

LOCK TABLES `tributo_grupo_tributario` WRITE;
/*!40000 ALTER TABLE `tributo_grupo_tributario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_grupo_tributario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_icms_custom_cab`
--

DROP TABLE IF EXISTS `tributo_icms_custom_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_icms_custom_cab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `origem_mercadoria` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_icms_custom_cab`
--

LOCK TABLES `tributo_icms_custom_cab` WRITE;
/*!40000 ALTER TABLE `tributo_icms_custom_cab` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_icms_custom_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_icms_custom_det`
--

DROP TABLE IF EXISTS `tributo_icms_custom_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_icms_custom_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tributo_icms_customcab_id` int(11) DEFAULT NULL,
  `uf_destino` varchar(2) DEFAULT NULL,
  `cfop` int(11) DEFAULT NULL,
  `csosn` varchar(3) DEFAULT NULL,
  `cst` varchar(2) DEFAULT NULL,
  `modalidade_bc` varchar(1) DEFAULT NULL,
  `aliquota` decimal(18,6) DEFAULT NULL,
  `valor_pauta` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo` decimal(18,6) DEFAULT NULL,
  `mva` decimal(18,6) DEFAULT NULL,
  `porcento_bc` decimal(18,6) DEFAULT NULL,
  `modalidade_bc_st` varchar(1) DEFAULT NULL,
  `aliquota_interna_st` decimal(18,6) DEFAULT NULL,
  `aliquota_interestadual_st` decimal(18,6) DEFAULT NULL,
  `porcento_bc_st` decimal(18,6) DEFAULT NULL,
  `aliquota_icms_st` decimal(18,6) DEFAULT NULL,
  `valor_pauta_st` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo_st` decimal(18,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_tributo_icms_custom_det_tributo_icms_customcab_id` (`tributo_icms_customcab_id`),
  CONSTRAINT `FK_tributo_icms_custom_det_tributo_icms_custom_cab_tributo_icms~` FOREIGN KEY (`tributo_icms_customcab_id`) REFERENCES `tributo_icms_custom_cab` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_icms_custom_det`
--

LOCK TABLES `tributo_icms_custom_det` WRITE;
/*!40000 ALTER TABLE `tributo_icms_custom_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_icms_custom_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_icms_uf`
--

DROP TABLE IF EXISTS `tributo_icms_uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_icms_uf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tributo_configura_ofgt_id` int(11) DEFAULT NULL,
  `uf_destino` varchar(2) DEFAULT NULL,
  `cfop` int(11) DEFAULT NULL,
  `csosn` varchar(3) DEFAULT NULL,
  `cst` varchar(2) DEFAULT NULL,
  `modalidade_bc` varchar(1) DEFAULT NULL,
  `aliquota` decimal(18,6) DEFAULT NULL,
  `valor_pauta` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo` decimal(18,6) DEFAULT NULL,
  `mva` decimal(18,6) DEFAULT NULL,
  `porcento_bc` decimal(18,6) DEFAULT NULL,
  `modalidade_bc_st` varchar(1) DEFAULT NULL,
  `aliquota_interna_st` decimal(18,6) DEFAULT NULL,
  `aliquota_interestadual_st` decimal(18,6) DEFAULT NULL,
  `porcento_bc_st` decimal(18,6) DEFAULT NULL,
  `aliquota_icms_st` decimal(18,6) DEFAULT NULL,
  `valor_pauta_st` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo_st` decimal(18,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_tributo_icms_uf_tributo_configura_ofgt_id` (`tributo_configura_ofgt_id`),
  CONSTRAINT `FK_tributo_icms_uf_tributo_configura_of_gt_tributo_configura_of~` FOREIGN KEY (`tributo_configura_ofgt_id`) REFERENCES `tributo_configura_of_gt` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_icms_uf`
--

LOCK TABLES `tributo_icms_uf` WRITE;
/*!40000 ALTER TABLE `tributo_icms_uf` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_icms_uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_ipi`
--

DROP TABLE IF EXISTS `tributo_ipi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_ipi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tributo_configura_ofgt_id` int(11) DEFAULT NULL,
  `cst_ipi` varchar(2) DEFAULT NULL,
  `modalidade_base_calculo` varchar(1) DEFAULT NULL,
  `porcento_base_calculo` decimal(18,6) DEFAULT NULL,
  `aliquota_porcento` decimal(18,6) DEFAULT NULL,
  `aliquota_unidade` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo` decimal(18,6) DEFAULT NULL,
  `valor_pauta_fiscal` decimal(18,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_tributo_ipi_tributo_configura_ofgt_id` (`tributo_configura_ofgt_id`),
  CONSTRAINT `FK_tributo_ipi_tributo_configura_of_gt_tributo_configura_ofgt_id` FOREIGN KEY (`tributo_configura_ofgt_id`) REFERENCES `tributo_configura_of_gt` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_ipi`
--

LOCK TABLES `tributo_ipi` WRITE;
/*!40000 ALTER TABLE `tributo_ipi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_ipi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_iss`
--

DROP TABLE IF EXISTS `tributo_iss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_iss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tributo_operacao_fiscal_id` int(11) DEFAULT NULL,
  `modalidade_base_calculo` varchar(1) DEFAULT NULL,
  `porcento_base_calculo` decimal(18,6) DEFAULT NULL,
  `aliquota_porcento` decimal(18,6) DEFAULT NULL,
  `aliquota_unidade` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo` decimal(18,6) DEFAULT NULL,
  `valor_pauta_fiscal` decimal(18,6) DEFAULT NULL,
  `item_lista_servico` int(11) DEFAULT NULL,
  `codigo_tributacao` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_tributo_iss_tributo_operacao_fiscal_id` (`tributo_operacao_fiscal_id`),
  CONSTRAINT `FK_tributo_iss_tributo_operacao_fiscal_tributo_operacao_fiscal_~` FOREIGN KEY (`tributo_operacao_fiscal_id`) REFERENCES `tributo_operacao_fiscal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_iss`
--

LOCK TABLES `tributo_iss` WRITE;
/*!40000 ALTER TABLE `tributo_iss` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_iss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_operacao_fiscal`
--

DROP TABLE IF EXISTS `tributo_operacao_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_operacao_fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `descricao_na_nf` varchar(100) DEFAULT NULL,
  `cfop` int(11) DEFAULT NULL,
  `observacao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_operacao_fiscal`
--

LOCK TABLES `tributo_operacao_fiscal` WRITE;
/*!40000 ALTER TABLE `tributo_operacao_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_operacao_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo_pis`
--

DROP TABLE IF EXISTS `tributo_pis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributo_pis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tributo_configura_ofgt_id` int(11) DEFAULT NULL,
  `cst_pis` varchar(2) DEFAULT NULL,
  `efd_tabela_435` varchar(2) DEFAULT NULL,
  `modalidade_base_calculo` varchar(1) DEFAULT NULL,
  `porcento_base_calculo` decimal(18,6) DEFAULT NULL,
  `aliquota_porcento` decimal(18,6) DEFAULT NULL,
  `aliquota_unidade` decimal(18,6) DEFAULT NULL,
  `valor_preco_maximo` decimal(18,6) DEFAULT NULL,
  `valor_pauta_fiscal` decimal(18,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_tributo_pis_tributo_configura_ofgt_id` (`tributo_configura_ofgt_id`),
  CONSTRAINT `FK_tributo_pis_tributo_configura_of_gt_tributo_configura_ofgt_id` FOREIGN KEY (`tributo_configura_ofgt_id`) REFERENCES `tributo_configura_of_gt` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo_pis`
--

LOCK TABLES `tributo_pis` WRITE;
/*!40000 ALTER TABLE `tributo_pis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributo_pis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(2) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `codigo_ibge` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-23  5:58:34
