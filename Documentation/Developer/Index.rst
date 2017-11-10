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

	.. code-block:: php

      /**
       * Convert time to users timezone if avaiable
       */
      function formatDateTime($tstamp) {
          if (TYPO3\CMS\Core\Utility\ExtensionManagementUtility::isLoaded('timezones')) {
              $rc = Thucke\Timezones\Utility\TimezonesUtility::convertToTimezone($tstamp);
         } else {
            $rc = date($format, $tstamp);
         }
         return $rc;
      }

    Use this function wherever u need to display dates and/or times. That's it. No more need to take care of anything else.