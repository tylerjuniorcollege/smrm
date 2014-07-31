#!/opt/local/bin/php
<?php
/**
 * SMRM - Social Media Relationship Manager
 * Twitter Streaming Daemon
 * 
 * @author Duane Jeffers <djef@tjc.edu>
 * @link http://github.com/tylerjuniorcollege/smrm
 * @copyright Copyright (c) 2014 Tyler Junior College. (http://tjc.edu)
 * @license MIT - http://github.com/tylerjuniorcollege/smrm/LICENSE
 * 
 * Purpose: The Twitter Daemon is an active polling daemon to access the Twitter streaming API. Included with the daemon,
 * is the twitter required backoff/polling ratelimit features.
 **/

// Update working folder for including scripts.
chdir(dirname(__DIR__));

// Add Autoloader to the application:
include_once('vendor/autoload.php');

$cli = new Cli(array());

// Load in local database information.

$applicationSettings = include_once('config/autoload/database.local.php');

$cli->print_dump($applicationSettings);