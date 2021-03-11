<?php
declare(strict_types = 1);

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Service;

use TYPO3\CMS\Core\Log\Logger;
use TYPO3\CMS\Core\Log\LogManager;
use TYPO3\CMS\Core\Log\Writer\DatabaseWriter;
use TYPO3\CMS\Core\Log\Writer\FileWriter;
use TYPO3\CMS\Extbase\Configuration\ConfigurationManagerInterface;
use TYPO3\CMS\Extbase\Object\ObjectManagerInterface;

/**
 * Factory for model objects.
 *
 * @version $Id:$
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU protected License, version 2
 */
class LoggingService
{
    /**
     * @var ObjectManagerInterface
     */
    protected $objectManager;
    /**
     * @var ConfigurationManagerInterface
     */
    protected $configurationManager;

    /**
     * Constructor
     * Must overrule the abstract class method to avoid self referencing.
     *
     * @param ObjectManagerInterface               $objectManager
     * @param ConfigurationManagerInterface $configurationManager,
     */
    public function __construct(
        ObjectManagerInterface $objectManager,
        ConfigurationManagerInterface $configurationManager
    ) {
        $this->objectManager = $objectManager;
        $this->configurationManager = $configurationManager;
    }

    /**
     * Get a logger instance
     * The configuration of the logger is modified by extension typoscript config.
     *
     * @param string $name the class name which this logger is for
     *
     * @return Logger
     */
    public function getLogger($name)
    {
        $writerConfiguration = $GLOBALS['TYPO3_CONF_VARS']['LOG']['Thucke']['Timezones']['writerConfiguration'];
        $settings = $this->configurationManager->getConfiguration(ConfigurationManagerInterface::CONFIGURATION_TYPE_SETTINGS, 'timezones', 'pi1');
        if (is_array($settings['logging'])) {
            foreach ($settings['logging'] as $logLevel => $logConfig) {
                $levelUppercase = strtoupper($logLevel);
                if (!empty($logConfig['file'])) {
                    $writerConfiguration[constant('\TYPO3\CMS\Core\Log\LogLevel::' . $levelUppercase)][FileWriter::class] =
                        ['logFile' => $logConfig['file']];
                }
                if (!empty($logConfig['database'])) {
                    $writerConfiguration[constant('\TYPO3\CMS\Core\Log\LogLevel::' . $levelUppercase)][DatabaseWriter::class] =
                        ['table' => $logConfig['table']];
                }
            }
        }
        $GLOBALS['TYPO3_CONF_VARS']['LOG']['Thucke']['Timezones']['writerConfiguration'] = $writerConfiguration;
        return $this->objectManager->get(LogManager::class)->getLogger($name);
    }
}
