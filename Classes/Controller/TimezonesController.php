<?php

namespace Thucke\Timezones\Controller;

use Thucke\Timezones\Service\ExtensionHelperService;
use TYPO3\CMS\Extbase\Object\ObjectManager;

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
 * The Timezones Controller.
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License, version 2
 */
class TimezonesController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController
{
    /**
     * @var int
     */
    protected $cookieLifetime;

    /**
     * @var \TYPO3\CMS\Core\Log\Logger
     */
    protected $logger;

    /**
     * @var \Thucke\Timezones\Service\CookieService
     */
    protected $cookieService;

    /**
     * @var string
     */
    private $prefixId;

    /**
     * @param \Thucke\Timezones\Service\CookieService $cookieService
     */
    public function injectCookieService(\Thucke\Timezones\Service\CookieService $cookieService): void
    {
        $this->cookieService = $cookieService;
    }

    /**
     * @var \Thucke\Timezones\Service\TimezoneService
     */
    protected $timezoneService;

    /**
     * @param \Thucke\Timezones\Service\TimezoneService $timezoneService
     */
    public function injectTimezoneService(\Thucke\Timezones\Service\TimezoneService $timezoneService): void
    {
        $this->timezoneService = $timezoneService;
    }

    /**
     * @var \Thucke\Timezones\Service\ExtensionHelperService
     */
    protected $extensionHelperService;

    /**
     * @param \Thucke\Timezones\Service\ExtensionHelperService $extensionHelperService
     *
     * @return void
     */
    public function injectExtensionHelperService(ExtensionHelperService $extensionHelperService): void
    {
        $this->extensionHelperService = $extensionHelperService;
    }

    /**
     * Initializes the current action.
     *
     * @throws \Thucke\Timezones\Exception\ModuleNotLoadedException
     * @throws \Exception
     *
     * @return void
     */
    public function initializeAction(): void
    {
        //instantiate the logger
        $this->logger = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(ObjectManager::class)->get(ExtensionHelperService::class)->getLogger(__CLASS__);
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry initializeAction');

        $this->checkIntlModule();

        $this->prefixId = strtolower('tx_'.$this->request->getControllerExtensionName().'_'.$this->request->getPluginName());

        //set expire time to 10 years in the future
        $this->cookieLifetime = (new \DateTime())->add(new \DateInterval('P10Y'))->getTimestamp();

        $this->timezoneService->setCurrentTimezone($this->cookieService->getCookie($this->prefixId));
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit initializeAction');
    }

    /**
     * Index action for this controller.
     *
     * @throws \Exception
     *
     * @return string The rendered view
     */
    public function indexAction()
    {
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry indexAction');
        $this->view->assign('tz_name', $this->timezoneService->getCurrentTimezoneAbbreviation());
        $pluginPage = abs((int) $this->settings['pluginPage']);
        //only generate link if a uid is configured
        if ($pluginPage > 0) {
            //generate URI to this page
            $selfUri = $this->controllerContext->getUriBuilder()->reset()
                        ->setTargetPageUid($pluginPage)
                        ->setCreateAbsoluteUri(true)
                        ->buildFrontendUri();
            $this->view->assign('change_url', $selfUri);
        } else {
            $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::WARNING, 'No pluginPage set - skipping hyperlink generation', ['errorCode' => 1507388375]);
        }
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit indexAction');
    }

    /**
     * Displays the vote of the current user.
     *
     * @throws \Exception
     *
     * @return string The rendered voting
     */
    public function showAction()
    {
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry showAction');
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Timezone', [$this->timezoneService->getOffset(), date('Y-m-d H:i')]);
        $this->view->assign('tz_name', $this->timezoneService->getCurrentTimezoneAbbreviation());
        $this->view->assign('curdatetime', $this->formatDateTime(time()));
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit showAction');
    }

    /**
     * Displays the vote of the current user.
     *
     * @throws \Exception
     *
     * @return string The rendered voting
     */
    public function selectAction()
    {
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry selectAction');
        $this->view->assign('selector', $this->timezoneService->getTimezoneArray());
        $this->view->assign('selected', $this->timezoneService->getCurrentTimezone()->getName());
        //generate URI to this page
        $selfUri = $this->controllerContext->getUriBuilder()->reset()
                    ->setTargetPageUid($GLOBALS['TSFE']->id)
                    ->setCreateAbsoluteUri(true)
                    ->buildFrontendUri();
        $this->view->assign('action', $selfUri);
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit selectAction');
    }

    /**
     * Sets the given timezone.
     *
     * @param string $timezone
     *
     * @throws \TYPO3\CMS\Core\Exception
     * @throws \TYPO3\CMS\Extbase\Mvc\Exception\StopActionException
     * @throws \TYPO3\CMS\Extbase\Mvc\Exception\UnsupportedRequestTypeException
     *
     * @return void
     * @ignorevalidation $timezone
     */
    public function tzsetAction($timezone = null): void
    {
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry tzsetAction', ['Timezone' => $timezone]);

        $this->timezoneService->setCurrentTimezone($timezone);
        $timezone = $this->timezoneService->getCurrentTimezone()->getName();
        $this->cookieService->setCookie($this->prefixId, $timezone, $this->cookieLifetime);

        $referrer = $this->request->getInternalArgument('__referrer');

        /* @noinspection PhpIllegalStringOffsetInspection */
        $this->logger->log(\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit tzsetAction - forwarding request',
                [
                        'action'     => $referrer['@action'],
                        'controller' => $referrer['@controller'],
                        'extension'  => $referrer['@extension'],
                        'arguments'  => null,
                ]
        );
        $this->controllerContext->getFlashMessageQueue()->clear();
        $this->redirectToUri($_SERVER['HTTP_REFERER']);
    }

    /**
     * Checks if the required PHP module intl is loaded.
     *
     * @throws \Thucke\Timezones\Exception\ModuleNotLoadedException if php module intl is not loaded
     *
     * @return void
     */
    private function checkIntlModule(): void
    {
        if (!extension_loaded('intl')) {
            throw new \Thucke\Timezones\Exception\ModuleNotLoadedException(
                \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('error.phpModuleIntlNotLoaded', 'Timezones'), 1508270706
            );
        }
    }

    /**
     * Convert time to users timezone if avaiable.
     *
     * @link http://www.php.net/manual/en/intldateformatter.format.php
     *
     * @param $tstamp
     *
     * @throws \Exception
     *
     * @return string The formatted string or, if an error occurred, false.
     */
    private function formatDateTime($tstamp)
    {
        if (\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::isLoaded('timezones')) {
            $rc = \Thucke\Timezones\Utility\TimezonesUtility::convertToTimezone($tstamp);
        } else {
            $rc = date(DATE_RFC850, $tstamp);
        }

        return $rc;
    }
}
