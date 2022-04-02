<?php

declare(strict_types=1);

/*
 * This file is part of the package thucke/timezones.
 *
 * For the full copyright and license information, please read the
 * LICENSE file that was distributed with this source code.
 */

namespace Thucke\Timezones\Service;

use TYPO3\CMS\Core\Exception;
use TYPO3\CMS\Core\Log\LogLevel;
use TYPO3\CMS\Core\Utility\GeneralUtility;

/**
 * Service for setting cookies like Typo3 does.
 *
 * @version $Id:$
 *
 * @license http://opensource.org/licenses/gpl-license.php GNU protected License, version 2
 */
class CookieService extends AbstractExtensionService
{
    /**
     * Gets the domain to be used on setting cookies.
     * The information is taken from the value in $GLOBALS['TYPO3_CONF_VARS']['SYS']['cookieDomain'].
     * Protected function taken from t3lib_userAuth (t3 4.7.7).
     *
     * @return string The domain to be used on setting cookies
     */
    protected function getCookieDomain(): string
    {
        $result = '';
        $cookieDomain = $GLOBALS['TYPO3_CONF_VARS']['SYS']['cookieDomain'];
        // If a specific cookie domain is defined for a given TYPO3_MODE,
        // use that domain
        if (!empty($GLOBALS['TYPO3_CONF_VARS']['FE']['cookieDomain'])) {
            $cookieDomain = $GLOBALS['TYPO3_CONF_VARS']['FE']['cookieDomain'];
        }
        if ($cookieDomain) {
            if ($cookieDomain[0] === '/') {
                $match = [];
                $matchCnt = @preg_match($cookieDomain, GeneralUtility::getIndpEnv('TYPO3_HOST_ONLY'), $match);
                if ($matchCnt === false) {
                    $this->logger->log(
                        LogLevel::ERROR,
                        'getCookieDomain: The regular expression for the cookie domain contains errors. The session is not shared across sub-domains.',
                        [
                                            'cookieDomain' => $cookieDomain,
                                            'errorCode'    => 1399137882,
                                        ]
                    );
                } elseif ($matchCnt) {
                    $result = $match[0];
                }
            } else {
                $result = $cookieDomain;
            }
        }

        return $result;
    }

    /**
     * Sets the cookie
     * Protected function taken from t3lib_userAuth (t3 4.7.7).
     *
     * @param string $cookieName identifier for the cookie
     *
     * @throws Exception
     */
    public function clearCookie(string $cookieName): void
    {
        setcookie($cookieName);
    }

    /**
     * Sets the cookie
     * Protected function taken from t3lib_userAuth (t3 4.7.7).
     *
     * @param string $cookieName identifier for the cookie
     * @param string $cookieValue cookie value
     * @param int $cookieExpire expire time for the cookie
     *
     * @throws Exception
     */
    public function setCookie(string $cookieName, string $cookieValue, $cookieExpire = 0): void
    {
        // do not set session cookies
        //\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump(date('H:i:s - m.d.y', $cookieExpire), 'setCookie');
        if (!empty($cookieExpire)) {
            $settings = $GLOBALS['TYPO3_CONF_VARS']['SYS'];

            // Get the domain to be used for the cookie (if any):
            $cookieDomain = $this->getCookieDomain();

            // If no cookie domain is set, use the base path:
            /** @var string $cookiePath */
            $cookiePath = ($cookieDomain ? '/' : GeneralUtility::getIndpEnv('TYPO3_SITE_PATH'));

            //TODO - cookieSecure and cookieHttpOnly had been removed in TYPO3 v11
            // drop special handling when dropping support for TYPO3 <v11

            // Use the secure option when the current request is served by a secure connection:
            $cookieSecure = false;
            if (array_key_exists('cookieSecure', $settings)) {
                $cookieSecure = (bool)$settings['cookieSecure'] && GeneralUtility::getIndpEnv('TYPO3_SSL');
            }
            // Deliver cookies only via HTTP and prevent possible XSS by JavaScript:
            $cookieHttpOnly = true;
            if (array_key_exists('cookieHttpOnly', $settings)) {
                $cookieHttpOnly = (bool)$settings['cookieHttpOnly'];
            }

            // Do not set cookie if cookieSecure is set to "1" (force HTTPS) and no secure channel is used:
            if (!($cookieSecure xor GeneralUtility::getIndpEnv('TYPO3_SSL'))) {
                setcookie(
                    $cookieName,
                    $cookieValue,
                    (int)$cookieExpire,
                    $cookiePath,
                    $cookieDomain,
                    $cookieSecure,
                    $cookieHttpOnly
                );
                $this->logger->log(
                    LogLevel::INFO,
                    'setCookie: Cookie set',
                    [
                                        'cookieName'     => $cookieName,
                                        'cookieValue'    => $cookieValue,
                                        'cookieExpire'   => $cookieExpire,
                                        'cookiePath'     => $cookiePath,
                                        'cookieDomain'   => $cookieDomain,
                                        'cookieSecure'   => $cookieSecure,
                                        'cookieHttpOnly' => $cookieHttpOnly,
                                    ]
                );
            } else {
                throw new Exception(
                    'Cookie was not set since HTTPS was forced in $TYPO3_CONF_VARS[SYS][cookieSecure].',
                    1254325546
                );
            }
        }
    }

    /**
     * Gets the cookie.
     *
     * @param string $cookieName identifier for the cookie
     * @return string|null
     */
    public function getCookie(string $cookieName): ?string
    {
        //\TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump($_COOKIE[$cookieName],get_class($this).' getCookie');
        return isset($_COOKIE[$cookieName]) ? stripslashes($_COOKIE[$cookieName]) : null;
    }

    /**
     * Return if cookie has been set.
     *
     * @param string $cookieName identifier for the cookie
     *
     * @return bool
     */
    public function hasCookie(string $cookieName): bool
    {
        return !empty($this->getCookie($cookieName));
    }
}
