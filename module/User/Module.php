<?php
/**
 * SMRM - Social Media Relationship Manager
 * User Module 
 * 
 * @author Duane Jeffers <djef@tjc.edu>
 * @link http://github.com/tylerjuniorcollege/smrm
 * @copyright Copyright (c) 2014 Tyler Junior College. (http://tjc.edu)
 * @license MIT - http://github.com/tylerjuniorcollege/smrm/LICENSE
 **/

namespace User;

use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\ModuleManager\Feature\ConfigProviderInterface;

class Module implements AutoloaderProviderInterface, ConfigProviderInterface {
	public function getConfig() {
		return include __DIR__ . '/config/module.config.php';
	}
	public function getAutoloaderConfig() {
		
	}
	public function getServiceConfig() {
		return array(

		);
	}
}