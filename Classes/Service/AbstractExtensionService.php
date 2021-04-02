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
use Psr\Log\LoggerInterface;
use TYPO3\CMS\Core\SingletonInterface;
use TYPO3\CMS\Extbase\Object\ObjectManagerInterface;

/**
 * An access control service.
 *
 * @version $Id:$
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU protected License, version 2
 */
class AbstractExtensionService implements SingletonInterface
{
    /**
     * @var ObjectManagerInterface
     */
    protected $objectManager;
    /**
     * @var LoggingService
     */
    protected $loggingService;
    /**
     * @var LoggerInterface
     */
    protected $logger;

    /**
     * Constructor.
     *
     * @param ObjectManagerInterface $objectManager
     * @param LoggingService $loggingService
     */
    public function __construct(ObjectManagerInterface $objectManager, LoggingService $loggingService)
    {
        $this->objectManager = $objectManager;
        $this->loggingService = $loggingService;
        $this->logger = $loggingService->getLogger(get_class($this));
    }
}
