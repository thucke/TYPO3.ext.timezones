<?php

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */
defined('TYPO3_MODE') || die('Access denied.');

use TYPO3\CMS\Extbase\Utility\ExtensionUtility;
use TYPO3\CMS\Core\Information\Typo3Version;


if ((new Typo3Version())->getMajorVersion() >= 10) {
    $moduleClass = \Thucke\Timezones\Controller\TimezonesController::class;
} else {
    $moduleClass = 'Timezones';
}

/*
 * Configure the Plugin to call the
 * right combination of Controller and Action according to
 * the user input (default settings, FlexForm, URL etc.)
 */
ExtensionUtility::configurePlugin(
    'Timezones',
    'show',
    [ $moduleClass => 'show' ],
    [ $moduleClass => 'show' ]
);

ExtensionUtility::configurePlugin(
    'Timezones',
    'select',
    [ $moduleClass => 'select, tzset' ],
    [ $moduleClass => 'select' ]
);

ExtensionUtility::configurePlugin(
    'Timezones',
    'index',
    [ $moduleClass => 'index' ],
    [ $moduleClass => 'index' ]
);


ExtensionUtility::configurePlugin(
    'Timezones',	// The extension name (in UpperCamelCase) or the extension key (in lower_underscore)
    'Pi1',		// A unique name of the plugin in UpperCamelCase
    [		// An array holding the controller-action-combinations that are accessible
        $moduleClass => 'index,show,select,tzset',   // The first controller and its first action will be the default
    ],
    [		// An array of non-cachable controller-action-combinations (they must already be enabled)
        $moduleClass => 'show,select,index'
    ]
//\TYPO3\CMS\Extbase\Utility\ExtensionUtility::PLUGIN_TYPE_CONTENT_ELEMENT
);


/*
 * Base configuration of logging events.
 * Each loglevel could be swichted off using typoscript setting
 *
$GLOBALS['TYPO3_CONF_VARS']['LOG']['Thucke']['Timezones']['writerConfiguration'] = array(
    \TYPO3\CMS\Core\Log\LogLevel::EMERGENCY => array(
    ),
    \TYPO3\CMS\Core\Log\LogLevel::ALERT => array(
    ),
    \TYPO3\CMS\Core\Log\LogLevel::CRITICAL => array(
    ),
    \TYPO3\CMS\Core\Log\LogLevel::ERROR => array(
    ),
    \TYPO3\CMS\Core\Log\LogLevel::WARNING => array(
    ),
    \TYPO3\CMS\Core\Log\LogLevel::NOTICE => array(
    ),
    \TYPO3\CMS\Core\Log\LogLevel::INFO => array(
    ),
    \TYPO3\CMS\Core\Log\LogLevel::DEBUG => array(
    ),
); */
