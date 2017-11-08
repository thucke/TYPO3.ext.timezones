<?php
namespace Thucke\Timezones\Controller;


/***************************************************************
 *  Copyright notice
 *
 *  (c) 2017 Thomas Hucke <thucke@web.de>
 *  All rights reserved
 *
 *  This script is part of the TYPO3 project. The TYPO3 project is
 *  free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  The GNU General Public License can be found at
 *  http://www.gnu.org/copyleft/gpl.html.
 *
 *  This script is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  This copyright notice MUST APPEAR in all copies of the script!
 ***************************************************************/

/**
 * The Timezones Controller
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License, version 2
 */
class TimezonesController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController {

	/**
	 * @var int
	 */
	protected $cookieLifetime;

	/**
	 * @var $logger \TYPO3\CMS\Core\Log\Logger
	 */
	protected $logger;

	/**
	 * @var \Thucke\Timezones\Service\CookieService
	 */
	protected $cookieService;
	/**
	 * @param \Thucke\Timezones\Service\CookieService $cookieService
	 */
	public function injectCookieService(\Thucke\Timezones\Service\CookieService $cookieService) {
		$this->cookieService = $cookieService;
	}
	/**
	 * @var \Thucke\Timezones\Service\TimezoneService
	 */
	protected $timezoneService;
	/**
	 * @param \Thucke\Timezones\Service\TimezoneService $timezoneService
	 */
	public function injectTimezoneService(\Thucke\Timezones\Service\TimezoneService $timezoneService) {
		$this->timezoneService = $timezoneService;
	}
	/**
	 * @var \Thucke\Timezones\Service\ExtensionHelperService $extensionHelperService
	 */
	protected $extensionHelperService;
	/**
	 * @param	\Thucke\Timezones\Service\ExtensionHelperService $extensionHelperService
	 * @return	void
	 */
	public function injectExtensionHelperService( \Thucke\Timezones\Service\ExtensionHelperService $extensionHelperService ) {
		$this->extensionHelperService = $extensionHelperService;
	}
	 
	/**
	 * Initializes the current action
	 *
	 * @return void
	 */
	public function initializeAction() {
		//instantiate the logger
		$this->logger = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('TYPO3\\CMS\\Extbase\\Object\\ObjectManager')->get('Thucke\\Timezones\\Service\\ExtensionHelperService')->getLogger(__CLASS__);
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry point', array());
		
		$this->checkIntlModule();
		
		$this->prefixId = strtolower('tx_' . $this->request->getControllerExtensionName(). '_' . $this->request->getPluginName());
		$this->cookieLifetime = time()+60*60*24*365;
		$this->timezoneService->setCurrentTimezone($this->cookieService->getCookie($this->prefixId));
		
		//\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump($this->settings,get_class($this).' settings');
	}


	/**
	 * Index action for this controller.
	 *
	 * @return string The rendered view
	 */
	public function indexAction() {
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry indexAction', array());
		$this->view->assign('tz_name',$this->timezoneService->getCurrentTimezoneAbbreviation());
		$pluginPage = abs(intval($this->settings['pluginPage']));

		#only generate link if a uid is configured
		if ($pluginPage > 0) {
    		//generate URI to this page
    		$selfUri = $this->controllerContext->getUriBuilder()->reset()
    					->setTargetPageUid(10)
    					->setCreateAbsoluteUri(true)
    					->buildFrontendUri();
    		$this->view->assign('change_url',$selfUri);
		} else {
		    $this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::WARNING, 'No pluginPage set - skipping hyperlink generation', array('errorCode' => 1507388375));
		}
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit indexAction', array());    
	}


	/**
	 * Displays the vote of the current user
	 *
	 * @return 	string 							The rendered voting
	 */
	public function showAction()	 {
	    $this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry showAction', array());
	    $this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Timezone', array($this->timezoneService->getOffset(), date('Y-m-d H:i',time())));
		$this->view->assign('tz_name', $this->timezoneService->getCurrentTimezoneAbbreviation());
		$this->view->assign('curdatetime', $this->timezoneService->getIntlDateFormatter()->format(time()));
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit showAction', array());
	}


	/**
	 * Displays the vote of the current user
	 *
	 * @return 	string 							The rendered voting
	 */
	public function selectAction()	 {
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry selectAction', array());
		$this->view->assign('selector', $this->timezoneService->getTimezoneArray());
		$this->view->assign('selected', $this->timezoneService->getCurrentTimezone()->getName());
		//generate URI to this page
		$selfUri = $this->controllerContext->getUriBuilder()->reset()
					->setTargetPageUid($GLOBALS["TSFE"]->id)
					->setCreateAbsoluteUri(true)
					->buildFrontendUri();
		$this->view->assign('action',$selfUri);
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit selectAction', array());
	}


	/**
	 * Sets the given timezone
	 *
	 * @param	string $timezone
	 * @return 	void
	 * @ignorevalidation $timezone
	 */
	public function tzsetAction($timezone = null)	 {
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry tzsetAction', array());
		
		$this->timezoneService->setCurrentTimezone($timezone);
		$timezone = $this->timezoneService->getCurrentTimezone()->getName();
		$this->cookieService->setCookie($this->prefixId, $timezone, $this->cookieLifetime);
		
		$referrer = $this->request->getInternalArgument('__referrer');
		
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit tzsetAction - forwarding request',
				array(
						'action' => $referrer['@action'],
						'controller' => $referrer['@controller'],
						'extension' => $referrer['@extension'],
						'arguments' => null,
				));
		$this->controllerContext->getFlashMessageQueue()->clear();
		$this->redirectToUri($_SERVER['HTTP_REFERER']);
	}
	
	/**
	 * Checks if the required PHP module intl is loaded
	 *
	 * @throws \Thucke\Timezones\Exception\ModuleNotLoadedException if php module intl is not loaded
	 * @return void
	 */
	private function checkIntlModule() {
	    if (!extension_loaded('intl')) {
	        throw new \Thucke\Timezones\Exception\ModuleNotLoadedException(
	            \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('error.phpModuleIntlNotLoaded', 'Timezones'), 1508270706
	        );
	    }
	}
}
?>