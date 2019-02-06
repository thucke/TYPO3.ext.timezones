<?php
namespace Thucke\Timezones\Utility;


use TYPO3\CMS\Extbase\Object\ObjectManager;
use Thucke\Timezones\Service\ExtensionHelperService;
use Thucke\Timezones\Service\CookieService;
use Thucke\Timezones\Service\TimezoneService;

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
 * The Timezones Utility
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License, version 2
 */
class TimezonesUtility {

    /**
     * Converts the given value in local DateTime
     * accoring to the timezone set in the cookie
     *
     * @param mixed $value
     * @return string
     * @throws \Exception
     */
	public static function convertToTimezone($value) {
		//instantiate the logger
        /** @var \TYPO3\CMS\Core\Log\Logger $logger */
        $logger = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(ObjectManager::class)->get(ExtensionHelperService::class)->getLogger(__CLASS__);
		$logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry convertToTimezone');

        /** @var \Thucke\Timezones\Service\TimezoneService $timezoneService */
        $timezoneService = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(ObjectManager::class)->get(TimezoneService::class);

        /** @var \Thucke\Timezones\Service\CookieService $cookieService */
        $cookieService = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(ObjectManager::class)->get(CookieService::class);

		$timezoneService->setCurrentTimezone($cookieService->getCookie('tx_timezones_pi1'));
		$convertedValue = $timezoneService->getIntlDateFormatter()->format($value);
		
		$logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit convertToTimezone', ['originalValue' => $value, 'convertedValue' => $convertedValue]);
		return $convertedValue;
	}
}
