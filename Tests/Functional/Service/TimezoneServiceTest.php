<?php /** @noinspection ALL */

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Tests\Functional\Service;

use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;
use Thucke\Timezones\Service\TimezoneService;
use Thucke\Timezones\Service\LoggingService;
use TYPO3\CMS\Core\Core\Bootstrap;
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
     * @var \Thucke\Timezones\Service\TimezoneService
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

        $loggingService = GeneralUtility::makeInstance(LoggingService::class);
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
