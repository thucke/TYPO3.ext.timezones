<?php

/**
 * #ddev-generated: Automatically generated TYPO3 AdditionalConfiguration.php file.
 * ddev manages this file and may delete or overwrite the file unless this comment is removed.
 * It is recommended that you leave this file alone.
 */
print('IS_DDEV_PROJECT' . getenv('IS_DDEV_PROJECT') . ' ####### ');
print('IS_T3ACCEPTANCE_RUN' . getenv('IS_T3ACCEPTANCE_RUN') . ' ####### ');
print_r($_ENV . ' ####### ');

if (getenv('IS_DDEV_PROJECT') == 'true') {
    $GLOBALS['TYPO3_CONF_VARS'] = array_replace_recursive(
        $GLOBALS['TYPO3_CONF_VARS'],
        [
            'DB' => [
                'Connections' => [
                    'Default' => [
                        'dbname' => 'db',
                        'host' => 'db',
                        'password' => 'db',
                        'port' => '3306',
                        'user' => 'db',
                    ],
                ],
            ],
            // This GFX configuration allows processing by installed ImageMagick 6
            'GFX' => [
                'processor' => 'ImageMagick',
                'processor_path' => '/usr/bin/',
                'processor_path_lzw' => '/usr/bin/',
            ],
            // This mail configuration sends all emails to mailhog
            'MAIL' => [
                'transport' => 'smtp',
                'transport_smtp_server' => 'localhost:1025',
            ],
            'SYS' => [
                'trustedHostsPattern' => '.*.*',
                'devIPmask' => '*',
                'displayErrors' => 1,
            ],
        ]
    );
    if (getenv('IS_T3ACCEPTANCE_RUN') == 'true') {
        $GLOBALS['TYPO3_CONF_VARS'] = array_replace_recursive(
            $GLOBALS['TYPO3_CONF_VARS'],
            [
                'DB' => [
                    'Connections' => [
                        'Default' => [
                            'dbname' => 't3acceptance',
                            'password' => 'root',
                            'user' => 'root',
                        ],
                    ],
                ],
            ]
        );
    }
}
