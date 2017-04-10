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
 * Plugin 'Timezone Library' for the 'timezones' extension.
 *
 * @author	Ralph Schuster <rs.eschborn@gmx.de>
 */

class tx_timezones_pi1 extends TYPO3\CMS\Frontend\Plugin\AbstractPlugin {
	var $prefixId = 'tx_timezones_pi1';
	var $scriptRelPath = 'pi1/class.tx_timezones_pi1.php';	
	var $extKey = 'timezones';
	var $cookieService;
	var $timezoneService;
	
	/**
	 * Constructor
	 * @return void
	 */
	public function __construct(  ) {
	}

	/**
	 * [Put your description here]
	 */
	function main($content,$conf)	{
		$zone = $this->timezoneService->getCurrentTimezone()->getName();
		\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump('Huhu',get_class($this).' main');

		// Set cookie anyway to user timezone
		$this->cookieService->setCookie('typo3_tx_timezone', $zone, time()+60*60*24*365);

		// Update in FE user profile
		if ($GLOBALS['TSFE']->loginUser) {
			$fields = array(
				'tx_timezones_timezone' => $zone,
			);
			$GLOBALS['TYPO3_DB']->exec_UPDATEquery('fe_users',
			       'uid='.$GLOBALS['TSFE']->fe_user->user['uid'], $fields);
		}
	}

	function guessTimezone() {
		// whois must be installed: http://whois.sourceforge.net/
		// whois -h whois.ripe.net <client-ip>|grep country
		// TBD: mapping country code to timezone
	}
}

if (defined('TYPO3_MODE') && $TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/timezones/pi1/class.tx_timezones_pi1.php'])	{
	include_once($TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/timezones/pi1/class.tx_timezones_pi1.php']);
}

?>
