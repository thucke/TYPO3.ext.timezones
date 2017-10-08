<?php
namespace Thucke\Timezones\Tests\Unit\Service;

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Frontend\Controller\TypoScriptFrontendController;
use TYPO3\CMS\Extbase\Mvc\Controller\ControllerContext;
use TYPO3\CMS\Extbase\Mvc\Web\Routing\UriBuilder;
use TYPO3\CMS\Extbase\Mvc\Request;

/**
 * Test case
 */
class TimezonesControllerTest extends \TYPO3\CMS\Core\Tests\UnitTestCase {

	protected $backupGlobalsBlacklist = array('TYPO3_CONF_VARS');

	/**
	 * @var \Thucke\Timezones\Controller\TimezonesController|\TYPO3\CMS\Core\Tests\AccessibleObjectInterface
	 */
	protected $controller;
	
	/**
	 * @var string
	 */
	protected $testHostName;
	
	/**
	 * @var string
	 */
	protected $testSitePath;
	
	/**
	 * @var \TYPO3\CMS\Extbase\Mvc\View\ViewInterface
	 */
	protected $view = NULL;
	
	protected function setUp()	{
		$this->controller = $this->getAccessibleMock(\Thucke\Timezones\Controller\TimezonesController::class, ['dummy'], array(), '', false);
		$this->testHostName = 'hostname.tld';
		$this->testSitePath = '/';

		$settings = array(
				'magicNumber' => 10
		);
		$this->controller->_set('settings', $settings);
		
		$this->controller->cObj = $this->getMock(\TYPO3\CMS\Frontend\ContentObject\ContentObjectRenderer::class);
		$this->controller->_set('request', $this->getMock(\TYPO3\CMS\Extbase\Mvc\Request::class, array(), array(), '', FALSE));
		$this->controller->_set('view', $this->getMockedViewInstance(), array(), array(), '', FALSE);
		$this->controller->_set('frontendController', $this->getMock(\TYPO3\CMS\Frontend\Controller\TypoScriptFrontendController::class, [], [], '', false));
		$this->controller->_set('logger', $this->getMock(\TYPO3\CMS\Core\Log\Logger::class, array(), array(), '', false));
		$this->controller->_set('timezoneService', $this->getMockedTimezoneServiceInstance());
		
		$mockUriBuilder = $this->getMock(UriBuilder::class, ['reset', 'setArguments', 'setTargetPageUid', 'setCreateAbsoluteUri', 'buildFrontendUri'], array(), '', false);
		$mockUriBuilder->expects($this->any())->method('reset')->willReturnSelf();
		$mockUriBuilder->expects($this->any())->method('setArguments')->willReturnSelf();
		$mockUriBuilder->expects($this->any())->method('setTargetPageUid')->willReturnSelf();
		$mockUriBuilder->expects($this->any())->method('setCreateAbsoluteUri')->willReturnSelf();
		$mockUriBuilder->expects($this->any())->method('buildFrontendUri')->willReturnSelf();
		
		$mockControllerContext = $this->getAccessibleMock(ControllerContext::class, ['dummy'], array(), '', false);
		$mockControllerContext->_set('uriBuilder', $mockUriBuilder);
		$mockControllerContext->expects($this->any())->method('getUriBuilder')->will($this->returnValue($this->mockRequest));
		$this->controller->_set('controllerContext', $mockControllerContext);
		
		$this->setUpFakeSitePathAndHost();
	}
	
	/**
	 * Set up a fake site path and host
	 */
	protected function setUpFakeSitePathAndHost()
	{
		GeneralUtility::flushInternalRuntimeCaches();
		$_SERVER['ORIG_PATH_INFO'] = $_SERVER['PATH_INFO'] = $_SERVER['ORIG_SCRIPT_NAME'] = $_SERVER['SCRIPT_NAME'] = $this->testSitePath . TYPO3_mainDir;
		$_SERVER['HTTP_HOST'] = $this->testHostName;
	}
	
	/**
	 * Set up a fake view instance
	 * 
	 * @return \TYPO3\CMS\Extbase\Mvc\View\ViewInterface
	 */
	protected function getMockedViewInstance()
	{
		$mock = $this->getMock(\TYPO3\CMS\Fluid\View\TemplateView::class, ['render', 'assign']);
		$mock
			->expects($this->any())
			->method('assign');
		$mock
			->method('render')
			->willReturn('Huhu');
		return $mock;	
	}
	
	/**
	 * Set up a fake view instance
	 *
	 * @return \TYPO3\CMS\Extbase\Mvc\View\ViewInterface
	 */
	protected function getMockedTimezoneServiceInstance()
	{
		$mock = $this->getMock(Thucke\Timezones\Service\TimezoneService::class, ['getCurrentTimezoneAbbreviation'], array(),'', true);
		$mock
			->expects($this->once())
			->method('getCurrentTimezoneAbbreviation')
			->willReturn('Europe/Berlin');
		return $mock;
	}
	
	/**
	 * @test
	 */
	public function indexActionIgnoresActionVar()
	{
		$this->controller->indexAction();
		$this->assertEquals('Huhu', $this->controller->_get('view')->render());
	}
	
	
}
?>