-- Create Database for SMRM. This line might not be needed for creating the database.
CREATE DATABASE `smrm`;

CREATE TABLE `users` (
	`id` int unsigned NOT NULL PRIMARY_KEY AUTO_INCREMENT,
	`username` varchar(250) NOT NULL,
	`password` varchar(100) NOT NULL,
	`firstname` varchar(200) NOT NULL,
	`lastname` varchar(200) NOT NULL,
	`email` varchar(250) NOT NULL,
	`created` datetime NOT NULL
);

