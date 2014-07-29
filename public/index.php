<?php
	/**
	 * SMRM - Social Media Relationship Manager
	 **/

	// First, make let's change the directory to the base system directory.
	chdir(dirname(__DIR__));

	require "vendor/autoload.php";

	// Run the application!
	Zend\Mvc\Application::init(require 'config/application.config.php')->run();