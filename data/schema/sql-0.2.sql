-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `networks`;
CREATE TABLE `networks` (
  `networkid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` int(1) NOT NULL,
  `class` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`networkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

TRUNCATE `networks`;
INSERT INTO `networks` (`networkid`, `network`, `enabled`, `class`, `path`) VALUES
(1,	'Facebook',	1,	'facebook',	'facebook/feed'),
(2,	'Twitter',	1,	'twitter',	'twitter/feed'),
(3,	'Instagram',	1,	'instagram',	'instagram/feed'),
(4,	'LinkedIn',	1,	'linkedin',	'linkedin/feed'),
(5,	'Tumblr',	1,	'tumblr',	'tumblr/feed'),
(6,	'Pinterest',	1,	'pinterest',	'pinterest/feed'),
(7,	'Reddit',	1,	'reddit',	'reddit/feed'),
(8,	'YouTube',	1,	'youtube',	'youtube/feed'),
(9,	'Google+',	1,	'google-plus',	'googleplus/feed');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `settingid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`settingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `state` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_role` (`role_id`),
  KEY `idx_parent_id` (`parent_id`),
  CONSTRAINT `fk_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `user_role` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `user_role_linker`;
CREATE TABLE `user_role_linker` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP VIEW IF EXISTS `user_role_list`;
CREATE TABLE `user_role_list` (`user_id` int(10) unsigned, `username` varchar(255), `email` varchar(255), `display_name` varchar(50), `role_id` varchar(255));


DROP TABLE IF EXISTS `user_role_list`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `user_role_list` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`email` AS `email`,`u`.`display_name` AS `display_name`,`r`.`role_id` AS `role_id` from ((`user` `u` left join `user_role_linker` `rl` on((`u`.`user_id` = `rl`.`user_id`))) left join `user_role` `r` on((`rl`.`role_id` = `r`.`id`)));

-- 2014-08-12 22:12:06