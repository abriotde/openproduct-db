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
INSERT INTO `produce` (`id`, `fr`, `en`, `category`, `parent`) VALUES (1,'Lait',NULL,'L',246),
(2,'Oeufs',NULL,'V',246),
(3,'viande de boeuf',NULL,'V',246),
(4,'viande de mouton',NULL,'V',246),
(5,'charcuterie',NULL,'V',246),
(6,'viande de porc',NULL,'V',246),
(7,'fromage de vache',NULL,'L',246),
(8,'fromage de chèvre',NULL,'L',246),
(9,'fromage',NULL,'L',246),
(10,'Poulet',NULL,'V',246),
(11,'Poisson',NULL,'P',246),
(12,'Crustacés',NULL,'P',246),
(13,'pomme',NULL,'F',246),
(14,'Poire',NULL,'F',246),
(15,'raisins',NULL,'F',246),
(16,'autres fruits',NULL,'F',246),
(17,'pomme de terre',NULL,'C',246),
(18,'blé',NULL,'C',246),
(19,'farine de blé',NULL,'C',246),
(20,'farine de seigle',NULL,'C',246),
(21,'avoine',NULL,'C',246),
(22,'miel',NULL,'N',246),
(23,'citrouille',NULL,'M',246),
(24,'aubergine',NULL,'M',246),
(25,'carotte',NULL,'M',246),
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
(62,'champignons',NULL,'X',246),
(63,'produits de beauté',NULL,'X',246),
(64,'spiruline',NULL,'X',246),
(65,'safran',NULL,'X',246),
(66,'huiles',NULL,'X',246),
(67,'plantes médicinales',NULL,'X',246),
(68,'pain',NULL,'X',246),
(69,'patisseries',NULL,'X',246),
(70,'Panier en osier',NULL,'O',246),
(71,'Sculpture sur pierre',NULL,'Z',246),
(72,'objet en plâtre',NULL,NULL,246),
(73,'poterie',NULL,'Q',246),
(74,'emailleur',NULL,'Q',246),
(75,'Huitres',NULL,'P',246),
(76,'Lait de brebis',NULL,'L',246),
(77,'Lait de vache',NULL,'L',246),
(78,'Lait de chèvre',NULL,'L',246),
(79,'beurre',NULL,'L',246),
(80,'Epices',NULL,'M',246),
(81,'Poivre',NULL,'M',246),
(82,'gingembre',NULL,'M',246),
(83,'Zaatar',NULL,'M',246),
(84,'Agriculture Biologique certifié',NULL,'A9',246),
(85,'Agriculture Biologique non certifié',NULL,'A9',246),
(86,'Faux',NULL,'F',246),
(87,'Faucille',NULL,'F',246),
(88,'Marteau',NULL,'F',246),
(89,'Hâche',NULL,'F',246),
(90,'Yaourt',NULL,'L',246),
(91,'Sandalles',NULL,NULL,246),
(92,'Set de table',NULL,NULL,246),
(93,'Boite',NULL,NULL,246),
(94,'Flyer',NULL,NULL,246),
(95,'Bol',NULL,NULL,246),
(96,'Table',NULL,NULL,246),
(97,'Chaise',NULL,NULL,246),
(98,'Boîte / Trousse',NULL,NULL,246),
(102,'Cagoule',NULL,NULL,246),
(103,'Echarpe',NULL,NULL,246),
(104,'Gilet',NULL,NULL,246),
(105,'Polo (Habit)',NULL,'H',246),
(106,'Baskets',NULL,NULL,246),
(107,'T-shirt',NULL,NULL,246),
(108,'Jogging',NULL,NULL,246),
(109,'Sous-vêtement',NULL,NULL,246),
(110,'Maquillage',NULL,NULL,246),
(111,'Savon',NULL,NULL,246),
(112,'Crème maquillage',NULL,NULL,246),
(113,'Onguent médicinal',NULL,NULL,246),
(114,'Huile',NULL,NULL,246),
(115,'Vin',NULL,NULL,246),
(116,'Cidre',NULL,NULL,246),
(117,'Jus de pomme',NULL,NULL,246),
(118,'Jus de raisin',NULL,NULL,246),
(119,'Liqueur',NULL,NULL,246),
(120,'Hydromel',NULL,NULL,246),
(121,'Bière',NULL,NULL,246),
(122,'Whisky',NULL,NULL,246),
(123,'Porto (vin cuit)',NULL,NULL,246),
(124,'Peigne',NULL,NULL,NULL),
(125,'Jeu en bois',NULL,NULL,NULL),
(126,'Jeu',NULL,NULL,NULL),
(127,'Casse tête',NULL,NULL,NULL),
(128,'Meuble en bois',NULL,'O0',NULL),
(129,'Meuble',NULL,'O',NULL),
(132,'Courgette',NULL,'M',246),
(133,'Chanvre',NULL,NULL,246),
(134,'Corde',NULL,NULL,246),
(135,'CBD',NULL,NULL,246),
(136,'Confiture',NULL,NULL,246),
(139,'Noix',NULL,NULL,246),
(140,'Raisin',NULL,NULL,246),
(141,'Pâte à tartiner',NULL,NULL,246),
(142,'Noisette',NULL,NULL,246),
(143,'Figue',NULL,NULL,246),
(145,'Compotte',NULL,NULL,246),
(146,'Crèpe',NULL,NULL,246),
(147,'Galette',NULL,NULL,246),
(149,'Champignon',NULL,NULL,246),
(152,'Huile d\'olives',NULL,NULL,246),
(153,'Infusion',NULL,NULL,246),
(154,'Sirop',NULL,NULL,246),
(155,'Biscuit',NULL,NULL,246),
(156,'Gâteau',NULL,NULL,246),
(157,'Selle de cheval',NULL,NULL,246),
(159,'Instrument de musique',NULL,NULL,246),
(161,'Bijou',NULL,NULL,246),
(162,'Piment',NULL,NULL,246),
(163,'Ail',NULL,NULL,246),
(164,'Persil',NULL,NULL,246),
(165,'Condiment',NULL,NULL,246),
(167,'Blé noir',NULL,NULL,246),
(170,'Bague',NULL,NULL,246),
(171,'Bracelet',NULL,NULL,246),
(172,'Couteau',NULL,NULL,246),
(173,'Arme à feu',NULL,NULL,246),
(174,'Arme de lancé',NULL,NULL,246),
(175,'Gants',NULL,NULL,246),
(176,'Lunettes',NULL,NULL,246),
(177,'Production sans pétrole',NULL,'99',246),
(178,'Agriculture raisonnée',NULL,'A9',246),
(179,'Au delà du label AB',NULL,'9',246),
(180,'100% local',NULL,'9',246),
(181,'100% français',NULL,'9',246),
(182,'100% européen',NULL,'9',246),
(183,'Origine la plus locale possible',NULL,'9',246),
(184,'Saucisse',NULL,'A2',246),
(185,'Andouille',NULL,'A2',246),
(186,'Boudin',NULL,'A2',246),
(187,'Saucisson',NULL,'A2',246),
(188,'Truite',NULL,'AP',246),
(190,'Tasse',NULL,NULL,246),
(191,'AMAP',NULL,'AG9',246),
(192,'Volailles',NULL,'A2',246),
(193,'Légumes',NULL,NULL,246),
(194,'AB',NULL,NULL,246),
(195,'Paysan (Producteur)',NULL,NULL,246),
(196,'Eleveur (Paysan)',NULL,NULL,246),
(197,'Viande Bovine (Eleveur)',NULL,NULL,246),
(198,'Producteur',NULL,NULL,246),
(199,'Producteur Disponible',NULL,NULL,246),
(200,'Maraîcher (Paysan)',NULL,NULL,246),
(201,'Herbes Aromatiques (Paysan)',NULL,NULL,246),
(202,'Oeufs (Eleveur)',NULL,NULL,246),
(203,'Volailles (Eleveur)',NULL,NULL,246),
(204,'Boulanger (Paysan)',NULL,NULL,246),
(205,'Lait & Fromage Chèvre (Eleveur)',NULL,NULL,246),
(206,'Confitures et Gelées (Paysan)',NULL,NULL,246),
(207,'Huile (Paysan)',NULL,NULL,246),
(208,'Lait & Fromage de Vaches (Eleveur)',NULL,NULL,246),
(209,'Viande Porcine (Eleveur)',NULL,NULL,246),
(210,'Apiculteur (Paysan)',NULL,NULL,246),
(211,'Miel (Apiculteur)',NULL,NULL,246),
(212,'Viande Ovine (Eleveur)',NULL,NULL,246),
(213,'Céréales et Farines (Paysan)',NULL,NULL,246),
(214,'Arboriculteur (Paysan)',NULL,NULL,246),
(215,'Boissons (Paysan)',NULL,NULL,246),
(216,'Champignons (Paysan)',NULL,NULL,246),
(217,'Viande de Lapin (Eleveur)',NULL,NULL,246),
(218,'GEOLOC A FAIRE',NULL,NULL,NULL),
(219,'Légumes secs (Paysan)',NULL,NULL,246),
(220,'Saliculteur (Paysan)',NULL,NULL,246),
(221,'Lait & Fromage de Brebis (Eleveur)',NULL,NULL,246),
(222,'Vin (Viticulteur)',NULL,NULL,246),
(223,'Viticulteur (Paysan)',NULL,NULL,246),
(224,'Pâtes (Paysan)',NULL,NULL,246),
(225,'Artisan (Producteur)',NULL,NULL,246),
(226,'Fromages (Artisan)',NULL,NULL,246),
(227,'Safran (Paysan)',NULL,NULL,246),
(228,'Cidre (Arboriculteur)',NULL,NULL,246),
(229,'Pêcheur',NULL,NULL,246),
(230,'Conversion AB',NULL,NULL,246),
(231,'Viande',NULL,'V',246),
(232,'fruit',NULL,'F',246),
(233,'Alcool',NULL,'F',246),
(234,'Éleveur',NULL,'2',246),
(235,'Bovins viande',NULL,'2',246),
(236,'Ovins',NULL,'2',246),
(237,'Porcins',NULL,'2',246),
(239,'Maraîcher',NULL,'M',246),
(240,'Maraîchage',NULL,'M',246),
(241,'Arboriculteur',NULL,'M',246),
(242,'Apiculteur',NULL,'M',246),
(243,'Héliciculteur',NULL,'N',246),
(246,'Alimentaire',NULL,'A',NULL),
(247,'Pisciculteur',NULL,'P',246),
(248,'Spirulinier',NULL,'X',246),
(249,'Pâtissier',NULL,'X',246),
(250,'Boulanger',NULL,'X',246),
(251,'Chocolatier',NULL,'X',246),
(252,'Herboriste',NULL,'3',NULL),
(253,'Pépiniériste',NULL,'3',NULL),
(254,'Fromager',NULL,'L',246),
(255,'Laitier',NULL,'L',246),
(256,'fromages et produits laitiers',NULL,'L',246),
(257,'Distillateur',NULL,'F',246),
(258,'Vinaigrier',NULL,'F',246),
(259,'Vigneron',NULL,'F',246),
(260,'Confiturier',NULL,'F',246),
(261,'Fruits',NULL,'F',246),
(262,'Brasseur',NULL,'F',246),
(263,'Viticulture',NULL,'F',246),
(264,'Grandes cultures',NULL,'C',246),
(265,'Myciculteur',NULL,'C',246),
(266,'Fleuriste',NULL,'4',246),
(267,'Artisans/Artistes',NULL,'O',NULL),
(268,'Artisans / Artistes',NULL,'O',NULL),
(269,'Habillement',NULL,'H',NULL),
(270,'Plantes (Fleurs, arbres)',NULL,'4',NULL),
(271,'Produits ménager, de beauté, médicinal',NULL,'3',NULL),
(272,'Petites et moyennes entrepries',NULL,'I',NULL);
/*!40000 ALTER TABLE `produce` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-06 10:45:48
