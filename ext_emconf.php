<?php

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

$EM_CONF[$_EXTKEY] = [
    'title'            => 'Timezones',
    'description'      => 'Manages timezones and datetime conversion in your website',
    'category'         => 'plugin',
    'version'          => '3.0.1',
    'state'            => 'stable',
    'uploadfolder'     => false,
    'createDirs'       => '',
    'clearcacheonload' => true,
    'author'           => 'Thomas Hucke',
    'author_email'     => 'thucke@web.de',
    'author_company'   => '',
    'constraints'      => [
        'depends' => [
            'php' => '7.4.0-8.1.99',
            'typo3' => '10.4.0-11.5.99'
        ],
        'conflicts' => [],
        'suggests'  => [],
    ],
    'autoload' => [
        'psr-4' => [
            'Thucke\\Timezones\\' => 'Classes', ], ],
];
