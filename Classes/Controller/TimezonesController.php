<?php

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Controller;

use Thucke\Timezones\Service\ExtensionHelperService;
use TYPO3\CMS\Core\Log\LogLevel;
use TYPO3\CMS\Extbase\Annotation as Extbase;
use TYPO3\CMS\Extbase\Object\ObjectManager;
use TYPO3\CMS\Extbase\Utility\LocalizationUtility;

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
     */
    public function initializeAction(): void
    {
        //instantiate the logger
        $this->logger = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(ObjectManager::class)
            ->get(ExtensionHelperService::class)
            ->getLogger(__CLASS__);
        $this->logger->log(LogLevel::DEBUG, 'Entry initializeAction');

        $this->checkIntlModule();

        $this->prefixId = strtolower(
            'tx_' . $this->request->getControllerExtensionName() . '_' . $this->request->getPluginName()
        );

        //set expire time to 10 years in the future
        $this->cookieLifetime = (new \DateTime())->add(new \DateInterval('P10Y'))->getTimestamp();

        $this->timezoneService->setCurrentTimezone($this->cookieService->getCookie($this->prefixId));
        $this->logger->log(LogLevel::DEBUG, 'Exit initializeAction');
    }

    /**
     * Index action for this controller.
     *
     * @throws \Exception
     */
    public function indexAction()
    {
        $this->logger->log(LogLevel::DEBUG, 'Entry indexAction');
        $this->view->assign('tz_name', $this->timezoneService->getCurrentTimezoneAbbreviation());
        $pluginPage = abs((int)$this->settings['pluginPage']);
        //only generate link if a uid is configured
        if ($pluginPage > 0) {
            //generate URI to this page
            $selfUri = $this->controllerContext->getUriBuilder()->reset()
                        ->setTargetPageUid($pluginPage)
                        ->setCreateAbsoluteUri(true)
                        ->buildFrontendUri();
            $this->view->assign('change_url', $selfUri);
        } else {
            $this->logger->log(
                LogLevel::WARNING,
                'No pluginPage set - skipping hyperlink generation',
                ['errorCode' => 1507388375]
            );
        }
        $this->logger->log(LogLevel::DEBUG, 'Exit indexAction');
    }

    /**
     * Displays the vote of the current user.
     *
     * @throws \Exception
     */
    public function showAction()
    {
        $this->logger->log(LogLevel::DEBUG, 'Entry showAction');
        $this->logger->log(
            LogLevel::DEBUG,
            'Timezone',
            [$this->timezoneService->getOffsetInSeconds(), date('Y-m-d H:i')]
        );
        $this->view->assign('tz_name', $this->timezoneService->getCurrentTimezoneAbbreviation());
        $this->view->assign('curdatetime', $this->formatDateTime(time()));
        $this->logger->log(LogLevel::DEBUG, 'Exit showAction');
    }

    /**
     * Displays the vote of the current user.
     *
     * @throws \Exception
     */
    public function selectAction()
    {
        $this->logger->log(LogLevel::DEBUG, 'Entry selectAction');
        $this->view->assign('selector', $this->timezoneService->getTimezoneArray());
        $this->view->assign('selected', $this->timezoneService->getCurrentTimezone()->getName());
        //generate URI to this page
        $selfUri = $this->controllerContext->getUriBuilder()->reset()
                    ->setTargetPageUid($GLOBALS['TSFE']->id)
                    ->setCreateAbsoluteUri(true)
                    ->buildFrontendUri();
        $this->view->assign('action', $selfUri);
        $this->logger->log(LogLevel::DEBUG, 'Exit selectAction');
    }

    /**
     * Sets the given timezone.
     *
     * @param string $timezone
     * @Extbase\IgnoreValidation("timezone")
     * @throws \TYPO3\CMS\Core\Exception
     * @throws \TYPO3\CMS\Extbase\Mvc\Exception\StopActionException
     * @throws \TYPO3\CMS\Extbase\Mvc\Exception\UnsupportedRequestTypeException
     */
    public function tzsetAction($timezone = null): void
    {
        $this->logger->log(LogLevel::DEBUG, 'Entry tzsetAction', ['Timezone' => $timezone]);

        $this->timezoneService->setCurrentTimezone($timezone);
        $timezone = $this->timezoneService->getCurrentTimezone()->getName();
        $this->cookieService->setCookie($this->prefixId, $timezone, $this->cookieLifetime);

        $referrer = $this->request->getInternalArgument('__referrer');

        $this->logger->log(
            LogLevel::DEBUG,
            'Exit tzsetAction - forwarding request',
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
     */
    private function checkIntlModule(): void
    {
        if (!extension_loaded('intl')) {
            throw new \Thucke\Timezones\Exception\ModuleNotLoadedException(
                LocalizationUtility::translate('error.phpModuleIntlNotLoaded', 'Timezones'),
                1508270706
            );
        }
    }

    /**
     * Convert time to users timezone if avaiable.
     *
     * @link http://www.php.net/manual/en/intldateformatter.format.php
     *
     * @param int|\DateTimeInterface$tstamp
     *
     * @throws \Exception
     *
     * @return string The formatted string or, if an error occurred, false.
     */
    private function formatDateTime($tstamp): string
    {
        if (\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::isLoaded('timezones')) {
            $rc = \Thucke\Timezones\Utility\TimezonesUtility::convertToTimezone($tstamp);
        } else {
            $rc = date(DATE_RFC850, $tstamp);
        }
        return $rc;
    }
}
