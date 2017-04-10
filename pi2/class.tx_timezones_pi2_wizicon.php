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
 * Class that adds the wizard icon.
 *
 * @author	Ralph Schuster <rs.eschborn@gmx.de>
 */



class tx_timezones_pi2_wizicon {
	function proc($wizardItems)	{
		global $LANG;

		$LL = $this->includeLocalLang();

		$wizardItems['plugins_tx_timezones_pi2'] = array(
			'icon'=>\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::extRelPath('timezones').'pi2/ce_wiz.gif',
			'title'=>$LANG->getLLL('pi2_title',$LL),
			'description'=>$LANG->getLLL('pi2_plus_wiz_description',$LL),
			'params'=>'&defVals[tt_content][CType]=list&defVals[tt_content][list_type]=timezones_pi2'
		);

		return $wizardItems;
	}
	function includeLocalLang()	{
		include(\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::extPath('timezones').'locallang.php');
		return $LOCAL_LANG;
	}
}



if (defined('TYPO3_MODE') && $TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/timezones/pi2/class.tx_timezones_pi2_wizicon.php'])	{
	include_once($TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/timezones/pi2/class.tx_timezones_pi2_wizicon.php']);
}

?>
