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
$EM_CONF[$_EXTKEY] = [
    'title'            => 'Timezones',
    'description'      => 'Manages timezones and datetime conversion in your website',
    'category'         => 'plugin',
    'version'          => '2.2.0',
    'state'            => 'stable',
    'uploadfolder'     => false,
    'createDirs'       => '',
    'clearcacheonload' => true,
    'author'           => 'Thomas Hucke',
    'author_email'     => 'thucke@web.de',
    'author_company'   => '',
    'constraints'      => [
        'depends' => [
            'php'   => '7.1.0-7.2.99',
            'typo3' => '8.7.0-9.5.99',
        ],
        'conflicts' => [],
        'suggests'  => [],
    ],
    'autoload' => [
        'psr-4' => [
            'Thucke\\Timezones\\' => 'Classes', ], ],
];
