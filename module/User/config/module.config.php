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
		'invokables' => array(
			'User\Controller\User' => 'User\Controller\UserController'
		)
	),
	'router' => array(
		'routes' => array(
			'user' => array(
				'type' => 'Literal',
				'options' => array(
					'route' => '/user',
					'defaults' => array(
						'__NAMESPACE__' => 'User\Controller',
						'controller' => 'User',
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
			'User' => __DIR__ . '/../view'
		)
	)
);