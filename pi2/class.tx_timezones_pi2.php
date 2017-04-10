<?php
/***************************************************************
*  Copyright notice
*
*  (c) 2005 Ralph Schuster (rs.eschborn@gmx.de)
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
 * Plugin 'Oventa Forgot Password' for the 'timezones' extension.
 *
 * @author	Ralph Schuster <rs.eschborn@gmx.de>
 */

class tx_timezones_pi2 extends TYPO3\CMS\Frontend\Plugin\AbstractPlugin {
	var $prefixId = 'tx_timezones_pi2';		// Same as class name
	var $scriptRelPath = 'pi2/class.tx_timezones_pi2.php';	// Path to this script relative to the extension dir.
	var $extKey = 'timezones';	// The extension key.
	var $orig_templateCode;
	var $cookieService;
	var $timezoneService;

	/**
	 * Constructor
	 * @return void
	 */
	public function __construct(  ) {
		$this->cookieService = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('Thucke\\Timezones\\Service\\CookieService');
		$this->timezoneService = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('Thucke\\Timezones\\Service\\TimezoneService');
		//$this->txTimezonesPi1 = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('tx_timezones_pi1');
		$this->initZones();
	}

	/**
	 * [Put your description here]
	 */
	function main($content,$conf)	{
		$this->conf=$conf;
		$this->pi_setPiVarDefaults();
		$this->pi_USER_INT_obj=1;


		$type = $this->cObj->data['select_key'];
		if (!$type) $type = $this->conf['select_key'];
		if (!$type) $type = 'info';

		$cObj = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('TYPO3\CMS\Frontend\ContentObject\ContentObjectRenderer');
		$cObj->setParent($this->cObj->data, $this->cObj->currentRecord);
		$this->orig_templateCode = $this->cObj->fileResource($conf["templateFile"]);

		if ($type == 'form') {
			$content = $this->getForm($cObj);
		} else {
			$content = $this->getInfo($cObj);
		}
		return $this->pi_wrapInBaseClass($content);
	}

	function getForm(&$cObj) {
		$template = $cObj->getSubpart($this->orig_templateCode, "###PI2_FORM###");
		$markers = array(
			'###LABEL###' => \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('form_label', 'Timezones'),
			'###SELECT_LABEL###' => \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('select_label', 'Timezones'),
			'###SUBMIT###'   => \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('submit', 'Timezones'),
			'###TZ_LABEL###' => $this->timezoneService->getTimezoneArray()[$this->timezoneService->getCurrentTimezone()->getName()],
			'###TZ_NAME###'  => $this->timezoneService->getCurrentTimezoneAbbreviation(),
			'###TZ_ID###'    => $this->timezoneService->getCurrentTimezone()->getName(),
			'###ACTION###' => $this->pi_getPageLink($GLOBALS['TSFE']->id, '', ''),
			'###CURDATETIME###' => $this->timezoneService->getIntlDateFormatter()->format(time()),
			'###CURDATELABEL###' => \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('curdate_label', 'Timezones'),
			'###SELECTOR###' => $this->getTimezoneSelector(),
		);
		return $cObj->substituteMarkerArray($template, $markers);
	}

	function getInfo(&$cObj) {
		$template = $cObj->getSubpart($this->orig_templateCode, "###PI2_INFO###");
		$markers = array(
			'###LABEL###' => \TYPO3\CMS\Extbase\Utility\LocalizationUtility::translate('form_label', 'Timezones'),
			'###TZ_NAME###'  => $this->timezoneService->getCurrentTimezoneAbbreviation(),
			'###CHANGE_URL###' => $this->pi_getPageLink($this->conf['changePage'], '', ''),
		);
		return $cObj->substituteMarkerArray($template, $markers);
	}


	function getTimezoneSelector($sel_zone = 'XXX', $name = "tx_timezones[timezone]") {
		$tz = $this->timezoneService->getCurrentTimezone()->getName();
		if ($sel_zone != 'XXX') {
			$tz = $sel_zone;
		}

		$rc = '<select name="'.$name.'">';
		foreach ($this->timezoneService->getTimezoneArray() AS $zone => $tzDisplay) {
			if ($tz == $zone) {
				$selected = 'selected="selected"';
			} else {
				$selected = '';
			}
			$rc .= "<option value=\"$zone\" $selected>$tzDisplay</option>\n";
		}
		$rc .= '</select>';
		return $rc;
	}
	
	function initZones() {

		// Create array of possibilities in order of precedence
		$tz = array();

		// Timezone is set by param
		$rc = \TYPO3\CMS\Core\Utility\GeneralUtility::_GP('tx_timezones');
		if (is_array($rc) && isset($rc['timezone'])) {
			$tz[] = $rc['timezone'];
		}

		// FE user just logged in? Get value from user profile
		if ($GLOBALS['TSFE']->loginUser && (\TYPO3\CMS\Core\Utility\GeneralUtility::_GP('logintype') == 'login')) {
			$tz[] = $GLOBALS['TSFE']->fe_user->user['tx_timezones_timezone'];
		}

		// timezone cookie
		if ($this->cookieService->hasCookie('typo3_tx_timezone')) {
			$tz[] = $this->cookieService->getCookie('typo3_tx_timezone');
		}

		// FE user is coming? Get value from user profile
		if ($GLOBALS['TSFE']->loginUser) {
			$tz[] = $GLOBALS['TSFE']->fe_user->user['tx_timezones_timezone'];
		}

		// default timezone
		$tz[] = $this->timezoneService->getCurrentTimezone()->getName();
		//\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump($this->timezoneService,get_class($this).' initZones_timezoneService');

		// check all values now and do the timezone setting
		foreach ($tz AS $z) {
			if (isset($this->timezoneService->getTimezoneArray()[$z])) {
				$this->timezoneService->setCurrentTimezone($z);
				return;
			}
		}
	}
}

if (defined('TYPO3_MODE') && $TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/timezones/pi2/class.tx_timezones_pi2.php'])	{
	include_once($TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/timezones/pi2/class.tx_timezones_pi2.php']);
}

?>
