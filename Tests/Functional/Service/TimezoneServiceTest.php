<?php

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Tests\Unit\Service;

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Thucke\Timezones\Service\LoggingService;
use TYPO3\CMS\Extbase\Configuration\ConfigurationManager;
use TYPO3\CMS\Extbase\Object\ObjectManager;
use TYPO3\TestingFramework\Core\Functional\FunctionalTestCase;

/**
 * Test case.
 */
class TimezoneServiceTest extends FunctionalTestCase
{
    /**
     * @var string[]
     */
    //protected $backupGlobalsBlacklist = ['TYPO3_CONF_VARS'];
    /**
     * @var string[]
     */
    protected $testExtensionsToLoad = ['typo3conf/ext/timezones'];
    /**
     * @var string[]
     */
    protected $coreExtensionsToLoad = ['extbase', 'fluid'];

    /**
     * @var \Thucke\Timezones\Service\TimezoneService
     */
    protected $subject;

    protected function setUp(): void
    {
        parent::setUp();

        $objectManager = new ObjectManager();
        $configurationManager = $this->createPartialMock(ConfigurationManager::class, ['getConfiguration']);
        $configurationManager->method('getConfiguration')->willReturn([]);

        $loggingService = $objectManager->get(LoggingService::class, $objectManager, $configurationManager);
        $this->subject = new \Thucke\Timezones\Service\TimezoneService($objectManager, $loggingService);
        $this->subject->initializeObject();
        $this->subject->setCurrentTimezone('Europe/Berlin');
    }

    /**
     * @test
     * @throws \Exception
     */
    public function timezoneArrayContainsBerlin()
    {
        $this->assertArrayHasKey('Europe/Berlin', $this->subject->getTimezoneArray());
    }

    /**
     * @test
     * @throws \Exception
     */
    public function checkUtc()
    {
        $this->assertArrayHasKey('UTC', $this->subject->getTimezoneArray());
        $oldTz = $this->subject->getCurrentTimezone();
        $this->subject->setCurrentTimezone('UTC');
        $this->assertSame('UTC', $this->subject->getCurrentTimezone()->getName());
        $this->subject->setCurrentTimezone($oldTz->getName());
    }

    /**
     * @test
     * @throws \Exception
     */
    public function checkDst()
    {
        $this->subject->setCurrentTimezone('Europe/Berlin');
        $this->assertFalse($this->subject->isDst('2020-01-01'));
        $this->assertTrue($this->subject->isDst('2020-07-01'));
    }

    /**
     * @test
     */
    public function checkTimezoneString()
    {
        // consider the Germany may have GMT+0100 or GMT+0200 due to DST also allowed is e.g. GMT+01:00
        $this->assertRegExp('/GMT\+0[1|2]:?00/', $this->subject->getIcuTimezoneString());
    }

    /**
     * @test
     */
    public function checkTimezoneOffset()
    {
        // consider the Germany may have GMT+0100 or GMT+0200 due to DST
        $this->assertRegExp('/[3600|7200]/', $this->subject->getOffsetInSeconds());
    }
}
