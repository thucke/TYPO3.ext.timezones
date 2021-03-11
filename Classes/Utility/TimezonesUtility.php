<?php
declare(strict_types = 1);

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Utility;

use Exception;
use Thucke\Timezones\Service\CookieService;
use Thucke\Timezones\Service\ExtensionHelperService;
use Thucke\Timezones\Service\TimezoneService;
use TYPO3\CMS\Core\Log\Logger;
use TYPO3\CMS\Core\Log\LogLevel;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Object\ObjectManager;

/**
 * The Timezones Utility.
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License, version 2
 */
class TimezonesUtility
{
    /**
     * Converts the given value in local DateTime
     * accoring to the timezone set in the cookie.
     *
     * @param int|\DateTimeInterface $value
     *
     * @throws Exception
     *
     * @return string
     */
    public static function convertToTimezone($value): string
    {
        //instantiate the logger
        /** @var Logger $logger */
        $logger = GeneralUtility::makeInstance(ObjectManager::class)->get(ExtensionHelperService::class)->getLogger(__CLASS__);
        $logger->log(LogLevel::DEBUG, 'Entry convertToTimezone');

        /** @var TimezoneService $timezoneService */
        $timezoneService = GeneralUtility::makeInstance(ObjectManager::class)->get(TimezoneService::class);

        /** @var CookieService $cookieService */
        $cookieService = GeneralUtility::makeInstance(ObjectManager::class)->get(CookieService::class);

        $timezoneService->setCurrentTimezone($cookieService->getCookie('tx_timezones_pi1'));
        $convertedValue = $timezoneService->getIntlDateFormatter()->format($value);

        $logger->log(LogLevel::DEBUG, 'Exit convertToTimezone', ['originalValue' => $value, 'convertedValue' => $convertedValue]);

        return $convertedValue;
    }
}
