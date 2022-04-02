<?php

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

defined('TYPO3_MODE') || die('Access denied.');

use TYPO3\CMS\Core\Information\Typo3Version;
use TYPO3\CMS\Extbase\Utility\ExtensionUtility;

$moduleClass = 'Timezones';
$extensionKey = 'Thucke.Timezones';
if ((new Typo3Version())->getMajorVersion() >= 10) {
    $moduleClass = \Thucke\Timezones\Controller\TimezonesController::class;
    $extensionKey = 'Timezones';
}
/*
 * Configure the Plugin to call the
 * right combination of Controller and Action according to
 * the user input (default settings, FlexForm, URL etc.)
 */
ExtensionUtility::configurePlugin(
    $extensionKey,
    'show',
    [ $moduleClass => 'show' ],
    [ $moduleClass => 'show' ]
);

ExtensionUtility::configurePlugin(
    $extensionKey,
    'select',
    [ $moduleClass => 'select, tzset' ],
    [ $moduleClass => 'select' ]
);

ExtensionUtility::configurePlugin(
    $extensionKey,
    'index',
    [ $moduleClass => 'index' ],
    [ $moduleClass => 'index' ]
);

//deprecated - will be removed when support for TYPO3 v10 is dropped
ExtensionUtility::configurePlugin(
    $extensionKey,	// The extension name (in UpperCamelCase) or the extension key (in lower_underscore)
    'Pi1',		// A unique name of the plugin in UpperCamelCase
    [		// An array holding the controller-action-combinations that are accessible
        $moduleClass => 'index,show,select,tzset',   // The first controller and its first action will be the default
    ],
    [		// An array of non-cachable controller-action-combinations (they must already be enabled)
        $moduleClass => 'show,select,index',
    ]
//\TYPO3\CMS\Extbase\Utility\ExtensionUtility::PLUGIN_TYPE_CONTENT_ELEMENT
);

/*
 * Base configuration of logging events.
 * Each loglevel could be switched off using typoscript setting
$GLOBALS['TYPO3_CONF_VARS']['LOG']['Thucke']['Timezones']['writerConfiguration'] = [
    \TYPO3\CMS\Core\Log\LogLevel::EMERGENCY => [
    ],
    \TYPO3\CMS\Core\Log\LogLevel::ALERT => [
    ],
    \TYPO3\CMS\Core\Log\LogLevel::CRITICAL => [
    ],
    \TYPO3\CMS\Core\Log\LogLevel::ERROR => [
    ],
    \TYPO3\CMS\Core\Log\LogLevel::WARNING => [
    ],
    \TYPO3\CMS\Core\Log\LogLevel::NOTICE => [
    ],
    \TYPO3\CMS\Core\Log\LogLevel::INFO => [
    ],
    \TYPO3\CMS\Core\Log\LogLevel::DEBUG => [
    ],
];
 */
