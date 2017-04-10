<?php
namespace Thucke\Timezones\Service;
use \DateTime;
use \DateTimeZone;
use \IntlDateFormatter;
use \Locale;
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
class TimezoneService extends \Thucke\Timezones\Service\AbstractExtensionService {

	/**
	 * List of all timezones
	 * @var array
	 */
	protected $timezoneArray = false;

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
	 * Constructor
	 * @return void
	 */
	public function __construct(  ) {
		parent::__construct();
		$this->locale = \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('locale', 'Timezones');
		$this->setCurrentTimezone(date_default_timezone_get());
		//create instance of IntlDateFormatter for best localized date conversions
		//TODO: make format settings configurable
		$this->intlDateFormatter = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('IntlDateFormatter', $this->locale, \IntlDateFormatter::MEDIUM, \IntlDateFormatter::SHORT, null, null);
		$this->setTimezoneArray();
	}

	/**
	 * Sets the new timezone identifier
	 *
	 * @param	string	$timezoneName
	 * @return	void
	 */
	public function setCurrentTimezone($timezoneName) {
		date_default_timezone_set($timezoneName);
		$this->currentTimezone = new DateTimeZone($timezoneName);
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
	 * @return	\IntlDateFormatter	Gives back the current IntlDateFormatter object
	 */
	public function getIntlDateFormatter() {
		return $this->intlDateFormatter;
	}

	/**
	 * Get all timezones
	 *
	 * @return	string	Gives back the current DateTimeZone object
	 */
	public function getCurrentTimezoneAbbreviation() {
		return $this->intlDateFormatter->formatObject(new DateTime('now', $this->getCurrentTimezone()), 'zzzz', $this->locale);
	}

	/**
	 * Get all timezones
	 *
	 * @return	array	Gives back a list of all timezones
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
	 * @return	void
	 */
	public function setTimezoneArray() {
		$this->timezoneArray = array();
		$timezone_identifiers_list = DateTimeZone::listIdentifiers();
		foreach($timezone_identifiers_list as $timezone_identifier){
			$dateTimeZone = new DateTimeZone($timezone_identifier);
			//\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump($dateTimeZone->getTransitions(),get_class($this).' loop '.$dateTimeZone->getName());
			$dateTime = new DateTime('now', $dateTimeZone);
			$abbreviation = $this->intlDateFormatter->formatObject($dateTime,'zzzz', $this->locale);
			$hours = floor($dateTimeZone->getOffset($dateTime) / 3600);
			$mins = floor(($dateTimeZone->getOffset($dateTime) - ($hours*3600)) / 60);
			$hours = 'GMT' . ($hours < 0 ? $hours : '+'.$hours);
			$mins = ($mins > 0 ? $mins : '0'.$mins);
			$text = str_replace("_"," ",$timezone_identifier);
			$this->timezoneArray[$timezone_identifier] = $text.' ('.$hours.':'.$mins.')';
		}
	}

	/**
	 * Get the timezone offset in relation to GMT
	 *
	 * @return	int
	 */
	public function getOffset() {
		return $this->currentTimezone->getOffset(new DateTime("now", new DateTimeZone("GMT")));
	}

	/**
	 * Check if daylight saving time is active
	 *
	 * @return	boolean
	 */
	public function isDst() {
		//$dateTime = new DateTime('2017-06-01', $this->currentTimezone);
		$dateTime = new DateTime('now', $this->currentTimezone);
		$dstAbbrevation = $this->intlDateFormatter->formatObject($dateTime,'zzz','en_GB');
		$gmtAbbrevation = $this->intlDateFormatter->formatObject($dateTime,'v','en_GB');
		return ($dstAbbrevation != $gmtAbbrevation);
	}
}
?>