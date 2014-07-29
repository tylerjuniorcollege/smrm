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

return array(
	'controllers' => array(
		'invokeables' => array(
			'User\Controller\User' => 'User\Controller\UserController'
		)
	),
	'router' => array(
		'routes' => array(
			'user' => array(
				'type' => 'segment',
				'options' => array(
					'route' => '/user[/][:action][:id]',
					'constraints' => array(
						'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
						'id' => '[0-9]+',
					),
					'defaults' => array(
						'controller' => 'User\Controller\User',
						'action' => 'index'
					)
				)
			)
		)
	),
	'view_manager' => array(
		'template_path_stack' => array(
			'user' => __DIR__ . '/../view'
		)
	)
);