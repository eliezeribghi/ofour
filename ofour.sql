-- MySQL dump 10.13  Distrib 9.1.0, for macos15.1 (arm64)
--
-- Host: localhost    Database: ofour
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (00000000000000000001,'Plats principaux',NULL,NULL),(00000000000000000002,'Plats principaux',NULL,NULL),(00000000000000000003,'Soupe',NULL,NULL),(00000000000000000004,'Plats principaux',NULL,NULL),(00000000000000000005,'Plats principaux',NULL,NULL),(00000000000000000006,'Desserts',NULL,NULL),(00000000000000000007,'Soupe',NULL,NULL),(00000000000000000008,'Desserts',NULL,NULL),(00000000000000000009,'Plats principaux',NULL,NULL),(00000000000000000010,'Desserts',NULL,NULL),(00000000000000000011,'Desserts',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapes_preparation`
--

DROP TABLE IF EXISTS `etapes_preparation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapes_preparation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recette_id` bigint unsigned NOT NULL,
  `numero_etape` int NOT NULL,
  `description_etape` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etapes_preparation_recette_id_foreign` (`recette_id`),
  CONSTRAINT `etapes_preparation_recette_id_foreign` FOREIGN KEY (`recette_id`) REFERENCES `recettes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapes_preparation`
--

LOCK TABLES `etapes_preparation` WRITE;
/*!40000 ALTER TABLE `etapes_preparation` DISABLE KEYS */;
INSERT INTO `etapes_preparation` VALUES (1,1,1,'Préparer la pâte brisée.',NULL,NULL),(2,1,2,'Faire revenir les lardons.',NULL,NULL),(3,1,3,'Mélanger les œufs et la crème.',NULL,NULL),(4,1,4,'Verser le mélange sur la pâte avec les lardons.',NULL,NULL),(5,1,5,'Ajouter le fromage râpé et cuire au four.',NULL,NULL),(6,2,1,'Couper les légumes en dés.',NULL,NULL),(7,2,2,'Faire revenir les légumes dans une poêle.',NULL,NULL),(8,2,3,'Laisser mijoter jusqu\'à ce que les légumes soient tendres.',NULL,NULL),(9,3,1,'Faire revenir les oignons.',NULL,NULL),(10,3,2,'Ajouter le bouillon et laisser mijoter.',NULL,NULL),(11,3,3,'Ajouter le pain et le fromage râpé.',NULL,NULL),(12,3,4,'Faire gratiner au four.',NULL,NULL),(13,4,1,'Faire revenir le bœuf.',NULL,NULL),(14,4,2,'Ajouter les légumes.',NULL,NULL),(15,4,3,'Ajouter le vin et laisser mijoter.',NULL,NULL),(16,5,1,'Faire revenir le poulet.',NULL,NULL),(17,5,2,'Ajouter les oignons et les champignons.',NULL,NULL),(18,5,3,'Ajouter le vin et laisser mijoter.',NULL,NULL),(19,6,1,'Préparer la pâte à crêpes.',NULL,NULL),(20,6,2,'Cuire les crêpes.',NULL,NULL),(21,6,3,'Préparer la sauce à l\'orange.',NULL,NULL),(22,6,4,'Flamber les crêpes avec la sauce.',NULL,NULL),(23,7,1,'Faire revenir les poissons et moules.',NULL,NULL),(24,7,2,'Ajouter les tomates et le bouillon.',NULL,NULL),(25,7,3,'Ajouter le safran et laisser mijoter.',NULL,NULL),(26,8,1,'Préparer le caramel avec le sucre et le beurre.',NULL,NULL),(27,8,2,'Ajouter les pommes au caramel.',NULL,NULL),(28,8,3,'Recouvrir de pâte brisée et cuire au four.',NULL,NULL),(29,9,1,'Beurrer les tranches de pain.',NULL,NULL),(30,9,2,'Ajouter le jambon et le fromage.',NULL,NULL),(31,9,3,'Griller les sandwiches.',NULL,NULL),(32,10,1,'Préparer la pâte sablée.',NULL,NULL),(33,10,2,'Préparer la garniture au citron.',NULL,NULL),(34,10,3,'Ajouter la meringue et cuire au four.',NULL,NULL),(35,11,1,'Préparer la crème avec le lait, les œufs et la vanille.',NULL,NULL),(36,11,2,'Verser dans des ramequins et cuire au bain-marie.',NULL,NULL),(37,11,3,'Caraméliser le sucre sur le dessus avant de servir.',NULL,NULL),(38,12,1,'Préparer le caramel avec le sucre et le beurre.',NULL,NULL),(39,12,2,'Ajouter les pommes au caramel.',NULL,NULL),(40,12,3,'Recouvrir de pâte brisée et cuire au four.',NULL,NULL),(41,13,1,'Préparer les blancs d\'œufs et battre en neige.',NULL,NULL),(42,13,2,'Mélanger les amandes et le sucre glace.',NULL,NULL),(43,13,3,'Former des petits tas et cuire au four.',NULL,NULL),(44,14,1,'Préparer la pâte à choux et la cuire.',NULL,NULL),(45,14,2,'Préparer la crème pâtissière au chocolat.',NULL,NULL),(46,14,3,'Garnir les éclairs avec la crème pâtissière.',NULL,NULL),(47,15,1,'Préparer la crème de mascarpone.',NULL,NULL),(48,15,2,'Tremper les biscuits dans le café.',NULL,NULL),(49,15,3,'Alterner les couches de biscuits et de crème.',NULL,NULL),(50,16,1,'Faire fondre le chocolat avec le beurre.',NULL,NULL),(51,16,2,'Incorporer les œufs et le sucre.',NULL,NULL),(52,16,3,'Cuire au four et servir immédiatement.',NULL,NULL),(53,17,1,'Mélanger les ingrédients et préparer la pâte.',NULL,NULL),(54,17,2,'Verser dans les moules à madeleines.',NULL,NULL),(55,17,3,'Cuire au four jusqu\'à ce qu\'elles soient dorées.',NULL,NULL),(56,18,1,'Préparer la pâte à choux et la cuire.',NULL,NULL),(57,18,2,'Garnir les choux avec la crème pâtissière.',NULL,NULL),(58,18,3,'Nappez de chocolat fondu.',NULL,NULL),(59,19,1,'Préparer la pâte et la laisser lever.',NULL,NULL),(60,19,2,'Cuire les babas au four.',NULL,NULL),(61,19,3,'Imbiber les babas de sirop au rhum.',NULL,NULL),(62,20,1,'Préparer la crème d\'amande.',NULL,NULL),(63,20,2,'Étaler la pâte feuilletée et garnir de crème.',NULL,NULL),(64,20,3,'Cuire au four et laisser refroidir.',NULL,NULL),(65,21,1,'Couper les tomates et haricots verts.',NULL,NULL),(66,21,2,'Mélanger les légumes avec les œufs durs, olives, thon et anchois.',NULL,NULL),(67,21,3,'Assaisonner avec de l\'huile d\'olive.',NULL,NULL),(68,22,1,'Faire caraméliser les oignons.',NULL,NULL),(69,22,2,'Ajouter le bouillon et laisser mijoter.',NULL,NULL),(70,22,3,'Servir avec du pain grillé et du fromage.',NULL,NULL),(71,23,1,'Trancher le foie gras.',NULL,NULL),(72,23,2,'Assaisonner avec fleur de sel et poivre.',NULL,NULL),(73,23,3,'Servir avec du pain d\'épices grillé.',NULL,NULL),(74,24,1,'Préparer la pâte brisée.',NULL,NULL),(75,24,2,'Mélanger les œufs, crème et lardons.',NULL,NULL),(76,24,3,'Verser le mélange sur la pâte et cuire.',NULL,NULL),(77,25,1,'Préparer la pâte et la farce de viande.',NULL,NULL),(78,25,2,'Assembler le pâté et le cuire.',NULL,NULL),(79,26,1,'Faire griller le pain et déposer une tranche de chèvre dessus.',NULL,NULL),(80,26,2,'Préparer la salade avec les noix et la vinaigrette.',NULL,NULL),(81,26,3,'Disposer le chèvre chaud sur la salade et servir.',NULL,NULL),(82,27,1,'Cuire les aubergines au four jusqu\'à ce qu\'elles soient tendres.',NULL,NULL),(83,27,2,'Mixer la chair des aubergines avec l\'ail, l\'huile d\'olive et le jus de citron.',NULL,NULL),(84,27,3,'Assaisonner avec du sel et servir.',NULL,NULL),(85,28,1,'Trancher finement le bœuf et disposer sur une assiette.',NULL,NULL),(86,28,2,'Parsemer de parmesan, roquette, huile et citron.',NULL,NULL),(87,28,3,'Servir immédiatement.',NULL,NULL),(88,29,1,'Cuire le saumon frais et l\'émietter.',NULL,NULL),(89,29,2,'Mélanger avec le saumon fumé, la crème et le citron.',NULL,NULL),(90,29,3,'Assaisonner avec l\'aneth et servir.',NULL,NULL),(91,30,1,'Hacher la viande et mélanger avec les ingrédients.',NULL,NULL),(92,30,2,'Verser le mélange dans une terrine et cuire au bain-marie.',NULL,NULL);
/*!40000 ALTER TABLE `etapes_preparation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recette_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Lardons',NULL,NULL,0),(2,'Œufs',NULL,NULL,0),(3,'Crème fraîche',NULL,NULL,0),(4,'Fromage râpé',NULL,NULL,0),(5,'Aubergine',NULL,NULL,0),(6,'Poivron',NULL,NULL,0),(7,'Courgette',NULL,NULL,0),(8,'Tomates',NULL,NULL,0),(9,'Oignons',NULL,NULL,0),(10,'Bouillon de légumes',NULL,NULL,0),(11,'Pain',NULL,NULL,0),(12,'Fromage râpé',NULL,NULL,0),(13,'Bœuf',NULL,NULL,0),(14,'Carottes',NULL,NULL,0),(15,'Vin rouge',NULL,NULL,0),(16,'Oignons',NULL,NULL,0),(17,'Poulet',NULL,NULL,0),(18,'Vin rouge',NULL,NULL,0),(19,'Oignons',NULL,NULL,0),(20,'Champignons',NULL,NULL,0),(21,'Farine',NULL,NULL,0),(22,'Œufs',NULL,NULL,0),(23,'Beurre',NULL,NULL,0),(24,'Orange',NULL,NULL,0),(25,'Poisson',NULL,NULL,0),(26,'Moules',NULL,NULL,0),(27,'Tomates',NULL,NULL,0),(28,'Safran',NULL,NULL,0),(29,'Pommes',NULL,NULL,0),(30,'Sucre',NULL,NULL,0),(31,'Beurre',NULL,NULL,0),(32,'Pâte brisée',NULL,NULL,0),(33,'Pain de mie',NULL,NULL,0),(34,'Jambon',NULL,NULL,0),(35,'Fromage',NULL,NULL,0),(36,'Beurre',NULL,NULL,0),(37,'Citron',NULL,NULL,0),(38,'Sucre',NULL,NULL,0),(39,'Œufs',NULL,NULL,0),(40,'Pâte sablée',NULL,NULL,0),(41,'Crème',NULL,NULL,0),(42,'Œufs',NULL,NULL,0),(43,'Sucre',NULL,NULL,0),(44,'Vanille',NULL,NULL,0),(45,'Pommes',NULL,NULL,0),(46,'Sucre',NULL,NULL,0),(47,'Beurre',NULL,NULL,0),(48,'Pâte brisée',NULL,NULL,0),(49,'Amandes',NULL,NULL,0),(50,'Blancs d\'œufs',NULL,NULL,0),(51,'Sucre glace',NULL,NULL,0),(52,'Colorant alimentaire',NULL,NULL,0),(53,'Pâte à choux',NULL,NULL,0),(54,'Chocolat',NULL,NULL,0),(55,'Crème pâtissière',NULL,NULL,0),(56,'Sucre',NULL,NULL,0),(57,'Mascarpone',NULL,NULL,0),(58,'Œufs',NULL,NULL,0),(59,'Café',NULL,NULL,0),(60,'Biscuit à la cuillère',NULL,NULL,0),(61,'Chocolat',NULL,NULL,0),(62,'Œufs',NULL,NULL,0),(63,'Beurre',NULL,NULL,0),(64,'Sucre',NULL,NULL,0),(65,'Farine',NULL,NULL,0),(66,'Beurre',NULL,NULL,0),(67,'Œufs',NULL,NULL,0),(68,'Sucre',NULL,NULL,0),(69,'Pâte à choux',NULL,NULL,0),(70,'Crème pâtissière',NULL,NULL,0),(71,'Chocolat',NULL,NULL,0),(72,'Sucre',NULL,NULL,0),(73,'Farine',NULL,NULL,0),(74,'Levure',NULL,NULL,0),(75,'Rhum',NULL,NULL,0),(76,'Sucre',NULL,NULL,0),(77,'Pâte feuilletée',NULL,NULL,0),(78,'Crème d\'amande',NULL,NULL,0),(79,'Œufs',NULL,NULL,0),(80,'Sucre',NULL,NULL,0),(81,'Tomates',NULL,NULL,0),(82,'Haricots verts',NULL,NULL,0),(83,'Œufs durs',NULL,NULL,0),(84,'Olives noires',NULL,NULL,0),(85,'Thon',NULL,NULL,0),(86,'Anchois',NULL,NULL,0),(87,'Oignons',NULL,NULL,0),(88,'Bouillon de bœuf',NULL,NULL,0),(89,'Pain',NULL,NULL,0),(90,'Fromage râpé',NULL,NULL,0),(91,'Foie gras',NULL,NULL,0),(92,'Pain d\'épices',NULL,NULL,0),(93,'Fleur de sel',NULL,NULL,0),(94,'Poivre noir',NULL,NULL,0),(95,'Lardons',NULL,NULL,0),(96,'Œufs',NULL,NULL,0),(97,'Crème fraîche',NULL,NULL,0),(98,'Pâte brisée',NULL,NULL,0),(99,'Gruyère râpé',NULL,NULL,0),(100,'Farine',NULL,NULL,0),(101,'Viande de porc hachée',NULL,NULL,0),(102,'Œufs',NULL,NULL,0),(103,'Beurre',NULL,NULL,0),(104,'Chèvre',NULL,NULL,0),(105,'Pain',NULL,NULL,0),(106,'Salade verte',NULL,NULL,0),(107,'Noix',NULL,NULL,0),(108,'Vinaigrette',NULL,NULL,0),(109,'Aubergines',NULL,NULL,0),(110,'Ail',NULL,NULL,0),(111,'Huile d\'olive',NULL,NULL,0),(112,'Citron',NULL,NULL,0),(113,'Sel',NULL,NULL,0),(114,'Bœuf',NULL,NULL,0),(115,'Parmesan',NULL,NULL,0),(116,'Roquette',NULL,NULL,0),(117,'Huile d\'olive',NULL,NULL,0),(118,'Citron',NULL,NULL,0),(119,'Saumon frais',NULL,NULL,0),(120,'Saumon fumé',NULL,NULL,0),(121,'Crème fraîche',NULL,NULL,0),(122,'Citron',NULL,NULL,0),(123,'Aneth',NULL,NULL,0),(124,'Porc',NULL,NULL,0),(125,'Foie de volaille',NULL,NULL,0),(126,'Oeufs',NULL,NULL,0),(127,'Cognac',NULL,NULL,0),(128,'Échalotes',NULL,NULL,0);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2023_10_13_130843_create_categories_table',1),(3,'2023_10_13_130924_create_ingredients_table',2),(4,'2023_10_13_130956_create_recettes_table',2),(5,'2023_10_13_131023_create_recette_ingredients_table',2),(6,'2023_10_13_131050_create_etapes_preparation_table',2),(7,'2023_10_13_143117_add_recette_id_to_ingredients_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recette_ingredients`
--

DROP TABLE IF EXISTS `recette_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recette_ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recette_id` bigint unsigned NOT NULL,
  `ingredient_id` bigint unsigned NOT NULL,
  `quantite` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recette_ingredients_recette_id_foreign` (`recette_id`),
  KEY `recette_ingredients_ingredient_id_foreign` (`ingredient_id`),
  CONSTRAINT `recette_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `recette_ingredients_recette_id_foreign` FOREIGN KEY (`recette_id`) REFERENCES `recettes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recette_ingredients`
--

LOCK TABLES `recette_ingredients` WRITE;
/*!40000 ALTER TABLE `recette_ingredients` DISABLE KEYS */;
INSERT INTO `recette_ingredients` VALUES (1,1,1,200,NULL,NULL),(2,1,2,3,NULL,NULL),(3,1,3,200,NULL,NULL),(4,1,4,100,NULL,NULL),(5,2,5,1,NULL,NULL),(6,2,6,1,NULL,NULL),(7,2,7,1,NULL,NULL),(8,2,8,3,NULL,NULL),(9,3,9,4,NULL,NULL),(10,3,10,1,NULL,NULL),(11,3,11,4,NULL,NULL),(12,3,12,100,NULL,NULL),(13,4,13,1,NULL,NULL),(14,4,14,4,NULL,NULL),(15,4,15,750,NULL,NULL),(16,4,16,2,NULL,NULL),(17,5,17,1,NULL,NULL),(18,5,18,750,NULL,NULL),(19,5,19,2,NULL,NULL),(20,5,20,200,NULL,NULL),(21,6,21,250,NULL,NULL),(22,6,22,2,NULL,NULL),(23,6,23,50,NULL,NULL),(24,6,24,2,NULL,NULL),(25,7,25,500,NULL,NULL),(26,7,26,500,NULL,NULL),(27,7,27,4,NULL,NULL),(28,7,28,1,NULL,NULL),(29,8,29,6,NULL,NULL),(30,8,30,150,NULL,NULL),(31,8,31,100,NULL,NULL),(32,8,32,1,NULL,NULL),(33,9,33,8,NULL,NULL),(34,9,34,4,NULL,NULL),(35,9,35,4,NULL,NULL),(36,9,36,50,NULL,NULL),(37,10,37,3,NULL,NULL),(38,10,38,150,NULL,NULL),(39,10,39,4,NULL,NULL),(40,10,40,1,NULL,NULL),(41,11,41,500,NULL,NULL),(42,11,42,4,NULL,NULL),(43,11,43,100,NULL,NULL),(44,11,44,1,NULL,NULL),(45,12,45,6,NULL,NULL),(46,12,46,150,NULL,NULL),(47,12,47,100,NULL,NULL),(48,12,48,1,NULL,NULL),(49,13,49,150,NULL,NULL),(50,13,50,100,NULL,NULL),(51,13,51,200,NULL,NULL),(52,13,52,0,NULL,NULL),(53,14,53,500,NULL,NULL),(54,14,54,200,NULL,NULL),(55,14,55,400,NULL,NULL),(56,14,56,100,NULL,NULL),(57,15,57,250,NULL,NULL),(58,15,58,4,NULL,NULL),(59,15,59,300,NULL,NULL),(60,15,60,200,NULL,NULL),(61,16,61,200,NULL,NULL),(62,16,62,4,NULL,NULL),(63,16,63,50,NULL,NULL),(64,16,64,100,NULL,NULL),(65,17,65,200,NULL,NULL),(66,17,66,100,NULL,NULL),(67,17,67,2,NULL,NULL),(68,17,68,150,NULL,NULL),(69,18,69,500,NULL,NULL),(70,18,70,400,NULL,NULL),(71,18,71,200,NULL,NULL),(72,18,72,100,NULL,NULL),(73,19,73,250,NULL,NULL),(74,19,74,10,NULL,NULL),(75,19,75,100,NULL,NULL),(76,19,76,150,NULL,NULL),(77,20,77,2,NULL,NULL),(78,20,78,250,NULL,NULL),(79,20,79,1,NULL,NULL),(80,20,80,100,NULL,NULL),(81,21,81,200,NULL,NULL),(82,21,82,150,NULL,NULL),(83,21,83,3,NULL,NULL),(84,21,84,50,NULL,NULL),(85,21,85,100,NULL,NULL),(86,21,86,50,NULL,NULL),(87,22,87,500,NULL,NULL),(88,22,88,1,NULL,NULL),(89,22,89,4,NULL,NULL),(90,22,90,100,NULL,NULL),(91,23,91,200,NULL,NULL),(92,23,92,4,NULL,NULL),(93,23,93,1,NULL,NULL),(94,23,94,1,NULL,NULL),(95,24,95,150,NULL,NULL),(96,24,96,3,NULL,NULL),(97,24,97,200,NULL,NULL),(98,24,98,1,NULL,NULL),(99,24,99,100,NULL,NULL),(100,25,100,300,NULL,NULL),(101,25,101,500,NULL,NULL),(102,25,102,3,NULL,NULL),(103,25,103,100,NULL,NULL),(104,26,104,100,NULL,NULL),(105,26,105,4,NULL,NULL),(106,26,106,150,NULL,NULL),(107,26,107,50,NULL,NULL),(108,26,108,3,NULL,NULL),(109,27,109,2,NULL,NULL),(110,27,110,2,NULL,NULL),(111,27,111,4,NULL,NULL),(112,27,112,1,NULL,NULL),(113,27,113,1,NULL,NULL),(114,28,114,200,NULL,NULL),(115,28,115,50,NULL,NULL),(116,28,116,50,NULL,NULL),(117,28,117,2,NULL,NULL),(118,28,118,1,NULL,NULL),(119,29,119,200,NULL,NULL),(120,29,120,100,NULL,NULL),(121,29,121,100,NULL,NULL),(122,29,122,1,NULL,NULL),(123,29,123,1,NULL,NULL),(124,30,124,500,NULL,NULL),(125,30,125,200,NULL,NULL),(126,30,126,2,NULL,NULL),(127,30,127,50,NULL,NULL),(128,30,128,3,NULL,NULL);
/*!40000 ALTER TABLE `recette_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recettes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` bigint unsigned NOT NULL,
  `temps_preparation` int NOT NULL,
  `temps_cuisson` int NOT NULL,
  `niveau_difficulte` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_moyenne` decimal(3,2) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recettes_categorie_id_foreign` (`categorie_id`),
  CONSTRAINT `recettes_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recettes`
--

LOCK TABLES `recettes` WRITE;
/*!40000 ALTER TABLE `recettes` DISABLE KEYS */;
INSERT INTO `recettes` VALUES (1,'Quiche Lorraine','Une quiche savoureuse avec du lard, des œufs et de la crème.',1,20,45,'Moyen','quiche_lorraine.png',4.40,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Ratatouille','Un plat provençal traditionnel avec des légumes frais.',2,20,40,'Facile','ratatouille.png',4.80,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Soupe à l’Oignon','Une soupe chaude et réconfortante à base d\'oignons caramélisés.',3,10,30,'Facile','soupe_oignon.png',4.40,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Bœuf Bourguignon','Un ragoût de bœuf cuit lentement dans du vin rouge avec des légumes.',4,30,180,'Difficile','boeuf_bourguignon.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Coq au Vin','Un poulet braisé dans du vin rouge avec des champignons et des oignons.',5,30,120,'Difficile','coq_au_vin.png',4.60,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Crêpes Suzette','Des crêpes flambées avec une sauce à l\'orange.',6,20,15,'Moyen','crepes_suzette.png',4.50,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Bouillabaisse','Une soupe de poisson méditerranéenne avec des moules et du safran.',7,30,60,'Difficile','bouillabaisse.png',4.60,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Tarte Tatin','Une tarte aux pommes caramélisées, renversée.',8,20,45,'Moyen','tarte_tatin.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Croque Monsieur','Un sandwich grillé au jambon et fromage.',9,10,10,'Facile','croque_monsieur.png',4.40,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Tarte au Citron Meringuée','Une tarte au citron avec une meringue légère.',10,20,50,'Moyen','tarte_citron.png',4.60,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'Crème Brûlée','Un dessert à base de crème épaisse avec une croûte de sucre caramélisé.',11,20,45,'Moyen','creme_brulee.png',4.80,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'Tarte Tatin','Une tarte aux pommes caramélisées, renversée.',11,20,45,'Moyen','tarte_tatin.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'Macaron','Petits gâteaux à base de meringue et de poudre d\'amandes.',11,30,15,'Difficile','macaron.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'Éclair au Chocolat','Une pâte à choux garnie de crème pâtissière au chocolat.',11,30,20,'Moyen','eclair_chocolat.png',4.60,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'Tiramisu','Un dessert italien à base de mascarpone, café et biscuits.',11,20,0,'Facile','tiramisu.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'Soufflé au Chocolat','Un dessert léger et aérien au chocolat.',11,15,20,'Moyen','souffle_chocolat.png',4.80,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'Madeleines','Petits gâteaux moelleux en forme de coquille.',11,15,10,'Facile','madeleines.png',4.60,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'Profiteroles','Petits choux garnis de crème et nappés de chocolat.',11,30,20,'Moyen','profiteroles.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'Baba au Rhum','Gâteau imbibé de rhum, souvent accompagné de crème fouettée.',11,20,30,'Moyen','baba_rhum.png',4.60,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'Galette des Rois','Une galette traditionnelle à la frangipane, servie lors de l\'Epiphanie.',11,30,30,'Facile','galette_rois.png',4.50,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'Salade Niçoise','Salade composée typique de la région niçoise.',12,20,0,'Facile','salade_nicoise.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'Soupe à l\'Oignon','Une soupe traditionnelle à base d\'oignons.',12,15,45,'Facile','soupe_oignon.png',4.80,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'Foie Gras','Foie gras servi avec pain d\'épices.',12,10,0,'Facile','foie_gras.png',4.90,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'Quiche Lorraine','Une tarte salée garnie de lardons et crème.',12,15,30,'Facile','quiche_lorraine.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'Pâté en Croûte','Un pâté de viande cuit dans une pâte.',12,45,60,'Difficile','pate_en_croute.png',4.80,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'Salade de Chèvre Chaud','Une salade verte garnie de fromage de chèvre chaud.',12,15,10,'Facile','salade_chevre_chaud.png',4.60,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'Caviar d\'Aubergines','Purée d\'aubergines assaisonnée à l\'ail et au citron.',12,10,30,'Facile','caviar_aubergines.png',4.50,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'Carpaccio de Bœuf','Bœuf finement tranché servi avec parmesan et roquette.',12,15,0,'Facile','carpaccio_boeuf.png',4.70,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'Rillettes de Saumon','Mélange de saumon frais et fumé avec crème et citron.',12,15,0,'Facile','rillettes_saumon.png',4.80,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'Terrine de Campagne','Terrine de porc rustique parfumée au cognac.',12,30,90,'Difficile','terrine_campagne.png',4.90,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `recettes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 19:13:58
