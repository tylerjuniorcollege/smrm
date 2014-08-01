-- Create Database for SMRM. This line might not be needed for creating the database.
CREATE DATABASE `smrm`;

 CREATE TABLE `user` (
 	`userid` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
 	`username` varchar(250) NOT NULL,
 	`password` varchar(150) NOT NULL,
 	`email` varchar(150) NOT NULL,
 	`firstname` varchar(250) NOT NULL,
 	`lastname` varchar(250) NOT NULL,
 	`created` datetime NOT NULL,
 	`updated` datetime NOT NULL
) COMMENT='' ENGINE='InnoDB';

CREATE TABLE `settings` (
	`settingid` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` varchar(150) NOT NULL,
	`value` text NOT NULL,
	`created` datetime NOT NULL,
	`updated` datetime NOT NULL
) COMMENT='' ENGINE='InnoDB';

