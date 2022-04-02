<?php

declare(strict_types=1);

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Service;

use DateTime;
use DateTimeZone;
use Exception;
use IntlDateFormatter;
use TYPO3\CMS\Core\Log\LogLevel;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Utility\LocalizationUtility;

/**
 * Service for setting cookies like Typo3 does extension=php_intl.dll.
 *
 * @version $Id:$
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU protected License, version 2
 */
class TimezoneService extends AbstractExtensionService
{
    /**
     * List of all timezones.
     *
     * @var array
     */
    protected $timezoneArray = [];

    /**
     * List of all timezones.
     *
     * @var DateTimeZone
     */
    protected $currentTimezone;

    /**
     * International Date Formatter Object.
     *
     * @var IntlDateFormatter
     */
    protected $intlDateFormatter;

    /**
     * locale setting for timezone conversions.
     *
     * @var string
     */
    protected $locale;

    /**
     * @var ExtensionHelperService
     */
    protected $extensionHelperService;
    /**
     * @param ExtensionHelperService $extensionHelperService
     */
    public function injectExtensionHelperService(ExtensionHelperService $extensionHelperService): void
    {
        $this->extensionHelperService = $extensionHelperService;
    }

    /**
     * Constructor.
     *
     * @throws Exception
     */
    public function initializeObject(): void
    {
        //$this->logger = $this->extensionHelperService->getLogger(__CLASS__);
        $this->logger->log(LogLevel::DEBUG, 'Entry point');
        $this->locale = LocalizationUtility::translate('locale', 'Timezones');
        $this->setCurrentTimezone(date_default_timezone_get());
        //create instance of IntlDateFormatter for best localized date conversions
        //TODO: make format settings configurable
        $this->intlDateFormatter = GeneralUtility::makeInstance(
            'IntlDateFormatter',
            $this->locale,
            IntlDateFormatter::MEDIUM,
            IntlDateFormatter::SHORT
        );
        $this->setTimezoneArray();
    }

    /**
     * Sets the new timezone identifier.
     *
     * @param string|DateTimeZone $timezone
     */
    public function setCurrentTimezone($timezone = null): void
    {
        $this->logger->log(LogLevel::DEBUG, 'Entry setCurrentTimezone', ['timezoneName' => $timezone]);
        if (!$timezone) {
            $timezone = $this->getCurrentTimezone()->getName();
        } elseif ($timezone instanceof DateTimeZone) {
            $timezone = $timezone->getName();
        }
        $result = date_default_timezone_set($timezone);
        $this->logger->log(LogLevel::DEBUG, 'date_default_timezone_set', [
            'result' => $result,
            'timezone' => $timezone, ]);
        $this->currentTimezone = new DateTimeZone($timezone);
        $this->logger->log(LogLevel::DEBUG, 'Exit setCurrentTimezone');
    }

    /**
     * Get all timezones.
     *
     * @return DateTimeZone Gives back the current DateTimeZone object
     */
    public function getCurrentTimezone(): DateTimeZone
    {
        return $this->currentTimezone;
    }

    /**
     * Get the IntlDateFormatter.
     *
     * @return IntlDateFormatter Gives back the current IntlDateFormatter object
     * @throws Exception
     */
    public function getIntlDateFormatter(): IntlDateFormatter
    {
        $this->logger->log(LogLevel::DEBUG, 'Entry getIntlDateFormatter');
        $this->intlDateFormatter->setTimeZone($this->getIcuTimezoneString());
        $this->logger->log(LogLevel::DEBUG, 'Exit getIntlDateFormatter', [$this->intlDateFormatter]);

        return $this->intlDateFormatter;
    }

    /**
     * Get all timezones.
     *
     * @return string Gives back the current DateTimeZone object
     * @throws Exception
     */
    public function getCurrentTimezoneAbbreviation(): string
    {
        return $this->intlDateFormatter::formatObject(
            new DateTime('now', $this->getCurrentTimezone()),
            'zzzz',
            $this->locale
        );
    }

    /**
     * Get all timezones.
     *
     * @throws Exception
     *
     * @return array Gives back a list of all timezones
     */
    public function getTimezoneArray(): array
    {
        if (!$this->timezoneArray) {
            $this->setTimezoneArray();
        }

        return $this->timezoneArray;
    }

    /**
     * Set timezoneArray.
     *
     * @throws Exception
     */
    public function setTimezoneArray(): void
    {
        $timezone_identifiers_list = DateTimeZone::listIdentifiers();
        foreach ($timezone_identifiers_list as $timezone_identifier) {
            $dateTimeZone = new DateTimeZone($timezone_identifier);
            $dateTime = new DateTime('now', $dateTimeZone);
            //$abbreviation = $this->intlDateFormatter::formatObject($dateTime,'zzzz', $this->locale);
            $hours = floor($dateTimeZone->getOffset($dateTime) / 3600);
            $mins = floor(($dateTimeZone->getOffset($dateTime) - ($hours * 3600)) / 60);
            $hours = 'GMT' . ($hours < 0 ? $hours : '+' . $hours);
            $mins = ($mins > 0 ? $mins : '0' . $mins);
            $text = str_replace('_', ' ', $timezone_identifier);
            $this->timezoneArray[$timezone_identifier] = $text . ' (' . $hours . ':' . $mins . ')';
        }
    }

    /**
     * Get the timezone offset in relation to GMT.
     *
     * @throws Exception
     *
     * @return int
     */
    public function getOffsetInSeconds(): int
    {
        return $this->currentTimezone->getOffset(new DateTime('now', new DateTimeZone('GMT')));
    }

    /**
     * Get the ICU representation of the timezone
     * e.g. GMT+0200.
     *
     * @return string
     * @throws Exception
     */
    public function getIcuTimezoneString(): string
    {
        $this->logger->log(LogLevel::DEBUG, 'Entry getIcuTimezoneString');
        $timezone = $this->currentTimezone->getName();
        $dt = new DateTime('now', new DateTimeZone($timezone));
        $icuTimezoneString = 'GMT';
        if ($this->getOffsetInSeconds() !== 0) {
            //$icuTimezoneString .= $dt->format('O');
            $icuTimezoneString .= $dt->format('P');
        }
        $this->logger->log(LogLevel::DEBUG, 'Exit getIcuTimezoneString', [$icuTimezoneString]);

        return $icuTimezoneString;
    }

    /**
     * Check if daylight saving time is active.
     *
     * @param string $time
     * @return bool
     * @throws Exception
     */
    public function isDst($time='now'): ?bool
    {
        $dateTime = new DateTime($time, $this->currentTimezone);
        return $dateTime->format('I') === '1';
    }
}
