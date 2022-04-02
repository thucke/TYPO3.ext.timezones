.. ==================================================
.. FOR YOUR INFORMATION
.. --------------------------------------------------
.. -*- coding: utf-8 -*- with BOM.

.. ==================================================
.. DEFINE SOME TEXTROLES
.. --------------------------------------------------
.. role::   underline
.. role::   typoscript(code)
.. role::   ts(typoscript)
   :class:  typoscript
.. role::   php(code)
.. highlight:: php

.. _developer-manual:

Developer Manual
================

Target group: **Extension developers**


Create a central function in your extension where you format dates and times, e.g. a function formatDateTime($timestamp):

    ::

      /**
       * Convert time to users timezone if avaiable
       *
       * @param mixed $value
       * @return string The formatted string or, if an error occurred, false.
       */
      private function formatDateTime($tstamp) {
          if (\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::isLoaded('timezones')) {
              // @link http://www.php.net/manual/en/intldateformatter.format.php
              $rc = \Thucke\Timezones\Utility\TimezonesUtility::convertToTimezone($tstamp);
          } else {
              // @link http://www.php.net/manual/en/function.date.php
              $rc = date(DATE_RFC850, $tstamp);
          }
          return $rc;
      }

    Use this function wherever u need to display dates and/or times. That's it. No more need to take care of anything else.


Resources for This Guide
========================

* `Doxygen generated on Github<http://thucke.github.io/TYPO3.ext.timezones/>`__



|phpstorm.png|

Supported by Jetbrains PHPStorm IDE

.. ==================================================
.. Image definitions
.. --------------------------------------------------

.. |phpstorm.png|                image:: phpstorm.png
   :target: https://www.jetbrains.com/?from=RatingAXTYPO3extension
   :alt: Jetbrains PHPStorm IDE
   :align: top
   :width: 100
