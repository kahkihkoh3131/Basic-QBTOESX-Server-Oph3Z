-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.22-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- oph3zqb için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `oph3zqb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `oph3zqb`;

-- tablo yapısı dökülüyor oph3zqb.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) CHARACTER SET latin1 NOT NULL,
  `label` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.addon_account: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `addon_account`;
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_police', 'Policia', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.addon_account_data: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `addon_account_data`;
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) CHARACTER SET latin1 NOT NULL,
  `label` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.addon_inventory: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `addon_inventory`;
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.addon_inventory_items: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `addon_inventory_items`;
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.billing: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `billing`;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `dateofbirth` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT 'Erkek',
  `height` varchar(128) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `lastdigits` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.characters: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `characters`;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- oph3zqb.datastore: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `datastore`;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_police', 'Policia', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- oph3zqb.datastore_data: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `datastore_data`;
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- oph3zqb.fine_types: ~98 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `fine_types`;
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Dikkatsiz Sürüş', 75, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(2, 'Hatali Sollama', 50, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(3, 'Ters Yonde Arac Kullanma', 40, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(4, 'Yetkisiz U Donusu', 40, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(5, 'Arazide Arac Kullanma', 50, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(6, 'Kazada Suclu Bulunma', 60, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(7, 'Tehlikeli / Yasak Duruslar', 50, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(8, 'Uygunsuz / Yasak Park Etme', 60, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(9, 'Kayitsiz Plakali Arac Kullanimi', 275, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(10, 'Oncelikli Araçlara Yol Vermeme', 60, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(11, 'Dur ihtarina Uymama', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(12, 'Kirmizi isiga Uymama', 50, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(13, 'Cop Bait Uyarisi', 700, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(14, 'Devlet Dairesine Ait Olmayan Arac', 100, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(15, 'Calinti Arac Kullanimi', 300, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(16, 'Vur Kac', 400, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(18, 'Hiz Yapma < 90 kmh', 600, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(21, 'Trafik Akisini Engelleme', 400, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(22, 'Trafik Kazasina Sebebiyet', 400, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(23, 'Hasarli Arac ile Seyahat', 400, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(24, 'Polis Operasyonunu Engelleme', 1000, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(25, 'Hakaret Etmek / Siviller', 140, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(26, 'Polis Memuruna Girisimde Bulunma', 780, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(27, 'Sozlu Tehdit veya Fiziksel Girisim', 630, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(28, 'Bir Polis Memuruna Sozlu Tehdit Veya Fiziksel Girisim', 680, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(29, 'Yasa Disi Protesto', 570, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(30, 'Rusvet Teklif Etme', 480, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(33, 'Ruhsatsiz Silah Bulundurma (Standart Lisans)', 1100, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(34, 'İllegal Silah Bulundurma', 2400, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(35, 'Maymuncuk Tasima', 400, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(36, 'Arac Hirsizligi', 400, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(37, 'Uyusturucu Satisi Yapma', 1400, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(38, 'Uyusturucu Trafigi Yapma', 1600, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(39, 'Uyusturucu Uretimi Yapma', 2000, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(41, 'Devlet Memurunu Rehin Alma', 5200, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(42, 'Soygun Girisiminde Bulunma', 420, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(43, 'Magaza / Dukkan Soyma', 500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(44, 'Banka Soygunu ', 700, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(45, 'Sivil Yaralama', 600, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(46, 'Devlet Memurunu Yaralama', 800, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(47, 'Sivil Oldurme Tesebbus', 480, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(48, 'Devlet Memurunu Oldurmeye Tesebbus', 1000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(49, 'Sivil Oldurme', 1900, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(50, 'Devlet Memuru Oldurme', 2400, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(51, 'Istemsiz Cinayet / Nevsi Mudafa', 1400, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(52, 'Is Hirsizligi / Vergi Kacirma', 250, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(53, 'Korna kötüye kullanımı', 30, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(54, 'Sürekli hat geçişi', 40, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(55, 'Yolun yanlış tarafında sürüş', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(56, 'Yanlış U dönüşü', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(57, 'Yasadışı Off-Road Sürüşü', 170, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(58, 'Polis emirlerine uyulmaması', 30, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(59, 'Aracın yanlış durması', 150, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(60, 'Yanlış park', 70, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(61, 'Sağdan gelen trafiğe uymama (sol şeritte sürüş)', 70, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(62, 'Araç bilgisi yok', 90, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(63, 'STOP işaretine uyulmaması', 105, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(64, 'Kırmızı ışıkta durma', 130, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(65, 'Yetkisiz bir yerde geçme', 100, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(66, 'Yasadışı bir araç kullanmak', 100, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(67, 'Ehliyet yok', 1500, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(68, 'Etkinlikten Kaçış', 800, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(69, 'Aşırı hız <5 mil / saat', 90, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(70, 'Aşırı hız 5-15 mil', 120, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(71, 'Aşırı hız 15-30 mil', 180, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(72, 'Aşırı hız> 30 mil / saat', 300, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(73, 'Hareketi engelleme', 110, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(74, 'Kamu yararı', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(75, 'Yanlış davranış', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(76, 'İşlemleri engelleme', 130, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(77, 'Sivillere hakaret', 75, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(78, 'Oyunculara hakaret', 110, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(79, 'Sözlü tehditler', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(80, 'Oyunculara küfür', 150, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(81, 'Yanlış bilgi sağlama', 250, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(82, 'Yolsuzluk teşebbüsü', 1500, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(83, 'Şehirde silah sallayarak gezmek', 120, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(84, 'Şehirde tehlikeli bir silah sallıyor', 300, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(85, 'Silah izni yok', 600, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(86, 'Yasadışı silah bulundurma', 700, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(87, 'Bilgisayar korsanlığı araçlarına sahip olmak', 300, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(88, 'Hırsız - tekrarlayan suçlu', 1800, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(89, 'Yasadışı maddelerin dağıtımı', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(90, 'Yasa dışı maddelerin imalatı', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(91, 'Yasaklanmış maddelerin bulundurulması', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(92, 'Sivilleri kaçırmak', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(93, 'Kaçırma oyuncusu', 2000, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(94, 'Soygun', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(95, 'Elinde silah olan hırsızlık', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(96, 'Banka soygunu', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(97, 'Sivil saldırı', 2000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(98, 'Oyuncuya saldırı', 2500, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(99, 'Sivil bir cinayete teşebbüs', 3000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(100, 'Oyuncu cinayete teşebbüs', 5000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(101, 'Bir sivilin kasıtlı suikastı', 10000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(102, 'Kasıtlı oyuncu cinayeti', 30000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(103, 'Yanlışlıkla ölüme neden', 1800, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(104, 'Dolandırıcılık', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.gloveboxitemsnew
CREATE TABLE IF NOT EXISTS `gloveboxitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.gloveboxitemsnew: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gloveboxitemsnew`;
/*!40000 ALTER TABLE `gloveboxitemsnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `gloveboxitemsnew` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  `type` longtext DEFAULT 'item',
  `unique` longtext DEFAULT 'false',
  `description` longtext DEFAULT 'Bilinmiyor',
  `image` longtext DEFAULT NULL,
  `shouldClose` longtext DEFAULT '0',
  `combinable` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4;

-- oph3zqb.items: ~85 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('cash', 'Nakit Para', 0, 0, 1, 'item', 'false', 'Nakit Para', 'cash.png', '0', NULL, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('phone', 'Telefon', 0.6, 0, 1, 'item', 'true', 'Bilinmiyor', 'phone.png', '0', NULL, 3);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('pistol_ammo', 'Tabanca Mermisi', 0.1, 0, 1, 'item', 'false', 'Tabanca mermi kutusu.', 'pistol_ammo.png', '0', NULL, 4);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('pistol_extended', 'Tab. Uzatılmış', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'extendedclip.png', '0', NULL, 5);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('pistol_flashlight', 'Tab. Fener', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'flashlight.png', '0', NULL, 6);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('pistol_scope', 'Tab. Dürbünü', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'scope.png', '0', NULL, 7);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('pistol_suppressor', 'Tab. Susturucu', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'suppressor.png', '0', NULL, 8);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('rifle_ammo', 'Rifle Mermisi', 0.1, 0, 1, 'item', 'false', 'Rifle mermi kutusu.', 'rifle_ammo.png', '0', NULL, 9);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('rifle_extendedclip', 'Rifle Uzatılmış', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'extendedclip.png', '0', NULL, 10);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('rifle_flashlight', 'Rifle Fener', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'flashlight.png', '0', NULL, 11);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('rifle_scope', 'Rifle Dürbün', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'scope.png', '0', NULL, 12);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('rifle_suppressor', 'Rifle Susturucu', 0.3, 0, 1, 'item', 'true', 'Ateş Sesini Muazzam Ölçüde Azaltan Ekipman.', 'suppressor.png', '0', NULL, 13);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('shotgun_ammo', 'Shotgun Mermisi', 0.1, 0, 1, 'item', 'false', 'Shotgun mermi kutusu.', 'shotgun_ammo.png', '0', NULL, 14);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('smg_ammo', 'Smg Mermisi', 0.1, 0, 1, 'item', 'false', 'Smg mermi kutusu', 'smg_ammo.png', '0', NULL, 15);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('smg_extendedclip', 'SMG Uzatılmış', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'extendedclip.png', '0', NULL, 16);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('smg_flashlight', 'SMG Feneri', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'flashlight.png', '0', NULL, 17);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('smg_scope', 'SMG Dürbünü', 0.3, 0, 1, 'item', 'false', 'Bilinmiyor', 'scope.png', '0', NULL, 18);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('smg_suppressor', 'SMG Susturucu', 0.3, 0, 1, 'item', 'true', 'Bilinmiyor', 'suppressor.png', '0', NULL, 19);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('water', 'Su', 0.01, 0, 1, 'item', 'false', 'Bilinmiyor', 'water.png', '0', NULL, 20);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_advancedrifle', 'Geliştirilmiş Tüfek', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_ADVANCEDRIFLE.png', '0', NULL, 21);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_appistol', 'Ap Pistol', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_appistol.png', '0', NULL, 22);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_assaultrifle', 'Ak-47', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_ASSAULTRIFLE.png', '0', NULL, 23);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_assaultsmg', 'PD F40', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_assaultsmg.png', '0', NULL, 24);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_bat', 'Beyzbol Sopasi', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_BAT.png', '0', NULL, 25);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_battleaxe', 'Balta', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_BATTLEAXE.png', '0', NULL, 26);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_carbinerifle_mk2', 'PD 762', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_CARBINERIFLE_MK2.png', '0', NULL, 27);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_combatpdw', 'SAUER MPX', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_combatpdw.png', '0', NULL, 28);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_combatpistol', 'GLOCK 17', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_combatpistol.png', '0', NULL, 29);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_compactrifle', 'DRACO', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_compactrifle.png', '0', NULL, 30);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_crowbar', 'Levye', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_CROWBAR.png', '0', NULL, 31);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_flashlight', 'El Feneri', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'flashlight.png', '0', NULL, 32);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_garbagebag', 'Bin bag', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', NULL, '0', NULL, 33);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_gusenberg', 'TOMMY', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_GUSENBERG.PNG', '0', NULL, 34);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_heavypistol', 'Desert Eagle', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_heavypistol.png', '0', NULL, 35);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_knife', 'Bicak', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_knife.png', '0', NULL, 36);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_knuckle', 'Musta', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_KNUCKLE.png', '0', NULL, 37);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_machinepistol', 'Tec-9', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_machinepistol.png', '0', NULL, 38);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_microsmg', 'Micro SMG', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_microsmg.png', '0', NULL, 39);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_minismg', 'Mini SMG', 1.5, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_minismg.png', '0', NULL, 40);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_nightstick', 'Jop', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_nightstick.png', '0', NULL, 41);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_pistol', 'Colt 1911', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_PISTOL.png', '0', NULL, 42);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_pistol50', 'Desert Eagle', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_PISTOL50.png', '0', NULL, 43);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_pistol_mk2', 'PD 9MM', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_PISTOL_MK2.png', '0', NULL, 44);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_poolcue', 'Sopa', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_poolcue.png', '0', NULL, 45);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_revolver', 'Revolver', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_REVOLVER_MK2.png', '0', NULL, 46);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_sawnoffshotgun', 'SAWED OFF', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_SAWNOFFSHOTGUN.png', '0', NULL, 47);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_smg', 'MP-5 SMG', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_smg.png', '0', NULL, 48);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_smg_mk2', 'MP5-K', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_SMG_MK2.png', '0', NULL, 49);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_snspistol', 'BU9 Nano', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_snspistol.png', '0', NULL, 50);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_stungun', 'Teaser', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_stungun.png', '0', NULL, 51);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_switchblade', 'Kelebek', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_switchblade.png', '0', NULL, 52);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_vintagepistol', 'Vintage', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'weapon_vintagepistol.png', '0', NULL, 53);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('bread', 'Ekmek', 0.01, 0, 1, 'item', 'false', 'Acıktığında ekmek yiyebilirsin, karnını doyurmak için.', 'bread.png', '0', NULL, 54);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('bandage', 'Bandage', 2, 0, 1, 'item', 'false', 'Bilinmiyor', NULL, '0', NULL, 258);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('medikit', 'Medikit', 2, 0, 1, 'item', 'false', 'Bilinmiyor', NULL, '0', NULL, 259);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('ayakkabi', 'Ayakkabı', 0.5, 0, 1, 'item', 'false', 'Ayakkabı', 'ayakkabi.png', '0', NULL, 260);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('ceket', 'Ceket', 0.5, 0, 1, 'item', 'false', 'Ceket', 'ceket.png', '0', NULL, 261);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('gozluk', 'Gözlük', 0.5, 0, 1, 'item', 'false', 'Gözlük', 'gozluk.png', '0', NULL, 262);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('pantolon', 'Pantolon', 0.5, 0, 1, 'item', 'false', 'Pantolon', 'pantolon.png', '0', NULL, 263);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('tisort', 'Tişört', 0.5, 0, 1, 'item', 'false', 'Tişört', 'tisort.png', '0', NULL, 264);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('kolye', 'Kolye', 0.5, 0, 1, 'item', 'false', 'Kolye', 'kolye.png', '0', NULL, 265);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('saat', 'Saat', 0.5, 0, 1, 'item', 'false', 'Saat', 'saat.png', '0', NULL, 266);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('canta', 'Çanta', 0.5, 0, 1, 'item', 'false', 'Çanta', 'canta.png', '0', NULL, 267);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('maske', 'Maske', 0.5, 0, 1, 'item', 'false', 'Maske', 'maske.png', '0', NULL, 268);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('kupe', 'Kupe', 0.5, 0, 1, 'item', 'false', 'Kupe', 'kupe.png', '0', NULL, 269);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('zirh', 'Zirh', 0.5, 0, 1, 'item', 'false', 'Zirh', 'armor.png', '0', NULL, 270);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('kask', 'Kask', 0.5, 0, 1, 'item', 'false', 'Kask', 'hat.png', '0', NULL, 271);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('vehiclekey', 'Araba Anahtarı', 0.2, 0, 1, 'item', 'false', 'Araba Anahtarı', 'vehiclekey.png', '0', NULL, 272);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('motel_key', 'Motel Anahtarı', 0.2, 0, 1, 'item', 'true', 'Oda anahtarına benziyor...', 'motelkeys.png', '0', NULL, 273);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('balta', 'Balta', 2, 0, 1, 'item', 'false', 'Odunculuk için Balta. Balta kullanarak odunları kesebilirsiniz, ve kestiğin odunlardan para kazanabilirsiniz.', 'balta.png', '0', NULL, 274);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('wood', 'Odun', 0.5, 0, 1, 'item', 'false', 'Bilinmiyor', 'wood.png', '0', NULL, 275);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('das', 'Taş', 5, 0, 1, 'item', 'false', 'Bilinmiyor', 'das.png', '0', NULL, 276);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('dastoken', 'Madenci Tokeni', 1, 0, 1, 'item', 'false', 'Bilinmiyor', 'dastoken.png', '0', NULL, 277);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('pickaxe', 'Kazma', 2, 0, 1, 'item', 'false', 'Madencilik için gerekli.', 'pickaxe.png', '0', NULL, 278);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('cuttedwood', 'Kesilmiş Odun', 0.2, 0, 1, 'item', 'false', 'Bilinmiyor', NULL, '0', NULL, 279);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('motelkeys', 'Motel Anahtarı', 0.2, 0, 1, 'item', 'true', 'Motel anahtarına benziyor...', 'motelkeys.png', '0', NULL, 280);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('siteusp', 'Normal Site USP', 0.2, 0, 1, 'item', 'false', 'Bilinmiyor', 'usp.png', '0', NULL, 281);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('oyunusp', 'Oyun USP', 0.2, 0, 1, 'item', 'false', 'Bilinmiyor', 'usp.png', '0', NULL, 282);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('forumsite', 'Forum Site USP', 0.2, 0, 1, 'item', 'false', 'Bilinmiyor', 'usp.png', '0', NULL, 283);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('appusp', 'Uygulama USP', 0.2, 0, 1, 'item', 'false', 'Bilinmiyor', 'usp.png', '0', NULL, 284);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('illegalsite', 'İllgeal Siste USP', 0.2, 0, 1, 'item', 'false', 'Bilinmiyor', 'usp.png', '0', NULL, 285);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('phone', 'Telefon', 1, 0, 1, 'item', 'false', 'Bilinmiyor', NULL, '0', NULL, 287);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('phone', 'Telefon', 1, 0, 1, 'item', 'false', 'Bilinmiyor', NULL, '0', NULL, 288);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('mg_ammo', 'MG Mermisi', 0.2, 0, 1, 'item', 'false', 'Bilinmiyor', 'rifle_ammo.png', '0', NULL, 289);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `type`, `unique`, `description`, `image`, `shouldClose`, `combinable`, `id`) VALUES
	('weapon_carbinerifle', 'PD 760', 1, 0, 1, 'weapon', 'true', 'Bilinmiyor', 'WEAPON_CARBINERIFLE_MK2.png', '0', NULL, 290);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.jobs: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`) VALUES
	('ambulance', 'Ambulance');
INSERT INTO `jobs` (`name`, `label`) VALUES
	('police', 'Policia');
INSERT INTO `jobs` (`name`, `label`) VALUES
	('unemployed', 'Unemployed');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- oph3zqb.job_grades: ~13 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `job_grades`;
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(2, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(3, 'ambulance', 1, 'doctor', 'Medecin', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(4, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(5, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(6, 'police', 0, 'recruit', 'Alumno', 20, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(7, 'police', 1, 'officer', 'Oficial I', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(8, 'police', 2, 'sergeant', 'Oficial II', 60, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(9, 'police', 3, 'sergeant_chief', 'Sheriff', 80, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(10, 'police', 4, 'intendent', 'Inspector', 100, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(11, 'police', 5, 'lieutenant', 'Detective', 120, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(12, 'police', 6, 'chef', 'Comisario', 140, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(13, 'police', 7, 'boss', 'Super Intendente', 160, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- oph3zqb.licenses: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `licenses`;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`id`, `type`, `label`) VALUES
	(1, 'dmv', 'Code de la route');
INSERT INTO `licenses` (`id`, `type`, `label`) VALUES
	(2, 'drive', 'Permis de conduire');
INSERT INTO `licenses` (`id`, `type`, `label`) VALUES
	(3, 'drive_bike', 'Permis moto');
INSERT INTO `licenses` (`id`, `type`, `label`) VALUES
	(4, 'drive_truck', 'Permis camion');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.m3_banlist
CREATE TABLE IF NOT EXISTS `m3_banlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `admin` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `steam` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `rockstar` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `xbox` varchar(21) CHARACTER SET latin1 DEFAULT NULL,
  `live` varchar(21) CHARACTER SET latin1 DEFAULT NULL,
  `discord` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `ip` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `time` int(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.m3_banlist: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `m3_banlist`;
/*!40000 ALTER TABLE `m3_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `m3_banlist` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `lasthouse` int(11) DEFAULT 0,
  `garage` varchar(200) COLLATE utf8mb4_bin DEFAULT 'A',
  `vehicleimage` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `finance` int(32) NOT NULL DEFAULT 0,
  `financetimer` int(32) NOT NULL DEFAULT 0,
  `jamstate` int(11) NOT NULL DEFAULT 0,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- oph3zqb.owned_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `owned_vehicles`;
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `model` varchar(255) CHARACTER SET latin1 NOT NULL,
  `skin` text CHARACTER SET latin1 NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.playerskins: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `playerskins`;
/*!40000 ALTER TABLE `playerskins` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerskins` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- oph3zqb.player_outfits: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_outfits`;
/*!40000 ALTER TABLE `player_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_outfits` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.society_moneywash: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `society_moneywash`;
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.stashitemsnew
CREATE TABLE IF NOT EXISTS `stashitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stash` (`stash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.stashitemsnew: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `stashitemsnew`;
/*!40000 ALTER TABLE `stashitemsnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `stashitemsnew` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.trunkitemsnew
CREATE TABLE IF NOT EXISTS `trunkitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.trunkitemsnew: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `trunkitemsnew`;
/*!40000 ALTER TABLE `trunkitemsnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunkitemsnew` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `lastdigits` varchar(255) DEFAULT NULL,
  `ilk_giris` longtext DEFAULT NULL,
  `tattoos` text DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.users: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.user_accounts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `user_accounts`;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- oph3zqb.user_inventory: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `user_inventory`;
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- oph3zqb.user_licenses: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `user_licenses`;
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- tablo yapısı dökülüyor oph3zqb.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- oph3zqb.vehicles: ~225 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `vehicles`;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Adder', 'adder', 200000, 'super', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Akuma', 'akuma', 15000, 'motorcycles', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Alpha', 'alpha', 100000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ardent', 'ardent', 50000, 'sportsclassics', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Asea', 'asea', 10000, 'sedans', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Asterope', 'asterope', 30000, 'sedans', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Autarch', 'autarch', 1000000, 'super', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Avarus', 'avarus', 19000, 'motorcycles', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Baller', 'baller', 300000, 'suvs', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Baller Super', 'baller4', 350000, 'suvs', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Banshee', 'banshee', 90000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Banshee 900R', 'banshee2', 300000, 'super', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bati', 'bati', 50000, 'motorcycles', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bestia GTS', 'bestiagts', 78000, 'sports', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bf Injection', 'bfinjection', 15000, 'offroad', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bifta', 'bifta', 18000, 'offroad', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bison', 'bison', 250000, 'vans', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('BJXL', 'bjxl', 150000, 'suvs', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Blade', 'blade', 50000, 'muscle', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Blista', 'blista', 50000, 'compacts', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Blista S', 'blista2', 60000, 'sports', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Blista GT', 'blista3', 65000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bobcatxl', 'bobcatxl', 300000, 'vans', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Brawler', 'brawler', 150000, 'offroad', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Brioso', 'brioso', 62000, 'compacts', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Btype', 'btype', 90000, 'sportsclassics', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Btype SC', 'btype2', 95000, 'sportsclassics', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Btype S', 'btype3', 99000, 'sportsclassics', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Buccaneer', 'buccaneer', 155000, 'muscle', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Buffalo', 'buffalo', 68000, 'sports', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Buffalo GT', 'buffalo3', 70000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bullet', 'bullet', 95000, 'super', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Camper', 'camper', 60000, 'vans', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Carboni', 'carbonizzare', 195000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Carbonr S', 'carbonrs', 31200, 'motorcycles', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Casco', 'casco', 42000, 'sportsclassics', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Cavalcade', 'cavalcade', 92000, 'suvs', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Cheetah', 'cheetah', 2500000, 'super', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Cheetah SC', 'cheetah2', 2800000, 'sportsclassics', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Chino', 'chino', 70000, 'muscle', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Chino S', 'chino2', 75000, 'muscle', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Cliff hanger', 'cliffhanger', 15800, 'motorcycles', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('COG55', 'cog55', 210000, 'sedans', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Cogcabrio', 'cogcabrio', 70000, 'coupes', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Cognoscenti', 'cognoscenti', 200000, 'sedans', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Comet SX', 'comet2', 120000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Contender', 'contender', 300000, 'suvs', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Coquette', 'coquette', 75000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Coquette SC', 'coquette2', 74000, 'sportsclassics', 0);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Coquette GM', 'coquette3', 80000, 'muscle', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Cyclone', 'cyclone', 3000000, 'super', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Daemon', 'daemon', 18100, 'motorcycles', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Defiler', 'defiler', 25000, 'motorcycles', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Diablous', 'diablous', 45000, 'motorcycles', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Diablous S', 'Diablous2', 50000, 'motorcycles', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Dilettante', 'dilettante', 40000, 'compacts', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Dominator', 'dominator', 55000, 'muscle', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Double', 'double', 35000, 'motorcycles', 1);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Dubsta', 'dubsta', 95000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Dukes', 'dukes', 67000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Elegy', 'elegy', 300000, 'sports', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Elegy S', 'elegy2', 330000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Emperor', 'emperor', 8000, 'sedans', 2);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Entity XF', 'entityxf', 300000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ess key', 'esskey', 14000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Exemplar', 'exemplar', 90000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('F620', 'f620', 300000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Faction', 'faction', 110000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Faggio S', 'faggio', 5500, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('FCR', 'fcr', 13500, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('FCR S', 'fcr2', 19600, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Felon', 'felon', 100000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Felon S', 'felon2', 150000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Feltzer S', 'feltzer2', 113100, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Feltzer SC', 'feltzer3', 80000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('FMJ', 'fmj', 330000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('FQ2', 'fq2', 253000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Fugitive', 'fugitive', 66000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Furore GT', 'furoregt', 100000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Fusilade', 'fusilade', 66000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Futo', 'futo', 75000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Gargoyle', 'gargoyle', 34000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Gauntlet', 'gauntlet', 80000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Glendale', 'glendale', 150000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('GPL', 'gp1', 300000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Granger', 'granger', 120000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Gresley', 'gresley', 250000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('GT500', 'gt500', 130000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Habanero', 'habanero', 62000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Hakuchou', 'hakuchou', 150000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Hermes', 'hermes', 53000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Hexer', 'hexer', 19500, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Hotknife', 'hotknife', 50000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Huntley', 'huntley', 250000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Infernus', 'infernus', 130000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Infernus SC', 'infernus2', 70000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ingot', 'ingot', 45000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Innovation', 'innovation', 32000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Intruder', 'intruder', 53000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Issi S', 'issi2', 38500, 'compacts', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Italigtb', 'italigtb', 500000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Jackal', 'jackal', 92000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Jester', 'jester', 400000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Journey', 'journey', 80000, 'vans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Khamelion', 'khamelion', 83000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Kuruma', 'kuruma', 98000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Lands Talker', 'landstalker', 85000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('LE7B', 'le7b', 450000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Lectro', 'lectro', 40000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Lynx S', 'lynx2', 173000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Mamba', 'mamba', 90000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Manana', 'manana', 66000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Massacro', 'massacro', 88000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Mesa S', 'mesa', 98000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Mesa OR', 'mesa3', 75000, 'offroad', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Minivan', 'minivan', 100000, 'vans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Minivan2', 'minivan2', 130000, 'vans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Monroe', 'monroe', 84000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Moon Beam', 'moonbeam', 150000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Neon', 'neon', 150000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Nero', 'nero', 2500000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Nightblade', 'nightblade', 25000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Night Shade', 'nightshade', 72300, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ninef', 'ninef', 63000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Omnis', 'omnis', 68000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Oracle S', 'oracle', 82000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Oracle', 'oracle2', 87000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Osiris', 'osiris', 300000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Panto', 'panto', 22000, 'compacts', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Pariah', 'pariah', 72200, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Patriot', 'patriot', 70000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('PCJ', 'pcj', 13500, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Penetrator', 'penetrator', 380000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Penumbra', 'penumbra', 66500, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Peyote', 'peyote', 86500, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Pfister', 'pfister811', 1304000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Picador', 'picador', 45000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Pigalle', 'pigalle', 20000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Prairie', 'prairie', 430000, 'compacts', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Premier', 'premier', 35000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Primo', 'primo', 100000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Prototipo', 'prototipo', 3000000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Radi', 'radi', 74000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Raiden', 'raiden', 68800, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rancher XL', 'rancherxl', 79000, 'offroad', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rapid GT', 'rapidgt', 35000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rapidgt Turbo', 'rapidgt2', 82500, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rapid GTSC', 'rapidgt3', 38000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('raptor', 'raptor', 84000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ratloader MS', 'ratloader2', 18000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Reaper', 'reaper', 300000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rebel OR', 'rebel2', 20000, 'offroad', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Regina', 'regina', 22500, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Retinue', 'retinue', 78000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Revolter', 'revolter', 200000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rhapsody', 'rhapsody', 30000, 'compacts', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rocoto', 'rocoto', 110000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ruffian', 'ruffian', 10000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ruiner', 'ruiner', 54000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Rumpo VN', 'rumpo3', 250000, 'vans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('ruston', 'ruston', 93200, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Sabre GT', 'sabregt', 87000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Sadler', 'sadler', 169000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Sanchez', 'sanchez2', 15000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Savestra', 'savestra', 85000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('SCL', 'sc1', 100000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Schafter SD', 'schafter2', 45000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Schafter ST', 'schafter3', 40000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Schwarzer', 'schwarzer', 65350, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Seminole', 'seminole', 97000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('sentinel', 'sentinel', 100000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Serrano', 'serrano', 78000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Seven 70', 'seven70', 93000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Sheava', 'sheava', 250000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Slam Van', 'slamvan', 80000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Specter', 'specter', 88750, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Speedo', 'speedo', 230000, 'vans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('stalion', 'stalion', 42000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Stanier', 'stanier', 40000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Stinger', 'stinger', 76000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Stratum', 'stratum', 63000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Streiter', 'streiter', 120000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Stretch', 'stretch', 1300000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Stromberg', 'stromberg', 77000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Sultan', 'sultan', 54642, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('sultanrs', 'sultanrs', 95000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Superd', 'superd', 42000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Surano', 'surano', 71350, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Surge', 'surge', 30000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('T20', 't20', 2800000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Tailgater', 'tailgater', 86000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Tampa GT', 'tampa', 90000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Tampa ST', 'tampa2', 43500, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Tempesta', 'tempesta', 900000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Torero', 'torero', 79000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Tornado', 'tornado', 68000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Tropos', 'tropos', 95000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Turismo SC', 'turismo2', 1200000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Turismor', 'turismor', 2200000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Tyrus', 'tyrus', 2300000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Vacca', 'vacca', 800000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Vader', 'vader', 11700, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Vagner', 'vagner', 3500000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Verlierer ST', 'verlierer2', 96000, 'sports', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Vigero', 'vigero', 78000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Virgo', 'virgo', 75000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Viseris', 'viseris', 200000, 'sportsclassics', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Visione', 'visione', 2250000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Voltic', 'voltic', 100000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Voodoo', 'voodoo', 150000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Vortex', 'vortex', 13356, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Warrener', 'warrener', 64000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Washington', 'washington', 25000, 'sedans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Windsor', 'windsor', 500000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('windsor S', 'windsor2', 550000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Wolfsbane', 'wolfsbane', 27000, 'motorcycles', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('XA21', 'xa21', 2375000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('XLS', 'xls', 253000, 'suvs', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Yosemite', 'yosemite', 475000, 'muscle', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Youga', 'Youga', 24000, 'vans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Youga VN', 'youga2', 300000, 'vans', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Zentorno', 'zentorno', 725000, 'super', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('zion', 'zion', 75000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('zion S', 'zion2', 80000, 'coupes', NULL);
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Ztype', 'ztype', 200000, 'sportsclassics', NULL);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
