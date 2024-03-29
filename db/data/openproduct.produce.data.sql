-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: openproduct
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0ubuntu0.23.10.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `produce`
--

LOCK TABLES `produce` WRITE;
/*!40000 ALTER TABLE `produce` DISABLE KEYS */;
INSERT INTO `produce` (`id`, `fr`, `en`, `category`, `parent`) VALUES (1,'Lait',NULL,'L',NULL),
(2,'Oeufs',NULL,'V',NULL),
(3,'viande de boeuf',NULL,'V',NULL),
(4,'viande de mouton',NULL,'V',NULL),
(5,'charcuterie',NULL,'V',NULL),
(6,'viande de porc',NULL,'V',NULL),
(7,'fromage de vache',NULL,'L',9),
(8,'fromage de chèvre',NULL,'L',9),
(9,'fromage',NULL,'L',NULL),
(10,'Poulet',NULL,'V',NULL),
(11,'Poisson',NULL,'P',NULL),
(12,'Crustacés',NULL,'P',NULL),
(13,'pomme',NULL,'F',NULL),
(14,'Poire',NULL,'F',NULL),
(15,'raisins',NULL,'F',NULL),
(16,'autres fruits',NULL,'F',NULL),
(17,'pomme de terre',NULL,'C',NULL),
(18,'blé',NULL,'C',NULL),
(19,'farine de blé',NULL,'C',NULL),
(20,'farine de seigle',NULL,'C',NULL),
(21,'avoine',NULL,'C',NULL),
(22,'miel',NULL,'N',NULL),
(23,'citrouille',NULL,'M',NULL),
(24,'aubergine',NULL,'M',NULL),
(25,'carotte',NULL,'M',NULL),
(26,'Ecologique',NULL,'99',NULL),
(27,'armes à feu',NULL,'R',NULL),
(28,'instruments de musique',NULL,'L',NULL),
(29,'vitre',NULL,'V',NULL),
(30,'Vitrail',NULL,'V',NULL),
(31,'objets en verre',NULL,'V',NULL),
(32,'outils de jardins',NULL,'F',NULL),
(33,'tapis',NULL,'E',NULL),
(34,'cire',NULL,'E',NULL),
(35,'orfèvre',NULL,'E',NULL),
(36,'jeux en bois',NULL,'J',NULL),
(37,'pantallon',NULL,'H',NULL),
(38,'pull en laine',NULL,'H',NULL),
(39,'dentelle',NULL,'D',NULL),
(40,'broderie',NULL,'D',NULL),
(41,'couture divers',NULL,'T',NULL),
(42,'costume',NULL,'T',NULL),
(43,'canne',NULL,'A',NULL),
(44,'pipe',NULL,'A',NULL),
(45,'péruque',NULL,'A',NULL),
(46,'chapeau',NULL,'C',NULL),
(47,'sabot',NULL,'K',NULL),
(48,'chaussures en cuir',NULL,'K',NULL),
(49,'basket',NULL,'K',NULL),
(50,'chaussons',NULL,'K',NULL),
(51,'sous-vêtements',NULL,'H',NULL),
(52,'lave-linge',NULL,'Y',NULL),
(53,'lave-vaisselle',NULL,'Y',NULL),
(54,'sèche-linge',NULL,'Y',NULL),
(55,'ordinateurs',NULL,'Y',NULL),
(56,'chauffe-eau',NULL,'Y',NULL),
(57,'VMC',NULL,'Y',NULL),
(58,'poelle à bois',NULL,'U',NULL),
(59,'taxidermie',NULL,'T',NULL),
(60,'tanneur',NULL,'T',NULL),
(61,'Equipement équestre',NULL,'T',NULL),
(62,'champignons',NULL,'X',NULL),
(63,'produits de beauté',NULL,'X',NULL),
(64,'spiruline',NULL,'X',NULL),
(65,'safran',NULL,'X',NULL),
(66,'huiles',NULL,'X',NULL),
(67,'plantes médicinales',NULL,'X',NULL),
(68,'pain',NULL,'X',NULL),
(69,'patisseries',NULL,'X',NULL),
(70,'Panier en osier',NULL,'O',NULL),
(71,'Sculpture sur pierre',NULL,'Z',NULL),
(72,'objet en plâtre',NULL,NULL,NULL),
(73,'poterie',NULL,'Q',NULL),
(74,'emailleur',NULL,'Q',NULL),
(75,'Huitres',NULL,'P',NULL),
(76,'Lait de brebis',NULL,'L',NULL),
(77,'Lait de vache',NULL,'L',NULL),
(78,'Lait de chèvre',NULL,'L',NULL),
(79,'beurre',NULL,'L',NULL),
(80,'Epices',NULL,'M',NULL),
(81,'Poivre',NULL,'M',NULL),
(82,'gingembre',NULL,'M',NULL),
(83,'Zaatar',NULL,'M',NULL),
(84,'Agriculture Biologique certifié',NULL,'A9',NULL),
(85,'Agriculture Biologique non certifié',NULL,'A9',NULL),
(86,'Faux',NULL,'F',NULL),
(87,'Faucille',NULL,'F',NULL),
(88,'Marteau',NULL,'F',NULL),
(89,'Hâche',NULL,'F',NULL),
(90,'Yaourt',NULL,'L',NULL),
(91,'Sandalles',NULL,NULL,NULL),
(92,'Set de table',NULL,NULL,NULL),
(93,'Boite',NULL,NULL,NULL),
(94,'Flyer',NULL,NULL,NULL),
(95,'Bol',NULL,NULL,NULL),
(96,'Table',NULL,NULL,NULL),
(97,'Chaise',NULL,NULL,NULL),
(98,'Boîte / Trousse',NULL,NULL,NULL),
(102,'Cagoule',NULL,NULL,NULL),
(103,'Echarpe',NULL,NULL,NULL),
(104,'Gilet',NULL,NULL,NULL),
(105,'Polo (Habit)',NULL,'H',NULL),
(106,'Baskets',NULL,NULL,NULL),
(107,'T-shirt',NULL,NULL,NULL),
(108,'Jogging',NULL,NULL,NULL),
(109,'Sous-vêtement',NULL,NULL,NULL),
(110,'Maquillage',NULL,NULL,NULL),
(111,'Savon',NULL,NULL,NULL),
(112,'Crème maquillage',NULL,NULL,NULL),
(113,'Onguent médicinal',NULL,NULL,NULL),
(114,'Huile',NULL,NULL,NULL),
(115,'Vin',NULL,NULL,NULL),
(116,'Cidre',NULL,NULL,NULL),
(117,'Jus de pomme',NULL,NULL,NULL),
(118,'Jus de raisin',NULL,NULL,NULL),
(119,'Liqueur',NULL,NULL,NULL),
(120,'Hydromel',NULL,NULL,NULL),
(121,'Bière',NULL,NULL,NULL),
(122,'Whisky',NULL,NULL,NULL),
(123,'Porto (vin cuit)',NULL,NULL,NULL),
(124,'Peigne',NULL,NULL,NULL),
(125,'Jeu en bois',NULL,NULL,NULL),
(126,'Jeu',NULL,NULL,NULL),
(127,'Casse tête',NULL,NULL,NULL),
(128,'Meuble en bois',NULL,'O0',NULL),
(129,'Meuble',NULL,'O',NULL),
(132,'Courgette',NULL,'M',NULL),
(133,'Chanvre',NULL,NULL,NULL),
(134,'Corde',NULL,NULL,NULL),
(135,'CBD',NULL,NULL,NULL),
(136,'Confiture',NULL,NULL,NULL),
(139,'Noix',NULL,NULL,NULL),
(140,'Raisin',NULL,NULL,NULL),
(141,'Pâte à tartiner',NULL,NULL,NULL),
(142,'Noisette',NULL,NULL,NULL),
(143,'Figue',NULL,NULL,NULL),
(145,'Compotte',NULL,NULL,NULL),
(146,'Crèpe',NULL,NULL,NULL),
(147,'Galette',NULL,NULL,NULL),
(149,'Champignon',NULL,NULL,NULL),
(152,'Huile d\'olives',NULL,NULL,NULL),
(153,'Infusion',NULL,NULL,NULL),
(154,'Sirop',NULL,NULL,NULL),
(155,'Biscuit',NULL,NULL,NULL),
(156,'Gâteau',NULL,NULL,NULL),
(157,'Selle de cheval',NULL,NULL,NULL),
(159,'Instrument de musique',NULL,NULL,NULL),
(161,'Bijou',NULL,NULL,NULL),
(162,'Piment',NULL,NULL,NULL),
(163,'Ail',NULL,NULL,NULL),
(164,'Persil',NULL,NULL,NULL),
(165,'Condiment',NULL,NULL,NULL),
(167,'Blé noir',NULL,NULL,NULL),
(170,'Bague',NULL,NULL,NULL),
(171,'Bracelet',NULL,NULL,NULL),
(172,'Couteau',NULL,NULL,NULL),
(173,'Arme à feu',NULL,NULL,NULL),
(174,'Arme de lancé',NULL,NULL,NULL),
(175,'Gants',NULL,NULL,NULL),
(176,'Lunettes',NULL,NULL,NULL),
(177,'Production sans pétrole',NULL,'99',NULL),
(178,'Agriculture raisonnée',NULL,'A9',NULL),
(179,'Au delà du label AB',NULL,'9',NULL),
(180,'100% local',NULL,'9',NULL),
(181,'100% français',NULL,'9',NULL),
(182,'100% européen',NULL,'9',NULL),
(183,'Origine la plus locale possible',NULL,'9',NULL),
(184,'Saucisse',NULL,'A2',NULL),
(185,'Andouille',NULL,'A2',NULL),
(186,'Boudin',NULL,'A2',NULL),
(187,'Saucisson',NULL,'A2',NULL),
(188,'Truite',NULL,'AP',NULL),
(190,'Tasse',NULL,NULL,NULL),
(191,'AMAP',NULL,'AG9',NULL),
(192,'Volailles',NULL,'A',NULL),
(193,'Légumes',NULL,NULL,NULL),
(194,'AB',NULL,NULL,NULL),
(195,'Paysan (Producteur)',NULL,NULL,NULL),
(196,'Eleveur (Paysan)',NULL,NULL,NULL),
(197,'Viande Bovine (Eleveur)',NULL,NULL,NULL),
(198,'Producteur',NULL,NULL,NULL),
(199,'Producteur Disponible',NULL,NULL,NULL),
(200,'Maraîcher (Paysan)',NULL,NULL,NULL),
(201,'Herbes Aromatiques (Paysan)',NULL,NULL,NULL),
(202,'Oeufs (Eleveur)',NULL,NULL,NULL),
(203,'Volailles (Eleveur)',NULL,NULL,NULL),
(204,'Boulanger (Paysan)',NULL,NULL,NULL),
(205,'Lait & Fromage Chèvre (Eleveur)',NULL,NULL,NULL),
(206,'Confitures et Gelées (Paysan)',NULL,NULL,NULL),
(207,'Huile (Paysan)',NULL,NULL,NULL),
(208,'Lait & Fromage de Vaches (Eleveur)',NULL,NULL,NULL),
(209,'Viande Porcine (Eleveur)',NULL,NULL,NULL),
(210,'Apiculteur (Paysan)',NULL,NULL,NULL),
(211,'Miel (Apiculteur)',NULL,NULL,NULL),
(212,'Viande Ovine (Eleveur)',NULL,NULL,NULL),
(213,'Céréales et Farines (Paysan)',NULL,NULL,NULL),
(214,'Arboriculteur (Paysan)',NULL,NULL,NULL),
(215,'Boissons (Paysan)',NULL,NULL,NULL),
(216,'Champignons (Paysan)',NULL,NULL,NULL),
(217,'Viande de Lapin (Eleveur)',NULL,NULL,NULL),
(218,'GEOLOC A FAIRE',NULL,NULL,NULL),
(219,'Légumes secs (Paysan)',NULL,NULL,NULL),
(220,'Saliculteur (Paysan)',NULL,NULL,NULL),
(221,'Lait & Fromage de Brebis (Eleveur)',NULL,NULL,NULL),
(222,'Vin (Viticulteur)',NULL,NULL,NULL),
(223,'Viticulteur (Paysan)',NULL,NULL,NULL),
(224,'Pâtes (Paysan)',NULL,NULL,NULL),
(225,'Artisan (Producteur)',NULL,NULL,NULL),
(226,'Fromages (Artisan)',NULL,NULL,NULL),
(227,'Safran (Paysan)',NULL,NULL,NULL),
(228,'Cidre (Arboriculteur)',NULL,NULL,NULL),
(229,'Pêcheur',NULL,NULL,NULL),
(230,'Conversion AB',NULL,NULL,NULL),
(231,'Viande',NULL,'V',NULL),
(232,'fruit',NULL,'F',NULL),
(233,'Alcool',NULL,'F',NULL);
/*!40000 ALTER TABLE `produce` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-12  0:30:52
