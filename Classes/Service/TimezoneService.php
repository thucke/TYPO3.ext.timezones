<?php
namespace Thucke\Timezones\Service;
use DateTime;
use DateTimeZone;
use TYPO3\CMS\Extbase\Object\ObjectManager;
/***************************************************************
*  Copyright notice
*
*  (c) 2013 Thomas Hucke <thucke@web.de>
*  All rights reserved
*
*  This script is part of the TYPO3 project. The TYPO3 project is
*  free software; you can redistribute it and/or modify
*  it under the terms of the GNU General protected License as published by
*  the Free Software Foundation; either version 2 of the License, or
*  (at your option) any later version.
*
*  The GNU General protected License can be found at
*  http://www.gnu.org/copyleft/gpl.html.
*
*  This script is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General protected License for more details.
*
*  This copyright notice MUST APPEAR in all copies of the script!
***************************************************************/

/**
 * Service for setting cookies like Typo3 does extension=php_intl.dll
 *
 * @version $Id:$
 * @license http://opensource.org/licenses/gpl-license.php GNU protected License, version 2
 */
class TimezoneService extends AbstractExtensionService {

	/**
	 * List of all timezones
	 * @var array
	 */
	protected $timezoneArray = [];

	/**
	 * List of all timezones
	 * @var \DateTimeZone
	 */
	protected $currentTimezone;

	/**
	 * International Date Formatter Object
	 * @var \IntlDateFormatter
	 */
	protected $intlDateFormatter;

	/**
	 * locale setting for timezone conversions
	 * @var string
	 */
	protected $locale;

	/**
	 * @var \TYPO3\CMS\Core\Log\Logger $logger
     */
	protected $logger;

    /**
     * Constructor
     * @return void
     * @throws \Exception
     */
	public function initializeObject(  ) {
	    $this->logger = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(ObjectManager::class)->get(ExtensionHelperService::class)->getLogger(__CLASS__);
	    $this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry point');
	    $this->locale = \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('locale', 'Timezones');
		$this->setCurrentTimezone(date_default_timezone_get());
		//create instance of IntlDateFormatter for best localized date conversions
		//TODO: make format settings configurable
		$this->intlDateFormatter = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('IntlDateFormatter', $this->locale, \IntlDateFormatter::MEDIUM, \IntlDateFormatter::SHORT);
		$this->setTimezoneArray();
	}

	/**
	 * Sets the new timezone identifier
	 *
	 * @param	string	$timezoneName
	 * @return	void
	 */
	public function setCurrentTimezone($timezoneName = null) {
	    $this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry setCurrentTimezone', ['timezoneName' => $timezoneName]);
	    if (!$timezoneName) {
			$timezoneName = $this->getCurrentTimezone()->getName();
		}
		$result = date_default_timezone_set($timezoneName);
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'date_default_timezone_set', ['result' => $result,
		    'timezone' => $timezoneName]);
		$this->currentTimezone = new DateTimeZone($timezoneName);
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit setCurrentTimezone');
	}

	/**
	 * Get all timezones
	 *
	 * @return	\DateTimeZone	Gives back the current DateTimeZone object
	 */
	public function getCurrentTimezone() {
		if (!$this->currentTimezone) {
			$this->setCurrentTimezone(date_default_timezone_get());
		}
		return $this->currentTimezone;
	}

    /**
     * Get the IntlDateFormatter
     *
     * @return \IntlDateFormatter    Gives back the current IntlDateFormatter object
     * @throws \Exception
     */
	public function getIntlDateFormatter() {
	    $this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry getIntlDateFormatter');
		$this->intlDateFormatter->setTimeZone($this->getIcuTimezoneString());
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit getIntlDateFormatter', [$this->intlDateFormatter]);
		return $this->intlDateFormatter;
	}

    /**
     * Get all timezones
     *
     * @return    string    Gives back the current DateTimeZone object
     * @throws \Exception
     */
	public function getCurrentTimezoneAbbreviation() {
		return $this->intlDateFormatter::formatObject(new DateTime('now', $this->getCurrentTimezone()), 'zzzz', $this->locale);
	}

    /**
     * Get all timezones
     *
     * @return    array    Gives back a list of all timezones
     * @throws \Exception
     */
	public function getTimezoneArray() {
		if (!$this->timezoneArray) {
			$this->setTimezoneArray();
		}
		return $this->timezoneArray;
	}

    /**
     * Set timezoneArray
     *
     * @return    void
     * @throws \Exception
     */
	public function setTimezoneArray() {
		$timezone_identifiers_list = DateTimeZone::listIdentifiers();
		foreach($timezone_identifiers_list as $timezone_identifier){
			$dateTimeZone = new DateTimeZone($timezone_identifier);
			$dateTime = new DateTime('now', $dateTimeZone);
			//$abbreviation = $this->intlDateFormatter::formatObject($dateTime,'zzzz', $this->locale);
			$hours = floor($dateTimeZone->getOffset($dateTime) / 3600);
			$mins = floor(($dateTimeZone->getOffset($dateTime) - ($hours*3600)) / 60);
			$hours = 'GMT' . ($hours < 0 ? $hours : '+'.$hours);
			$mins = ($mins > 0 ? $mins : '0'.$mins);
			$text = str_replace('_', ' ',$timezone_identifier);
			$this->timezoneArray[$timezone_identifier] = $text.' ('.$hours.':'.$mins.')';
		}
	}

    /**
     * Get the timezone offset in relation to GMT
     *
     * @return    int
     * @throws \Exception
     */
	public function getOffset() {
		return $this->currentTimezone->getOffset(new DateTime('now', new DateTimeZone('GMT')));
	}

    /**
     * Get the ICU representation of the timezone
     * e.g. GMT+2
     *
     * @return    string
     * @throws \Exception
     */
	public function getIcuTimezoneString() {
	    $this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Entry getIcuTimezoneString');
	    $timezone = $this->currentTimezone->getName();
		$dt = new DateTime('now', new DateTimeZone($timezone));
		$icuTimezoneString = 'GMT';
		if ($this->getOffset() !== 0) {
		    $icuTimezoneString .= $dt->format('P');
		}
		$this->logger->log(	\TYPO3\CMS\Core\Log\LogLevel::DEBUG, 'Exit getIcuTimezoneString', [$icuTimezoneString]);
		return $icuTimezoneString;
	}

    /**
     * Check if daylight saving time is active
     *
     * @return    boolean
     * @throws \Exception
     */
	public function isDst() {
		$dateTime = new DateTime('now', $this->currentTimezone);

        /** @var string $dstAbbrevation */
        $dstAbbrevation = $this->intlDateFormatter::formatObject($dateTime,'zzz','en_GB');

        /** @var string $gmtAbbrevation */
        $gmtAbbrevation = $this->intlDateFormatter::formatObject($dateTime,'v','en_GB');
        if (!empty($dstAbbrevation)) {
            return ($dstAbbrevation !== $gmtAbbrevation);
        }
	}
}
