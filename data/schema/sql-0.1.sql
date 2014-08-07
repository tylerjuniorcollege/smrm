SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

-- CREATE DATABASE `smrm`;

DROP TABLE IF EXISTS `networks`;
CREATE TABLE `networks` (
	`networkid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`network` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
	`enabled` int(1) NOT NULL,
	`class` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`networkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

TRUNCATE `networks`;
INSERT INTO `networks` (`networkid`, `network`, `enabled`, `class`) VALUES
(1,	'Facebook',	1,	'fa-facebook'),
(2,	'Twitter',	1,	'fa-twitter'),
(3,	'Instagram',	1,	'fa-instagram'),
(4,	'LinkedIn',	1,	'fa-linkedin'),
(5,	'Tumblr',	1,	'fa-tumblr'),
(6,	'Pinterest',	1,	'fa-pinterest'),
(7,	'Reddit',	1,	'fa-reddit'),
(8,	'YouTube',	1,	'fa-youtube'),
(9,	'Google+',	1,	'fa-google-plus');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
	`settingid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
	`value` text COLLATE utf8_unicode_ci NOT NULL,
	`created` datetime NOT NULL,
	`updated` datetime NOT NULL,
	PRIMARY KEY (`settingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

TRUNCATE `settings`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
	`password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
	`email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
	`firstname` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
	`lastname` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
	`created` datetime NOT NULL,
	`updated` datetime NOT NULL,
	PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

TRUNCATE `user`;