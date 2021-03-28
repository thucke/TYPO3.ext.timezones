<?php
declare(strict_types = 1);

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Service;

/**
 * Factory for model objects.
 *
 * @version $Id:$
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU protected License, version 2
 */
class ExtensionHelperService extends \Thucke\Timezones\Service\AbstractExtensionService
{
    /**
     * @var LoggingService
     */
    protected $loggingService;

    /**
     * @param \Thucke\Timezones\Service\LoggingService $loggingService
     */
    public function injectLoggingService(LoggingService $loggingService): void
    {
        $this->loggingService = $loggingService;
    }

    /**
     * Get a logger instance
     * The configuration of the logger is modified by extension typoscript config.
     *
     * @param string $name the class name which this logger is for
     *
     * @return \Psr\Log\LoggerInterface
     */
    public function getLogger(string $name): \Psr\Log\LoggerInterface
    {
        return $this->loggingService->getLogger($name);
    }
}
