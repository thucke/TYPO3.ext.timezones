<?php

use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;

call_user_func(static function () {
    ExtensionManagementUtility::addStaticFile('timezones', 'Configuration/TypoScript', 'Timezones');
});
