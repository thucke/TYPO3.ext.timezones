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

/**
 * Test case.
 */
class TimezoneServiceTest extends \TYPO3\CMS\Core\Tests\UnitTestCase
{
    protected $backupGlobalsBlacklist = ['TYPO3_CONF_VARS'];

    /**
     * @var \Thucke\Timezones\Service\TimezoneService
     * @inject
     */
    protected $subject;

    protected function setUp()
    {
        $objectManager = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance('TYPO3\\CMS\\Extbase\\Object\\ObjectManager');
        $loggingService = $objectManager->get('Thucke\Timezones\Service\LoggingService');
        $this->subject = new \Thucke\Timezones\Service\TimezoneService($objectManager, $loggingService);
        $this->subject->initializeObject();
    }

    /**
     * @test
     */
    public function timezoneArray_Contains_Berlin()
    {
        $this->assertTrue(array_key_exists('Europe/Berlin', $this->subject->getTimezoneArray()));
    }

    /**
     * @test
     */
    public function check_UTC()
    {
        $this->assertTrue(array_key_exists('UTC', $this->subject->getTimezoneArray()));
        $this->subject->setCurrentTimezone('UTC');
        $this->assertSame('UTC', $this->subject->getCurrentTimezone()->getName());
    }

    /**
     * @test
     * @depends check_UTC
     */
    public function check__UTC_DST()
    {
        $this->assertFalse($this->subject->isDst());
    }

    /**
     * @test
     * @depends check_UTC
     */
    public function check_UTC_Offset()
    {
        $this->assertSame(0, $this->subject->getOffset());
    }
}
