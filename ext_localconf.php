<?php

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

use TYPO3\CMS\Extbase\Utility\ExtensionUtility;

if (!defined('TYPO3_MODE')) {
    die('Access denied.');
}

/*
 * Configure the Plugin to call the
 * right combination of Controller and Action according to
 * the user input (default settings, FlexForm, URL etc.)
 */
ExtensionUtility::configurePlugin(
    'Thucke.Timezones',	// The extension name (in UpperCamelCase) or the extension key (in lower_underscore)
    'Pi1',		// A unique name of the plugin in UpperCamelCase
    [		// An array holding the controller-action-combinations that are accessible
        'Timezones' 			=> 'index,show,select,tzset',	// The first controller and its first action will be the default
        \Thucke\Timezones\Controller\TimezonesController::class => 'index,show,select,tzset',
    ],
    [		// An array of non-cachable controller-action-combinations (they must already be enabled)
        'Timezones' 			=> 'show,select,index',
        \Thucke\Timezones\Controller\TimezonesController::class => 'show,select,index'
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
