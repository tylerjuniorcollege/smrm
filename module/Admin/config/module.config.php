<?php
/**
 * SMRM - Social Media Relationship Manager
 * Admin Module 
 * 
 * @author Duane Jeffers <djef@tjc.edu>
 * @link http://github.com/tylerjuniorcollege/smrm
 * @copyright Copyright (c) 2014 Tyler Junior College. (http://tjc.edu)
 * @license MIT - http://github.com/tylerjuniorcollege/smrm/LICENSE
 **/

return array(
	'controllers' => array(
		'invokables' => array(
			'Admin\Controller\Admin' => 'Admin\Controller\AdminController',
			'Admin\Controller\Settings' => 'Admin\Controller\SettingsController'
		)
	),
	'router' => array(
		'routes' => array(
			'admin' => array(
				'type' => 'Literal',
				'options' => array(
					'route' => '/admin',
					'defaults' => array(
						'__NAMESPACE__' => 'Admin\Controller',
						'controller' => 'Admin',
						'action' => 'index'
					)
				),
				'may_terminate' => true,
				'child_routes' => array(
					'default' => array(
						'type' => 'Segment',
						'options' => array(
							'route' => '/[:controller[/:action]]',
							'constraints' => array(
								'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
								'action' => '[a-zA-Z][a-zA-Z0-9_-]*'
							),
							'defaults' => array()
						)
					)
				)
			)
		)
	),
	'view_manager' => array(
		'template_path_stack' => array(
			'Admin' => __DIR__ . '/../view'
		)
	)
);