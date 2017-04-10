<?php
//TODO: whole file is deprecated since TYPO3 7.3. Move content to <your_extension>/Configuration/TCA/Overrides/pages.php
if (!defined ('TYPO3_MODE')) 	die ('Access denied.');

\TYPO3\CMS\Extbase\Utility\ExtensionUtility::registerPlugin(
	'Thucke.Timezones',	// The extension name (in UpperCamelCase) or the extension key (in lower_underscore)
	'Pi1',		// A unique name of the plugin in UpperCamelCase
	'Timezones'	// A title shown in the backend dropdown field
);

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile('timezones', 'Configuration/TypoScript', 'Timezones');


/*
$tempColumns = Array (
	"tx_timezones_timezone" => Array (		
		"exclude" => 1,		
		"label" => "LLL:EXT:timezones/locallang_db.php:fe_users.tx_timezones_timezone",		
		"config" => Array (
			"type" => "input",
			"size" => "25",
			"max" => "100",
			"eval" => "trim",
		)
	),
);

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTCAcolumns("fe_users",$tempColumns);
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addToAllTCAtypes("fe_users","tx_timezones_timezone;;;;1-1-1");
$extensionName = \TYPO3\CMS\Core\Utility\GeneralUtility::underscoredToUpperCamelCase($_EXTKEY);
$pluginSignature = strtolower($extensionName) . '_pi1';
$GLOBALS['TCA']['tt_content']['types']['list']['subtypes_excludelist'][$pluginSignature] = 'layout';

// Add "pierror" plugin to new element wizard
if (TYPO3_MODE == 'BE') {
   $TBE_MODULES_EXT['xMOD_db_new_content_el']['addElClasses']['tx_timezones_wizicon'] = \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::extPath($_EXTKEY) . 'pierror/class.tx_examples_pierror_wizicon.php';
}


$TCA['tt_content']['types']['list']['subtypes_excludelist'][$_EXTKEY.'_pi2']='layout';
*/

?>
