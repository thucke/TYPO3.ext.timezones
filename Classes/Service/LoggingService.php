<?php
declare(strict_types = 1);

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Service;

use Psr\Log\LoggerInterface;
use TYPO3\CMS\Core\Log\LogManagerInterface;
use TYPO3\CMS\Core\Log\Writer\DatabaseWriter;
use TYPO3\CMS\Core\Log\Writer\FileWriter;
use TYPO3\CMS\Core\SingletonInterface;
use TYPO3\CMS\Extbase\Configuration\ConfigurationManagerInterface;
use TYPO3\CMS\Extbase\Object\ObjectManagerInterface;

/**
 * Factory for model objects.
 *
 * @version $Id:$
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU protected License, version 2
 */
class LoggingService implements SingletonInterface
{
    /**
     * @var ObjectManagerInterface
     */
    protected $objectManager;
    /**
     * @var LogManagerInterface
     */
    protected $logManager;
    /**
     * @param LogManagerInterface $logManager
     */
    public function injectLogManager(LogManagerInterface $logManager): void
    {
        $this->logManager = $logManager;
    }
    /**
     * @var ConfigurationManagerInterface
     */
    protected $configurationManager;
    /**
     * @param ConfigurationManagerInterface $configurationManager
     */
    public function injectConfigurationManager(ConfigurationManagerInterface $configurationManager): void
    {
        $this->configurationManager = $configurationManager;
    }

    /**
     * Get a logger instance
     * The configuration of the logger is modified by extension typoscript config.
     *
     * @param string $name the class name which this logger is for
     *
     * @return \Psr\Log\LoggerInterface
     */
    public function getLogger(string $name): LoggerInterface
    {
        $writerConfiguration = $GLOBALS['TYPO3_CONF_VARS']['LOG']['Thucke']['Timezones']['writerConfiguration'];
        $settings = $this->configurationManager->getConfiguration(
            ConfigurationManagerInterface::CONFIGURATION_TYPE_SETTINGS,
            'timezones',
            'pi1'
        );
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
        return $this->logManager->getLogger($name);
    }
}
