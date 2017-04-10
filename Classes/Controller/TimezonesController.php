<?php
namespace Thucke\Timezones\Controller;
/***************************************************************
 *  Copyright notice
 *
 *  (c) 2013 Thomas Hucke <thucke@web.de>
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
 * The Vote Controller
 *
 * @version $Id:$
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
	 * @var string
	 */
	protected $prefixId;

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
	 * @var \Thucke\Timezones\Service\ObjectFactoryService $objectFactoryService
	 */
	protected $objectFactoryService;
	/**
	 * @param	\Thucke\Timezones\Service\ObjectFactoryService $objectFactoryService
	 * @return	void
	 */
	public function injectObjectFactoryService( \Thucke\Timezones\Service\ObjectFactoryService $objectFactoryService ) {
		$this->objectFactoryService = $objectFactoryService;
	}
	 
	/**
	 * Lifecycle-Event
	 * wird nach der Initialisierung des Objekts und nach dem Auflösen der Dependencies aufgerufen.
	 * 
	 */
	public function initializeObject() {
	}

	/**
	 * Initializes the current action
	 *
	 * @return void
	 */
	public function initializeAction() {
		//instantiate the logger
		$this->logger = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('TYPO3\\CMS\\Extbase\\Object\\ObjectManager')->get('Thucke\\Timezones\\Service\\ObjectFactoryService')->getLogger(__CLASS__);
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry point', array());

		$this->prefixId = strtolower('tx_' . $this->request->getControllerExtensionName(). '_' . $this->request->getPluginName());
		$frameworkConfiguration = $this->configurationManager->getConfiguration(\TYPO3\CMS\Extbase\Configuration\ConfigurationManagerInterface::CONFIGURATION_TYPE_FRAMEWORK);
		$this->cookieLifetime = time()+60*60*24*365;

		//\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump($this->settings,get_class($this).' settings');
		//\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump($this,get_class($this).' initializeAction');
	}


	/**
	 * Index action for this controller.
	 *
	 * @return string The rendered view
	 */
	public function indexAction() {
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry indexAction', array());
		$this->view->assign('label',\TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('form_label', 'Timezones'));
		$this->view->assign('tz_name',$this->timezoneService->getCurrentTimezoneAbbreviation());
		//generate URI to this page
		$selfUri = $this->controllerContext->getUriBuilder()->reset()
					->setArguments([
						'tx_timezones_pi1[action]'=>'select'])
					->setTargetPageUid($GLOBALS["TSFE"]->id)
					->setCreateAbsoluteUri(true)
					->buildFrontendUri();
		$this->view->assign('change_url',$selfUri);
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit indexAction', array());
	}


	/**
	 * Displays the vote of the current user
	 *
	 * @return 	string 							The rendered voting
	 */
	public function showAction()	 {
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry showAction', array());
		$this->view->assign('label', \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('form_label', 'Timezones'));
		$this->view->assign('tz_name', $this->timezoneService->getCurrentTimezoneAbbreviation());
		$this->view->assign('curdatelabel', \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('curdate_label', 'Timezones'));
		$this->view->assign('curdatetime', $this->timezoneService->getIntlDateFormatter()->format(time()));
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit showAction', array());
	}


	/**
	 * Displays the vote of the current user
	 *
	 * @return 	string 							The rendered voting
	 */
	public function selectAction()	 {
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry showAction', array());
		$this->view->assign('select_label', \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('select_label', 'Timezones'));
		$this->view->assign('selector', $this->timezoneService->getTimezoneArray());
		$this->view->assign('selected', $this->timezoneService->getCurrentTimezone()->getName());
		$this->view->assign('submit', \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('submit', 'Timezones'));
		//generate URI to this page
		$selfUri = $this->controllerContext->getUriBuilder()->reset()
					->setArguments([
						'tx_timezones_pi1[action]'=>'set',
						'tx_timezones_pi1[timezone]'=>'set']
						)
					->setTargetPageUid($GLOBALS["TSFE"]->id)
					->setCreateAbsoluteUri(true)
					->buildFrontendUri();
		$this->view->assign('action',$selfUri);
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit showAction', array());
	}


	/**
	 * Override getErrorFlashMessage to present
	 * nice flash error messages.
	 *
	 * @return string
	 */
	protected function getErrorFlashMessage() {
		switch ($this->actionMethodName) {
			case 'createAction' :
				return 'Could not create the new vote:';
			case 'showAction' :
				return 'Could not show vote!';
			default :
				return parent::getErrorFlashMessage();
		}
	}


	/**
	 * Sends log information to flashMessage and logging framework
	 *
	 * $messageText		string 	The message
	 * $messageTitle 	string	The header of the message
	 * $severity		string 	Logging severity
	 * $additionalInfo	array	some additional data - at least 'errorCode'
	 * @return	void
	 */
	private function logFlashMessage(	$messageText, 
										$messageTitle, 
										$severity, 
										array $additionalInfo) {
		//TODO delete deprecated $additionalInfo = \TYPO3\CMS\Core\Utility\GeneralUtility::array_merge($additionalInfo, array('messageTitle' => $messageTitle));
		$additionalInfo = array('messageTitle' => $messageTitle) + $additionalInfo;
		$severity = strtoupper($severity);
		switch ($severity) {
			case 'DEBUG' :
				$flashSeverity = 'OK';
				break;
			case 'INFO' :
				$flashSeverity = 'NOTICE';
				break;
			case 'NOTICE' :
				$flashSeverity = 'INFO';
				break;
			case 'WARNING' :
				$flashSeverity = 'WARNING';
				break;
			default :
				$flashSeverity = 'ERROR';
		}
		if ( intval($additionalInfo['errorCode']) ) {
			$messageText = $messageText.' ('.$additionalInfo['errorCode'].')';
		}
		//TODO: locally enqueue flashmessages of setStoragePids when controllerContext has not been set yet
		if (is_object($this->controllerContext)) {
			$this->addFlashMessage( $messageText,
									$messageTitle,
									constant('\TYPO3\CMS\Core\Messaging\AbstractMessage::'.$flashSeverity));
		}
		$this->logger->log(	constant('\TYPO3\CMS\Core\Log\LogLevel::'.$severity),
							$messageText,
							$additionalInfo );
	}

	/**
	 * @return \TYPO3\CMS\Frontend\Controller\TypoScriptFrontendController
	 */
	protected function getTypoScriptFrontendController() {
		/** @var \TYPO3\CMS\Frontend\Controller\TypoScriptFrontendController $TSFE */
		global $TSFE;

		return $TSFE;
	}
}
?>