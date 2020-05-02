<?php

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

use Nimut\TestingFramework\TestCase\UnitTestCase;
use TYPO3\CMS\Extbase\Object\ObjectManager;
use Thucke\Timezones\Service\LoggingService;

/**
 * Test case.
 */
class TimezoneServiceTest extends UnitTestCase
{
    protected $backupGlobalsBlacklist = ['TYPO3_CONF_VARS'];

    /**
     * @var \Thucke\Timezones\Service\TimezoneService
     * @inject
     */
    protected $subject;

    protected function setUp()
    {
        /** @var TYPO3\CMS\Extbase\Object\ObjectManager $objectManager */
        $objectManager = new ObjectManager();
        $loggingService = $objectManager->get(LoggingService::class);
        $this->subject = new \Thucke\Timezones\Service\TimezoneService($objectManager, $loggingService);
        $this->subject->initializeObject();
    }

    /**
     * @test
     * @throws \Exception
     */
    public function timezoneArrayContainsBerlin()
    {
        static::assertArrayHasKey('Europe/Berlin', $this->subject->getTimezoneArray());
    }

    /**
     * @test
     */
    public function checkUtc()
    {
        static::assertArrayHasKey('UTC', $this->subject->getTimezoneArray());
        //$this->subject->setCurrentTimezone('UTC');
        //static::assertSame('UTC', $this->subject->getCurrentTimezone()->getName());
    }

    /**
     * @test
     * @depends checkUtc
     */
    public function checkUtcDst()
    {
        static::assertFalse($this->subject->isDst());
    }

    /**
     * @test
     * @depends checkUtc
     */
    public function checkUtcOffset()
    {
        static::assertSame(0, $this->subject->getOffset());
    }
}
