<?php
/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

defined('TYPO3_MODE') or die();
use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;
use TYPO3\CMS\Extbase\Utility\ExtensionUtility;

$actions = [ 'Show', 'Select', 'Index', 'Pi1' ];
foreach ($actions as $identifier) {
    \TYPO3\CMS\Extbase\Utility\ExtensionUtility::registerPlugin(
        'Timezones',
        $identifier,
        'LLL:EXT:timezones/Resources/Private/Language/locallang_be.xlf:flexforms_general.mode.' . $identifier,
        null,
        'news'
    );

    $listType = 'timezones_' . strtolower($identifier);
    $GLOBALS['TCA']['tt_content']['types']['list']['subtypes_excludelist'][$listType] = 'layout,select_key,recursive,pages';
    $GLOBALS['TCA']['tt_content']['types']['list']['subtypes_addlist'][$listType] = 'pi_flexform';
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPiFlexFormValue(
        $listType,
        'FILE:EXT:timezones/Configuration/FlexForms/flexform_pi1.xml'
    );
}
