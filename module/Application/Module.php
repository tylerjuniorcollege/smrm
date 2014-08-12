<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use BjyAuthorize\View\RedirectionStrategy;
use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Zend\ModuleManager\Feature\ViewHelperProviderInterface;
use Zend\ServiceManager\AbstractPluginManager;

class Module implements 
    AutoloaderProviderInterface,
    ConfigProviderInterface,
    ViewHelperProviderInterface
{
    public function onBootstrap(MvcEvent $e)
    {
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);

        // Adding in new redirect strategy for anyone who isn't logged in.
        $strategy = new RedirectionStrategy();
        $strategy->setRedirectRoute('zfcuser/login');
        $eventManager->attach($strategy);
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    public function getViewHelperConfig() 
    {
        return array(
            'factories' => array(
                'networkSidebar' => function(AbstractPluginManager $pluginManager) {
                    $serviceLocator = $pluginManager->getServiceLocator();

                    return new View\Helper\NetworkSidebar($serviceLocator->get('Zend\Db\Adapter\Adapter'));
                }
            )
        );
    }
}
