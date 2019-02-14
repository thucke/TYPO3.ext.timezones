<?php

call_user_func(function () {
    \TYPO3\CMS\Extbase\Utility\ExtensionUtility::registerPlugin(
        'Thucke.Timezones',	// The extension name (in UpperCamelCase) or the extension key (in lower_underscore)
        'Pi1',		// A unique name of the plugin in UpperCamelCase
        'Timezones'	// A title shown in the backend dropdown field
    );

    $pluginSignature = 'timezones_pi1';
    $GLOBALS['TCA']['tt_content']['types']['list']['subtypes_excludelist'][$pluginSignature] = 'layout,select_key,recursive,pages';
    $GLOBALS['TCA']['tt_content']['types']['list']['subtypes_addlist'][$pluginSignature] = 'pi_flexform';
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPiFlexFormValue($pluginSignature, 'FILE:EXT:timezones/Configuration/Flexforms/flexform_pi1.xml');
});
