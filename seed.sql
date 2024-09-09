-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nlmexkiqtjnwqueqicawripdpmzaronaujtt` (`primaryOwnerId`),
  CONSTRAINT `fk_fbosbhgrymqkthghcomlzvhnjulmetoffnvz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nlmexkiqtjnwqueqicawripdpmzaronaujtt` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lesideawxyhnniqngherhngqujzfwxaxzhac` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_mjfsxqdfiwlucsboylqyainfjnrbxzlbgiyr` (`dateRead`),
  KEY `fk_vlenduimijofihggqdxvbhedgclfwsqycgbb` (`pluginId`),
  CONSTRAINT `fk_naxuzcwufpesflxpmhhgweqygjtguusfsrtr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vlenduimijofihggqdxvbhedgclfwsqycgbb` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qckdxcxsnxloekxickvhticvwkekarwacoqq` (`sessionId`,`volumeId`),
  KEY `idx_yfovnoxypptipednrohrgzvfnublnadtzyzy` (`volumeId`),
  CONSTRAINT `fk_qdzctqhlpbqntsrvcmjxtjjgxmhzfewjmxhc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yxzzlzkybkbpnzrjswvldttnjssgsfnxjrnr` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_avjokqcfwrajbctnuggichhnjowcrtjweykj` (`filename`,`folderId`),
  KEY `idx_skzyagsdhuoamwdiirczctajhplhbgnzmsno` (`folderId`),
  KEY `idx_mtlifvtazjarkwjreufsswedhjtjhhstcvgm` (`volumeId`),
  KEY `fk_hblysetsrggzdctqddjcofiiaqeawizioplv` (`uploaderId`),
  CONSTRAINT `fk_bjughaezoopkradzpkwlqlngdpnwzmtxnpvz` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cibaphrsrjedhvmaueuniwheldbkyizjjffh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gilvmurwpxriodilvrdbcaxbwrbfdizflkcp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hblysetsrggzdctqddjcofiiaqeawizioplv` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_athaxeolhznuycdqoahrvhgpkbbdukjeqvml` (`siteId`),
  CONSTRAINT `fk_ahivhckeiayracfperwxnymtnbbukwstqmkn` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_athaxeolhznuycdqoahrvhgpkbbdukjeqvml` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_odxnhgjqbugqtmzlukpgnqbjedqpdginwfmx` (`userId`),
  CONSTRAINT `fk_odxnhgjqbugqtmzlukpgnqbjedqpdginwfmx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hueaciknzwkcbtckwnmymztjlegsrkjnuupz` (`groupId`),
  KEY `fk_vsitfzzxsuigfzgzppcfkrehidcddirdhlzp` (`parentId`),
  CONSTRAINT `fk_niqixhhlgbmatrireyycdywfpsvissevozrl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ssuxroxjfvfusefbmccmxodjjrghpexkljav` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vsitfzzxsuigfzgzppcfkrehidcddirdhlzp` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pzncnsujjsxbkbbpxmdzzagipejhvqmtoqoj` (`name`),
  KEY `idx_pmmwxlegjqxokzxqmmwxcwapeojnmxakjwmk` (`handle`),
  KEY `idx_uqiksciivlhlbrpyjnwihnvicpanovdofxew` (`structureId`),
  KEY `idx_zucptfhsmcrveoigdfljlccpklubtotfssxt` (`fieldLayoutId`),
  KEY `idx_wxdomfyhzhticqxefvqnlxlhtznfidyhrelq` (`dateDeleted`),
  CONSTRAINT `fk_asbfhiqletxbcnxxgwkdajjaorvgpuvzyyzr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hvbyyiqtjkvhjsarhomahipcpoabqyvgkbxt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rmdbfqhidtlqzcrhmcoxwqfncsxtjdhennzz` (`groupId`,`siteId`),
  KEY `idx_apztjxwscpokyewvqagkhhsoybypadnissrn` (`siteId`),
  CONSTRAINT `fk_aomsvnnrjtkhzzgnpvghhzyvmvvidpzlovji` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nsobgapfzdweceocidxjxcyspnpcyigjoauj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_kbiqgcjbgrcahnpdiporwfesbtfsgfpduxdj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_txmxhwkjzivjwbsoiwqvtiwsywgerlhamwgh` (`siteId`),
  KEY `fk_qhvgzapvtnuxbapvxtybrtilcgqbtnilsaku` (`userId`),
  CONSTRAINT `fk_qhvgzapvtnuxbapvxtybrtilcgqbtnilsaku` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_txmxhwkjzivjwbsoiwqvtiwsywgerlhamwgh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zcijxuqcjtgfjappiuuzsubitkvbykxkmoyu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_jandmnzezjojrtgxyciqcajoumfwmfjidvni` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_fdvismvjvgeevfmekjblglpmgygijcymunmv` (`siteId`),
  KEY `fk_pkdnptmnuuqucshwgafpwhckjeppfzpmymvw` (`fieldId`),
  KEY `fk_fkyiqzeqzoxxgqlwambqhykdicxzdiszdvcp` (`userId`),
  CONSTRAINT `fk_fdvismvjvgeevfmekjblglpmgygijcymunmv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fkyiqzeqzoxxgqlwambqhykdicxzdiszdvcp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_kpgrxwbuwgehssozfpwmxzifesolluwaxklc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pkdnptmnuuqucshwgafpwhckjeppfzpmymvw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sqvtnnpsjsfzgrvfsttqktnuglavuhbfvhya` (`userId`),
  CONSTRAINT `fk_sqvtnnpsjsfzgrvfsttqktnuglavuhbfvhya` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ljskeslympkmbiwxowdzbboksrawajqxggqf` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_lzenylrdfqzvjcqrleicbrqjcxizgeipldtp` (`creatorId`,`provisional`),
  KEY `idx_xrhzipggtutvebmjuaknmsvhrgyiavnuopgj` (`saved`),
  KEY `fk_cmxvnfnunxuutndtbvlkhjdjtzsmcacnxmea` (`canonicalId`),
  CONSTRAINT `fk_cmxvnfnunxuutndtbvlkhjdjtzsmcacnxmea` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hhyowtqsxvygvgwuaummhuweclllxqiovjul` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_fvffzknkvaypdgtkwvqqkvuwjkudvhxsobtb` (`elementId`,`timestamp`,`userId`),
  KEY `fk_kfiohpfwznvdcrfcqvlnkxwpxizkrhcsqbbe` (`userId`),
  KEY `fk_zgeojhitpxlcrcyjdeuvzacqcagdpnydlbep` (`siteId`),
  KEY `fk_osfifloannfjvjzayioftwpjznbqhcoiozxp` (`draftId`),
  CONSTRAINT `fk_kfiohpfwznvdcrfcqvlnkxwpxizkrhcsqbbe` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_osfifloannfjvjzayioftwpjznbqhcoiozxp` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfguidhukxmpuwidqmuqxvcicejymhtbmwfp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zgeojhitpxlcrcyjdeuvzacqcagdpnydlbep` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gfkzgasiumkhwejdetoieincxxzuctytndpm` (`dateDeleted`),
  KEY `idx_uuzobezzsbouhbpjtrddbmvkhtykmooieepp` (`fieldLayoutId`),
  KEY `idx_jkzqnbnahoutumvysuohundjoxvxbzfsztcj` (`type`),
  KEY `idx_lpylidoyiqcwfnvadxllornwcvwsadlvaglz` (`enabled`),
  KEY `idx_zcjdvxknsimtgxbivnlpfnprwyhrbnwnnold` (`canonicalId`),
  KEY `idx_vteqlumpunypyhomfcryvgjwzwxsrlgjecou` (`archived`,`dateCreated`),
  KEY `idx_efjxllkuvzsjkoptpuhnbxomqsuzivmexemw` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_dogrjtkchzpcwachowhhnmgygxvzckoiwgya` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_jwnbuxbruibxbmprijzpyjiazfqgkzcwwfdw` (`draftId`),
  KEY `fk_cuworlsddivsskfhksaysrxdaodapsymecyo` (`revisionId`),
  CONSTRAINT `fk_cuworlsddivsskfhksaysrxdaodapsymecyo` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jrurnjljrlvmmtkdosiwfxjbeixkqypzwqau` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jwnbuxbruibxbmprijzpyjiazfqgkzcwwfdw` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zomftqdvfkcnpueeukdwuqrhnmmtykbnfjkg` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_hepszvaalkzbspymtfouagpvqkyvhicgeoib` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_yibjrypypckneuaskvtrbwhygwbvtlekydfx` (`ownerId`),
  CONSTRAINT `fk_ikdxuipwyvsihozlfyhkjtyunmwxcaaqohnr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yibjrypypckneuaskvtrbwhygwbvtlekydfx` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xedjcwyzbweqntczhhymfhynhmogopdfyren` (`elementId`,`siteId`),
  KEY `idx_wughywxthkcvjxvuidmpugmuiegnaipathua` (`siteId`),
  KEY `idx_mxyzjljytmgcbmmpojpibjzkrbaqmnfhnyjf` (`title`,`siteId`),
  KEY `idx_bclwtdvgbtformvfsqmdgxgspuxvhrskbads` (`slug`,`siteId`),
  KEY `idx_jskpfpasoyfferflzkkekeblafntorruartc` (`enabled`),
  KEY `idx_psjwxoicehfrvnwmzcarvzqlfpooqacilkbs` (`uri`,`siteId`),
  CONSTRAINT `fk_cmarbculmzcvtwvpqezvqqvoluseifioyily` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ywizscmycnjqykrmnokpaljlnvysdoswcgjn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dviqylsmzflyzxabgnhfcwdpxfogfacgdvsy` (`postDate`),
  KEY `idx_izqzxrataewqlofxwofupholwwzmsjasmamb` (`expiryDate`),
  KEY `idx_kiwmjubguwywdlcgodvjozhakdpxyrtrrwvb` (`sectionId`),
  KEY `idx_qtjbhjjdovvjikefpupzrxkghaeibyfbfgxu` (`typeId`),
  KEY `idx_cvnbwtjmmehhalwpaezixlgcnrhqatzjjmzo` (`primaryOwnerId`),
  KEY `idx_avblnbiqatodvzjunzskjkgjtumimjtkgdsh` (`fieldId`),
  KEY `fk_wwuwulbysbwbiigsnzbnzkyvittcuahbffta` (`parentId`),
  CONSTRAINT `fk_hgkjvhspwtzlnlsrtydehbxhxjqnyyeavnom` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ksslutnchvpxrnbdbocjtoalrfslllksmsem` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ooiwnfpimvmrncbtpywrpgkatkybojhhtlxq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wwuwulbysbwbiigsnzbnzkyvittcuahbffta` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xfwxydttfkvmqhdfjsmheybrsrqxwqyjmnpr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yqndgdfixjxqmbieqwbnlkdbrpbbyctemrra` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_uzisszjrerzelwtxzrvrpvzlxrinhxxdiqsv` (`authorId`),
  KEY `idx_yyrcuxjnruchxpaegkonujpodageflcmfwhn` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_duznvdrhvqhqhmtaczcmxxcwvmdikniaxupn` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xbvgksxooyrrdknwrkkhdochbueagaoiussn` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kwumvuihtkaqblapqkrejykwyufopjmvbged` (`fieldLayoutId`),
  KEY `idx_ouovkpjdbvyrgpqupnpfivblfzbgduaptvpv` (`dateDeleted`),
  CONSTRAINT `fk_leiyjpcwuzqlibqvubuaobfqvxgwgmnuaaeq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kxykmwnjcowogkdqglljcgnefueksfzdltpp` (`dateDeleted`),
  KEY `idx_zurdrbqnjmavbfnhiqjkhvoiguslpbhxqwab` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eeojnzhbbqgpcjoifjmjdwmkjezddyptxeao` (`handle`,`context`),
  KEY `idx_nzpfkjfnnwhtovpthnsjtglqutwvjhefyzij` (`context`),
  KEY `idx_srufmmrsfimotcbehkxdufffdrjskwrvhsjl` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kwmllxtdhmctfxqtqxhlafppfpdopxmtklse` (`name`),
  KEY `idx_xpaxsyvoxmralssxzfjbbzekvmdnampqktkh` (`handle`),
  KEY `idx_znifwdswcbezidjdtnzxybhpzwzozxfzvuxb` (`fieldLayoutId`),
  KEY `idx_pkfwveyjqxkyjbziccqedvdvslsodyunsmps` (`sortOrder`),
  CONSTRAINT `fk_anbwqujzqqgaacadtswgpsomjwokrxmxswkt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hmymogutmlwgcspcjebkuwaqdwyuslyzyger` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aqptinkwxamqsqaynruakqwakwngwyoduqtb` (`accessToken`),
  UNIQUE KEY `idx_uokiruvzkbrgwmstkevlghvfaxlcizdajyyi` (`name`),
  KEY `fk_cktoeizpdjlauwdqgbcgzuhbjzdudqjbwrnp` (`schemaId`),
  CONSTRAINT `fk_cktoeizpdjlauwdqgbcgzuhbjzdudqjbwrnp` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qjsmvkrbbygwlldylilljwieoeqkhsqquzeb` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ckvoxgtondjdljicbbaxhcsmltsonsphajlx` (`name`),
  KEY `idx_rydbcpqhnzvjvrabwqxyktxhlhkqlofojveo` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ewykvgbqqbzliurmqpzmytjdgmndezhgotfu` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rqkeemaysdzxpojwvmgqwohegfzlnirtupja` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_ewfzmdckmacwgbevgyapapwkqefswmoxouis` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_gjpsmcgrrgkrkfekfagbccxpeheyyizejdhh` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_segniwxjnfqqtluzsoevqxtmnippglprnxhx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_giystynijlotuwglhzlimlbcjmvukljxfwkj` (`sourceId`),
  KEY `idx_lridifodndrjjnpnbucpxvcemvfsczwyapuk` (`targetId`),
  KEY `idx_uvvjujpqxxvatxjqlwigvjbmhaouwmmkdpng` (`sourceSiteId`),
  CONSTRAINT `fk_deyotnavtbjmrhhnldewkdjviybczffqihix` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mcupmjnochftomdjmlmohyhgmkfzfnwuqnok` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uvpjhjjxfohrnjrmjlncsuraqoatuokgrddp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fsevxozrsdcpooqzvevbeexdhegucxbvkmys` (`canonicalId`,`num`),
  KEY `fk_dhxgxiflajmaiakhxwuwaorqxidxwzpgzrbn` (`creatorId`),
  CONSTRAINT `fk_dhxgxiflajmaiakhxwuwaorqxidxwzpgzrbn` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qzvtfxdgptzwioywallradxfajjlqtjrkyfv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_kdgwxcjcsvqhxxonagdbzzfltsplarqsztfg` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iwrhfbxhniigmnvkshrdrmltdmdlrhysvsgf` (`handle`),
  KEY `idx_lhqxgqooueytrpcszbmtxaafkeeshxerpofb` (`name`),
  KEY `idx_kreylmtddfwpnmouububplekvepaowzmsmfk` (`structureId`),
  KEY `idx_zinlvbzggtcguxfngukdthdysufffshslrrj` (`dateDeleted`),
  CONSTRAINT `fk_jdgpyyrbbcspvzacstsxmcyeaxnulafbqfqy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_qqvxdflfxxvfzznduifgdviszqitstmnebdm` (`typeId`),
  CONSTRAINT `fk_dwftgvhhvxledoyxztasdvrkbgrkrqailjfr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qqvxdflfxxvfzznduifgdviszqitstmnebdm` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dekkjqhdtjbidirzdwxezbxuxeduzukkqfkw` (`sectionId`,`siteId`),
  KEY `idx_mskunrcejakbzmvorjstrdnizooectjczqat` (`siteId`),
  CONSTRAINT `fk_irfkytntamrjljikowpzzeylumcaxzlzuuyc` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lkrfsxtkwbtsytubtzvjfccqcfrhzabskrae` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ajbiafpoepffvwajzwhjqjtjvfadyfjncqfm` (`uid`),
  KEY `idx_zmtjzflafoypflbkwougizwxinboowxsaflt` (`token`),
  KEY `idx_xsweuhoptcobijmlvqdzgkvmilyyohdguubw` (`dateUpdated`),
  KEY `idx_lxnbxtuxxmqevtitjwltymykxedkeewecklx` (`userId`),
  CONSTRAINT `fk_dmbugacsgqlydhqmzsrmdanbxflwnynrtfhp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nimmavyawoulmrfbhpircrketfkwwvdbgygt` (`userId`,`message`),
  CONSTRAINT `fk_aizfugobrwnablcoamzbjgruzenyuzcjuxej` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eurwkxsaghzvhaituycfubugdvrgirjjbltp` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lwfpbcysxootjdqombbtaqjqxjlwtgsbpdnb` (`dateDeleted`),
  KEY `idx_kevvzuotllgfttodbghflqtrntjijuskggcx` (`handle`),
  KEY `idx_yazqfvftvtcpvukuwvxjiljehkkoqdysposr` (`sortOrder`),
  KEY `fk_rggmfsaabbzuanscxohbwwqxuajuppvstwtc` (`groupId`),
  CONSTRAINT `fk_rggmfsaabbzuanscxohbwwqxuajuppvstwtc` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_wjyddxortzqeayowogmynddqdwoigwnbjfth` (`userId`),
  CONSTRAINT `fk_wjyddxortzqeayowogmynddqdwoigwnbjfth` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zjijpbdcrviyhgmaxattiwqlozuofzecyngu` (`structureId`,`elementId`),
  KEY `idx_rnexxhepihzmbxenehabnjuqaqgkevwubttu` (`root`),
  KEY `idx_ogxjzkajebesekrqbyhvlripbqxefwzcvxem` (`lft`),
  KEY `idx_fivgswrqcpjcnumqylrjrfrznddmyvaqznzb` (`rgt`),
  KEY `idx_kkguymxdzxtncxejivlffycrkizawvdasodn` (`level`),
  KEY `idx_vntalukvbgbmtjkcyjrgkggapmomhlaqrcvm` (`elementId`),
  CONSTRAINT `fk_tweuvpqkaawhnegntgvhbhmtbkpkpjmqmamw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uajnpsftcaixnjczanjuxwsrgqezrxptkujv` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ejaawpzbdlohehewcybsmfxehewuhuhxxupy` (`key`,`language`),
  KEY `idx_qjjussrypkcztuqamigxiciiovrqvkuhipkp` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_alaptdondfyzgxzewkryvvzprmvlzxnxxopy` (`name`),
  KEY `idx_skqibmwawcrbdzdyyvowpzpgzaguwhpwhndn` (`handle`),
  KEY `idx_xxtafwhcvoitqhwslccbwfjdmrviycekbrdq` (`dateDeleted`),
  KEY `fk_dftpvfhtdgopzktivapihfyqtrntdahjqkdu` (`fieldLayoutId`),
  CONSTRAINT `fk_dftpvfhtdgopzktivapihfyqtrntdahjqkdu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zlnvbjqcyfxlhigljaktokecmamtybkasdsc` (`groupId`),
  CONSTRAINT `fk_oubollgqdayzfkafotbucsokdnvjnitpcyjg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ueldzsxbnhfuiebrbgvagmuomspbiprraufb` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_accualqhellwdebffnquygmmahzapupvorql` (`token`),
  KEY `idx_aumusrwitpbfoqaqbaxpwsogsxldwbfddxjk` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iaeclkbsvqaosqvmppxcjilcmfjdbvsaeyfx` (`handle`),
  KEY `idx_vqzazunpcydkrqbbmchoummxarztbbemhbxk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ihvvbgngawhpmhzbytroepodlqfsqxwjjghy` (`groupId`,`userId`),
  KEY `idx_spmkhnlgngrjkghtdlsovoqylznuofzimguh` (`userId`),
  CONSTRAINT `fk_pyftmfamsmcijworferxruuzmogcifrzjfbe` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qcvluckddocvgpcqoayjhddxrmimkmhjiapu` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pzevwpacohqfuyxwkwtqajwhzxrjvccppnog` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szjluyizapkgwjminowgwavqxedylpjabquf` (`permissionId`,`groupId`),
  KEY `idx_cqsutaciievdgplrflxsvwzjfxhxpptrnsxo` (`groupId`),
  CONSTRAINT `fk_focjiitupsvyvskhweopfcajgjtvxzttlccb` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pwkaaekmpayyscwmdussoqvncbeeihbnqnlv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qxgertezwiycvedljymutxypboxzcdqwcfpk` (`permissionId`,`userId`),
  KEY `idx_egdqwefmdjarcxhqoclzcbmrnueblmjspbuz` (`userId`),
  CONSTRAINT `fk_doylvnwxxhtxarjxjxttighkgjwyqkgaaknf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytndeoidtnpapftclkdhutyrodeabxkjsnkb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_owivhjabhykkewjqjoswwowjzjyitdoqtszb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jkmbfiokdslwmovmcgzqgvlkiusrzbwxxzgt` (`active`),
  KEY `idx_dqitvczyszgjrxdfvxpxxkedoekllvmuewxs` (`locked`),
  KEY `idx_nsgvvsyzkcoqhltdduhenrbxvllgksscdyvc` (`pending`),
  KEY `idx_cqyylyspwdugpleblgsvhtxvgrlclormxuie` (`suspended`),
  KEY `idx_ihzzjqasuzfktrsmjpgglfcheggnjleksqsd` (`verificationCode`),
  KEY `idx_anzlaslpbiaffiubktiwnumcfzmbuuozwfqm` (`email`),
  KEY `idx_dfkhygfxurhnispiipihqqctignhdxapwdfi` (`username`),
  KEY `fk_cqeacicpeyvjgvkvmmbzprlpyeqgxsrtaazm` (`photoId`),
  CONSTRAINT `fk_cqeacicpeyvjgvkvmmbzprlpyeqgxsrtaazm` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yydlyyipykqoywmnizwyermdcgptakqbdnlj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zikfwkxwpukhkhazrwfvwvsucshlupxydyao` (`name`,`parentId`,`volumeId`),
  KEY `idx_rldbpavnycdzsrunxspugdqehukvceqlosof` (`parentId`),
  KEY `idx_bdgjpnmrcasuxypghymiwtuornyjcjkxtbhd` (`volumeId`),
  CONSTRAINT `fk_faakpsqvckwqrymdfhuzgakyqlnbtiamklwv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xefvuluvpbeamsyfldvqlkqsfodqbiuwxhhx` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qgehrokphiolblubcgvzaegeqkhjimusddix` (`name`),
  KEY `idx_gwynunoyrlqazanahbezupftgrgztowjzqyd` (`handle`),
  KEY `idx_zlzzpvxnkhvprdfyktnbtdgrkxatccvsowge` (`fieldLayoutId`),
  KEY `idx_jbcloxtkzkgysbbwgjrnohirbbhsybwfczwe` (`dateDeleted`),
  CONSTRAINT `fk_ypwiypvrvhaqsuodyyremflhaiqgqorvjxqg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pxnmzbxhdqvdbikrzudkaalcivegnmikjtix` (`userId`),
  CONSTRAINT `fk_pxnmzbxhdqvdbikrzudkaalcivegnmikjtix` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bjupcniizexvqklkhumrptweyopmovoczljv` (`userId`),
  CONSTRAINT `fk_ffpfmhlrxbfifxxamaucwcklsrjdmpyvnhfq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-09 13:13:41
-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES
(6,1,1,1,'sign-up.jpg','image',NULL,1289,780,120683,NULL,NULL,NULL,'2024-08-22 13:59:09','2024-08-22 13:59:09','2024-08-22 13:59:09'),
(75,1,1,1,'07bf8a92b22866fde5a2ac2f289e4140.jpg','image',NULL,736,736,254999,NULL,NULL,NULL,'2024-08-27 12:41:17','2024-08-27 12:41:17','2024-08-27 12:41:17');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES
(6,1,NULL),
(75,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES
(14,1,NULL,NULL,'2024-08-23 15:08:52','2024-08-23 15:08:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups` VALUES
(1,1,3,'Topics','topics','end','2024-08-22 13:19:06','2024-08-22 13:19:06',NULL,'9b59c16c-626b-4c1d-bae7-8164ef5b0aa1');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups_sites` VALUES
(1,1,1,1,'blog/topic/{slug}','blog/_topic.twig','2024-08-22 13:19:06','2024-08-22 13:19:06','f65aa0f6-4417-45e6-b8ab-447476874f1d');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES
(3,1,'expiryDate','2024-08-22 13:55:00',0,1),
(3,1,'postDate','2024-08-22 13:54:54',0,1),
(3,1,'slug','2024-08-22 13:54:47',0,1),
(3,1,'title','2024-08-22 13:54:47',0,1),
(3,1,'uri','2024-08-22 13:54:47',0,1),
(12,1,'fieldLayoutId','2024-08-22 14:20:08',0,1),
(12,1,'postDate','2024-08-23 15:09:05',0,1),
(12,1,'slug','2024-08-23 15:08:36',0,1),
(12,1,'title','2024-08-23 15:08:36',0,1),
(12,1,'typeId','2024-08-22 14:20:08',0,1),
(12,1,'uri','2024-08-23 15:08:36',0,1),
(13,1,'postDate','2024-08-23 15:04:55',0,1),
(14,1,'slug','2024-08-23 15:08:54',0,1),
(14,1,'title','2024-08-23 15:08:54',0,1),
(14,1,'uri','2024-08-23 15:08:54',0,1),
(17,1,'slug','2024-08-23 15:09:59',0,1),
(17,1,'title','2024-08-23 15:09:59',0,1),
(17,1,'uri','2024-08-23 15:09:59',0,1),
(19,1,'postDate','2024-08-23 15:10:52',0,1),
(19,1,'slug','2024-08-23 15:10:52',0,1),
(19,1,'title','2024-08-23 15:10:52',0,1),
(19,1,'uri','2024-08-23 15:10:52',0,1),
(25,1,'fieldLayoutId','2024-08-23 15:13:27',0,1),
(25,1,'postDate','2024-08-23 15:14:07',0,1),
(25,1,'slug','2024-08-23 15:16:53',0,1),
(25,1,'title','2024-08-23 15:13:31',0,1),
(25,1,'typeId','2024-08-23 15:13:27',0,1),
(25,1,'uri','2024-08-23 15:13:01',0,1),
(26,1,'postDate','2024-08-23 15:13:38',0,1),
(44,1,'postDate','2024-08-27 09:44:20',0,1),
(72,1,'enabled','2024-08-27 12:41:29',0,1),
(72,1,'title','2024-08-27 12:41:24',0,1),
(72,1,'uri','2024-08-27 12:40:39',0,1),
(81,1,'postDate','2024-08-29 08:23:07',0,1),
(82,1,'postDate','2024-08-29 08:36:53',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES
(12,1,1,'c5f127d0-97a7-4aff-86d2-b1794b49ba5e','2024-08-23 15:09:10',0,1),
(12,1,2,'8e4ec545-62eb-46eb-9751-5b205cf251b9','2024-08-23 15:09:10',0,1),
(12,1,3,'043f5e23-6b8c-45fa-8290-4b4d4dc38c8e','2024-08-23 15:09:10',0,1),
(12,1,4,'c94b7197-b184-4fbe-9ee0-548d7972c582','2024-08-23 15:09:10',0,1),
(13,1,5,'15eee6cf-231e-4be7-8aba-add31a28837e','2024-08-23 15:09:10',0,1),
(13,1,6,'24ebe54f-6d8e-4be0-a39d-b6d573fc5113','2024-08-23 15:09:10',0,1),
(25,1,1,'c5f127d0-97a7-4aff-86d2-b1794b49ba5e','2024-08-23 15:14:07',0,1),
(25,1,2,'8e4ec545-62eb-46eb-9751-5b205cf251b9','2024-08-23 15:14:07',0,1),
(25,1,3,'043f5e23-6b8c-45fa-8290-4b4d4dc38c8e','2024-08-23 15:14:07',0,1),
(25,1,4,'c94b7197-b184-4fbe-9ee0-548d7972c582','2024-08-29 08:37:30',0,1),
(26,1,5,'15eee6cf-231e-4be7-8aba-add31a28837e','2024-08-23 15:14:07',0,1),
(26,1,6,'24ebe54f-6d8e-4be0-a39d-b6d573fc5113','2024-08-26 14:15:34',0,1),
(26,1,7,'6d2a0f3b-576f-44fd-b3ae-54458ee28a18','2024-08-27 11:34:18',0,1),
(38,1,5,'15eee6cf-231e-4be7-8aba-add31a28837e','2024-08-26 14:15:17',0,1),
(44,1,5,'15eee6cf-231e-4be7-8aba-add31a28837e','2024-08-27 09:44:20',0,1),
(49,1,6,'24ebe54f-6d8e-4be0-a39d-b6d573fc5113','2024-08-27 11:31:15',0,1),
(55,1,6,'24ebe54f-6d8e-4be0-a39d-b6d573fc5113','2024-08-27 11:31:15',0,1),
(72,1,8,'b46928ce-a347-433e-b9a3-e90c2849dff6','2024-08-27 12:41:24',0,1),
(72,1,9,'a194a682-d580-4e87-8ff4-eeee0f71920a','2024-08-27 12:41:24',0,1),
(81,1,5,'15eee6cf-231e-4be7-8aba-add31a28837e','2024-08-29 08:23:07',0,1),
(81,1,6,'24ebe54f-6d8e-4be0-a39d-b6d573fc5113','2024-08-29 08:23:07',0,1),
(81,1,7,'6d2a0f3b-576f-44fd-b3ae-54458ee28a18','2024-08-29 08:23:07',0,1),
(82,1,5,'15eee6cf-231e-4be7-8aba-add31a28837e','2024-08-29 08:37:02',0,1),
(82,1,6,'24ebe54f-6d8e-4be0-a39d-b6d573fc5113','2024-08-29 08:37:02',0,1),
(82,1,7,'6d2a0f3b-576f-44fd-b3ae-54458ee28a18','2024-08-29 08:37:02',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES
(1,NULL,1,0,'First draft',NULL,0,NULL,0),
(4,NULL,1,0,'First draft',NULL,0,NULL,0),
(5,NULL,1,0,'First draft',NULL,0,NULL,0),
(6,NULL,1,0,'First draft',NULL,0,NULL,0),
(10,NULL,1,0,'First draft','',0,NULL,1),
(11,NULL,1,0,'First draft',NULL,0,NULL,0),
(13,NULL,1,0,'First draft',NULL,0,NULL,0),
(14,NULL,1,0,'First draft',NULL,0,NULL,0),
(15,NULL,1,0,'First draft',NULL,0,NULL,0),
(16,NULL,1,0,'First draft',NULL,0,NULL,0),
(26,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES
(3,1,1,NULL,'save','2024-08-22 14:04:30'),
(6,1,1,NULL,'save','2024-08-23 15:15:12'),
(12,1,1,NULL,'save','2024-08-23 15:09:10'),
(14,1,1,NULL,'save','2024-08-23 15:08:54'),
(17,1,1,NULL,'save','2024-08-23 15:09:59'),
(19,1,1,NULL,'save','2024-08-23 15:10:52'),
(25,1,1,NULL,'edit','2024-08-29 08:37:29'),
(25,1,1,NULL,'save','2024-08-29 08:37:30'),
(25,1,1,NULL,'view','2024-08-29 08:37:21'),
(44,1,1,NULL,'save','2024-08-27 09:44:20'),
(72,1,1,NULL,'edit','2024-08-27 12:41:24'),
(72,1,1,NULL,'save','2024-08-27 12:41:24');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES
(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-08-22 12:26:29','2024-08-22 12:26:29',NULL,NULL,NULL,'7723e441-b744-4f2d-95d3-3c450d5c6c3f'),
(2,NULL,1,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-22 13:54:00','2024-08-22 13:54:00',NULL,NULL,NULL,'08cd7098-606d-40f8-89b5-9173d1ca7f95'),
(3,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-22 13:54:00','2024-08-22 14:04:30',NULL,NULL,NULL,'3bdae75d-41bf-49da-b3cd-df5d5c54d5d0'),
(4,3,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-08-22 13:55:03','2024-08-22 13:55:03',NULL,NULL,NULL,'b0d32ea7-16b3-4958-a087-d31940d0d242'),
(5,3,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-08-22 13:58:35','2024-08-22 13:58:35',NULL,NULL,NULL,'3f13796d-48e4-465e-be2a-660258f3b119'),
(6,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-22 13:59:09','2024-08-23 15:15:12',NULL,NULL,NULL,'00c892e1-7c15-4e0e-8e20-6b31cde7ae40'),
(8,3,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-08-22 14:04:30','2024-08-22 14:04:30',NULL,NULL,NULL,'e364a6c1-f479-4dbb-a408-b726d95115e2'),
(9,NULL,4,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-22 14:05:56','2024-08-22 14:05:56',NULL,NULL,NULL,'7b854977-012e-4713-97c6-8e130b686e55'),
(10,NULL,5,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-22 14:19:07','2024-08-22 14:19:07',NULL,NULL,NULL,'ca6ba52b-4a92-48ab-86b4-16ae5c5a1eac'),
(11,NULL,6,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-22 14:19:22','2024-08-22 14:19:22',NULL,NULL,NULL,'e85ed64d-8765-49a7-86dc-e28b2cab5d36'),
(12,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-08-22 14:20:04','2024-08-23 15:09:10',NULL,NULL,NULL,'29f15f16-1169-4550-a4bf-96ad639a93df'),
(13,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-23 15:04:54','2024-08-23 15:09:10',NULL,NULL,NULL,'04e72c07-7f19-4564-a43c-2b068d0f767a'),
(14,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2024-08-23 15:08:52','2024-08-23 15:08:54',NULL,NULL,NULL,'7ccdce4a-8b34-49f4-abcb-a8e03c177834'),
(15,12,NULL,4,4,'craft\\elements\\Entry',1,0,'2024-08-23 15:09:10','2024-08-23 15:09:10',NULL,NULL,NULL,'c5c8917d-8341-4ceb-bcb6-e23fd95865ed'),
(16,13,NULL,5,5,'craft\\elements\\Entry',1,0,'2024-08-23 15:09:10','2024-08-23 15:09:10',NULL,NULL,NULL,'f0ccf3d9-1599-48ca-9fc3-e650ae686379'),
(17,NULL,10,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:09:52','2024-08-23 15:10:27',NULL,'2024-08-23 15:10:27',NULL,'bda2526b-832f-4a62-8eb0-9ed123e2a481'),
(18,NULL,11,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:10:32','2024-08-23 15:10:32',NULL,NULL,NULL,'eb0fbc62-760e-436f-96a1-1f5a66fa76c2'),
(19,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:10:48','2024-08-23 15:10:57',NULL,'2024-08-23 15:10:57',NULL,'845df444-9a09-4331-ba03-b21089faefa2'),
(20,19,NULL,6,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:10:52','2024-08-23 15:10:52',NULL,'2024-08-23 15:10:57',NULL,'254c73d2-7b53-4ee0-baee-2fa4024b07db'),
(21,NULL,13,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:11:25','2024-08-23 15:11:25',NULL,NULL,NULL,'070b29a7-2ef7-4b75-a8ea-00c307f67284'),
(22,NULL,14,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:11:25','2024-08-23 15:11:25',NULL,NULL,NULL,'2c110c94-c013-435e-9168-459d56eab1ca'),
(23,NULL,15,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:11:55','2024-08-23 15:11:55',NULL,NULL,NULL,'2b0d8e2e-52c2-4163-b496-72ec67662177'),
(24,NULL,16,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-23 15:11:55','2024-08-23 15:11:55',NULL,NULL,NULL,'bcecc2e8-8694-4d17-9a82-b0f9f6555174'),
(25,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-08-23 15:12:44','2024-08-29 08:37:30',NULL,NULL,NULL,'2bfe6a67-2433-4e65-939e-dfc3b9835db3'),
(26,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-23 15:13:38','2024-08-27 11:34:18',NULL,NULL,NULL,'aa4d4acc-f90e-412d-992e-d7eaab09790d'),
(27,25,NULL,7,4,'craft\\elements\\Entry',1,0,'2024-08-23 15:14:07','2024-08-23 15:14:07',NULL,NULL,NULL,'58e0ad05-a201-4327-993f-0a9e0189dcbf'),
(28,26,NULL,8,5,'craft\\elements\\Entry',1,0,'2024-08-23 15:14:07','2024-08-23 15:14:07',NULL,NULL,NULL,'ff378d3b-4ff2-4437-b203-1536795486f1'),
(32,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-23 15:16:52','2024-08-26 14:15:34',NULL,'2024-08-26 14:15:34',NULL,'e82a4f48-1464-47a0-99c8-8aee89819585'),
(33,25,NULL,9,4,'craft\\elements\\Entry',1,0,'2024-08-23 15:16:52','2024-08-23 15:16:52',NULL,NULL,NULL,'429b48ac-ae63-4de7-88c6-4cc0b13364f4'),
(34,32,NULL,10,5,'craft\\elements\\Entry',1,0,'2024-08-23 15:16:52','2024-08-23 15:16:53',NULL,'2024-08-26 14:15:34',NULL,'0867dac4-ed8e-487d-a18b-f6360d43f5ba'),
(35,25,NULL,11,4,'craft\\elements\\Entry',1,0,'2024-08-23 15:33:06','2024-08-23 15:33:06',NULL,NULL,NULL,'15d703a7-b0b0-487d-ac20-66cf0248766b'),
(36,25,NULL,12,4,'craft\\elements\\Entry',1,0,'2024-08-26 13:46:37','2024-08-26 13:46:37',NULL,NULL,NULL,'e5478972-161d-4e38-859e-fb4b03929297'),
(38,32,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-26 14:15:17','2024-08-26 14:15:20',NULL,'2024-08-26 14:15:20',NULL,'f692082b-57c2-41db-ad73-c6e1bd8ad7f6'),
(40,25,NULL,13,4,'craft\\elements\\Entry',1,0,'2024-08-26 14:15:34','2024-08-26 14:15:34',NULL,NULL,NULL,'8e9a0afe-c769-4e0c-93d5-521cb63afa7d'),
(41,26,NULL,14,5,'craft\\elements\\Entry',1,0,'2024-08-26 14:15:34','2024-08-26 14:15:34',NULL,NULL,NULL,'955ff9e4-9c95-4c7c-86c5-05e86014393e'),
(42,25,NULL,15,4,'craft\\elements\\Entry',1,0,'2024-08-26 14:17:16','2024-08-26 14:17:16',NULL,NULL,NULL,'d6588f97-de1c-4728-96b0-2a87c5caa24c'),
(43,25,NULL,16,4,'craft\\elements\\Entry',1,0,'2024-08-27 09:44:09','2024-08-27 09:44:09',NULL,NULL,NULL,'25460670-662e-4b1a-8a3c-7371e2b7859c'),
(44,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:44:16','2024-08-27 09:44:39',NULL,'2024-08-27 09:44:39',NULL,'bfc694e7-7d23-4c53-bcd6-e2f40c960e56'),
(45,44,NULL,17,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:44:20','2024-08-27 09:44:20',NULL,'2024-08-27 09:44:39',NULL,'7f544527-46aa-4214-894e-94cbefc7189f'),
(46,NULL,26,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:44:28','2024-08-27 09:44:28',NULL,'2024-08-27 09:44:53',NULL,'60901422-3521-430c-a6c1-77f4a96b575b'),
(49,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:55:43','2024-08-27 11:31:15',NULL,NULL,NULL,'42c2fa11-22a3-4bef-acaf-d6ad86d12dd0'),
(50,25,NULL,18,4,'craft\\elements\\Entry',1,0,'2024-08-27 09:55:43','2024-08-27 09:55:43',NULL,NULL,NULL,'1d3bbbe8-f173-4921-9c24-2e553619f31a'),
(51,49,NULL,19,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:55:43','2024-08-27 09:55:43',NULL,NULL,NULL,'51b4ba3c-c3cc-413a-b3d9-fcef86e0eec2'),
(55,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:57:49','2024-08-27 11:31:15',NULL,NULL,NULL,'c9fefc3c-0752-45a1-aff6-c97dfbcf2a05'),
(56,25,NULL,20,4,'craft\\elements\\Entry',1,0,'2024-08-27 09:57:49','2024-08-27 09:57:49',NULL,NULL,NULL,'7950aa16-927a-4445-9c25-d68c975bfa68'),
(57,49,NULL,21,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:57:49','2024-08-27 09:57:49',NULL,NULL,NULL,'430e5083-7a22-4004-b667-05d7d63ab3b4'),
(58,55,NULL,22,5,'craft\\elements\\Entry',1,0,'2024-08-27 09:57:49','2024-08-27 09:57:49',NULL,NULL,NULL,'b29fae19-71bb-4a49-93b0-af15b5d09c23'),
(62,25,NULL,23,4,'craft\\elements\\Entry',1,0,'2024-08-27 11:31:15','2024-08-27 11:31:15',NULL,NULL,NULL,'59f8647c-04ca-4e78-84dd-984a226fe5f1'),
(63,49,NULL,24,5,'craft\\elements\\Entry',1,0,'2024-08-27 11:31:15','2024-08-27 11:31:15',NULL,NULL,NULL,'e529c181-7838-4f97-8567-0b8936e76e34'),
(64,55,NULL,25,5,'craft\\elements\\Entry',1,0,'2024-08-27 11:31:15','2024-08-27 11:31:15',NULL,NULL,NULL,'d9a6171a-621d-4d61-ab3e-8f2edd3e72cb'),
(67,25,NULL,26,4,'craft\\elements\\Entry',1,0,'2024-08-27 11:34:18','2024-08-27 11:34:18',NULL,NULL,NULL,'21a50e3a-add6-463c-a0c4-2284e37f3f2c'),
(68,26,NULL,27,5,'craft\\elements\\Entry',1,0,'2024-08-27 11:34:18','2024-08-27 11:34:18',NULL,NULL,NULL,'a278b811-1e26-4bdc-9842-b4808b096a6f'),
(69,25,NULL,28,4,'craft\\elements\\Entry',1,0,'2024-08-27 11:49:16','2024-08-27 11:49:16',NULL,NULL,NULL,'67b30808-2e1b-4bed-81b5-6f02a52ab0c4'),
(72,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2024-08-27 12:40:39','2024-08-27 12:41:29',NULL,NULL,NULL,'8afeacaf-2bfd-4045-b380-d219072528ea'),
(73,72,NULL,30,6,'craft\\elements\\Entry',0,0,'2024-08-27 12:40:39','2024-08-27 12:40:39',NULL,NULL,NULL,'26767c10-b38d-4481-9657-5e52d2997ead'),
(75,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 12:41:17','2024-08-27 12:41:17',NULL,NULL,NULL,'7e4f97d9-0e14-490c-9256-b2eafd89cb01'),
(76,72,NULL,31,6,'craft\\elements\\Entry',0,0,'2024-08-27 12:41:24','2024-08-27 12:41:24',NULL,NULL,NULL,'792b2d9b-7b47-48b0-9791-36d20311a23b'),
(77,72,NULL,32,6,'craft\\elements\\Entry',1,0,'2024-08-27 12:41:29','2024-08-27 12:41:29',NULL,NULL,NULL,'516685e8-3888-4162-baa5-88f04c6c6fc3'),
(78,NULL,NULL,NULL,7,'craft\\elements\\GlobalSet',1,0,'2024-08-27 12:51:09','2024-08-27 13:00:14',NULL,NULL,NULL,'79016788-c0f8-4921-a3ab-18b3281e476f'),
(79,25,NULL,33,4,'craft\\elements\\Entry',1,0,'2024-08-29 07:57:17','2024-08-29 07:57:17',NULL,NULL,NULL,'f76a1647-dda7-417c-b4ca-7f4889e93a9d'),
(81,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-29 08:23:07','2024-08-29 08:37:29',NULL,'2024-08-29 08:37:29',NULL,'61f7937e-1289-4c49-bd31-72190fdae706'),
(82,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-29 08:36:53','2024-08-29 08:37:26',NULL,'2024-08-29 08:37:26',NULL,'d1dfb05b-a67d-4948-9bcc-91e72d51b9f8'),
(83,25,NULL,34,4,'craft\\elements\\Entry',1,0,'2024-08-29 08:37:30','2024-08-29 08:37:30',NULL,NULL,NULL,'8307a99f-7f03-435c-853a-0db494872407');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES
(13,12,1),
(16,15,1),
(26,25,1),
(28,27,1),
(28,33,2),
(28,35,2),
(28,36,2),
(32,25,1),
(34,33,1),
(34,35,1),
(34,36,1),
(41,40,1),
(41,42,1),
(41,43,1),
(41,50,1),
(41,56,1),
(41,62,1),
(49,25,2),
(51,50,2),
(55,25,3),
(57,56,2),
(58,56,3),
(63,62,2),
(63,67,2),
(63,69,2),
(63,79,2),
(63,83,2),
(64,62,3),
(64,67,3),
(64,69,3),
(64,79,3),
(64,83,3),
(68,67,1),
(68,69,1),
(68,79,1),
(68,83,1);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES
(1,1,1,NULL,NULL,NULL,NULL,1,'2024-08-22 12:26:29','2024-08-22 12:26:29','dbe035b6-3c20-45d3-8625-2d795ffbf986'),
(2,2,1,NULL,'__temp_tvhpkfbdkzwisfdhnkurgpllbopyqpegwqkz','blog/__temp_tvhpkfbdkzwisfdhnkurgpllbopyqpegwqkz',NULL,1,'2024-08-22 13:54:00','2024-08-22 13:54:00','f839209e-03f3-4683-8658-638657a22456'),
(3,3,1,'test','test','blog/test',NULL,1,'2024-08-22 13:54:00','2024-08-22 13:54:47','f91dd915-2f2c-474f-a3b4-406cab488024'),
(4,4,1,'test','test','blog/test',NULL,1,'2024-08-22 13:55:03','2024-08-22 13:55:03','6d13ce3a-67f2-457f-9a29-f4bc9afd1a2f'),
(5,5,1,'test','test','blog/test',NULL,1,'2024-08-22 13:58:35','2024-08-22 13:58:35','8cbad82f-6476-4c9b-8be3-813ddf428d0c'),
(6,6,1,'Bend',NULL,NULL,NULL,1,'2024-08-22 13:59:09','2024-08-23 15:15:12','1782264d-d3c6-495f-955b-5047318e06c5'),
(8,8,1,'test','test','blog/test',NULL,1,'2024-08-22 14:04:30','2024-08-22 14:04:30','9db65966-8832-44d8-9661-f6bc15a32058'),
(9,9,1,NULL,'__temp_ishnisyxhydbvumpbvdwqlosawjowrgifbke','blog/__temp_ishnisyxhydbvumpbvdwqlosawjowrgifbke',NULL,1,'2024-08-22 14:05:56','2024-08-22 14:05:56','c6038f11-46f9-4bfb-9b2f-bf072eac8a37'),
(10,10,1,NULL,'__temp_nligrfmsfizroyqigjntyfxsufwypangnlxy','blog/__temp_nligrfmsfizroyqigjntyfxsufwypangnlxy',NULL,1,'2024-08-22 14:19:07','2024-08-22 14:19:07','aaa24bce-d52a-4cf1-be93-e395590ea3b4'),
(11,11,1,NULL,'__temp_ivtorvgdmnfodtlwujymqiqehkvgqfotosva','blog/__temp_ivtorvgdmnfodtlwujymqiqehkvgqfotosva',NULL,1,'2024-08-22 14:19:22','2024-08-22 14:19:22','776a1ac3-9239-4ea3-a343-9367a2407f42'),
(12,12,1,'Test','test-2','blog/test-2','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Testing\"}',1,'2024-08-22 14:20:04','2024-08-23 15:09:00','6370dd6b-57ee-4f65-a3e0-0a66088c2546'),
(13,13,1,NULL,'__temp_mnlmazwimwcayzixfllvfxuxamufcvzegvmx',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"Test test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": [6]}',1,'2024-08-23 15:04:54','2024-08-23 15:08:45','b8609f00-db21-4a5a-a87f-b1a29ec42ab0'),
(14,14,1,'Test','test','blog/topic/test',NULL,1,'2024-08-23 15:08:52','2024-08-23 15:09:10','5dbbed4c-392e-40e0-8cf3-5507b8a6323d'),
(15,15,1,'Test','test-2','blog/test-2','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Testing\"}',1,'2024-08-23 15:09:10','2024-08-23 15:09:10','54ef4437-43b7-4aca-9337-ff4aba5ed8ee'),
(16,16,1,NULL,'__temp_mnlmazwimwcayzixfllvfxuxamufcvzegvmx',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"Test test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": [6]}',1,'2024-08-23 15:09:10','2024-08-23 15:09:10','a9ec04c1-5663-4080-818b-d3d4863840b5'),
(17,17,1,'My trip to Bend','my-trip-to-bend','blog/my-trip-to-bend',NULL,1,'2024-08-23 15:09:52','2024-08-23 15:09:59','5c5ad5cb-fae1-4605-a960-cce9f0b8d3aa'),
(18,18,1,NULL,'__temp_mthcvfenmgdhlnybvadwjizkvrgmetngdzxe','blog/__temp_mthcvfenmgdhlnybvadwjizkvrgmetngdzxe',NULL,1,'2024-08-23 15:10:32','2024-08-23 15:10:32','66a7b641-c1d3-45bf-93a2-17914175ae82'),
(19,19,1,'Test','test-3','blog/test-3',NULL,1,'2024-08-23 15:10:48','2024-08-23 15:10:52','df018097-1355-4110-ab54-0b47b3cca74e'),
(20,20,1,'Test','test-3','blog/test-3',NULL,1,'2024-08-23 15:10:52','2024-08-23 15:10:52','5417af88-d530-47b1-afe7-0d83463e4f3e'),
(21,21,1,NULL,'__temp_khevcucsykfbkhnygslhzqgsnwkpkegrbzkw','blog/__temp_khevcucsykfbkhnygslhzqgsnwkpkegrbzkw',NULL,1,'2024-08-23 15:11:25','2024-08-23 15:11:25','717436a8-5db5-407b-be50-8ea8167ca576'),
(22,22,1,NULL,'__temp_hhnisywkxfhnyctrrlwmldobdbjdtfzwtxdy','blog/__temp_hhnisywkxfhnyctrrlwmldobdbjdtfzwtxdy',NULL,1,'2024-08-23 15:11:25','2024-08-23 15:11:25','886fd6a0-c692-4440-9877-d830206db269'),
(23,23,1,NULL,'__temp_dskpqncceselatcdrbjegwmnntlrgkluesou','blog/__temp_dskpqncceselatcdrbjegwmnntlrgkluesou',NULL,1,'2024-08-23 15:11:55','2024-08-23 15:11:55','4c67fc71-4d4f-4bcc-b48c-bc4d762e6c55'),
(24,24,1,NULL,'__temp_akebsptuaonrufheimbbmwvhifqnurkppcwq','blog/__temp_akebsptuaonrufheimbbmwvhifqnurkppcwq',NULL,1,'2024-08-23 15:11:55','2024-08-23 15:11:55','bdc55da5-f69f-417a-b304-e9c5d610d598'),
(25,25,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-23 15:12:44','2024-08-23 15:16:52','b9824e5b-1ac0-452c-8194-3968f21ee011'),
(26,26,1,NULL,'__temp_kjqupsjmmdqigazpfkxgsgfdmkuxszmnmsmo',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"This is picturesque\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": [6], \"6d2a0f3b-576f-44fd-b3ae-54458ee28a18\": \"So beautiful!!\"}',1,'2024-08-23 15:13:38','2024-08-27 11:34:18','ea27fbcb-a42d-44ab-a208-c62553652ad2'),
(27,27,1,'My Trip to Bend','my-trip-to','blog/my-trip-to','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-23 15:14:07','2024-08-23 15:14:07','76529534-4941-493c-a247-c106871ac8a5'),
(28,28,1,NULL,'__temp_kjqupsjmmdqigazpfkxgsgfdmkuxszmnmsmo',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"This is picturesque\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-23 15:14:07','2024-08-23 15:14:07','1ec3ea78-efaa-4235-9872-198e5199a824'),
(32,32,1,NULL,'__temp_etfdnqapzgrypsryqrfguxldasegjlhevtyk',NULL,'{\"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-23 15:16:52','2024-08-23 15:16:52','74af7e15-b97c-4ab8-9ae5-150777a8a6d4'),
(33,33,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-23 15:16:53','2024-08-23 15:16:53','03f146c6-5152-40ed-9082-4272f6639b4e'),
(34,34,1,NULL,'__temp_etfdnqapzgrypsryqrfguxldasegjlhevtyk',NULL,'{\"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-23 15:16:53','2024-08-23 15:16:53','e4801ea4-9049-428d-b781-2f15a0c994a9'),
(35,35,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-23 15:33:06','2024-08-23 15:33:06','1010eb1e-08e9-4cb6-812d-648f5af2bc97'),
(36,36,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-26 13:46:37','2024-08-26 13:46:37','61a48ec3-bc97-4651-bbdd-0c2526f9dc87'),
(38,38,1,NULL,'__temp_etfdnqapzgrypsryqrfguxldasegjlhevtyk',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-26 14:15:17','2024-08-26 14:15:17','251132a8-4f8b-4a82-9cc8-099bce627b12'),
(40,40,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-26 14:15:34','2024-08-26 14:15:34','7a27dbd3-f10e-483b-99dd-f64dfcdb100d'),
(41,41,1,NULL,'__temp_kjqupsjmmdqigazpfkxgsgfdmkuxszmnmsmo',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"This is picturesque\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": [6]}',1,'2024-08-26 14:15:34','2024-08-26 14:15:34','2470ecb0-7264-4bbb-9b1a-8c34f644189f'),
(42,42,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-26 14:17:16','2024-08-26 14:17:16','8a2a00a4-6344-46ea-8bbb-0520ad85e3a5'),
(43,43,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-27 09:44:09','2024-08-27 09:44:09','0a9bae34-ab1f-44b7-9ec7-c0255f015de2'),
(44,44,1,NULL,'__temp_atatnazvpbwgpvhmaxmywdkojixqqofvtmcx','posted-content/__temp_atatnazvpbwgpvhmaxmywdkojixqqofvtmcx','{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 09:44:16','2024-08-27 09:44:19','011b2860-8e37-4385-b5e4-63629e23e5ef'),
(45,45,1,NULL,'__temp_atatnazvpbwgpvhmaxmywdkojixqqofvtmcx','posted-content/__temp_atatnazvpbwgpvhmaxmywdkojixqqofvtmcx','{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 09:44:20','2024-08-27 09:44:20','e6bfbe9b-6fde-478e-ba11-9ca749398b0d'),
(46,46,1,NULL,'__temp_tlgtvikmwbvgdszdokeeniuosltwutxkdxrq','posted-content/__temp_tlgtvikmwbvgdszdokeeniuosltwutxkdxrq','{\"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 09:44:28','2024-08-27 09:44:28','7dd30ec3-07ab-4e02-bc44-d62df309f597'),
(49,49,1,NULL,'__temp_rmcyxxejkoebicnulfqgzmwgwsxjfhredmde',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"testje 2\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 09:55:43','2024-08-27 11:31:15','433ad3f3-d31b-4fdd-a4ad-04b99324f7e7'),
(50,50,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-27 09:55:43','2024-08-27 09:55:43','ba693f7e-6e86-4ed7-aca4-f63b9908f49e'),
(51,51,1,NULL,'__temp_rmcyxxejkoebicnulfqgzmwgwsxjfhredmde',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"testje 2\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 09:55:43','2024-08-27 09:55:43','b8860a38-f6d5-4375-a9dc-156a4d56b233'),
(55,55,1,NULL,'__temp_bkculpawamkkmmkicjsubmedohxxasoambhs',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 09:57:49','2024-08-27 11:31:15','63a11968-7f92-4470-9397-d1d780519c3d'),
(56,56,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-27 09:57:49','2024-08-27 09:57:49','591bb856-ad33-4aa2-b8a7-2aeb9d663232'),
(57,57,1,NULL,'__temp_rmcyxxejkoebicnulfqgzmwgwsxjfhredmde',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"testje 2\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": [6]}',1,'2024-08-27 09:57:49','2024-08-27 09:57:49','49b006a6-755b-46a7-8bb1-069f6d075ba7'),
(58,58,1,NULL,'__temp_bkculpawamkkmmkicjsubmedohxxasoambhs',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": [6]}',1,'2024-08-27 09:57:49','2024-08-27 09:57:49','7935c9c8-7aa7-4948-8a11-86cfaf566dc0'),
(62,62,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-27 11:31:15','2024-08-27 11:31:15','4258ec91-ca92-40c6-bc9f-148aabe6ace8'),
(63,63,1,NULL,'__temp_rmcyxxejkoebicnulfqgzmwgwsxjfhredmde',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"testje 2\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 11:31:15','2024-08-27 11:31:15','2bb029c6-bcc9-43c6-95ed-076bac601a9e'),
(64,64,1,NULL,'__temp_bkculpawamkkmmkicjsubmedohxxasoambhs',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"test\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-27 11:31:15','2024-08-27 11:31:15','e806c51d-52c4-48f1-8304-bc1e71f58a40'),
(67,67,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-27 11:34:18','2024-08-27 11:34:18','45d53cd3-83dc-476a-a392-1041b0525792'),
(68,68,1,NULL,'__temp_kjqupsjmmdqigazpfkxgsgfdmkuxszmnmsmo',NULL,'{\"15eee6cf-231e-4be7-8aba-add31a28837e\": \"This is picturesque\", \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": [6], \"6d2a0f3b-576f-44fd-b3ae-54458ee28a18\": \"So beautiful!!\"}',1,'2024-08-27 11:34:18','2024-08-27 11:34:18','88df5f0e-1570-443f-ba23-5eeb56b80b5d'),
(69,69,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-27 11:49:16','2024-08-27 11:49:16','807a1073-45c7-4206-aa9f-e6f19c8a88da'),
(72,72,1,'This is a test about','about','about','{\"a194a682-d580-4e87-8ff4-eeee0f71920a\": [75], \"b46928ce-a347-433e-b9a3-e90c2849dff6\": \"Test about test\"}',1,'2024-08-27 12:40:39','2024-08-27 12:41:24','6e8e0d47-4757-4887-9359-258ce10372ae'),
(73,73,1,'About','about',NULL,'{\"a194a682-d580-4e87-8ff4-eeee0f71920a\": []}',1,'2024-08-27 12:40:39','2024-08-27 12:40:39','20369dbc-5427-45cb-9097-40c7e3646a54'),
(75,75,1,'07bf8a92b22866fde5a2ac2f289e4140',NULL,NULL,NULL,1,'2024-08-27 12:41:17','2024-08-27 12:41:17','17e950b1-1218-4e25-956a-7c1a8cd87924'),
(76,76,1,'This is a test about','about','about','{\"a194a682-d580-4e87-8ff4-eeee0f71920a\": [75], \"b46928ce-a347-433e-b9a3-e90c2849dff6\": \"Test about test\"}',1,'2024-08-27 12:41:24','2024-08-27 12:41:24','09a8d62b-f90f-4153-b439-b73f5350ad6a'),
(77,77,1,'This is a test about','about','about','{\"a194a682-d580-4e87-8ff4-eeee0f71920a\": [75], \"b46928ce-a347-433e-b9a3-e90c2849dff6\": \"Test about test\"}',1,'2024-08-27 12:41:29','2024-08-27 12:41:29','e99f9c07-93ed-4586-9ca4-47dd0f80e4cf'),
(78,78,1,NULL,NULL,NULL,'{\"2bec5550-fbe2-48bc-8af3-e4dd41dfbfac\": \"Photos and stories from around the world.\"}',1,'2024-08-27 12:51:09','2024-08-27 12:51:34','e34a1145-c2eb-477b-8534-388e2b176ac5'),
(79,79,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-29 07:57:17','2024-08-29 07:57:17','90078b5d-cccb-405d-9847-0dd839d796b3'),
(81,81,1,NULL,'__temp_qunafwrhrcwjptptqejrbaqcdkmeghrrqgop',NULL,'{\"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-29 08:23:07','2024-08-29 08:23:07','761dda15-052c-43af-9738-517532beaf6b'),
(82,82,1,NULL,'__temp_eqkgscmyzrbvfaobnhaolvqcfzgbfdkcbmtl',NULL,'{\"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\": []}',1,'2024-08-29 08:36:53','2024-08-29 08:36:53','74c4cd92-25f0-4ddc-86d5-dd69e75c960f'),
(83,83,1,'My Trip to Bend','my-trip-to-bend','blog/my-trip-to-bend','{\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\": [14], \"8e4ec545-62eb-46eb-9751-5b205cf251b9\": [6], \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\": \"Short of Bend\"}',1,'2024-08-29 08:37:30','2024-08-29 08:37:30','a74494f3-37d6-4f3f-ae80-b633e8a2efb8');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES
(2,1,NULL,NULL,NULL,1,'2024-08-22 13:54:00',NULL,NULL,'2024-08-22 13:54:00','2024-08-22 13:54:00'),
(3,1,NULL,NULL,NULL,1,'2024-08-22 07:30:00','2024-08-27 10:00:00',NULL,'2024-08-22 13:54:00','2024-08-22 13:55:00'),
(4,1,NULL,NULL,NULL,1,'2024-08-22 07:30:00','2024-08-27 10:00:00',NULL,'2024-08-22 13:55:03','2024-08-22 13:55:03'),
(5,1,NULL,NULL,NULL,1,'2024-08-22 07:30:00','2024-08-27 10:00:00',NULL,'2024-08-22 13:58:35','2024-08-22 13:58:35'),
(8,1,NULL,NULL,NULL,1,'2024-08-22 07:30:00','2024-08-27 10:00:00',NULL,'2024-08-22 14:04:30','2024-08-22 14:04:30'),
(9,1,NULL,NULL,NULL,1,'2024-08-22 14:05:56',NULL,NULL,'2024-08-22 14:05:56','2024-08-22 14:05:56'),
(10,1,NULL,NULL,NULL,1,'2024-08-22 14:19:07',NULL,NULL,'2024-08-22 14:19:07','2024-08-22 14:19:07'),
(11,1,NULL,NULL,NULL,1,'2024-08-22 14:19:22',NULL,NULL,'2024-08-22 14:19:22','2024-08-22 14:19:22'),
(12,1,NULL,NULL,NULL,2,'2024-08-23 09:00:00',NULL,NULL,'2024-08-22 14:20:04','2024-08-23 15:09:05'),
(13,NULL,NULL,12,4,3,'2024-08-23 15:04:00',NULL,NULL,'2024-08-23 15:04:54','2024-08-23 15:04:55'),
(15,1,NULL,NULL,NULL,2,'2024-08-23 09:00:00',NULL,NULL,'2024-08-23 15:09:10','2024-08-23 15:09:10'),
(16,NULL,NULL,15,4,3,'2024-08-23 15:04:00',NULL,NULL,'2024-08-23 15:09:10','2024-08-23 15:09:10'),
(17,1,NULL,NULL,NULL,1,'2024-08-23 15:09:52',NULL,0,'2024-08-23 15:09:52','2024-08-23 15:09:52'),
(18,1,NULL,NULL,NULL,1,'2024-08-23 15:10:32',NULL,NULL,'2024-08-23 15:10:32','2024-08-23 15:10:32'),
(19,1,NULL,NULL,NULL,1,'2024-08-23 15:10:00',NULL,0,'2024-08-23 15:10:48','2024-08-23 15:10:52'),
(20,1,NULL,NULL,NULL,1,'2024-08-23 15:10:00',NULL,NULL,'2024-08-23 15:10:52','2024-08-23 15:10:52'),
(21,1,NULL,NULL,NULL,1,'2024-08-23 15:11:25',NULL,NULL,'2024-08-23 15:11:25','2024-08-23 15:11:25'),
(22,1,NULL,NULL,NULL,1,'2024-08-23 15:11:25',NULL,NULL,'2024-08-23 15:11:25','2024-08-23 15:11:25'),
(23,1,NULL,NULL,NULL,1,'2024-08-23 15:11:55',NULL,NULL,'2024-08-23 15:11:55','2024-08-23 15:11:55'),
(24,1,NULL,NULL,NULL,1,'2024-08-23 15:11:55',NULL,NULL,'2024-08-23 15:11:55','2024-08-23 15:11:55'),
(25,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-23 15:12:44','2024-08-23 15:14:07'),
(26,NULL,NULL,25,4,3,'2024-08-23 15:13:00',NULL,NULL,'2024-08-23 15:13:38','2024-08-23 15:13:38'),
(27,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-23 15:14:07','2024-08-23 15:14:07'),
(28,NULL,NULL,27,4,3,'2024-08-23 15:13:00',NULL,NULL,'2024-08-23 15:14:07','2024-08-23 15:14:07'),
(32,NULL,NULL,25,4,3,'2024-08-23 15:15:00',NULL,0,'2024-08-23 15:16:52','2024-08-23 15:16:52'),
(33,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-23 15:16:53','2024-08-23 15:16:53'),
(34,NULL,NULL,33,4,3,'2024-08-23 15:15:00',NULL,NULL,'2024-08-23 15:16:53','2024-08-23 15:16:53'),
(35,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-23 15:33:06','2024-08-23 15:33:06'),
(36,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-26 13:46:37','2024-08-26 13:46:37'),
(40,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-26 14:15:34','2024-08-26 14:15:34'),
(41,NULL,NULL,40,4,3,'2024-08-23 15:13:00',NULL,NULL,'2024-08-26 14:15:34','2024-08-26 14:15:34'),
(42,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-26 14:17:16','2024-08-26 14:17:16'),
(43,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-27 09:44:09','2024-08-27 09:44:09'),
(44,2,NULL,NULL,NULL,3,'2024-08-27 09:44:00',NULL,0,'2024-08-27 09:44:16','2024-08-27 09:44:20'),
(45,2,NULL,NULL,NULL,3,'2024-08-27 09:44:00',NULL,NULL,'2024-08-27 09:44:20','2024-08-27 09:44:20'),
(46,2,NULL,NULL,NULL,3,'2024-08-27 09:44:28',NULL,NULL,'2024-08-27 09:44:28','2024-08-27 09:44:28'),
(49,NULL,NULL,25,4,3,'2024-08-27 09:55:00',NULL,NULL,'2024-08-27 09:55:43','2024-08-27 09:55:43'),
(50,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-27 09:55:43','2024-08-27 09:55:43'),
(51,NULL,NULL,50,4,3,'2024-08-27 09:55:00',NULL,NULL,'2024-08-27 09:55:43','2024-08-27 09:55:43'),
(55,NULL,NULL,25,4,3,'2024-08-27 09:56:00',NULL,NULL,'2024-08-27 09:57:49','2024-08-27 09:57:49'),
(56,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-27 09:57:49','2024-08-27 09:57:49'),
(57,NULL,NULL,56,4,3,'2024-08-27 09:55:00',NULL,NULL,'2024-08-27 09:57:49','2024-08-27 09:57:49'),
(58,NULL,NULL,56,4,3,'2024-08-27 09:56:00',NULL,NULL,'2024-08-27 09:57:49','2024-08-27 09:57:49'),
(62,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-27 11:31:15','2024-08-27 11:31:15'),
(63,NULL,NULL,62,4,3,'2024-08-27 09:55:00',NULL,NULL,'2024-08-27 11:31:15','2024-08-27 11:31:15'),
(64,NULL,NULL,62,4,3,'2024-08-27 09:56:00',NULL,NULL,'2024-08-27 11:31:15','2024-08-27 11:31:15'),
(67,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-27 11:34:18','2024-08-27 11:34:18'),
(68,NULL,NULL,67,4,3,'2024-08-23 15:13:00',NULL,NULL,'2024-08-27 11:34:18','2024-08-27 11:34:18'),
(69,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-27 11:49:16','2024-08-27 11:49:16'),
(72,3,NULL,NULL,NULL,4,'2024-08-27 12:40:00',NULL,NULL,'2024-08-27 12:40:39','2024-08-27 12:40:39'),
(73,3,NULL,NULL,NULL,4,'2024-08-27 12:40:00',NULL,NULL,'2024-08-27 12:40:39','2024-08-27 12:40:39'),
(76,3,NULL,NULL,NULL,4,'2024-08-27 12:40:00',NULL,NULL,'2024-08-27 12:41:24','2024-08-27 12:41:24'),
(77,3,NULL,NULL,NULL,4,'2024-08-27 12:40:00',NULL,NULL,'2024-08-27 12:41:29','2024-08-27 12:41:29'),
(79,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-29 07:57:17','2024-08-29 07:57:17'),
(83,1,NULL,NULL,NULL,2,'2024-08-23 15:14:00',NULL,NULL,'2024-08-29 08:37:30','2024-08-29 08:37:30');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES
(2,1,1),
(3,1,1),
(4,1,1),
(5,1,1),
(8,1,1),
(9,1,1),
(10,1,1),
(11,1,1),
(12,1,1),
(15,1,1),
(17,1,1),
(18,1,1),
(19,1,1),
(20,1,1),
(21,1,1),
(22,1,1),
(23,1,1),
(24,1,1),
(25,1,1),
(27,1,1),
(33,1,1),
(35,1,1),
(36,1,1),
(40,1,1),
(42,1,1),
(43,1,1),
(44,1,1),
(45,1,1),
(46,1,1),
(50,1,1),
(56,1,1),
(62,1,1),
(67,1,1),
(69,1,1),
(79,1,1),
(83,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES
(1,1,'Default','default','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-08-22 13:15:07','2024-08-22 13:15:07',NULL,'834ec624-ea3a-445f-8e6e-bc5c217ff2ab'),
(2,4,'Post','post','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-08-22 13:53:53','2024-08-22 13:53:53',NULL,'edc1bfe8-f825-4996-8b0d-efe392379f8e'),
(3,5,'contentPost','contentPost','',NULL,0,'site',NULL,'',0,'site',NULL,0,'2024-08-23 15:03:28','2024-08-27 09:24:46',NULL,'85c968e6-c85a-4ea7-bf76-7d42f15de2d3'),
(4,6,'About','about','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-08-27 12:40:16','2024-08-27 12:40:16',NULL,'e3d39713-9ffa-4e92-8243-4ae17ce3987b');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES
(1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"af9325c7-3bff-473d-9d07-6f679829b00a\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"594f60b4-68d9-432c-a897-96a0843525e5\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-08-22T13:13:48+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-08-22 13:15:07','2024-08-22 13:15:07',NULL,'91e1384e-0e84-47de-a5b1-7b93e7e597ea'),
(2,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"71ccde99-f907-418c-b2b7-653b674f20a9\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"8d21edf7-9d62-436e-86c4-401161f23536\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-08-22T13:15:55+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-08-22 13:18:04','2024-08-22 13:18:04',NULL,'4736548f-4602-47e1-ae44-451e87de0a91'),
(3,'craft\\elements\\Category','{\"tabs\": [{\"uid\": \"df75ea04-9d74-41e4-a2e6-c1e5ebe02451\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"545c22aa-8774-4a9e-9c27-044c29ebcb8d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\TitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-08-22T13:17:10+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-08-22 13:19:06','2024-08-22 13:19:06',NULL,'bedf405b-ce2a-4ea3-9f8c-ebaf84655c89'),
(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"902ec514-304e-49e6-89f7-56a7f687d07d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"ab562d32-92e3-4155-8f97-466e00ec9239\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-08-22T13:51:36+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"8e4ec545-62eb-46eb-9751-5b205cf251b9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"18324bdc-c749-4834-afe9-953a032c4782\", \"required\": true, \"dateAdded\": \"2024-08-22T13:53:53+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c94b7197-b184-4fbe-9ee0-548d7972c582\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 75, \"handle\": null, \"warning\": null, \"fieldUid\": \"295de86d-7d6c-43e4-8b7f-acecd4b6be15\", \"required\": true, \"dateAdded\": \"2024-08-23T15:04:49+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"e397c12f-8e74-4ddb-8ef9-bedbdfcb1f4d\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2024-08-23T15:08:26+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 25, \"handle\": null, \"warning\": null, \"fieldUid\": \"25e4f6d1-8f1e-43f8-9c18-43beccec23ac\", \"required\": true, \"dateAdded\": \"2024-08-22T13:53:53+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7493a22d-c58a-4e7e-a927-5549de385115\", \"required\": false, \"dateAdded\": \"2024-08-22T13:53:53+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-08-22 13:53:53','2024-08-23 15:08:26',NULL,'ee63bbc8-5006-45ac-913a-31a71d433bb4'),
(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e0d78597-4668-401b-be46-6d1b86cde6a9\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"29e9fbbc-ad70-45d9-8ea2-e075d6dc8d9d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-08-23T15:00:15+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"15eee6cf-231e-4be7-8aba-add31a28837e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"034c94c7-7449-4ec5-9d4a-ef4bb85d1760\", \"required\": true, \"dateAdded\": \"2024-08-23T15:03:28+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7ef1eb88-017c-4129-b0dd-eac0053a62a2\", \"required\": false, \"dateAdded\": \"2024-08-23T15:03:28+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6d2a0f3b-576f-44fd-b3ae-54458ee28a18\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"394c0a79-d7c3-4254-a5a5-fe0cfa255cb1\", \"required\": false, \"dateAdded\": \"2024-08-27T11:34:02+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-08-23 15:03:28','2024-08-27 11:34:02',NULL,'6aee7711-9a57-48c3-aa38-a79cbe93aea0'),
(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"73715301-faab-47ae-8730-3fc5990c5b21\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"83d087bb-c8f9-47d7-8a3d-03ce848b6c8f\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-08-27T12:39:09+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"a194a682-d580-4e87-8ff4-eeee0f71920a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"47a430c5-4526-4e31-a721-b14568e8ad70\", \"required\": false, \"dateAdded\": \"2024-08-27T12:40:38+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b46928ce-a347-433e-b9a3-e90c2849dff6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c7145ecd-130f-4465-b0a3-bb3da4fdf0ad\", \"required\": false, \"dateAdded\": \"2024-08-27T12:40:38+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-08-27 12:40:16','2024-08-27 12:40:38',NULL,'b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42'),
(7,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"eaef76c6-cb72-40f5-a616-70c3731a7a60\", \"name\": \"Settings\", \"elements\": [{\"tip\": null, \"uid\": \"2bec5550-fbe2-48bc-8af3-e4dd41dfbfac\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"f34e1de1-7b45-4614-8406-091721a862a0\", \"required\": false, \"dateAdded\": \"2024-08-27T12:51:09+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-08-27 12:51:09','2024-08-27 12:51:09',NULL,'606a1651-1deb-473c-b12d-6247540ac6ed');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES
(1,'Summary','summary','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":1,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-08-22 13:21:47','2024-08-22 13:21:47',NULL,'7493a22d-c58a-4e7e-a927-5549de385115'),
(2,'Feature Image','featureImage','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":true,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:497758c3-9536-48e8-8733-204b872cc80c\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:497758c3-9536-48e8-8733-204b872cc80c\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-08-22 13:23:37','2024-08-22 13:55:38',NULL,'18324bdc-c749-4834-afe9-953a032c4782'),
(3,'Post Categories','postCategories','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Categories','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"source\":\"group:9b59c16c-626b-4c1d-bae7-8164ef5b0aa1\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-08-22 13:24:29','2024-08-22 13:24:29',NULL,'25e4f6d1-8f1e-43f8-9c18-43beccec23ac'),
(4,'Post Content','postContent','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"entryTypes\":[\"85c968e6-c85a-4ea7-bf76-7d42f15de2d3\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-08-22 13:49:11','2024-08-23 15:03:48',NULL,'295de86d-7d6c-43e4-8b7f-acecd4b6be15'),
(5,'Text','text','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":12,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-08-23 15:02:27','2024-08-23 15:02:27',NULL,'034c94c7-7449-4ec5-9d4a-ef4bb85d1760'),
(6,'Image','image','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:497758c3-9536-48e8-8733-204b872cc80c\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:497758c3-9536-48e8-8733-204b872cc80c\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-08-23 15:03:18','2024-08-23 15:03:18',NULL,'7ef1eb88-017c-4129-b0dd-eac0053a62a2'),
(7,'Quote','quote','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-08-27 11:33:54','2024-08-27 11:33:54',NULL,'394c0a79-d7c3-4254-a5a5-fe0cfa255cb1'),
(8,'Bio','bio','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"uiMode\":\"normal\",\"placeholder\":null,\"code\":false,\"multiline\":true,\"initialRows\":8,\"charLimit\":null,\"byteLimit\":null}','2024-08-27 12:37:17','2024-08-27 12:37:25',NULL,'c7145ecd-130f-4465-b0a3-bb3da4fdf0ad'),
(9,'Profile Photo','profilePhoto','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"restrictLocation\":false,\"restrictedLocationSource\":\"volume:497758c3-9536-48e8-8733-204b872cc80c\",\"restrictedLocationSubpath\":null,\"allowSubfolders\":false,\"restrictedDefaultUploadSubpath\":null,\"defaultUploadLocationSource\":\"volume:497758c3-9536-48e8-8733-204b872cc80c\",\"defaultUploadLocationSubpath\":null,\"allowUploads\":true,\"restrictFiles\":false,\"allowedKinds\":null,\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"previewMode\":\"full\",\"allowSelfRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"sources\":[\"volume:497758c3-9536-48e8-8733-204b872cc80c\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\",\"showCardsInGrid\":false,\"maintainHierarchy\":false,\"branchLimit\":null}','2024-08-27 12:38:25','2024-08-27 12:38:27',NULL,'47a430c5-4526-4e31-a721-b14568e8ad70'),
(10,'Description','description','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-08-27 12:50:12','2024-08-27 12:50:12',NULL,'f34e1de1-7b45-4614-8406-091721a862a0');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES
(78,'Site Info','siteInfo',7,1,'2024-08-27 12:51:09','2024-08-27 12:51:09','79016788-c0f8-4921-a3ab-18b3281e476f');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES
(1,'Public Schema','[]',1,'2024-08-26 14:15:47','2024-08-26 14:15:47','c592686e-08db-4842-a67b-85a43751b402');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES
(1,'5.3.5','5.3.0.2',0,'rpabcrdbryxz','3@rthvrnmitb','2024-08-22 12:26:28','2024-08-29 09:40:23','ea1e3654-2a92-406f-82c2-fd99538ba06d');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'craft','Install','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','dd9aef93-f58e-468c-803a-c9ed02ae3a18'),
(2,'craft','m221101_115859_create_entries_authors_table','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','3470c4f7-b9d3-47b2-9841-b7892b720039'),
(3,'craft','m221107_112121_add_max_authors_to_sections','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','c9020dbd-5e99-4fd2-9270-a4e5c72e3c50'),
(4,'craft','m221205_082005_translatable_asset_alt_text','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','ab391b8b-02be-4d3e-8a7e-2f6e70031808'),
(5,'craft','m230314_110309_add_authenticator_table','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','83f078cb-b797-4738-82e6-8de1577be372'),
(6,'craft','m230314_111234_add_webauthn_table','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','124ee2be-86bc-49ab-951a-8f36c4faaf13'),
(7,'craft','m230503_120303_add_recoverycodes_table','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','c254bef3-47ff-4e99-81d8-48ee1e96579f'),
(8,'craft','m230511_000000_field_layout_configs','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','3b2cc3bc-a812-4dea-a934-93de571ec910'),
(9,'craft','m230511_215903_content_refactor','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','cf582a0c-ee32-4c09-a2db-33c35496bb40'),
(10,'craft','m230524_000000_add_entry_type_show_slug_field','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','f3e7f474-a0f4-4c53-9b7f-6c73e5c066e6'),
(11,'craft','m230524_000001_entry_type_icons','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','86606893-e367-41f7-8e08-6983d7049a7b'),
(12,'craft','m230524_000002_entry_type_colors','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','ff2871b8-b38c-4737-86c0-671b176c4eed'),
(13,'craft','m230524_220029_global_entry_types','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','0154c217-fe9d-444c-92b7-75a120933404'),
(14,'craft','m230531_123004_add_entry_type_show_status_field','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','55cd5bd1-90d0-4238-bf32-e589bf606b32'),
(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','98b02d88-f1ec-42e8-93d6-34e5e82166d6'),
(16,'craft','m230616_173810_kill_field_groups','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','5b8d123d-4e27-4ef4-a273-cad3b6b39ab0'),
(17,'craft','m230616_183820_remove_field_name_limit','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','3f572ebd-1c2d-47ed-92a6-c6dcdf493565'),
(18,'craft','m230617_070415_entrify_matrix_blocks','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','4a9bae22-edd2-48d3-9584-e7fb1b7f70ee'),
(19,'craft','m230710_162700_element_activity','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','79f15ba7-d16a-4ec5-944a-c487098d5764'),
(20,'craft','m230820_162023_fix_cache_id_type','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','235badbe-c62b-4c89-9f83-7ac08016fcd5'),
(21,'craft','m230826_094050_fix_session_id_type','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','252f8765-f331-49ab-b57c-83717c68d593'),
(22,'craft','m230904_190356_address_fields','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','254c677b-9fe6-4601-b63b-ad96309484a2'),
(23,'craft','m230928_144045_add_subpath_to_volumes','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','11d622ba-56e6-4883-b459-787876eb983f'),
(24,'craft','m231013_185640_changedfields_amend_primary_key','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','f5e8382a-5286-4562-9b2c-8faa79e81efb'),
(25,'craft','m231213_030600_element_bulk_ops','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','c81f5cba-a3df-47fc-be72-827c54276bb8'),
(26,'craft','m240129_150719_sites_language_amend_length','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','6dc20370-8173-45ef-a468-049cd4ac2b8f'),
(27,'craft','m240206_035135_convert_json_columns','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','dbb2f856-0bd2-4be1-9fd4-9034c78f08e2'),
(28,'craft','m240207_182452_address_line_3','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','1656cd5b-5b44-4ef8-be83-3a99b073e21f'),
(29,'craft','m240302_212719_solo_preview_targets','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','c887dd5c-5cfb-4895-bc56-37903b50615f'),
(30,'craft','m240619_091352_add_auth_2fa_timestamp','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','ab6efb29-3b61-4e5f-8420-9cfd1f038914'),
(31,'craft','m240723_214330_drop_bulkop_fk','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','45712a11-17f3-47ff-bdd8-435bfea7300a'),
(32,'craft','m240731_053543_soft_delete_fields','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','cafcfb1b-74b0-40b0-8519-4eec9515139b'),
(33,'craft','m240805_154041_sso_identities','2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-22 12:26:29','f0a46616-fbe3-41b6-883d-cc3af53b3eb7');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.defaultPlacement','\"end\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elementCondition','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.autocapitalize','true'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.autocomplete','false'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.autocorrect','true'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.class','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.dateAdded','\"2024-08-22T13:17:10+00:00\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.disabled','false'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.elementCondition','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.id','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.includeInCards','false'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.inputType','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.instructions','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.label','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.max','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.min','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.name','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.orientation','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.placeholder','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.providesThumbs','false'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.readonly','false'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.requirable','false'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.size','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.step','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.tip','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.title','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.uid','\"545c22aa-8774-4a9e-9c27-044c29ebcb8d\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.userCondition','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.warning','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.elements.0.width','100'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.name','\"Content\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.uid','\"df75ea04-9d74-41e4-a2e6-c1e5ebe02451\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.fieldLayouts.bedf405b-ce2a-4ea3-9f8c-ebaf84655c89.tabs.0.userCondition','null'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.handle','\"topics\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.name','\"Topics\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.hasUrls','true'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.template','\"blog/_topic.twig\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.uriFormat','\"blog/topic/{slug}\"'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.structure.maxLevels','1'),
('categoryGroups.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1.structure.uid','\"da6e6159-33a0-45cf-abeb-5113d0b7c4ec\"'),
('dateModified','1724924423'),
('email.fromEmail','\"gitte.neven@hotmail.com\"'),
('email.fromName','\"cms test aug\"'),
('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.color','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elementCondition','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.autocomplete','false'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.autocorrect','true'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.class','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.dateAdded','\"2024-08-22T13:13:48+00:00\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.disabled','false'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.elementCondition','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.id','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.includeInCards','false'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.inputType','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.instructions','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.label','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.max','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.min','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.name','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.orientation','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.placeholder','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.readonly','false'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.requirable','false'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.size','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.step','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.tip','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.title','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.uid','\"594f60b4-68d9-432c-a897-96a0843525e5\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.userCondition','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.warning','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.elements.0.width','100'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.name','\"Content\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.uid','\"af9325c7-3bff-473d-9d07-6f679829b00a\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.fieldLayouts.91e1384e-0e84-47de-a5b1-7b93e7e597ea.tabs.0.userCondition','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.handle','\"default\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.hasTitleField','true'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.icon','\"\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.name','\"Default\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.showSlugField','true'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.showStatusField','true'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.slugTranslationKeyFormat','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.slugTranslationMethod','\"site\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.titleFormat','\"\"'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.titleTranslationKeyFormat','null'),
('entryTypes.834ec624-ea3a-445f-8e6e-bc5c217ff2ab.titleTranslationMethod','\"site\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.color','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elementCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.autocomplete','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.autocorrect','true'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.class','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.dateAdded','\"2024-08-23T15:00:15+00:00\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.disabled','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.elementCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.id','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.includeInCards','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.inputType','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.instructions','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.label','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.max','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.min','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.name','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.orientation','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.placeholder','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.readonly','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.requirable','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.size','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.step','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.tip','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.title','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.uid','\"29e9fbbc-ad70-45d9-8ea2-e075d6dc8d9d\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.userCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.warning','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.0.width','100'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.dateAdded','\"2024-08-23T15:03:28+00:00\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.elementCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.fieldUid','\"034c94c7-7449-4ec5-9d4a-ef4bb85d1760\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.handle','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.includeInCards','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.instructions','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.label','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.required','true'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.tip','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.uid','\"15eee6cf-231e-4be7-8aba-add31a28837e\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.userCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.warning','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.1.width','100'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.dateAdded','\"2024-08-23T15:03:28+00:00\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.elementCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.fieldUid','\"7ef1eb88-017c-4129-b0dd-eac0053a62a2\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.handle','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.includeInCards','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.instructions','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.label','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.required','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.tip','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.uid','\"24ebe54f-6d8e-4be0-a39d-b6d573fc5113\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.userCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.warning','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.2.width','100'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.dateAdded','\"2024-08-27T11:34:02+00:00\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.elementCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.fieldUid','\"394c0a79-d7c3-4254-a5a5-fe0cfa255cb1\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.handle','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.includeInCards','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.instructions','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.label','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.required','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.tip','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.uid','\"6d2a0f3b-576f-44fd-b3ae-54458ee28a18\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.userCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.warning','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.elements.3.width','100'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.name','\"Content\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.uid','\"e0d78597-4668-401b-be46-6d1b86cde6a9\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.fieldLayouts.6aee7711-9a57-48c3-aa38-a79cbe93aea0.tabs.0.userCondition','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.handle','\"contentPost\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.hasTitleField','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.icon','\"\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.name','\"contentPost\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.showSlugField','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.showStatusField','false'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.slugTranslationKeyFormat','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.slugTranslationMethod','\"site\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.titleFormat','\"\"'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.titleTranslationKeyFormat','null'),
('entryTypes.85c968e6-c85a-4ea7-bf76-7d42f15de2d3.titleTranslationMethod','\"site\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.color','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elementCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.autocomplete','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.autocorrect','true'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.class','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.dateAdded','\"2024-08-27T12:39:09+00:00\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.disabled','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.elementCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.id','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.includeInCards','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.inputType','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.instructions','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.label','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.max','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.min','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.name','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.orientation','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.placeholder','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.readonly','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.requirable','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.size','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.step','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.tip','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.title','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.uid','\"83d087bb-c8f9-47d7-8a3d-03ce848b6c8f\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.userCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.warning','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.0.width','100'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.dateAdded','\"2024-08-27T12:40:38+00:00\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.elementCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.fieldUid','\"47a430c5-4526-4e31-a721-b14568e8ad70\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.handle','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.includeInCards','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.instructions','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.label','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.required','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.tip','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.uid','\"a194a682-d580-4e87-8ff4-eeee0f71920a\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.userCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.warning','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.1.width','100'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.dateAdded','\"2024-08-27T12:40:38+00:00\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.elementCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.fieldUid','\"c7145ecd-130f-4465-b0a3-bb3da4fdf0ad\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.handle','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.includeInCards','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.instructions','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.label','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.required','false'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.tip','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.uid','\"b46928ce-a347-433e-b9a3-e90c2849dff6\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.userCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.warning','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.elements.2.width','100'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.name','\"Content\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.uid','\"73715301-faab-47ae-8730-3fc5990c5b21\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.fieldLayouts.b8623dff-1f22-4ddc-ae8d-1e2e9eea4a42.tabs.0.userCondition','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.handle','\"about\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.hasTitleField','true'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.icon','\"\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.name','\"About\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.showSlugField','true'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.showStatusField','true'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.slugTranslationKeyFormat','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.slugTranslationMethod','\"site\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.titleFormat','\"\"'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.titleTranslationKeyFormat','null'),
('entryTypes.e3d39713-9ffa-4e92-8243-4ae17ce3987b.titleTranslationMethod','\"site\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.color','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elementCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.autocomplete','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.autocorrect','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.class','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.dateAdded','\"2024-08-22T13:51:36+00:00\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.disabled','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.elementCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.id','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.includeInCards','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.inputType','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.instructions','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.label','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.max','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.min','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.name','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.orientation','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.placeholder','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.readonly','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.requirable','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.size','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.step','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.tip','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.title','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.uid','\"ab562d32-92e3-4155-8f97-466e00ec9239\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.userCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.warning','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.0.width','100'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.dateAdded','\"2024-08-22T13:53:53+00:00\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.elementCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.fieldUid','\"18324bdc-c749-4834-afe9-953a032c4782\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.handle','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.includeInCards','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.instructions','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.label','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.required','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.tip','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.uid','\"8e4ec545-62eb-46eb-9751-5b205cf251b9\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.userCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.warning','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.1.width','100'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.dateAdded','\"2024-08-23T15:04:49+00:00\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.elementCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.fieldUid','\"295de86d-7d6c-43e4-8b7f-acecd4b6be15\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.handle','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.includeInCards','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.instructions','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.label','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.required','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.tip','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.uid','\"c94b7197-b184-4fbe-9ee0-548d7972c582\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.userCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.warning','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.2.width','75'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.3.dateAdded','\"2024-08-23T15:08:26+00:00\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.3.elementCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.3.uid','\"e397c12f-8e74-4ddb-8ef9-bedbdfcb1f4d\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.3.userCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.dateAdded','\"2024-08-22T13:53:53+00:00\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.elementCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.fieldUid','\"25e4f6d1-8f1e-43f8-9c18-43beccec23ac\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.handle','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.includeInCards','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.instructions','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.label','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.required','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.tip','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.uid','\"043f5e23-6b8c-45fa-8290-4b4d4dc38c8e\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.userCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.warning','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.4.width','25'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.dateAdded','\"2024-08-22T13:53:53+00:00\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.elementCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.fieldUid','\"7493a22d-c58a-4e7e-a927-5549de385115\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.handle','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.includeInCards','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.instructions','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.label','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.providesThumbs','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.required','false'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.tip','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.uid','\"c5f127d0-97a7-4aff-86d2-b1794b49ba5e\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.userCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.warning','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.elements.5.width','100'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.name','\"Content\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.uid','\"902ec514-304e-49e6-89f7-56a7f687d07d\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.fieldLayouts.ee63bbc8-5006-45ac-913a-31a71d433bb4.tabs.0.userCondition','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.handle','\"post\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.hasTitleField','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.icon','\"\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.name','\"Post\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.showSlugField','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.showStatusField','true'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.slugTranslationKeyFormat','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.slugTranslationMethod','\"site\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.titleFormat','\"\"'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.titleTranslationKeyFormat','null'),
('entryTypes.edc1bfe8-f825-4996-8b0d-efe392379f8e.titleTranslationMethod','\"site\"'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.columnSuffix','null'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.handle','\"text\"'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.instructions','null'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.name','\"Text\"'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.searchable','false'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.settings.byteLimit','null'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.settings.charLimit','null'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.settings.code','false'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.settings.initialRows','12'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.settings.multiline','true'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.settings.placeholder','null'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.settings.uiMode','\"normal\"'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.translationKeyFormat','null'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.translationMethod','\"none\"'),
('fields.034c94c7-7449-4ec5-9d4a-ef4bb85d1760.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.columnSuffix','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.handle','\"featureImage\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.instructions','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.name','\"Feature Image\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.searchable','false'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.allowedKinds.0','\"image\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.allowSelfRelations','false'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.allowSubfolders','true'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.allowUploads','true'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.branchLimit','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.defaultUploadLocationSource','\"volume:497758c3-9536-48e8-8733-204b872cc80c\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.defaultUploadLocationSubpath','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.maintainHierarchy','false'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.maxRelations','1'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.minRelations','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.previewMode','\"full\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.restrictedDefaultUploadSubpath','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.restrictedLocationSource','\"volume:497758c3-9536-48e8-8733-204b872cc80c\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.restrictedLocationSubpath','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.restrictFiles','true'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.restrictLocation','true'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.selectionLabel','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.showCardsInGrid','false'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.showSiteMenu','true'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.showUnpermittedFiles','false'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.showUnpermittedVolumes','false'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.sources','\"*\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.targetSiteId','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.validateRelatedElements','false'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.settings.viewMode','\"list\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.translationKeyFormat','null'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.translationMethod','\"none\"'),
('fields.18324bdc-c749-4834-afe9-953a032c4782.type','\"craft\\\\fields\\\\Assets\"'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.columnSuffix','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.handle','\"postCategories\"'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.instructions','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.name','\"Post Categories\"'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.searchable','false'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.allowSelfRelations','false'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.branchLimit','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.maintainHierarchy','false'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.maxRelations','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.minRelations','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.selectionLabel','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.showCardsInGrid','false'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.showSiteMenu','false'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.source','\"group:9b59c16c-626b-4c1d-bae7-8164ef5b0aa1\"'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.targetSiteId','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.validateRelatedElements','false'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.settings.viewMode','\"list\"'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.translationKeyFormat','null'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.translationMethod','\"none\"'),
('fields.25e4f6d1-8f1e-43f8-9c18-43beccec23ac.type','\"craft\\\\fields\\\\Categories\"'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.columnSuffix','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.handle','\"postContent\"'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.instructions','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.name','\"Post Content\"'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.searchable','false'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.createButtonLabel','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.entryTypes.0','\"85c968e6-c85a-4ea7-bf76-7d42f15de2d3\"'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.includeTableView','false'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.maxEntries','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.minEntries','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.pageSize','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.propagationKeyFormat','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.propagationMethod','\"all\"'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.showCardsInGrid','false'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.settings.viewMode','\"blocks\"'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.translationKeyFormat','null'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.translationMethod','\"site\"'),
('fields.295de86d-7d6c-43e4-8b7f-acecd4b6be15.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.columnSuffix','null'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.handle','\"quote\"'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.instructions','null'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.name','\"Quote\"'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.searchable','false'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.settings.byteLimit','null'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.settings.charLimit','null'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.settings.code','false'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.settings.initialRows','4'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.settings.multiline','false'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.settings.placeholder','null'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.settings.uiMode','\"normal\"'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.translationKeyFormat','null'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.translationMethod','\"none\"'),
('fields.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.columnSuffix','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.handle','\"profilePhoto\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.instructions','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.name','\"Profile Photo\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.searchable','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.allowedKinds','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.allowSelfRelations','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.allowSubfolders','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.allowUploads','true'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.branchLimit','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.defaultUploadLocationSource','\"volume:497758c3-9536-48e8-8733-204b872cc80c\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.defaultUploadLocationSubpath','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.maintainHierarchy','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.maxRelations','1'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.minRelations','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.previewMode','\"full\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.restrictedDefaultUploadSubpath','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.restrictedLocationSource','\"volume:497758c3-9536-48e8-8733-204b872cc80c\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.restrictedLocationSubpath','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.restrictFiles','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.restrictLocation','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.selectionLabel','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.showCardsInGrid','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.showSiteMenu','true'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.showUnpermittedFiles','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.showUnpermittedVolumes','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.sources.0','\"volume:497758c3-9536-48e8-8733-204b872cc80c\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.targetSiteId','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.validateRelatedElements','false'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.settings.viewMode','\"large\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.translationKeyFormat','null'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.translationMethod','\"none\"'),
('fields.47a430c5-4526-4e31-a721-b14568e8ad70.type','\"craft\\\\fields\\\\Assets\"'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.columnSuffix','null'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.handle','\"summary\"'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.instructions','null'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.name','\"Summary\"'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.searchable','true'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.settings.byteLimit','null'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.settings.charLimit','null'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.settings.code','false'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.settings.initialRows','1'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.settings.multiline','true'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.settings.placeholder','null'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.settings.uiMode','\"normal\"'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.translationKeyFormat','null'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.translationMethod','\"none\"'),
('fields.7493a22d-c58a-4e7e-a927-5549de385115.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.columnSuffix','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.handle','\"image\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.instructions','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.name','\"Image\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.searchable','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.allowedKinds.0','\"image\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.allowSelfRelations','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.allowSubfolders','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.allowUploads','true'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.branchLimit','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.defaultUploadLocationSource','\"volume:497758c3-9536-48e8-8733-204b872cc80c\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.defaultUploadLocationSubpath','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.maintainHierarchy','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.maxRelations','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.minRelations','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.previewMode','\"full\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.restrictedDefaultUploadSubpath','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.restrictedLocationSource','\"volume:497758c3-9536-48e8-8733-204b872cc80c\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.restrictedLocationSubpath','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.restrictFiles','true'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.restrictLocation','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.selectionLabel','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.showCardsInGrid','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.showSiteMenu','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.showUnpermittedFiles','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.showUnpermittedVolumes','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.sources','\"*\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.targetSiteId','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.validateRelatedElements','false'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.settings.viewMode','\"list\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.translationKeyFormat','null'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.translationMethod','\"none\"'),
('fields.7ef1eb88-017c-4129-b0dd-eac0053a62a2.type','\"craft\\\\fields\\\\Assets\"'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.columnSuffix','null'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.handle','\"bio\"'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.instructions','null'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.name','\"Bio\"'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.searchable','false'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.settings.byteLimit','null'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.settings.charLimit','null'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.settings.code','false'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.settings.initialRows','8'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.settings.multiline','true'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.settings.placeholder','null'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.settings.uiMode','\"normal\"'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.translationKeyFormat','null'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.translationMethod','\"none\"'),
('fields.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.columnSuffix','null'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.handle','\"description\"'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.instructions','null'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.name','\"Description\"'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.searchable','false'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.settings.byteLimit','null'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.settings.charLimit','null'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.settings.code','false'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.settings.initialRows','4'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.settings.multiline','true'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.settings.placeholder','null'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.settings.uiMode','\"normal\"'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.translationKeyFormat','null'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.translationMethod','\"none\"'),
('fields.f34e1de1-7b45-4614-8406-091721a862a0.type','\"craft\\\\fields\\\\PlainText\"'),
('fs.hardDisk.hasUrls','true'),
('fs.hardDisk.name','\"Hard Disk\"'),
('fs.hardDisk.settings.path','\"@webroot/uploads/images\"'),
('fs.hardDisk.type','\"craft\\\\fs\\\\Local\"'),
('fs.hardDisk.url','\"@web/uploads/images\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elementCondition','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.dateAdded','\"2024-08-27T12:51:09+00:00\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.elementCondition','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.fieldUid','\"f34e1de1-7b45-4614-8406-091721a862a0\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.handle','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.includeInCards','false'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.instructions','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.label','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.providesThumbs','false'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.required','false'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.tip','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.uid','\"2bec5550-fbe2-48bc-8af3-e4dd41dfbfac\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.userCondition','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.warning','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.elements.0.width','100'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.name','\"Settings\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.uid','\"eaef76c6-cb72-40f5-a616-70c3731a7a60\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.fieldLayouts.606a1651-1deb-473c-b12d-6247540ac6ed.tabs.0.userCondition','null'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.handle','\"siteInfo\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.name','\"Site Info\"'),
('globalSets.79016788-c0f8-4921-a3ab-18b3281e476f.sortOrder','1'),
('graphql.schemas.c592686e-08db-4842-a67b-85a43751b402.isPublic','true'),
('graphql.schemas.c592686e-08db-4842-a67b-85a43751b402.name','\"Public Schema\"'),
('meta.__names__.034c94c7-7449-4ec5-9d4a-ef4bb85d1760','\"Text\"'),
('meta.__names__.18324bdc-c749-4834-afe9-953a032c4782','\"Feature Image\"'),
('meta.__names__.25e4f6d1-8f1e-43f8-9c18-43beccec23ac','\"Post Categories\"'),
('meta.__names__.295de86d-7d6c-43e4-8b7f-acecd4b6be15','\"Post Content\"'),
('meta.__names__.394c0a79-d7c3-4254-a5a5-fe0cfa255cb1','\"Quote\"'),
('meta.__names__.47a430c5-4526-4e31-a721-b14568e8ad70','\"Profile Photo\"'),
('meta.__names__.497758c3-9536-48e8-8733-204b872cc80c','\"Images\"'),
('meta.__names__.646b911b-625b-48ec-b10d-72d86733c600','\"About\"'),
('meta.__names__.7493a22d-c58a-4e7e-a927-5549de385115','\"Summary\"'),
('meta.__names__.79016788-c0f8-4921-a3ab-18b3281e476f','\"Site Info\"'),
('meta.__names__.7ef1eb88-017c-4129-b0dd-eac0053a62a2','\"Image\"'),
('meta.__names__.834ec624-ea3a-445f-8e6e-bc5c217ff2ab','\"Default\"'),
('meta.__names__.85c968e6-c85a-4ea7-bf76-7d42f15de2d3','\"contentPost\"'),
('meta.__names__.9b59c16c-626b-4c1d-bae7-8164ef5b0aa1','\"Topics\"'),
('meta.__names__.c592686e-08db-4842-a67b-85a43751b402','\"Public Schema\"'),
('meta.__names__.c7145ecd-130f-4465-b0a3-bb3da4fdf0ad','\"Bio\"'),
('meta.__names__.c9a73930-f21c-4d62-9fb9-e45b1930ddbd','\"Blog\"'),
('meta.__names__.cc6197f2-14c9-4e57-9751-95f0f83fd969','\"cms test aug\"'),
('meta.__names__.e3d39713-9ffa-4e92-8243-4ae17ce3987b','\"About\"'),
('meta.__names__.ecf43ff5-d5de-44a0-9c21-81afbe1b726c','\"cms test aug\"'),
('meta.__names__.edc1bfe8-f825-4996-8b0d-efe392379f8e','\"Post\"'),
('meta.__names__.f34e1de1-7b45-4614-8406-091721a862a0','\"Description\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.defaultPlacement','\"end\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.enableVersioning','true'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.entryTypes.0','\"e3d39713-9ffa-4e92-8243-4ae17ce3987b\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.handle','\"about\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.maxAuthors','1'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.name','\"About\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.propagationMethod','\"all\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.enabledByDefault','true'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.hasUrls','true'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.template','\"_singles/about\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.uriFormat','\"about\"'),
('sections.646b911b-625b-48ec-b10d-72d86733c600.type','\"single\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.defaultPlacement','\"end\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.enableVersioning','true'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.entryTypes.0','\"edc1bfe8-f825-4996-8b0d-efe392379f8e\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.entryTypes.1','\"834ec624-ea3a-445f-8e6e-bc5c217ff2ab\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.handle','\"blog\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.maxAuthors','1'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.name','\"Blog\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.propagationMethod','\"all\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.enabledByDefault','true'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.hasUrls','true'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.template','\"blog/_entry.twig\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.siteSettings.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.uriFormat','\"blog/{slug}\"'),
('sections.c9a73930-f21c-4d62-9fb9-e45b1930ddbd.type','\"channel\"'),
('siteGroups.cc6197f2-14c9-4e57-9751-95f0f83fd969.name','\"cms test aug\"'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.baseUrl','\"$PRIMARY_SITE_URL\"'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.enabled','true'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.handle','\"default\"'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.hasUrls','true'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.language','\"en-US\"'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.name','\"cms test aug\"'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.primary','true'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.siteGroup','\"cc6197f2-14c9-4e57-9751-95f0f83fd969\"'),
('sites.ecf43ff5-d5de-44a0-9c21-81afbe1b726c.sortOrder','1'),
('system.edition','\"team\"'),
('system.live','true'),
('system.name','\"cms test aug\"'),
('system.schemaVersion','\"5.3.0.2\"'),
('system.timeZone','\"America/Los_Angeles\"'),
('users.allowPublicRegistration','false'),
('users.defaultGroup','null'),
('users.photoSubpath','null'),
('users.photoVolumeUid','null'),
('users.require2fa','false'),
('users.requireEmailVerification','true'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.altTranslationKeyFormat','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.altTranslationMethod','\"none\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elementCondition','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.autocapitalize','true'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.autocomplete','false'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.autocorrect','true'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.class','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.dateAdded','\"2024-08-22T13:15:55+00:00\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.disabled','false'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.elementCondition','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.id','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.includeInCards','false'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.inputType','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.instructions','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.label','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.max','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.min','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.name','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.orientation','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.placeholder','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.providesThumbs','false'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.readonly','false'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.requirable','false'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.size','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.step','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.tip','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.title','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.uid','\"8d21edf7-9d62-436e-86c4-401161f23536\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.userCondition','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.warning','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.elements.0.width','100'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.name','\"Content\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.uid','\"71ccde99-f907-418c-b2b7-653b674f20a9\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fieldLayouts.4736548f-4602-47e1-ae44-451e87de0a91.tabs.0.userCondition','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.fs','\"hardDisk\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.handle','\"images\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.name','\"Images\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.sortOrder','1'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.subpath','\"\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.titleTranslationKeyFormat','null'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.titleTranslationMethod','\"site\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.transformFs','\"\"'),
('volumes.497758c3-9536-48e8-8733-204b872cc80c.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES
(1,2,12,NULL,6,1,'2024-08-23 15:08:39','2024-08-23 15:08:39','c973ac28-552c-4271-b202-71b3f8a77804'),
(2,6,13,NULL,6,1,'2024-08-23 15:08:45','2024-08-23 15:08:45','31382f41-ed61-4a69-ad13-7d0c8b02a73c'),
(3,3,12,NULL,14,1,'2024-08-23 15:08:55','2024-08-23 15:08:55','98727629-2cde-4fca-9eeb-6cb0c22a5944'),
(4,2,15,NULL,6,1,'2024-08-23 15:09:10','2024-08-23 15:09:10','f64baf66-066d-44ad-b1e2-10423e1e261a'),
(5,3,15,NULL,14,1,'2024-08-23 15:09:10','2024-08-23 15:09:10','ad9daf6d-d3c1-4177-8ad9-093f26f91afc'),
(6,6,16,NULL,6,1,'2024-08-23 15:09:10','2024-08-23 15:09:10','f781bb8d-f08d-4861-a820-f59de1114d2a'),
(7,2,25,NULL,6,1,'2024-08-23 15:13:34','2024-08-23 15:13:34','5b71f65a-b745-48eb-a55e-68c3080395ff'),
(8,3,25,NULL,14,1,'2024-08-23 15:13:57','2024-08-23 15:13:57','546b8a82-57a0-43f1-8708-06fc22823e38'),
(9,2,27,NULL,6,1,'2024-08-23 15:14:07','2024-08-23 15:14:07','4e93fb11-c373-4857-bcac-c171df8eaab5'),
(10,3,27,NULL,14,1,'2024-08-23 15:14:07','2024-08-23 15:14:07','ce5be4d0-c80a-458d-bc4f-322094f94be7'),
(15,2,33,NULL,6,1,'2024-08-23 15:16:53','2024-08-23 15:16:53','0e677921-2f7d-4345-b44f-7737db9fb779'),
(16,3,33,NULL,14,1,'2024-08-23 15:16:53','2024-08-23 15:16:53','24f2eb62-7778-4fc0-8a9b-581a09c08f84'),
(17,2,35,NULL,6,1,'2024-08-23 15:33:06','2024-08-23 15:33:06','65d53a65-2ec3-4638-a79f-22db2522f9bd'),
(18,3,35,NULL,14,1,'2024-08-23 15:33:06','2024-08-23 15:33:06','f8d9b2aa-ab04-4f7b-bf14-a2732ab602a6'),
(19,2,36,NULL,6,1,'2024-08-26 13:46:37','2024-08-26 13:46:37','76448b9c-bc62-4781-a827-f4345ad64495'),
(20,3,36,NULL,14,1,'2024-08-26 13:46:37','2024-08-26 13:46:37','d1887423-3442-43c9-90ae-c71c0202fd07'),
(24,6,26,NULL,6,1,'2024-08-26 14:15:34','2024-08-26 14:15:34','4df8320c-07f2-471b-a01e-183b024fa327'),
(25,2,40,NULL,6,1,'2024-08-26 14:15:34','2024-08-26 14:15:34','42e0a90d-85a9-4c87-b789-61b05440a110'),
(26,3,40,NULL,14,1,'2024-08-26 14:15:34','2024-08-26 14:15:34','e76a0368-b532-4523-8ef5-7947bed1b5fb'),
(27,6,41,NULL,6,1,'2024-08-26 14:15:34','2024-08-26 14:15:34','5ba1d4b7-ee3e-449b-b45b-8a044950de81'),
(28,2,42,NULL,6,1,'2024-08-26 14:17:16','2024-08-26 14:17:16','afb252de-0e07-4f19-a7dc-0945b768f9b5'),
(29,3,42,NULL,14,1,'2024-08-26 14:17:16','2024-08-26 14:17:16','87cc9648-030b-47bd-a2de-8257c1964c93'),
(30,2,43,NULL,6,1,'2024-08-27 09:44:09','2024-08-27 09:44:09','50966f81-05c5-4343-9865-b64ee1d2b9ed'),
(31,3,43,NULL,14,1,'2024-08-27 09:44:09','2024-08-27 09:44:09','eeb01dc3-2019-43a1-b5a0-e841e329fc10'),
(34,2,50,NULL,6,1,'2024-08-27 09:55:43','2024-08-27 09:55:43','d1ef97af-478b-436d-b993-6fb4de92f399'),
(35,3,50,NULL,14,1,'2024-08-27 09:55:43','2024-08-27 09:55:43','710e8d66-7f9e-4a31-be98-6a1309327864'),
(42,2,56,NULL,6,1,'2024-08-27 09:57:49','2024-08-27 09:57:49','f12e5cf0-91c4-4cc6-86b9-19fc5c702e68'),
(43,3,56,NULL,14,1,'2024-08-27 09:57:49','2024-08-27 09:57:49','b9808d6c-02d4-456d-95a2-51211795964c'),
(44,6,57,NULL,6,1,'2024-08-27 09:57:49','2024-08-27 09:57:49','388ace6b-798b-468b-8666-12ac7765d153'),
(45,6,58,NULL,6,1,'2024-08-27 09:57:49','2024-08-27 09:57:49','0fecd11a-1f38-4b33-9ff8-981d41e66a30'),
(50,2,62,NULL,6,1,'2024-08-27 11:31:15','2024-08-27 11:31:15','297ba11a-b3a7-4280-853b-d01b6efc9412'),
(51,3,62,NULL,14,1,'2024-08-27 11:31:15','2024-08-27 11:31:15','91212d85-c9fa-4832-be4d-7e0bf88fcf8f'),
(55,2,67,NULL,6,1,'2024-08-27 11:34:18','2024-08-27 11:34:18','3dbe8f72-c036-4bf4-b520-5788721a066e'),
(56,3,67,NULL,14,1,'2024-08-27 11:34:18','2024-08-27 11:34:18','c149b07b-162d-4329-91c4-a3289787b46c'),
(57,6,68,NULL,6,1,'2024-08-27 11:34:18','2024-08-27 11:34:18','2818f8c8-4080-49b8-9f2f-f72a683ca48e'),
(58,2,69,NULL,6,1,'2024-08-27 11:49:16','2024-08-27 11:49:16','37f93b93-0216-472e-bc58-ecf7de92fb62'),
(59,3,69,NULL,14,1,'2024-08-27 11:49:16','2024-08-27 11:49:16','add94d2f-343b-4870-9fd3-8b520958b73e'),
(61,9,72,NULL,75,1,'2024-08-27 12:41:24','2024-08-27 12:41:24','4651474e-94f7-49bd-a2db-501bb0f4154e'),
(62,9,76,NULL,75,1,'2024-08-27 12:41:24','2024-08-27 12:41:24','fb6bdafb-2041-41a3-8bba-b3bc60b82218'),
(63,9,77,NULL,75,1,'2024-08-27 12:41:29','2024-08-27 12:41:29','947a18ba-7af2-4704-87cb-7bfbf90778c6'),
(64,2,79,NULL,6,1,'2024-08-29 07:57:17','2024-08-29 07:57:17','2f9f22ae-ab1f-4663-92d1-c4e26b09c55a'),
(65,3,79,NULL,14,1,'2024-08-29 07:57:17','2024-08-29 07:57:17','943d7ad2-2600-4cc8-b449-5638aed5d4a8'),
(68,2,83,NULL,6,1,'2024-08-29 08:37:30','2024-08-29 08:37:30','85020afe-f3d7-48d8-b727-d9c99ab3af0e'),
(69,3,83,NULL,14,1,'2024-08-29 08:37:30','2024-08-29 08:37:30','d03bc092-ecf5-4990-b930-db070858876c');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES
(1,3,1,1,''),
(2,3,1,2,''),
(3,3,1,3,'Applied “Draft 1”'),
(4,12,1,1,''),
(5,13,1,1,NULL),
(6,19,1,1,''),
(7,25,1,1,''),
(8,26,1,1,NULL),
(9,25,1,2,'Applied “Draft 1”'),
(10,32,1,1,NULL),
(11,25,1,3,''),
(12,25,1,4,''),
(13,25,1,5,'Applied “Draft 1”'),
(14,26,1,2,NULL),
(15,25,1,6,''),
(16,25,1,7,''),
(17,44,1,1,''),
(18,25,1,8,'Applied “Draft 1”'),
(19,49,1,1,NULL),
(20,25,1,9,'Applied “Draft 1”'),
(21,49,1,2,NULL),
(22,55,1,1,NULL),
(23,25,1,10,'Applied “Draft 1”'),
(24,49,1,3,NULL),
(25,55,1,2,NULL),
(26,25,1,11,'Applied “Draft 1”'),
(27,26,1,3,NULL),
(28,25,1,12,''),
(30,72,1,1,NULL),
(31,72,1,2,'Applied “Draft 1”'),
(32,72,1,3,NULL),
(33,25,1,13,NULL),
(34,25,1,14,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES
(1,'email',0,1,' gitte neven hotmail com '),
(1,'firstname',0,1,''),
(1,'fullname',0,1,''),
(1,'lastname',0,1,''),
(1,'slug',0,1,''),
(1,'username',0,1,' git c c '),
(2,'slug',0,1,' temp tvhpkfbdkzwisfdhnkurgpllbopyqpegwqkz '),
(2,'title',0,1,''),
(3,'slug',0,1,' test '),
(3,'title',0,1,' test '),
(6,'alt',0,1,''),
(6,'extension',0,1,' jpg '),
(6,'filename',0,1,' sign up jpg '),
(6,'kind',0,1,' image '),
(6,'slug',0,1,''),
(6,'title',0,1,' bend '),
(9,'slug',0,1,' temp ishnisyxhydbvumpbvdwqlosawjowrgifbke '),
(9,'title',0,1,''),
(10,'slug',0,1,' temp nligrfmsfizroyqigjntyfxsufwypangnlxy '),
(10,'title',0,1,''),
(11,'slug',0,1,' temp ivtorvgdmnfodtlwujymqiqehkvgqfotosva '),
(11,'title',0,1,''),
(12,'field',1,1,' testing '),
(12,'slug',0,1,' test 2 '),
(12,'title',0,1,' test '),
(13,'slug',0,1,' temp mnlmazwimwcayzixfllvfxuxamufcvzegvmx '),
(13,'title',0,1,''),
(14,'slug',0,1,' test '),
(14,'title',0,1,' test '),
(17,'slug',0,1,' my trip to bend '),
(17,'title',0,1,' my trip to bend '),
(18,'slug',0,1,' temp mthcvfenmgdhlnybvadwjizkvrgmetngdzxe '),
(18,'title',0,1,''),
(19,'slug',0,1,' test 3 '),
(19,'title',0,1,' test '),
(21,'slug',0,1,' temp khevcucsykfbkhnygslhzqgsnwkpkegrbzkw '),
(21,'title',0,1,''),
(22,'slug',0,1,' temp hhnisywkxfhnyctrrlwmldobdbjdtfzwtxdy '),
(22,'title',0,1,''),
(23,'slug',0,1,' temp dskpqncceselatcdrbjegwmnntlrgkluesou '),
(23,'title',0,1,''),
(24,'slug',0,1,' temp akebsptuaonrufheimbbmwvhifqnurkppcwq '),
(24,'title',0,1,''),
(25,'field',1,1,' short of bend '),
(25,'slug',0,1,' my trip to bend '),
(25,'title',0,1,' my trip to bend '),
(26,'slug',0,1,' temp kjqupsjmmdqigazpfkxgsgfdmkuxszmnmsmo '),
(26,'title',0,1,''),
(32,'slug',0,1,' temp etfdnqapzgrypsryqrfguxldasegjlhevtyk '),
(32,'title',0,1,''),
(44,'slug',0,1,' temp atatnazvpbwgpvhmaxmywdkojixqqofvtmcx '),
(44,'title',0,1,''),
(46,'slug',0,1,' temp tlgtvikmwbvgdszdokeeniuosltwutxkdxrq '),
(46,'title',0,1,''),
(49,'slug',0,1,' temp rmcyxxejkoebicnulfqgzmwgwsxjfhredmde '),
(49,'title',0,1,''),
(55,'slug',0,1,' temp bkculpawamkkmmkicjsubmedohxxasoambhs '),
(55,'title',0,1,''),
(72,'slug',0,1,' about '),
(72,'title',0,1,' this is a test about '),
(75,'alt',0,1,''),
(75,'extension',0,1,' jpg '),
(75,'filename',0,1,' 07bf8a92b22866fde5a2ac2f289e4140 jpg '),
(75,'kind',0,1,' image '),
(75,'slug',0,1,''),
(75,'title',0,1,' 07bf8a92b22866fde5a2ac2f289e4140 '),
(78,'slug',0,1,''),
(81,'slug',0,1,' temp qunafwrhrcwjptptqejrbaqcdkmeghrrqgop '),
(81,'title',0,1,''),
(82,'slug',0,1,' temp eqkgscmyzrbvfaobnhaolvqcfzgbfdkcbmtl '),
(82,'title',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES
(1,NULL,'Blog','blog','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-08-22 13:15:10','2024-08-22 13:15:10',NULL,'c9a73930-f21c-4d62-9fb9-e45b1930ddbd'),
(2,2,'Posted Content','postedContent','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-08-27 09:44:00','2024-08-27 09:44:00','2024-08-27 09:44:53','bbea2069-6494-4974-913d-b5425b160144'),
(3,NULL,'About','about','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-08-27 12:39:51','2024-08-27 12:39:51',NULL,'646b911b-625b-48ec-b10d-72d86733c600');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES
(1,1,2),
(1,2,1),
(2,3,1),
(3,4,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES
(1,1,1,1,'blog/{slug}','blog/_entry.twig',1,'2024-08-22 13:15:10','2024-08-22 13:15:10','59de8b6d-473b-4a61-b881-8de823f9aa16'),
(2,2,1,1,'posted-content/{slug}','posted-content/_entry.twig',1,'2024-08-27 09:44:00','2024-08-27 09:44:00','0b2c38cd-50b4-4c91-9a40-51bb26e6daaf'),
(3,3,1,1,'about','_singles/about',1,'2024-08-27 12:39:51','2024-08-27 12:39:51','981b1df9-8910-4fc3-9ac5-18cbc1455ebd');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES
(1,'cms test aug','2024-08-22 12:26:28','2024-08-22 12:26:28',NULL,'cc6197f2-14c9-4e57-9751-95f0f83fd969');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES
(1,1,1,'1','cms test aug','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-08-22 12:26:28','2024-08-29 09:40:23',NULL,'ecf43ff5-d5de-44a0-9c21-81afbe1b726c');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES
(1,1,NULL,1,1,4,0,'2024-08-23 15:08:52','2024-08-23 15:08:52','eae8a8e1-6dda-4a18-bc91-951795adef50'),
(2,1,14,1,2,3,1,'2024-08-23 15:08:52','2024-08-23 15:08:52','f50dc237-6851-4985-b381-61ce9e27c195'),
(3,2,NULL,3,1,4,0,'2024-08-27 09:44:16','2024-08-27 09:44:39','1333fd00-7da4-48de-bf98-b1369707cf50'),
(5,2,46,3,2,3,1,'2024-08-27 09:44:28','2024-08-27 09:44:39','89babc44-4f8d-4f7d-b51c-b029990e39a2');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES
(1,1,'2024-08-22 13:19:06','2024-08-22 13:19:06',NULL,'da6e6159-33a0-45cf-abeb-5113d0b7c4ec'),
(2,NULL,'2024-08-27 09:44:00','2024-08-27 09:44:00','2024-08-27 09:44:53','57f24f86-2e39-4917-92a3-fd3a033db87a');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES
(4,'XkyfXm4XF9L3FE5f5bzb_pWl3ku3me4q','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":25,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2024-08-30 08:36:13','2024-08-29 08:36:13','2024-08-29 08:36:13','78a71d6f-8cad-4d6f-99e1-71f52e391f64');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `usergroups` VALUES
(1,'Team','team',NULL,'2024-08-29 08:20:11','2024-08-29 08:20:11','c55ca0a9-4bd6-409b-afd8-c1884dafecd0');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES
(1,'{\"language\": \"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,NULL,1,0,0,0,1,'Git[C[C',NULL,NULL,NULL,'gitte.neven@hotmail.com','$2y$13$cOj1.CCugt4E0Mcy7bqLveH5HyjHFtTrK0vSELR81EE3n/kIy3aea','2024-08-29 07:57:14',NULL,NULL,NULL,'2024-08-26 07:25:03',NULL,1,NULL,NULL,NULL,0,'2024-08-22 12:26:29','2024-08-22 12:26:29','2024-08-29 07:57:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES
(1,NULL,1,'Images','','2024-08-22 13:18:04','2024-08-22 13:18:04','d0a03cf7-082f-442b-bfdf-780ebd89b91b'),
(2,NULL,NULL,'Temporary Uploads',NULL,'2024-08-22 13:59:02','2024-08-22 13:59:02','8a90518e-f50a-4302-8704-2371bfb8279a'),
(3,2,NULL,'user_1','user_1/','2024-08-22 13:59:02','2024-08-22 13:59:02','83ce0be1-9941-48b2-ae45-1cd9985e1690');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES
(1,2,'Images','images','hardDisk','','','','site',NULL,'none',NULL,1,'2024-08-22 13:18:04','2024-08-22 13:18:04',NULL,'497758c3-9536-48e8-8733-204b872cc80c');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES
(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2024-08-22 12:29:16','2024-08-22 12:29:16','0b7258ce-734f-4d1f-8c12-9e9e22491577'),
(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-08-22 12:29:16','2024-08-22 12:29:16','4348f82b-a05c-4b2c-90b4-e837b3bd0d41'),
(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-08-22 12:29:16','2024-08-22 12:29:16','9877743f-cbd1-4546-8c0b-7c8c42b02d68'),
(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2024-08-22 12:29:16','2024-08-22 12:29:16','fb7948ed-1e69-4a41-85ab-167b30c94667');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-09 13:13:41
