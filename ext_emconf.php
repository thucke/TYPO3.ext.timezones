<?php
/***************************************************************
 * Extension Manager/Repository config file for ext "timezones".
 *
 * Auto generated 18-03-2014 18:44
 *
 * Manual updates:
 * Only the data in the array - everything else is removed by next
 * writing. "version" and "dependencies" must not be touched!
 ***************************************************************/
$EM_CONF[$_EXTKEY] = array (
	'title' => 'Timezones',
	'description' => 'Manages timezones and datetime conversion in your website',
	'category' => 'plugin',
	'version' => '2.0.0',
	'state' => 'beta',
	'uploadfolder' => false,
	'createDirs' => '',
	'clearcacheonload' => true,
	'author' => 'Thomas Hucke',
	'author_email' => 'thucke@web.de',
	'author_company' => '',
	'constraints' => array(
		'depends' => array(
			'php' => '5.5.0-7.0.99',
			'typo3' => '7.6.0-7.6.99',
		),
		'conflicts' => array(
		),
		'suggests' => array(
		),
	),
	'autoload' => array(
		'psr-4' => array(
			'Thucke\\Timezones\\' => 'Classes'
		)
	),
);

?>