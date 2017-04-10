<?php
$extensionClassesPath = \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::extPath('timezones');
$default = array(
   'tx_timezones_pi1' => $extensionClassesPath . 'pi1/class.tx_timezones_pi1.php',
   'tx_timezones_pi2' => $extensionClassesPath . 'pi2/class.tx_timezones_pi2.php'
);
return $default;
?>