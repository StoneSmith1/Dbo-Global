-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22-Fev-2023 às 18:24
-- Versão do servidor: 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `teach`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(128) NOT NULL DEFAULT '',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `vip_time` int(15) NOT NULL DEFAULT '0',
  `page_lastday` int(11) NOT NULL,
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(255) NOT NULL,
  `nickname` char(48) DEFAULT NULL,
  `avatar` char(48) DEFAULT NULL,
  `about_me` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3202 ;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `vip_time`, `page_lastday`, `email_new`, `email_new_time`, `created`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `vote`, `last_post`, `flag`, `nickname`, `avatar`, `about_me`) VALUES
(2401, 'samplesss', '7e5cefb2daa289bccfe0033588dcfe502b9ef88d', '', 0, 0, 'samplessssssss@hotmail.com', '', 0, 0, 1, 0, 0, '', 0, 0, '', '', 0, '0', 0, 0, 0, 0, '', 'Iidsadosasa', NULL, NULL),
(2402, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '', 0, 0, 'admin@hotmail.com', '', 0, 0, 1, 0, 0, '', 0, 0, '', '', 0, '0', 0, 0, 0, 0, '', 'Iidsadosasa', NULL, NULL);

--
-- Acionadores `accounts`
--
DROP TRIGGER IF EXISTS `ondelete_accounts`;
DELIMITER //
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_storage`
--

CREATE TABLE IF NOT EXISTS `account_storage` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_id_2` (`account_id`,`key`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `achievements`
--

CREATE TABLE IF NOT EXISTS `achievements` (
  `player_id` int(11) NOT NULL,
  `achievement` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bounty_hunters`
--

CREATE TABLE IF NOT EXISTS `bounty_hunters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fp_id` int(11) NOT NULL,
  `sp_id` int(11) NOT NULL,
  `k_id` int(11) NOT NULL,
  `added` int(15) NOT NULL,
  `prize` bigint(20) NOT NULL,
  `killed` int(11) NOT NULL,
  `kill_time` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bugtracker`
--

CREATE TABLE IF NOT EXISTS `bugtracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(3) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `text` text,
  `title` varchar(120) DEFAULT NULL,
  `done` tinyint(3) DEFAULT NULL,
  `priority` tinyint(3) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `body` text,
  `time` int(11) DEFAULT '0',
  `author` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `deaths_in_wars`
--

CREATE TABLE IF NOT EXISTS `deaths_in_wars` (
  `guild_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `killer_guild` int(11) NOT NULL,
  `killer` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `result1` int(11) NOT NULL,
  `result2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE IF NOT EXISTS `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forums`
--

CREATE TABLE IF NOT EXISTS `forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `description` tinytext,
  `access` smallint(5) DEFAULT '1' COMMENT 'Min. access to see the board',
  `closed` tinyint(1) DEFAULT NULL,
  `moderators` tinytext,
  `order` int(6) DEFAULT NULL,
  `requireLogin` tinyint(1) DEFAULT NULL,
  `guild` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Extraindo dados da tabela `forums`
--

INSERT INTO `forums` (`id`, `name`, `description`, `access`, `closed`, `moderators`, `order`, `requireLogin`, `guild`) VALUES
(1, 'Guildboard for One Piece', 'Guildboard for One Piece', 0, 0, 'Zoro', 9999, 1, 2),
(3, 'Guildboard for TERRORISTAS', 'Guildboard for TERRORISTAS', 0, 0, 'Taliban', 9999, 1, 2),
(4, 'Guildboard for UmBrElLaCoRpOrAtIoN', 'Guildboard for UmBrElLaCoRpOrAtIoN', 0, 0, 'Paikuhan The Sad', 9999, 1, 3),
(5, 'Guildboard for ADM TESTE', 'Guildboard for ADM TESTE', 0, 0, '[ADM] DBO Factory', 9999, 1, 4),
(6, 'Guildboard for One Piece', 'Guildboard for One Piece', 0, 0, 'Homobono', 9999, 1, 5),
(7, 'Guildboard for TioPatinhas', 'Guildboard for TioPatinhas', 0, 0, 'Marinho', 9999, 1, 8),
(8, 'Guildboard for  TioPatinhas', 'Guildboard for  TioPatinhas', 0, 0, 'Pikamhuca', 9999, 1, 9),
(9, 'Guildboard for SCCP', 'Guildboard for SCCP', 0, 0, 'Brhayon', 9999, 1, 18),
(10, 'Guildboard for H e n t a I', 'Guildboard for H e n t a I', 0, 0, 'Hentai', 9999, 1, 21),
(11, 'Guildboard for Testexxx', 'Guildboard for Testexxx', 0, 0, 'Godwiss', 9999, 1, 24),
(12, 'Guildboard for Forca Red Ribbon', 'Guildboard for Forca Red Ribbon', 0, 0, 'Frr', 9999, 1, 25),
(16, 'Guildboard for DestrozAnos', 'Guildboard for DestrozAnos', 0, 0, 'Pelonrico', 9999, 1, 30),
(17, 'Guildboard for traidores', 'Guildboard for traidores', 0, 0, 'Fuck Love', 9999, 1, 32),
(18, 'Guildboard for The legacy', 'Guildboard for The legacy', 0, 0, 'Verdinhoo', 9999, 1, 34),
(19, 'Guildboard for ToXiC', 'Guildboard for ToXiC', 0, 0, 'Leozin Smoker', 9999, 1, 35),
(21, 'Guildboard for Enemy Down', 'Guildboard for Enemy Down', 0, 0, 'Leozin Smoker', 9999, 1, 38),
(22, 'Guildboard for Os Renegado', 'Guildboard for Os Renegado', 0, 0, 'Cmil', 9999, 1, 39),
(24, 'Guildboard for gg lol vem', 'Guildboard for gg lol vem', 0, 0, 'Matadordoido', 9999, 1, 41),
(25, 'Guildboard for matamemo', 'Guildboard for matamemo', 0, 0, 'Frizei', 9999, 1, 46),
(26, 'Guildboard for Alliance Star', 'Guildboard for Alliance Star', 0, 0, 'Stoplosss', 9999, 1, 47),
(27, 'Guildboard for Time Anjel', 'Guildboard for Time Anjel', 0, 0, 'Ball Anjel', 9999, 1, 48),
(28, 'Guildboard for Dark Anjel', 'Guildboard for Dark Anjel', 0, 0, 'Anjel Dark', 9999, 1, 49),
(29, 'Guildboard for Dilatados', 'Guildboard for Dilatados', 0, 0, 'Saiyajin Goku', 9999, 1, 50),
(31, 'Guildboard for Old Anbu', 'Guildboard for Old Anbu', 0, 0, 'Massaru Ocult', 9999, 1, 53),
(32, 'Guildboard for RedSkulls', 'Guildboard for RedSkulls', 0, 0, 'Saiyajin Bardock', 9999, 1, 54),
(33, 'Guildboard for Escudinho', 'Guildboard for Escudinho', 0, 0, 'Ave Maria Doido', 9999, 1, 56),
(34, 'Guildboard for SeraFim Do Fim', 'Guildboard for SeraFim Do Fim', 0, 0, 'Sera Fim', 9999, 1, 58),
(35, 'Guildboard for Umbrella Corporation', 'Guildboard for Umbrella Corporation', 0, 0, 'Chi-chi-no-banheiro', 9999, 1, 71),
(36, 'Guildboard for Enemy LIXO', 'Guildboard for Enemy LIXO', 0, 0, 'Warrr', 9999, 1, 72),
(37, 'Guildboard for New Era', 'Guildboard for New Era', 0, 0, 'Random', 9999, 1, 73),
(38, 'Guildboard for War System', 'Guildboard for War System', 0, 0, 'Peao', 9999, 1, 74),
(39, 'Guildboard for It''s Server Balance', 'Guildboard for It''s Server Balance', 0, 0, 'Haxixi', 9999, 1, 75),
(40, 'Guildboard for Black Aliance', 'Guildboard for Black Aliance', 0, 0, 'Algumacoisaaqui', 9999, 1, 76),
(41, 'Guildboard for the inutil', 'Guildboard for the inutil', 0, 0, 'Askin', 9999, 1, 77);

-- --------------------------------------------------------

--
-- Estrutura da tabela `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `with` int(11) DEFAULT NULL,
  `friend` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `with` (`with`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE IF NOT EXISTS `global_storage` (
  `key` varchar(32) NOT NULL DEFAULT '0',
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `world_id`, `value`) VALUES
('0', 0, '-1'),
('1000', 0, '56'),
('140120', 0, '0'),
('140121', 0, '0'),
('180400', 0, '0'),
('201320111714', 0, 'Black Aliance'),
('201320111715', 0, 'Black Aliance'),
('201320111717', 0, 'Black Aliance'),
('34370', 0, '0'),
('34371', 0, '2'),
('34372', 0, '0'),
('34373', 0, '0'),
('89954', 0, '-1'),
('89956', 0, '1582333225'),
('runEventJoining', 0, '-1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `invited_to` int(11) NOT NULL,
  `invited_by` int(11) NOT NULL,
  `in_war_with` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `show` smallint(1) NOT NULL,
  `war_time` int(11) NOT NULL,
  `castle_war` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Acionadores `guilds`
--
DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_guilds`;
DELIMITER //
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds`
 FOR EACH ROW BEGIN
        UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE IF NOT EXISTS `guild_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_kills_ibfk_1` (`war_id`),
  KEY `guild_kills_ibfk_2` (`death_id`),
  KEY `guild_kills_ibfk_3` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=163 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE IF NOT EXISTS `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guild_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `enemy_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `guild_id` (`guild_id`),
  KEY `enemy_id` (`enemy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(2, 0, 0, 0, 0, 0, 'Unnamed House #2', 1, 23, 240000, 240000, 1, 1, 36, 0, 0),
(3, 0, 0, 0, 0, 0, 'Unnamed House #3', 1, 23, 240000, 240000, 1, 1, 36, 0, 0),
(4, 0, 0, 0, 0, 0, 'Unnamed House #4', 1, 23, 240000, 240000, 1, 1, 36, 0, 0),
(5, 0, 0, 0, 0, 0, 'Unnamed House #5', 1, 23, 240000, 240000, 1, 1, 36, 0, 0),
(6, 0, 0, 0, 0, 0, 'Unnamed House #6', 1, 18, 190000, 190000, 1, 1, 30, 0, 0),
(7, 0, 0, 0, 0, 0, 'Unnamed House #7', 1, 18, 190000, 190000, 1, 1, 30, 0, 0),
(8, 0, 0, 0, 0, 0, 'Unnamed House #8', 1, 14, 150000, 150000, 1, 1, 25, 0, 0),
(9, 0, 0, 0, 0, 0, 'Unnamed House #9', 1, 14, 150000, 150000, 1, 1, 25, 0, 0),
(10, 0, 0, 0, 0, 0, 'Unnamed House #10', 1, 52, 530000, 530000, 1, 1, 71, 0, 0),
(11, 0, 0, 0, 0, 0, 'Unnamed House #11', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(12, 0, 0, 0, 0, 0, 'Unnamed House #12', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(13, 0, 0, 0, 0, 0, 'Unnamed House #13', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(14, 0, 0, 0, 0, 0, 'Unnamed House #14', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(15, 0, 0, 0, 0, 0, 'Unnamed House #15', 1, 10, 110000, 110000, 1, 1, 21, 0, 0),
(16, 0, 0, 0, 0, 0, 'Unnamed House #16', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(17, 0, 0, 0, 0, 0, 'Unnamed House #17', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(18, 0, 0, 0, 0, 0, 'Unnamed House #18', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(19, 0, 0, 0, 0, 0, 'Unnamed House #19', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(20, 0, 0, 0, 0, 0, 'Unnamed House #20', 1, 14, 150000, 150000, 1, 1, 26, 0, 0),
(21, 0, 0, 0, 0, 0, 'Unnamed House #21', 1, 18, 190000, 190000, 1, 1, 31, 0, 0),
(22, 0, 0, 0, 0, 0, 'Unnamed House #22', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(23, 0, 0, 0, 0, 0, 'Unnamed House #23', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(24, 0, 0, 0, 0, 0, 'Unnamed House #24', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(25, 0, 0, 0, 0, 0, 'Unnamed House #25', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(26, 0, 0, 0, 0, 0, 'Unnamed House #26', 1, 14, 150000, 150000, 1, 1, 26, 0, 0),
(27, 0, 0, 0, 0, 0, 'Unnamed House #27', 1, 18, 190000, 190000, 1, 1, 31, 0, 0),
(28, 0, 0, 0, 0, 0, 'Unnamed House #28', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(29, 0, 0, 0, 0, 0, 'Unnamed House #29', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(30, 0, 0, 0, 0, 0, 'Unnamed House #30', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(31, 0, 0, 0, 0, 0, 'Unnamed House #31', 1, 10, 110000, 110000, 1, 1, 20, 0, 0),
(32, 0, 0, 0, 0, 0, 'Unnamed House #32', 1, 14, 150000, 150000, 1, 1, 23, 0, 0),
(33, 0, 0, 0, 0, 0, 'Unnamed House #33', 1, 18, 190000, 190000, 1, 1, 31, 0, 0),
(34, 0, 0, 0, 0, 0, 'Unnamed House #34', 1, 13, 140000, 140000, 1, 1, 24, 0, 0),
(35, 0, 0, 0, 0, 0, 'Unnamed House #35', 1, 13, 140000, 140000, 1, 1, 24, 0, 0),
(36, 0, 0, 0, 0, 0, 'Unnamed House #36', 1, 13, 140000, 140000, 0, 1, 24, 0, 0),
(37, 0, 0, 0, 0, 0, 'Unnamed House #37', 1, 13, 140000, 140000, 0, 1, 24, 0, 0),
(38, 0, 0, 0, 0, 0, 'Unnamed House #38', 1, 13, 140000, 140000, 1, 1, 24, 0, 0),
(39, 0, 0, 0, 0, 0, 'Unnamed House #39', 1, 13, 140000, 140000, 1, 1, 24, 0, 0),
(40, 0, 0, 0, 0, 0, 'Unnamed House #40', 1, 13, 140000, 140000, 1, 1, 25, 0, 0),
(41, 0, 0, 0, 0, 0, 'Unnamed House #41', 1, 13, 140000, 140000, 1, 1, 25, 0, 0),
(42, 0, 0, 0, 0, 0, 'Unnamed House #42', 1, 8, 90000, 90000, 1, 1, 18, 0, 0),
(43, 0, 0, 0, 0, 0, 'Unnamed House #43', 1, 13, 140000, 140000, 1, 1, 24, 0, 0),
(44, 0, 0, 0, 0, 0, 'Unnamed House #44', 1, 18, 190000, 190000, 1, 1, 33, 0, 0),
(45, 0, 0, 0, 0, 0, 'Unnamed House #45', 1, 18, 190000, 190000, 1, 1, 30, 0, 0),
(46, 0, 0, 0, 0, 0, 'Unnamed House #46', 1, 18, 190000, 190000, 1, 1, 30, 0, 0),
(47, 0, 0, 0, 0, 0, 'Unnamed House #47', 1, 16, 170000, 170000, 1, 1, 30, 0, 0),
(48, 0, 0, 0, 0, 0, 'Unnamed House #48', 1, 16, 170000, 170000, 1, 1, 30, 0, 0),
(51, 0, 0, 0, 0, 0, 'Unnamed House #51', 1, 47, 480000, 480000, 1, 1, 73, 0, 0),
(52, 0, 0, 0, 0, 0, 'Unnamed House #52', 1, 48, 490000, 490000, 1, 1, 74, 0, 0),
(53, 0, 0, 0, 0, 0, 'Unnamed House #53', 1, 45, 470000, 470000, 1, 2, 65, 0, 0),
(54, 0, 0, 0, 0, 0, 'Unnamed House #54', 1, 45, 470000, 470000, 1, 2, 65, 0, 0),
(55, 0, 0, 0, 0, 0, 'Unnamed House #55', 1, 45, 470000, 470000, 1, 2, 65, 0, 0),
(56, 0, 0, 0, 0, 0, 'Unnamed House #56', 1, 45, 470000, 470000, 1, 2, 64, 0, 0),
(57, 0, 0, 0, 0, 0, 'Unnamed House #57', 1, 45, 470000, 470000, 1, 2, 64, 0, 0),
(58, 0, 0, 0, 0, 0, 'Unnamed House #58', 1, 45, 470000, 470000, 1, 2, 64, 0, 0),
(59, 0, 0, 0, 0, 0, 'Unnamed House #59', 1, 18, 190000, 190000, 1, 1, 30, 0, 0),
(60, 0, 0, 0, 0, 0, 'Unnamed House #60', 1, 18, 190000, 190000, 1, 1, 30, 0, 0),
(61, 0, 0, 0, 0, 0, 'Unnamed House #61', 1, 64, 660000, 660000, 1, 2, 87, 0, 0),
(62, 0, 0, 0, 0, 0, 'Unnamed House #62', 1, 61, 630000, 630000, 1, 2, 84, 0, 0),
(63, 0, 0, 0, 0, 0, 'Unnamed House #63', 1, 68, 700000, 700000, 1, 2, 92, 0, 0),
(64, 0, 0, 0, 0, 0, 'Unnamed House #64', 1, 56, 580000, 580000, 1, 2, 77, 0, 0),
(65, 0, 0, 0, 0, 0, 'Unnamed House #65', 1, 57, 580000, 580000, 1, 1, 85, 0, 0),
(66, 0, 0, 0, 0, 0, 'Unnamed House #66', 1, 22, 230000, 230000, 1, 1, 36, 0, 0),
(67, 0, 0, 0, 0, 0, 'Unnamed House #67', 1, 26, 270000, 270000, 1, 1, 41, 0, 0),
(68, 0, 0, 0, 0, 0, 'Unnamed House #68', 1, 26, 270000, 270000, 1, 1, 40, 0, 0),
(69, 0, 0, 0, 0, 0, 'Unnamed House #69', 1, 22, 230000, 230000, 1, 1, 35, 0, 0),
(70, 0, 0, 0, 0, 0, 'Unnamed House #70', 1, 22, 230000, 230000, 1, 1, 36, 0, 0),
(71, 0, 0, 0, 0, 0, 'Unnamed House #71', 1, 22, 230000, 230000, 1, 1, 36, 0, 0),
(72, 0, 0, 0, 0, 0, 'Unnamed House #72', 1, 22, 230000, 230000, 1, 1, 35, 0, 0),
(73, 0, 0, 0, 0, 0, 'Unnamed House #73', 1, 22, 230000, 230000, 1, 1, 35, 0, 0),
(74, 0, 0, 0, 0, 0, 'Unnamed House #74', 1, 18, 190000, 190000, 1, 1, 30, 0, 0),
(75, 0, 0, 0, 0, 0, 'Unnamed House #75', 1, 22, 230000, 230000, 1, 1, 35, 0, 0),
(76, 0, 0, 0, 0, 0, 'Unnamed House #76', 1, 48, 490000, 490000, 1, 1, 70, 0, 0),
(78, 0, 0, 0, 0, 0, 'Unnamed House #78', 1, 52, 530000, 530000, 1, 1, 80, 0, 0),
(79, 0, 0, 0, 0, 0, 'Unnamed House #79', 1, 52, 530000, 530000, 1, 1, 80, 0, 0),
(80, 0, 0, 0, 0, 0, 'Unnamed House #80', 1, 52, 530000, 530000, 1, 1, 80, 0, 0),
(81, 0, 0, 0, 0, 0, 'Unnamed House #81', 1, 102, 1050000, 1050000, 2, 3, 160, 0, 0),
(82, 0, 0, 0, 0, 0, 'Unnamed House #82', 1, 102, 1050000, 1050000, 2, 3, 160, 0, 0),
(83, 0, 0, 0, 0, 0, 'Unnamed House #83', 1, 89, 910000, 910000, 1, 2, 135, 0, 0),
(84, 0, 0, 0, 0, 0, 'Unnamed House #84', 1, 52, 530000, 530000, 1, 1, 80, 0, 0),
(85, 0, 0, 0, 0, 0, 'Unnamed House #85', 2, 13, 140000, 140000, 1, 1, 24, 0, 0),
(86, 0, 0, 0, 0, 0, 'Unnamed House #86', 2, 13, 140000, 140000, 1, 1, 25, 0, 0),
(87, 0, 0, 0, 0, 0, 'Unnamed House #87', 2, 25, 260000, 260000, 1, 1, 39, 0, 0),
(88, 0, 0, 0, 0, 0, 'Unnamed House #88', 2, 10, 110000, 110000, 1, 1, 20, 0, 0),
(89, 0, 0, 0, 0, 0, 'Unnamed House #89', 2, 10, 110000, 110000, 1, 1, 20, 0, 0),
(90, 0, 0, 0, 0, 0, 'Unnamed House #90', 2, 10, 110000, 110000, 1, 1, 21, 0, 0),
(91, 0, 0, 0, 0, 0, 'Unnamed House #91', 2, 10, 110000, 110000, 1, 1, 21, 0, 0),
(92, 0, 0, 0, 0, 0, 'Unnamed House #92', 2, 16, 170000, 170000, 2, 1, 28, 0, 0),
(94, 0, 0, 0, 0, 0, 'Unnamed House #94', 2, 22, 230000, 230000, 1, 1, 35, 0, 0),
(95, 0, 0, 0, 0, 0, 'Unnamed House #95', 2, 22, 230000, 230000, 1, 1, 35, 0, 0),
(96, 0, 0, 0, 0, 0, 'Unnamed House #96', 2, 22, 230000, 230000, 1, 1, 35, 0, 0),
(97, 0, 0, 0, 0, 0, 'Unnamed House #97', 2, 22, 230000, 230000, 1, 1, 35, 0, 0),
(98, 0, 0, 0, 0, 0, 'Unnamed House #98', 2, 22, 230000, 230000, 1, 1, 35, 0, 0),
(99, 0, 0, 0, 0, 0, 'Unnamed House #99', 2, 14, 150000, 150000, 1, 1, 25, 0, 0),
(100, 0, 0, 0, 0, 0, 'Unnamed House #100', 2, 14, 150000, 150000, 1, 1, 25, 0, 0),
(101, 0, 0, 0, 0, 0, 'Unnamed House #101', 2, 14, 150000, 150000, 1, 1, 25, 0, 0),
(102, 0, 0, 0, 0, 0, 'Unnamed House #102', 2, 14, 150000, 150000, 1, 1, 25, 0, 0),
(103, 0, 0, 0, 0, 0, 'Unnamed House #103', 2, 14, 150000, 150000, 1, 1, 25, 0, 0),
(104, 0, 0, 0, 0, 0, 'Unnamed House #104', 1, 18, 190000, 190000, 1, 1, 31, 0, 0),
(105, 0, 0, 0, 0, 0, 'Unnamed House #105', 3, 24, 260000, 260000, 1, 2, 40, 0, 0),
(106, 0, 0, 0, 0, 0, 'Unnamed House #106', 3, 7, 80000, 80000, 1, 1, 17, 0, 0),
(107, 0, 0, 0, 0, 0, 'Unnamed House #107', 3, 7, 80000, 80000, 1, 1, 17, 0, 0),
(108, 0, 0, 0, 0, 0, 'Unnamed House #108', 3, 7, 80000, 80000, 1, 1, 17, 0, 0),
(109, 0, 0, 0, 0, 0, 'Unnamed House #109', 3, 23, 240000, 240000, 1, 1, 37, 0, 0),
(110, 0, 0, 0, 0, 0, 'Unnamed House #110', 3, 23, 240000, 240000, 1, 1, 37, 0, 0),
(111, 0, 0, 0, 0, 0, 'Unnamed House #111', 3, 23, 240000, 240000, 1, 1, 37, 0, 0),
(112, 0, 0, 0, 0, 0, 'Unnamed House #112', 3, 77, 790000, 790000, 1, 2, 114, 0, 0),
(113, 0, 0, 0, 0, 0, 'Unnamed House #113', 3, 77, 790000, 790000, 1, 2, 114, 0, 0),
(114, 0, 0, 0, 0, 0, 'Unnamed House #114', 3, 77, 790000, 790000, 1, 2, 114, 0, 0),
(115, 0, 0, 0, 0, 0, 'Unnamed House #115', 3, 59, 610000, 610000, 1, 2, 81, 0, 0),
(116, 0, 0, 0, 0, 0, 'Unnamed House #116', 3, 159, 1620000, 1620000, 2, 3, 210, 0, 0),
(117, 0, 0, 0, 0, 0, 'Unnamed House #117', 3, 67, 690000, 690000, 1, 2, 90, 0, 0),
(118, 0, 0, 0, 0, 0, 'Unnamed House #118', 3, 33, 340000, 340000, 1, 1, 49, 0, 0),
(119, 0, 0, 0, 0, 0, 'Unnamed House #119', 3, 33, 340000, 340000, 1, 1, 49, 0, 0),
(120, 0, 0, 0, 0, 0, 'Unnamed House #120', 3, 68, 700000, 700000, 1, 2, 90, 0, 0),
(121, 0, 0, 0, 0, 0, 'Unnamed House #121', 3, 38, 390000, 390000, 1, 1, 54, 0, 0),
(122, 0, 0, 0, 0, 0, 'Unnamed House #122', 4, 66, 680000, 680000, 2, 2, 102, 0, 0),
(123, 0, 0, 0, 0, 0, 'Unnamed House #123', 4, 66, 680000, 680000, 2, 2, 102, 0, 0),
(124, 0, 0, 0, 0, 0, 'Unnamed House #124', 4, 66, 680000, 680000, 2, 2, 102, 0, 0),
(126, 0, 0, 0, 0, 0, 'Unnamed House #126', 7, 57, 590000, 590000, 2, 2, 91, 0, 0),
(127, 0, 0, 0, 0, 0, 'Unnamed House #127', 7, 57, 590000, 590000, 2, 2, 91, 0, 0),
(128, 0, 0, 0, 0, 0, 'Unnamed House #128', 7, 57, 590000, 590000, 1, 2, 90, 0, 0),
(129, 0, 0, 0, 0, 0, 'Unnamed House #129', 7, 57, 590000, 590000, 0, 2, 89, 0, 0),
(130, 0, 0, 0, 0, 0, 'Unnamed House #130', 7, 30, 310000, 310000, 1, 1, 45, 0, 0),
(131, 0, 0, 0, 0, 0, 'Unnamed House #131', 7, 30, 310000, 310000, 1, 1, 46, 0, 0),
(132, 0, 0, 0, 0, 0, 'Unnamed House #132', 7, 30, 310000, 310000, 1, 1, 45, 0, 0),
(133, 0, 0, 0, 0, 0, 'Unnamed House #133', 7, 30, 310000, 310000, 1, 1, 46, 0, 0),
(134, 0, 0, 0, 0, 0, 'Unnamed House #134', 7, 30, 310000, 310000, 1, 1, 45, 0, 0),
(135, 0, 0, 0, 0, 0, 'Unnamed House #135', 7, 30, 310000, 310000, 1, 1, 46, 0, 0),
(136, 0, 0, 0, 0, 0, 'Unnamed House #136', 7, 30, 310000, 310000, 1, 1, 45, 0, 0),
(137, 0, 0, 0, 0, 0, 'Unnamed House #137', 7, 30, 310000, 310000, 1, 1, 46, 0, 0),
(138, 0, 0, 0, 0, 0, 'Unnamed House #138', 7, 8, 90000, 90000, 1, 1, 18, 0, 0),
(139, 0, 0, 0, 0, 0, 'Unnamed House #139', 7, 8, 90000, 90000, 1, 1, 18, 0, 0),
(140, 0, 0, 0, 0, 0, 'Unnamed House #140', 7, 8, 90000, 90000, 1, 1, 18, 0, 0),
(141, 0, 0, 0, 0, 0, 'Unnamed House #141', 7, 8, 90000, 90000, 1, 1, 19, 0, 0),
(142, 0, 0, 0, 0, 0, 'Unnamed House #142', 7, 8, 90000, 90000, 1, 1, 19, 0, 0),
(143, 0, 0, 0, 0, 0, 'Unnamed House #143', 7, 8, 90000, 90000, 1, 1, 19, 0, 0),
(144, 0, 0, 0, 0, 0, 'Unnamed House #144', 7, 67, 690000, 690000, 1, 2, 105, 0, 0),
(145, 0, 0, 0, 0, 0, 'Unnamed House #145', 7, 8, 80000, 80000, 1, 0, 15, 0, 0),
(146, 0, 0, 0, 0, 0, 'Unnamed House #146', 7, 8, 80000, 80000, 1, 0, 15, 0, 0),
(147, 0, 0, 0, 0, 0, 'Unnamed House #147', 7, 8, 80000, 80000, 1, 0, 15, 0, 0),
(148, 0, 0, 0, 0, 0, 'Unnamed House #148', 8, 23, 240000, 240000, 1, 1, 36, 0, 0),
(149, 0, 0, 0, 0, 0, 'Unnamed House #149', 8, 23, 240000, 240000, 1, 1, 36, 0, 0),
(150, 0, 0, 0, 0, 0, 'Unnamed House #150', 8, 32, 330000, 330000, 2, 1, 55, 0, 0),
(151, 0, 0, 0, 0, 0, 'Unnamed House #151', 8, 32, 330000, 330000, 2, 1, 55, 0, 0),
(152, 0, 0, 0, 0, 0, 'Unnamed House #152', 8, 32, 330000, 330000, 2, 1, 55, 0, 0),
(153, 0, 0, 0, 0, 0, 'Unnamed House #153', 8, 26, 270000, 270000, 1, 1, 41, 0, 0),
(154, 0, 0, 0, 0, 0, 'Unnamed House #154', 8, 26, 270000, 270000, 1, 1, 41, 0, 0),
(155, 0, 0, 0, 0, 0, 'Unnamed House #155', 8, 26, 270000, 270000, 1, 1, 41, 0, 0),
(156, 0, 0, 0, 0, 0, 'Unnamed House #156', 8, 18, 190000, 190000, 1, 1, 30, 0, 0),
(157, 0, 0, 0, 0, 0, 'Unnamed House #157', 8, 13, 140000, 140000, 1, 1, 25, 0, 0),
(158, 0, 0, 0, 0, 0, 'Unnamed House #158', 8, 13, 140000, 140000, 1, 1, 25, 0, 0),
(159, 0, 0, 0, 0, 0, 'Unnamed House #159', 8, 13, 140000, 140000, 1, 1, 25, 0, 0),
(160, 0, 0, 0, 0, 0, 'Unnamed House #160', 8, 18, 190000, 190000, 1, 1, 30, 0, 0),
(161, 0, 0, 0, 0, 0, 'Unnamed House #161', 8, 18, 190000, 190000, 1, 1, 30, 0, 0),
(165, 0, 0, 0, 0, 0, 'Unnamed House #165', 1, 55, 560000, 560000, 1, 1, 72, 0, 0),
(168, 0, 0, 0, 0, 0, 'Unnamed House #168', 1, 47, 480000, 480000, 1, 1, 74, 0, 0),
(169, 0, 0, 0, 0, 0, 'Unnamed House #169', 1, 47, 480000, 480000, 1, 1, 67, 0, 0),
(170, 0, 0, 0, 0, 0, 'Unnamed House #170', 1, 56, 560000, 560000, 1, 0, 59, 0, 0),
(171, 0, 0, 0, 0, 0, 'Unnamed House #171', 1, 59, 590000, 590000, 1, 0, 61, 0, 0),
(174, 0, 0, 0, 0, 0, 'Unnamed House #174', 1, 59, 590000, 590000, 1, 0, 75, 0, 0),
(175, 0, 0, 0, 0, 0, 'Unnamed House #175', 1, 57, 570000, 570000, 1, 0, 84, 0, 0),
(176, 0, 0, 0, 0, 0, 'Unnamed House #176', 1, 68, 680000, 680000, 1, 0, 71, 0, 0),
(177, 0, 0, 0, 0, 0, 'Unnamed House #177', 1, 68, 680000, 680000, 1, 0, 71, 0, 0),
(178, 0, 0, 0, 0, 0, 'Unnamed House #178', 1, 48, 480000, 480000, 1, 0, 51, 0, 0),
(180, 0, 0, 0, 0, 0, 'Unnamed House #180', 1, 52, 520000, 520000, 2, 0, 59, 0, 0),
(181, 0, 0, 0, 0, 0, 'Unnamed House #181', 1, 48, 480000, 480000, 1, 0, 51, 0, 0),
(182, 0, 0, 0, 0, 0, 'Unnamed House #182', 1, 38, 380000, 380000, 1, 0, 41, 0, 0),
(183, 0, 0, 0, 0, 0, 'Unnamed House #183', 1, 38, 380000, 380000, 1, 0, 41, 0, 0),
(184, 0, 0, 0, 0, 0, 'Unnamed House #184', 1, 40, 400000, 400000, 1, 0, 42, 0, 0),
(185, 0, 0, 0, 0, 0, 'Unnamed House #185', 1, 40, 400000, 400000, 1, 0, 43, 0, 0),
(186, 0, 0, 0, 0, 0, 'Unnamed House #186', 1, 137, 1370000, 1370000, 2, 0, 145, 0, 0),
(187, 0, 0, 0, 0, 0, 'Unnamed House #187', 1, 57, 570000, 570000, 1, 0, 61, 0, 0),
(188, 0, 0, 0, 0, 0, 'Unnamed House #188', 1, 59, 590000, 590000, 1, 0, 75, 0, 0),
(189, 0, 0, 0, 0, 0, 'Unnamed House #189', 1, 57, 570000, 570000, 1, 0, 61, 0, 0),
(191, 0, 0, 0, 0, 0, 'Unnamed House #191', 1, 57, 570000, 570000, 1, 0, 60, 0, 0),
(192, 0, 0, 0, 0, 0, 'Unnamed House #192', 1, 59, 590000, 590000, 1, 0, 63, 0, 0),
(194, 0, 0, 0, 0, 0, 'Unnamed House #194', 1, 57, 570000, 570000, 1, 0, 62, 0, 0),
(195, 0, 0, 0, 0, 0, 'Unnamed House #195', 1, 58, 580000, 580000, 1, 0, 62, 0, 0),
(196, 0, 0, 0, 0, 0, 'Unnamed House #196', 1, 58, 580000, 580000, 1, 0, 61, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE IF NOT EXISTS `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE IF NOT EXISTS `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE IF NOT EXISTS `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40010 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lottery`
--

CREATE TABLE IF NOT EXISTS `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1765 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `text` tinytext,
  `time` int(11) DEFAULT NULL,
  `delete_from` tinyint(1) DEFAULT NULL,
  `delete_to` tinyint(1) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT '',
  `body` text,
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsticker`
--

CREATE TABLE IF NOT EXISTS `newsticker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '250',
  `manamax` int(11) NOT NULL DEFAULT '250',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `marrystatus` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  `nick_verify` int(11) NOT NULL DEFAULT '0',
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `worldtransfer` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `show_outfit` tinyint(4) NOT NULL DEFAULT '1',
  `show_eq` tinyint(4) NOT NULL DEFAULT '1',
  `show_bars` tinyint(4) NOT NULL DEFAULT '1',
  `show_skills` tinyint(4) NOT NULL DEFAULT '1',
  `show_quests` tinyint(4) NOT NULL DEFAULT '1',
  `exphist_lastexp` bigint(255) NOT NULL DEFAULT '0',
  `exphist1` bigint(255) NOT NULL DEFAULT '0',
  `exphist2` bigint(255) NOT NULL DEFAULT '0',
  `exphist3` bigint(255) NOT NULL DEFAULT '0',
  `exphist4` bigint(255) NOT NULL DEFAULT '0',
  `exphist5` bigint(255) NOT NULL DEFAULT '0',
  `exphist6` bigint(255) NOT NULL DEFAULT '0',
  `exphist7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimetoday` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime1` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime2` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime3` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime4` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime5` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime6` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimeall` bigint(255) NOT NULL DEFAULT '0',
  `ip` varchar(17) NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `broadcasting` tinyint(4) NOT NULL DEFAULT '0',
  `viewers` int(1) DEFAULT '0',
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  `sbw_points` bigint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5426 ;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `pvp_blessing`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `marrystatus`, `promotion`, `deleted`, `description`, `created`, `nick_verify`, `old_name`, `hide_char`, `worldtransfer`, `comment`, `show_outfit`, `show_eq`, `show_bars`, `show_skills`, `show_quests`, `exphist_lastexp`, `exphist1`, `exphist2`, `exphist3`, `exphist4`, `exphist5`, `exphist6`, `exphist7`, `onlinetimetoday`, `onlinetime1`, `onlinetime2`, `onlinetime3`, `onlinetime4`, `onlinetime5`, `onlinetime6`, `onlinetime7`, `onlinetimeall`, `ip`, `offlinetraining_time`, `offlinetraining_skill`, `broadcasting`, `viewers`, `cast`, `castViewers`, `castDescription`, `sbw_points`) VALUES
(1, 'Account Manager', 0, 1, 2401, 1, 1, 50000, 50000, 0, 0, 0, 0, 0, 128, 0, 0, 50000, 50000, 0, 200, 1, 99, 188, 7, '', 50000, 1, 1560239788, 16777343, 0, 0, 0, 0, '', 1329049181, 31, 0, 0, 151200000, 0, 130, 100, 100, 100, 100, 0, 0, 0, 0, 0, 1, '', 1328921448, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 4200, 4200, 0, 0, 0, 0, 0, 0, 0, 3180, 0, 0, 0, 0, 0, 0, 3180, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(3, 'Goku Sample', 0, 1, 2401, 1, 1, 250, 250, 0, 68, 76, 78, 39, 2, 0, 0, 250, 250, 0, 100, 1, 655, 398, 7, '', 400, 1, 1576951251, 3038071729, 1, 0, 0, 0, '', 1576951253, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(4, 'Vegeta Sample', 0, 1, 2401, 1, 17, 250, 250, 0, 68, 76, 78, 39, 19, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559586, 1677764800, 1, 4, 0, 0, '', 1422559693, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(5, 'Piccolo Sample', 0, 1, 2401, 1, 32, 250, 250, 0, 68, 76, 78, 39, 33, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559526, 1677764800, 1, 4, 0, 0, '', 1422559544, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(6, 'C17 Sample', 0, 1, 2401, 1, 45, 250, 250, 0, 68, 76, 78, 39, 46, 0, 0, 250, 250, 0, 100, 1, 102, 186, 7, '', 400, 1, 1577044266, 3038071729, 1, 0, 0, 0, '', 1577044573, 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(7, 'Gohan Sample', 0, 1, 2401, 1, 57, 250, 250, 0, 68, 76, 78, 39, 55, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559457, 1677764800, 1, 4, 0, 0, '', 1422559479, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(8, 'Trunks Sample', 0, 1, 2401, 1, 71, 250, 250, 0, 68, 76, 78, 39, 69, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559544, 1677764800, 1, 4, 0, 0, '', 1422559565, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(9, 'Cell Sample', 0, 1, 2401, 1, 83, 250, 250, 0, 68, 76, 78, 39, 81, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1576951237, 3038071729, 1, 0, 0, 0, '', 1576951238, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(10, 'Freeza Sample', 0, 1, 2401, 1, 95, 250, 250, 0, 68, 76, 78, 39, 88, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559408, 1677764800, 1, 4, 0, 0, '', 1422559457, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(11, 'Majin Boo Sample', 0, 1, 2401, 1, 111, 250, 250, 0, 68, 76, 78, 39, 98, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559507, 1677764800, 1, 4, 0, 0, '', 1422559526, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(12, 'Brolly Sample', 0, 1, 2401, 1, 127, 250, 250, 0, 68, 76, 78, 39, 108, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1576951232, 3038071729, 1, 0, 0, 0, '', 1576951232, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(13, 'C18 Sample', 0, 1, 2401, 1, 140, 250, 250, 0, 68, 76, 78, 39, 46, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 0, 1422559385, 1677764800, 1, 4, 0, 0, '', 1422559407, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(14, 'Uub Sample', 0, 1, 2401, 1, 152, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559565, 1677764800, 1, 4, 0, 0, '', 1422559586, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(15, 'Goten Sample', 0, 1, 2401, 1, 164, 250, 250, 0, 68, 76, 78, 39, 135, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1576951249, 3038071729, 1, 0, 0, 0, '', 1576951249, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(16, 'Chibi Trunks Sample', 0, 1, 2401, 1, 178, 250, 250, 0, 68, 76, 78, 39, 149, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1576951241, 3038071729, 1, 0, 0, 0, '', 1576951241, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(17, 'Cooler Sample', 0, 1, 2401, 1, 192, 250, 250, 0, 68, 76, 78, 39, 153, 0, 0, 250, 250, 0, 100, 1, 655, 398, 7, '', 400, 1, 1576951243, 3038071729, 1, 0, 0, 0, '', 1576951244, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(18, 'Dende Sample', 0, 1, 2401, 1, 206, 250, 250, 0, 68, 76, 78, 39, 164, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1576951245, 3038071729, 1, 0, 0, 0, '', 1576951245, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(19, 'Tsuful Sample', 0, 1, 2401, 1, 218, 250, 250, 0, 68, 76, 78, 39, 175, 0, 0, 250, 250, 0, 100, 1, 655, 398, 7, '', 400, 1, 1576951254, 3038071729, 1, 0, 0, 0, '', 1576951256, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(21, 'Pan Sample', 0, 1, 2401, 1, 256, 250, 250, 0, 68, 76, 78, 39, 210, 0, 0, 250, 250, 0, 100, 1, 102, 188, 7, '', 400, 0, 1576957193, 3038071729, 1, 0, 0, 0, '', 1576957398, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(22, 'Kaio Sample', 0, 1, 2401, 1, 268, 250, 250, 0, 68, 76, 78, 39, 219, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560203, 1677764800, 1, 4, 0, 0, '', 1422560222, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(23, 'Videl Sample', 0, 1, 2401, 1, 280, 250, 250, 0, 68, 76, 78, 39, 227, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 0, 1422560359, 1677764800, 1, 4, 0, 0, '', 1422560380, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(24, 'Janemba Sample', 0, 1, 2401, 1, 292, 250, 250, 0, 68, 76, 78, 39, 234, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560167, 1677764800, 1, 4, 0, 0, '', 1422560185, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(25, 'Tenshinhan Sample', 0, 1, 2401, 1, 304, 250, 250, 0, 68, 76, 78, 39, 242, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560333, 1677764800, 1, 4, 0, 0, '', 1422560335, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(26, 'Jenk Sample', 0, 1, 2401, 1, 316, 250, 250, 0, 68, 76, 78, 39, 252, 0, 0, 250, 250, 0, 100, 1, 102, 187, 7, '', 400, 1, 1576982918, 3038071729, 1, 0, 0, 0, '', 1576983041, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(29, 'Turles Sample', 0, 1, 2401, 1, 352, 250, 250, 0, 68, 76, 78, 39, 280, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560335, 1677764800, 1, 4, 0, 0, '', 1422560359, 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(31, 'Bardock Sample', 0, 1, 2401, 1, 230, 250, 250, 0, 68, 76, 78, 39, 188, 0, 0, 250, 250, 0, 100, 1, 655, 398, 7, '', 400, 1, 1576951230, 3038071729, 1, 0, 0, 0, '', 1576951231, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(3762, 'Others', 0, 1, 2402, 1, 1, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 1577044720, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(5423, 'Bulma Sample', 0, 1, 2401, 1, 364, 250, 250, 0, 68, 76, 78, 39, 292, 0, 0, 250, 250, 0, 100, 1, 655, 398, 7, '', 400, 1, 1576951230, 3038071729, 1, 0, 0, 0, '', 1576951231, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(5424, 'C16 Sample', 0, 1, 2401, 1, 340, 250, 250, 0, 68, 76, 78, 39, 272, 0, 0, 250, 250, 0, 100, 1, 655, 398, 7, '', 400, 1, 1576951230, 3038071729, 1, 0, 0, 0, '', 1576951231, 0, 0, 0, 151200000, 2, 200, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0),
(5425, 'ADM', 0, 6, 2402, 500, 1, 134980, 134980, 2058474800, 68, 76, 78, 39, 447, 0, 0, 115020, 115020, 0, 100, 1, 99, 188, 7, '', 50300, 1, 1677086264, 16777343, 1, 0, 0, 0, '', 1677086375, 0, 0, 0, 151200000, 2, 70, 100, 100, 100, 10, 0, 0, 0, 0, 0, 0, '', 1577044720, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 43200, -1, 0, 0, 0, 0, '', 0);

--
-- Acionadores `players`
--
DROP TRIGGER IF EXISTS `oncreate_players`;
DELIMITER //
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players`
 FOR EACH ROW BEGIN
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_players`;
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
        UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17428 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(3, 1, 101, 12634, 1, ''),
(3, 3, 102, 12764, 1, ''),
(3, 4, 103, 12664, 1, ''),
(3, 5, 104, 12776, 100, 0x0f64),
(3, 6, 105, 12698, 1, ''),
(3, 7, 106, 12683, 1, ''),
(3, 8, 107, 12697, 1, ''),
(3, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(3, 10, 109, 12775, 100, 0x0f64),
(3, 102, 110, 2667, 100, 0x0f64),
(4, 1, 101, 12634, 1, ''),
(4, 3, 102, 12764, 1, ''),
(4, 4, 103, 12664, 1, ''),
(4, 5, 104, 12776, 100, 0x0f64),
(4, 6, 105, 12698, 1, ''),
(4, 7, 106, 12683, 1, ''),
(4, 8, 107, 12697, 1, ''),
(4, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(4, 10, 109, 12775, 100, 0x0f64),
(4, 102, 110, 2667, 100, 0x0f64),
(5, 1, 101, 12634, 1, ''),
(5, 3, 102, 12764, 1, ''),
(5, 4, 103, 12664, 1, ''),
(5, 5, 104, 2667, 100, 0x0f64),
(5, 6, 105, 12736, 1, ''),
(5, 7, 106, 12683, 1, ''),
(5, 8, 107, 12697, 1, ''),
(5, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(5, 10, 109, 12737, 1, 0x0f01),
(5, 102, 110, 12776, 100, 0x0f64),
(5, 102, 111, 12775, 100, 0x0f64),
(6, 1, 101, 12634, 1, ''),
(6, 3, 102, 12764, 1, ''),
(6, 4, 103, 12664, 1, ''),
(6, 5, 104, 12776, 100, 0x0f64),
(6, 6, 105, 12698, 1, ''),
(6, 7, 106, 12683, 1, ''),
(6, 8, 107, 12697, 1, ''),
(6, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(6, 10, 109, 12775, 100, 0x0f64),
(6, 102, 110, 2667, 100, 0x0f64),
(7, 1, 101, 12634, 1, ''),
(7, 3, 102, 12764, 1, ''),
(7, 4, 103, 12664, 1, ''),
(7, 5, 104, 12776, 100, 0x0f64),
(7, 6, 105, 12698, 1, ''),
(7, 7, 106, 12683, 1, ''),
(7, 8, 107, 12697, 1, ''),
(7, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(7, 10, 109, 12775, 100, 0x0f64),
(7, 102, 110, 2667, 100, 0x0f64),
(8, 1, 101, 12634, 1, ''),
(8, 3, 102, 12764, 1, ''),
(8, 4, 103, 12664, 1, ''),
(8, 5, 104, 12776, 100, 0x0f64),
(8, 6, 105, 12716, 1, ''),
(8, 7, 106, 12683, 1, ''),
(8, 8, 107, 12697, 1, ''),
(8, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(8, 10, 109, 12775, 100, 0x0f64),
(8, 102, 110, 2667, 100, 0x0f64),
(9, 1, 101, 12634, 1, ''),
(9, 3, 102, 12764, 1, ''),
(9, 4, 103, 12664, 1, ''),
(9, 5, 104, 2667, 100, 0x0f64),
(9, 6, 105, 12736, 1, ''),
(9, 7, 106, 12683, 1, ''),
(9, 8, 107, 12697, 1, ''),
(9, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(9, 10, 109, 12737, 1, 0x0f01),
(9, 102, 110, 12776, 100, 0x0f64),
(9, 102, 111, 12775, 100, 0x0f64),
(10, 1, 101, 12634, 1, ''),
(10, 3, 102, 12764, 1, ''),
(10, 4, 103, 12664, 1, ''),
(10, 5, 104, 12776, 100, 0x0f64),
(10, 6, 105, 12698, 1, ''),
(10, 7, 106, 12683, 1, ''),
(10, 8, 107, 12697, 1, ''),
(10, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(10, 10, 109, 12775, 100, 0x0f64),
(10, 102, 110, 2667, 100, 0x0f64),
(11, 1, 101, 12634, 1, ''),
(11, 3, 102, 12764, 1, ''),
(11, 4, 103, 12664, 1, ''),
(11, 5, 104, 12776, 100, 0x0f64),
(11, 6, 105, 12698, 1, ''),
(11, 7, 106, 12683, 1, ''),
(11, 8, 107, 12697, 1, ''),
(11, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(11, 10, 109, 12775, 100, 0x0f64),
(11, 102, 110, 2667, 100, 0x0f64),
(12, 1, 101, 12634, 1, ''),
(12, 3, 102, 12764, 1, ''),
(12, 4, 103, 12664, 1, ''),
(12, 5, 104, 12776, 100, 0x0f64),
(12, 6, 105, 12698, 1, ''),
(12, 7, 106, 12683, 1, ''),
(12, 8, 107, 12697, 1, ''),
(12, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(12, 10, 109, 12775, 100, 0x0f64),
(12, 102, 110, 2667, 100, 0x0f64),
(13, 1, 101, 12634, 1, ''),
(13, 3, 102, 12764, 1, ''),
(13, 4, 103, 12664, 1, ''),
(13, 5, 104, 12776, 100, 0x0f64),
(13, 6, 105, 12698, 1, ''),
(13, 7, 106, 12683, 1, ''),
(13, 8, 107, 12697, 1, ''),
(13, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(13, 10, 109, 12775, 100, 0x0f64),
(13, 102, 110, 2667, 100, 0x0f64),
(14, 1, 101, 12634, 1, ''),
(14, 3, 102, 12764, 1, ''),
(14, 4, 103, 12664, 1, ''),
(14, 5, 104, 12776, 100, 0x0f64),
(14, 6, 105, 12698, 1, ''),
(14, 7, 106, 12683, 1, ''),
(14, 8, 107, 12697, 1, ''),
(14, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(14, 10, 109, 12775, 100, 0x0f64),
(14, 102, 110, 2667, 100, 0x0f64),
(15, 1, 101, 12634, 1, ''),
(15, 3, 102, 12764, 1, ''),
(15, 4, 103, 12664, 1, ''),
(15, 5, 104, 12776, 100, 0x0f64),
(15, 6, 105, 12698, 1, ''),
(15, 7, 106, 12683, 1, ''),
(15, 8, 107, 12697, 1, ''),
(15, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(15, 10, 109, 12775, 100, 0x0f64),
(15, 102, 110, 2667, 100, 0x0f64),
(16, 1, 101, 12634, 1, ''),
(16, 3, 102, 12764, 1, ''),
(16, 4, 103, 12664, 1, ''),
(16, 5, 104, 12776, 100, 0x0f64),
(16, 6, 105, 12716, 1, ''),
(16, 7, 106, 12683, 1, ''),
(16, 8, 107, 12697, 1, ''),
(16, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(16, 10, 109, 12775, 100, 0x0f64),
(16, 102, 110, 2667, 100, 0x0f64),
(17, 1, 101, 12634, 1, ''),
(17, 3, 102, 12764, 1, ''),
(17, 4, 103, 12664, 1, ''),
(17, 5, 104, 12776, 100, 0x0f64),
(17, 6, 105, 12698, 1, ''),
(17, 7, 106, 12683, 1, ''),
(17, 8, 107, 12697, 1, ''),
(17, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(17, 10, 109, 12775, 100, 0x0f64),
(17, 102, 110, 2667, 100, 0x0f64),
(18, 1, 101, 12634, 1, ''),
(18, 3, 102, 12764, 1, ''),
(18, 4, 103, 12664, 1, ''),
(18, 5, 104, 2667, 100, 0x0f64),
(18, 6, 105, 12736, 1, ''),
(18, 7, 106, 12683, 1, ''),
(18, 8, 107, 12697, 1, ''),
(18, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(18, 10, 109, 12737, 1, 0x0f01),
(18, 102, 110, 12776, 100, 0x0f64),
(18, 102, 111, 12775, 100, 0x0f64),
(19, 1, 101, 12634, 1, ''),
(19, 3, 102, 12764, 1, ''),
(19, 4, 103, 12664, 1, ''),
(19, 5, 104, 12776, 100, 0x0f64),
(19, 6, 105, 12698, 1, ''),
(19, 7, 106, 12683, 1, ''),
(19, 8, 107, 12697, 1, ''),
(19, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(19, 10, 109, 12775, 100, 0x0f64),
(19, 102, 110, 2667, 100, 0x0f64),
(21, 1, 101, 12634, 1, ''),
(21, 3, 102, 12764, 1, ''),
(21, 4, 103, 12664, 1, ''),
(21, 5, 104, 12776, 100, 0x0f64),
(21, 6, 105, 12698, 1, ''),
(21, 7, 106, 12683, 1, ''),
(21, 8, 107, 12697, 1, ''),
(21, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(21, 10, 109, 12775, 100, 0x0f64),
(21, 102, 110, 2160, 100, 0x0f64),
(21, 102, 111, 12779, 10, 0x0f0a),
(21, 102, 112, 2667, 100, 0x0f64),
(22, 1, 101, 12634, 1, ''),
(22, 3, 102, 12764, 1, ''),
(22, 4, 103, 12664, 1, ''),
(22, 5, 104, 2667, 100, 0x0f64),
(22, 6, 105, 12736, 1, ''),
(22, 7, 106, 12683, 1, ''),
(22, 8, 107, 12697, 1, ''),
(22, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(22, 10, 109, 12737, 1, 0x0f01),
(22, 102, 110, 12776, 100, 0x0f64),
(22, 102, 111, 12775, 100, 0x0f64),
(23, 1, 101, 12634, 1, ''),
(23, 3, 102, 12764, 1, ''),
(23, 4, 103, 12664, 1, ''),
(23, 5, 104, 12776, 100, 0x0f64),
(23, 6, 105, 12698, 1, ''),
(23, 7, 106, 12683, 1, ''),
(23, 8, 107, 12697, 1, ''),
(23, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(23, 10, 109, 12775, 100, 0x0f64),
(23, 102, 110, 2667, 100, 0x0f64),
(24, 1, 101, 12634, 1, ''),
(24, 3, 102, 12764, 1, ''),
(24, 4, 103, 12664, 1, ''),
(24, 5, 104, 12776, 100, 0x0f64),
(24, 6, 105, 12716, 1, ''),
(24, 7, 106, 12683, 1, ''),
(24, 8, 107, 12697, 1, ''),
(24, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(24, 10, 109, 12775, 100, 0x0f64),
(24, 102, 110, 2667, 100, 0x0f64),
(25, 1, 101, 12634, 1, ''),
(25, 3, 102, 12764, 1, ''),
(25, 4, 103, 12664, 1, ''),
(25, 5, 104, 12776, 100, 0x0f64),
(25, 6, 105, 12698, 1, ''),
(25, 7, 106, 12683, 1, ''),
(25, 8, 107, 12697, 1, ''),
(25, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(25, 10, 109, 12775, 100, 0x0f64),
(25, 102, 110, 2667, 100, 0x0f64),
(26, 1, 101, 12634, 1, ''),
(26, 3, 102, 12764, 1, ''),
(26, 4, 103, 12664, 1, ''),
(26, 5, 104, 12776, 100, 0x0f64),
(26, 6, 105, 12698, 1, ''),
(26, 7, 106, 12683, 1, ''),
(26, 8, 107, 12697, 1, ''),
(26, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(26, 10, 109, 12775, 100, 0x0f64),
(26, 102, 110, 2667, 100, 0x0f64),
(29, 1, 101, 12634, 1, ''),
(29, 3, 102, 12764, 1, ''),
(29, 4, 103, 12664, 1, ''),
(29, 5, 104, 12776, 100, 0x0f64),
(29, 6, 105, 12698, 1, ''),
(29, 7, 106, 12683, 1, ''),
(29, 8, 107, 12697, 1, ''),
(29, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(29, 10, 109, 12775, 100, 0x0f64),
(29, 102, 110, 2667, 100, 0x0f64),
(31, 1, 101, 12634, 1, ''),
(31, 3, 102, 12764, 1, ''),
(31, 4, 103, 12664, 1, ''),
(31, 5, 104, 12776, 100, 0x0f64),
(31, 6, 105, 12698, 1, ''),
(31, 7, 106, 12683, 1, ''),
(31, 8, 107, 12697, 1, ''),
(31, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(31, 10, 109, 12775, 100, 0x0f64),
(31, 102, 110, 2667, 100, 0x0f64),
(3762, 1, 101, 12634, 1, ''),
(3762, 3, 102, 12764, 1, ''),
(3762, 4, 103, 12664, 1, ''),
(3762, 5, 104, 12776, 100, 0x0f64),
(3762, 6, 105, 12698, 1, ''),
(3762, 7, 106, 12683, 1, ''),
(3762, 8, 107, 12697, 1, ''),
(3762, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(3762, 10, 109, 12775, 100, 0x0f64),
(3762, 102, 110, 2667, 100, 0x0f64);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE IF NOT EXISTS `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(7, 0, 10, 0),
(7, 1, 10, 0),
(7, 2, 10, 0),
(7, 3, 10, 0),
(7, 4, 10, 0),
(7, 5, 10, 0),
(7, 6, 10, 0),
(8, 0, 10, 0),
(8, 1, 10, 0),
(8, 2, 10, 0),
(8, 3, 10, 0),
(8, 4, 10, 0),
(8, 5, 10, 0),
(8, 6, 10, 0),
(9, 0, 10, 0),
(9, 1, 10, 0),
(9, 2, 10, 0),
(9, 3, 10, 0),
(9, 4, 10, 0),
(9, 5, 10, 0),
(9, 6, 10, 0),
(10, 0, 10, 0),
(10, 1, 10, 0),
(10, 2, 10, 0),
(10, 3, 10, 0),
(10, 4, 10, 0),
(10, 5, 10, 0),
(10, 6, 10, 0),
(11, 0, 10, 0),
(11, 1, 10, 0),
(11, 2, 10, 0),
(11, 3, 10, 0),
(11, 4, 10, 0),
(11, 5, 10, 0),
(11, 6, 10, 0),
(12, 0, 10, 0),
(12, 1, 10, 0),
(12, 2, 10, 0),
(12, 3, 10, 0),
(12, 4, 10, 0),
(12, 5, 10, 0),
(12, 6, 10, 0),
(13, 0, 10, 0),
(13, 1, 10, 0),
(13, 2, 10, 0),
(13, 3, 10, 0),
(13, 4, 10, 0),
(13, 5, 10, 0),
(13, 6, 10, 0),
(14, 0, 10, 0),
(14, 1, 10, 0),
(14, 2, 10, 0),
(14, 3, 10, 0),
(14, 4, 10, 0),
(14, 5, 10, 0),
(14, 6, 10, 0),
(15, 0, 10, 0),
(15, 1, 10, 0),
(15, 2, 10, 0),
(15, 3, 10, 0),
(15, 4, 10, 0),
(15, 5, 10, 0),
(15, 6, 10, 0),
(16, 0, 10, 0),
(16, 1, 10, 0),
(16, 2, 10, 0),
(16, 3, 10, 0),
(16, 4, 10, 0),
(16, 5, 10, 0),
(16, 6, 10, 0),
(17, 0, 10, 0),
(17, 1, 10, 0),
(17, 2, 10, 0),
(17, 3, 10, 0),
(17, 4, 10, 0),
(17, 5, 10, 0),
(17, 6, 10, 0),
(18, 0, 10, 0),
(18, 1, 10, 0),
(18, 2, 10, 0),
(18, 3, 10, 0),
(18, 4, 10, 0),
(18, 5, 10, 0),
(18, 6, 10, 0),
(19, 0, 10, 0),
(19, 1, 10, 0),
(19, 2, 10, 0),
(19, 3, 10, 0),
(19, 4, 10, 0),
(19, 5, 10, 0),
(19, 6, 10, 0),
(21, 0, 10, 0),
(21, 1, 10, 0),
(21, 2, 10, 0),
(21, 3, 10, 0),
(21, 4, 10, 0),
(21, 5, 10, 0),
(21, 6, 10, 0),
(22, 0, 10, 0),
(22, 1, 10, 0),
(22, 2, 10, 0),
(22, 3, 10, 0),
(22, 4, 10, 0),
(22, 5, 10, 0),
(22, 6, 10, 0),
(23, 0, 10, 0),
(23, 1, 10, 0),
(23, 2, 10, 0),
(23, 3, 10, 0),
(23, 4, 10, 0),
(23, 5, 10, 0),
(23, 6, 10, 0),
(24, 0, 10, 0),
(24, 1, 10, 0),
(24, 2, 10, 0),
(24, 3, 10, 0),
(24, 4, 10, 0),
(24, 5, 10, 0),
(24, 6, 10, 0),
(25, 0, 10, 0),
(25, 1, 10, 0),
(25, 2, 10, 0),
(25, 3, 10, 0),
(25, 4, 10, 0),
(25, 5, 10, 0),
(25, 6, 10, 0),
(26, 0, 10, 0),
(26, 1, 10, 0),
(26, 2, 10, 0),
(26, 3, 10, 0),
(26, 4, 10, 0),
(26, 5, 10, 0),
(26, 6, 10, 0),
(29, 0, 10, 0),
(29, 1, 10, 0),
(29, 2, 10, 0),
(29, 3, 10, 0),
(29, 4, 10, 0),
(29, 5, 10, 0),
(29, 6, 10, 0),
(31, 0, 10, 0),
(31, 1, 10, 0),
(31, 2, 10, 0),
(31, 3, 10, 0),
(31, 4, 10, 0),
(31, 5, 10, 0),
(31, 6, 10, 0),
(3762, 0, 10, 0),
(3762, 1, 10, 0),
(3762, 2, 10, 0),
(3762, 3, 10, 0),
(3762, 4, 10, 0),
(3762, 5, 10, 0),
(3762, 6, 10, 0),
(5423, 0, 10, 0),
(5423, 1, 10, 0),
(5423, 2, 10, 0),
(5423, 3, 10, 0),
(5423, 4, 10, 0),
(5423, 5, 10, 0),
(5423, 6, 10, 0),
(5424, 0, 10, 0),
(5424, 1, 10, 0),
(5424, 2, 10, 0),
(5424, 3, 10, 0),
(5424, 4, 10, 0),
(5424, 5, 10, 0),
(5424, 6, 10, 0),
(5425, 0, 10, 0),
(5425, 1, 10, 0),
(5425, 2, 10, 0),
(5425, 3, 10, 0),
(5425, 4, 10, 0),
(5425, 5, 10, 0),
(5425, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_statements`
--

CREATE TABLE IF NOT EXISTS `player_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(3, '3482101', '0'),
(3, '60000', '1'),
(4, '3482101', '0'),
(4, '60000', '1'),
(5, '3482101', '0'),
(5, '60000', '1'),
(6, '3482101', '0'),
(6, '60000', '1'),
(7, '3482101', '0'),
(7, '60000', '1'),
(8, '3482101', '0'),
(8, '60000', '1'),
(9, '3482101', '0'),
(9, '60000', '1'),
(10, '3482101', '0'),
(10, '60000', '1'),
(11, '3482101', '0'),
(11, '60000', '1'),
(12, '3482101', '0'),
(12, '60000', '1'),
(13, '3482101', '0'),
(13, '60000', '1'),
(14, '3482101', '0'),
(14, '60000', '1'),
(15, '3482101', '0'),
(15, '60000', '1'),
(16, '3482101', '0'),
(16, '60000', '1'),
(17, '3482101', '0'),
(17, '60000', '1'),
(18, '3482101', '0'),
(18, '60000', '1'),
(19, '3482101', '0'),
(19, '60000', '1'),
(21, '3482101', '0'),
(21, '60000', '1'),
(21, '60134', '1'),
(21, '60135', '1'),
(22, '3482101', '0'),
(22, '60000', '1'),
(23, '3482101', '0'),
(23, '60000', '1'),
(24, '3482101', '0'),
(24, '60000', '1'),
(25, '3482101', '0'),
(25, '60000', '1'),
(26, '3482101', '0'),
(26, '60000', '1'),
(29, '3482101', '0'),
(29, '60000', '1'),
(31, '3482101', '0'),
(31, '60000', '1'),
(5425, '3482101', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_answer`
--

CREATE TABLE IF NOT EXISTS `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_votes`
--

CREATE TABLE IF NOT EXISTS `poll_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  `poll_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`),
  KEY `account_id` (`account_id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `text` text,
  `time` int(11) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `board_id` (`board_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '36'),
('encryption', '2'),
('vahash_key', '7TEY-6A74-4UEX-8SL3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE IF NOT EXISTS `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(33, 0, 'Welcome'),
(35, 0, 'Bem-vindo ao DBO LOGS, divirta-se!'),
(37, 0, 'Bem-vindo ao DBO LOGS, divirta-se!'),
(39, 0, 'Bem-vindo ao DBO LOGS, divirta-se!'),
(41, 0, 'Bem-vindo ao DBO LOGS, divirta-se!'),
(42, 0, 'Bem-vindo ao DBO Factory, divirta-se!'),
(43, 0, 'Welcome to the DBO Factory!'),
(44, 0, 'Welcome to the DBO TEACH!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE IF NOT EXISTS `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(1, 0, 1422558648),
(2, 0, 1422672448),
(3, 0, 1425164798),
(4, 0, 1425166651),
(5, 0, 1425172857),
(6, 0, 1425181152),
(7, 0, 1425181361),
(8, 0, 1425191883),
(9, 0, 1425225635),
(10, 0, 1425225640),
(11, 0, 1425225645),
(12, 0, 1425225730),
(13, 0, 1425225749),
(14, 0, 1425225754),
(15, 0, 1425225762),
(16, 0, 1425225824),
(17, 0, 1425225837),
(18, 0, 1425225881),
(19, 0, 1425225904),
(20, 0, 1425225929),
(21, 0, 1425225965),
(22, 0, 1425226065),
(23, 0, 1425226084),
(24, 0, 1425226148),
(25, 0, 1425226168),
(26, 0, 1425226180),
(27, 0, 1425226216),
(28, 0, 1425226290),
(29, 0, 1425226389),
(30, 0, 1425226544),
(31, 0, 1425226583),
(32, 0, 1425226621),
(33, 0, 1425226669),
(34, 0, 1425226789),
(35, 0, 1425227040),
(36, 0, 1425227090),
(37, 0, 1425227106),
(38, 0, 1425227170),
(39, 0, 1425227170),
(40, 0, 1425227234),
(41, 0, 1425227302),
(42, 0, 1425227318),
(43, 0, 1425227419),
(44, 0, 1425227442),
(45, 0, 1425227598),
(46, 0, 1425227644),
(47, 0, 1425227662),
(48, 0, 1425228707),
(49, 0, 1425229493),
(50, 0, 1425229502),
(51, 0, 1425229833),
(52, 0, 1425230408),
(53, 0, 1425230454),
(54, 0, 1425230590),
(55, 0, 1425231520),
(56, 0, 1425231556),
(57, 0, 1425231591),
(58, 0, 1425235351),
(59, 0, 1425235826),
(60, 0, 1425235886),
(61, 0, 1425236365),
(62, 0, 1425236419),
(63, 0, 1425236508),
(64, 0, 1425236518),
(65, 0, 1425238241),
(66, 0, 1425238352),
(67, 0, 1425238406),
(68, 0, 1425239298),
(69, 0, 1425239676),
(70, 0, 1425239679),
(71, 0, 1425239936),
(72, 0, 1425240495),
(73, 0, 1425240874),
(74, 0, 1425240908),
(75, 0, 1425240963),
(76, 0, 1425242531),
(77, 0, 1425243222),
(78, 0, 1425243260),
(79, 0, 1425311592),
(80, 0, 1425311857),
(81, 0, 1425311889),
(82, 0, 1425311961),
(83, 0, 1425311963),
(84, 0, 1425313232),
(85, 0, 1425313318),
(86, 0, 1425319227),
(87, 0, 1425319354),
(88, 0, 1425319428),
(89, 0, 1425319612),
(90, 0, 1425319961),
(91, 0, 1425320247),
(92, 0, 1425320267),
(93, 0, 1425335646),
(94, 0, 1425335659),
(95, 0, 1425335716),
(96, 0, 1425344145),
(97, 0, 1425400887),
(98, 0, 1425401681),
(99, 0, 1425411138),
(100, 0, 1425414884),
(101, 0, 1425415002),
(102, 0, 1425415052),
(103, 0, 1425415359),
(104, 0, 1425415683),
(105, 0, 1425415702),
(106, 0, 1425416343),
(107, 0, 1425416368),
(108, 0, 1425416459),
(109, 0, 1425416491),
(110, 0, 1425419147),
(111, 0, 1425420061),
(112, 0, 1425420087),
(113, 0, 1425420154),
(114, 0, 1425673865),
(115, 0, 1425674393),
(116, 0, 1425674397),
(117, 0, 1425676352),
(118, 0, 1425676679),
(119, 0, 1425677964),
(120, 0, 1425678004),
(121, 0, 1425678076),
(122, 0, 1425678127),
(123, 0, 1425678169),
(124, 0, 1425678195),
(125, 0, 1425679263),
(126, 0, 1580332434),
(127, 0, 1580332463),
(128, 0, 1580332677),
(129, 0, 1580387785),
(130, 0, 1580388372),
(131, 0, 1580391599),
(132, 0, 1580391675),
(133, 0, 1580395734),
(134, 0, 1580396079),
(135, 0, 1580398912),
(136, 0, 1580415282),
(137, 0, 1580415655),
(138, 0, 1580415672),
(139, 0, 1580417039),
(140, 0, 1580418154),
(141, 0, 1580418297),
(142, 0, 1580423528),
(143, 0, 1580426052),
(144, 0, 1580675267),
(145, 0, 1580675280),
(146, 0, 1580675624),
(147, 0, 1580675714),
(148, 0, 1581018480),
(149, 0, 1581018930),
(150, 0, 1581018974),
(151, 0, 1581019480),
(152, 0, 1581020097),
(153, 0, 1581091655),
(154, 0, 1581091828),
(155, 0, 1581091924),
(156, 0, 1581096560),
(157, 0, 1581096683),
(158, 0, 1581096688),
(159, 0, 1581097257),
(160, 0, 1581097370),
(161, 0, 1581101956),
(162, 0, 1581102074),
(163, 0, 1581103818),
(164, 0, 1581104799);

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE IF NOT EXISTS `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_donation_history`
--

CREATE TABLE IF NOT EXISTS `shop_donation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(256) NOT NULL,
  `receiver` varchar(256) NOT NULL,
  `buyer` varchar(256) NOT NULL,
  `account` varchar(256) NOT NULL,
  `points` int(11) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_history`
--

CREATE TABLE IF NOT EXISTS `shop_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `session` varchar(256) NOT NULL,
  `player` varchar(256) NOT NULL,
  `date` int(10) NOT NULL,
  `processed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=663 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_offer`
--

CREATE TABLE IF NOT EXISTS `shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL DEFAULT '1',
  `item` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Extraindo dados da tabela `shop_offer`
--

INSERT INTO `shop_offer` (`id`, `points`, `category`, `type`, `item`, `count`, `description`, `name`) VALUES
(23, 20, 1, 1, 0, 60, '60 dias Premmy account.', 'Premmy Account 60 Dias'),
(24, 5, 1, 4, 0, 0, 'Troque o nome de seu personagem.', 'Mudar Nome'),
(76, 20, 3, 5, 13616, 1, 'transforme-se em um Zaiko', 'Vocation Zaiko'),
(77, 20, 3, 5, 13617, 1, 'transforme-se em um Goku Jr', 'Vocation Goku Jr'),
(22, 10, 1, 1, 0, 30, '30 dias Premmy account.', 'Premmy Account 30 Dias'),
(25, 50, 1, 3, 0, 0, 'Remove del. da conta, e zero seus warnings', 'Remover Ban. da Conta'),
(26, 10, 1, 2, 0, 0, 'Remove a skull de seu personagem. white/red', 'Removedor de Skull'),
(27, 20, 2, 5, 12633, 1, 'KI Regeneration +3000/s', 'Cell Helmet'),
(28, 20, 2, 5, 12663, 1, 'Health and KI Regeneration +7500/s', 'Supreme North Armor'),
(29, 20, 2, 5, 12682, 1, 'Health and KI Regeneration +7500/s', 'Supreme North Legs'),
(30, 20, 2, 5, 12696, 1, 'Health and KI Regeneration +5000/s', 'Supreme North Boots'),
(34, 15, 2, 5, 12733, 1, 'Fast Attack', 'Hell Janemba Sword'),
(75, 20, 3, 5, 13615, 1, 'transforme-se em um Tapion', 'Vocation Tapion'),
(35, 15, 2, 5, 12714, 1, 'Fast Attack', 'Glove Of Lies'),
(44, 10, 2, 5, 2349, 1, 'Aaahhh! Muito Melhor!', 'Black Senzu'),
(46, 15, 2, 5, 10220, 1, 'Protect All 10%', 'Leviathan s Amulet'),
(73, 20, 3, 5, 13613, 1, 'transforme-se em um Kyabe', 'Vocation Kyabe'),
(49, 15, 2, 5, 8905, 1, 'Defese 350', 'Mystic Shield'),
(72, 20, 3, 5, 13612, 1, 'transforme-se em um King Vegeta', 'Vocation King Vegeta'),
(60, 20, 5, 5, 8110, 1, '10 Refiners', 'Refiner Max'),
(61, 10, 2, 5, 12759, 1, 'Protect All 5% Usem Bless para nÃ£o perde os items', 'Earring Of Magic'),
(71, 20, 3, 5, 13611, 1, 'transforme-se em um Gattai Zamasu', 'Vocation Gattai Zamasu'),
(69, 20, 3, 5, 13609, 1, 'transforme-se em um Hitto', 'Vocation Hitto'),
(70, 20, 3, 5, 13610, 1, 'transforme-se em um Goku Black', 'Vocation Goku Black'),
(68, 10, 2, 5, 13568, 1, 'Item usado para o ritual do set vip', 'Ritual VIP'),
(78, 20, 3, 5, 13618, 1, 'transforme-se em um Zamasu', 'Vocation Zamasu'),
(79, 20, 3, 5, 13619, 1, 'transforme-se em um Kagome', 'Vocation Kagome'),
(80, 20, 3, 5, 13614, 1, 'transforme-se em um Kame', 'Vocation Kame'),
(81, 20, 3, 5, 13624, 1, 'transforme-se em um Vegetto', 'Vocation Vegetto'),
(82, 20, 3, 5, 13625, 1, 'transforme-se em um Champa', 'Vocation Champa'),
(84, 20, 3, 5, 13628, 1, 'transforme-se em um Kamba', 'Vocation Kamba'),
(85, 15, 2, 5, 13680, 1, 'Distance', 'Supreme North Bow');

-- --------------------------------------------------------

--
-- Estrutura da tabela `snowballwar`
--

CREATE TABLE IF NOT EXISTS `snowballwar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `threads`
--

CREATE TABLE IF NOT EXISTS `threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `sticked` tinyint(1) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `board_id` (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE IF NOT EXISTS `tile_store` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  KEY `house_id` (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `description` tinytext,
  `youtube` varchar(45) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `video_comments`
--

CREATE TABLE IF NOT EXISTS `video_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `text` tinytext,
  PRIMARY KEY (`id`),
  KEY `video` (`video`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `woe`
--

CREATE TABLE IF NOT EXISTS `woe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `zaypay_payment`
--

CREATE TABLE IF NOT EXISTS `zaypay_payment` (
  `payID` bigint(30) NOT NULL,
  `account_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`payID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_bug_tracker`
--

CREATE TABLE IF NOT EXISTS `z_bug_tracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_changelog`
--

CREATE TABLE IF NOT EXISTS `z_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE IF NOT EXISTS `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `icon_id` int(3) NOT NULL DEFAULT '1',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_monsters`
--

CREATE TABLE IF NOT EXISTS `z_monsters` (
  `hide_creature` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `gfx_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE IF NOT EXISTS `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE IF NOT EXISTS `z_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE IF NOT EXISTS `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_spells`
--

CREATE TABLE IF NOT EXISTS `z_spells` (
  `name` varchar(255) NOT NULL,
  `spell` varchar(255) NOT NULL,
  `spell_type` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `mlvl` int(11) NOT NULL DEFAULT '0',
  `soul` int(11) NOT NULL DEFAULT '0',
  `pacc` varchar(255) NOT NULL,
  `vocations` varchar(255) NOT NULL,
  `conj_count` int(11) NOT NULL DEFAULT '0',
  `hide_spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `bugtracker`
--
ALTER TABLE `bugtracker`
  ADD CONSTRAINT `bugtracker_ibfk_1` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`with`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_statements`
--
ALTER TABLE `player_statements`
  ADD CONSTRAINT `player_statements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD CONSTRAINT `poll_answer_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`);

--
-- Limitadores para a tabela `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `poll_answer` (`id`),
  ADD CONSTRAINT `poll_votes_ibfk_2` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`),
  ADD CONSTRAINT `poll_votes_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Limitadores para a tabela `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `video_comments`
--
ALTER TABLE `video_comments`
  ADD CONSTRAINT `video_comments_ibfk_1` FOREIGN KEY (`video`) REFERENCES `videos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_comments_ibfk_2` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
