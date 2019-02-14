<?php

if (!defined('TYPO3_MODE')) {
    die('Access denied.');
}

/*
 * Configure the Plugin to call the
 * right combination of Controller and Action according to
 * the user input (default settings, FlexForm, URL etc.)
 */
\TYPO3\CMS\Extbase\Utility\ExtensionUtility::configurePlugin(
    'Thucke.Timezones',	// The extension name (in UpperCamelCase) or the extension key (in lower_underscore)
    'Pi1',		// A unique name of the plugin in UpperCamelCase
    [		// An array holding the controller-action-combinations that are accessible
        'Timezones' 			=> 'index,show,select,tzset',	// The first controller and its first action will be the default
    ],
    [		// An array of non-cachable controller-action-combinations (they must already be enabled)
        'Timezones' 			=> 'show,select',
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
