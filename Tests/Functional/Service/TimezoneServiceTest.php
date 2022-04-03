<?php

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Tests\Functional\Service;

use Thucke\Timezones\Service\LoggingService;
use Thucke\Timezones\Service\TimezoneService;
use TYPO3\CMS\Core\Core\Bootstrap;
use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;
use TYPO3\CMS\Core\Utility\GeneralUtility;
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
     * @var TimezoneService
     */
    protected $subject;

    protected function setUp(): void
    {
        parent::setUp();
        $extAbsPath = ExtensionManagementUtility::extPath('timezones');

        $objectManager = GeneralUtility::makeInstance(ObjectManager::class);
        $configurationManager = $this->createPartialMock(ConfigurationManager::class, ['getConfiguration']);
        $configurationManager->method('getConfiguration')->willReturn([]);

        $this->importDataSet($extAbsPath . '/Tests/Functional/Fixtures/Database/pages.xml');
        $this->setUpFrontendRootPage(
            1,
            [
                'EXT:fluid_styled_content/Configuration/TypoScript/setup.typoscript',
                $extAbsPath . '/Configuration/TypoScript/setup.typoscript',
                $extAbsPath . '/Tests/Functional/Fixtures/Frontend/Basic.typoscript',
            ]
        );
        Bootstrap::initializeLanguageObject();

        $loggingService = $this->getMockBuilder(LoggingService::class)->getMock();
        $this->subject = new TimezoneService($objectManager, $loggingService);
        $this->subject->initializeObject();
        $this->subject->setCurrentTimezone('Europe/Berlin');
    }

    /**
     * @test
     * @throws \Exception
     */
    public function timezoneArrayContainsBerlin()
    {
        self::assertArrayHasKey('Europe/Berlin', $this->subject->getTimezoneArray());
    }

    /**
     * @test
     * @throws \Exception
     */
    public function checkUtc()
    {
        self::assertArrayHasKey('UTC', $this->subject->getTimezoneArray());
        $oldTz = $this->subject->getCurrentTimezone();
        $this->subject->setCurrentTimezone('UTC');
        self::assertSame('UTC', $this->subject->getCurrentTimezone()->getName());
        $this->subject->setCurrentTimezone($oldTz->getName());
    }

    /**
     * @test
     * @throws \Exception
     */
    public function checkDst()
    {
        $this->subject->setCurrentTimezone('Europe/Berlin');
        self::assertFalse($this->subject->isDst('2020-01-01'));
        self::assertTrue($this->subject->isDst('2020-07-01'));
    }

    /**
     * @test
     */
    public function checkTimezoneString()
    {
        // consider the Germany may have GMT+0100 or GMT+0200 due to DST also allowed is e.g. GMT+01:00

        if (version_compare(TYPO3_version, '10.0', '>'))
        {
            self::assertMatchesRegularExpression('/GMT\+0[1|2]:?00/', $this->subject->getIcuTimezoneString());
        } else {
            self::assertRegExp('/GMT\+0[1|2]:?00/', $this->subject->getIcuTimezoneString());
        }
    }

    /**
     * @test
     */
    public function checkTimezoneOffset()
    {
        // consider the Germany may have GMT+0100 or GMT+0200 due to DST
        if (version_compare(TYPO3_version, '10.0', '>'))
        {
            self::assertMatchesRegularExpression('/[3600|7200]/', $this->subject->getOffsetInSeconds());
        } else {
            self::assertRegExp('/[3600|7200]/', $this->subject->getOffsetInSeconds());
        }
    }
}
