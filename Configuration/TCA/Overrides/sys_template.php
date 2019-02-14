<?php

call_user_func(function () {
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile('timezones', 'Configuration/TypoScript', 'Timezones');
});
