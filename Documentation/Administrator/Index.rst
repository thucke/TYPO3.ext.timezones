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
.. _docs.typo3.org.logging: https://docs.typo3.org/typo3cms/CoreApiReference/ApiOverview/Logging/Index.html

.. _admin-manual:

Administrator Manual
====================

Target group: **Administrators**

.. _admin-installation:

Installation
------------

To install the extension, perform the following steps:

#. Check that the php module *intl* is activated
    You may place a tiny phpinfo.php on the diretory of your website:

    .. code-block:: php

        <?php
            ini_set('display_errors','on');
            phpinfo();
        ?>

   You should look for a section similar to the following:

   .. figure:: ../Images/PhpInfoIntlModule.png
      :alt: PHPINFO Section identifying installed module

   If you find that the extension is *NOT* installed please check http://php.net/manual/de/intl.installation.php for installation options.

#. Go to the Extension Manager
#. Install the extension
#. Load the static template
#. You may include the pre-defined COA in either of the following ways to show a hyperlink telling the current choosen timezone.
    #. Typoscript with the predefined COA object :typoscript:`lib.timezone`
    #. Fluid template:

        .. code-block:: html

            <f:cObject typoscriptObjectPath="lib.timezone" />

    The COA will generate a hyperlink to the page set in the configuration:

    .. figure:: ../Images/IndexTimezone.png
        :alt: Link showing current timezone

.. _admin-configuration:

Configuration
-------------

The only configuration is pointing to the correct page that contains the
extensions content element to change the timezone.

.. figure:: ../Images/AdminConstantSetting.png
   :alt: Backend constant pid setting

   Constant uid setting pointing to the the page for changing the timezone.

.. _admin-logging:

Logging
-------

This extension features the standard logging mechanisms of TYPO3. You'll find find more information at `docs.typo3.org.logging`_.
Four log levels are actually used which might be activated via Typoscript in the following manner:

.. code-block:: typoscript

   plugin.tx_timezones.settings.logging {
         error {
            file = typo3temp/logs/Timezones.log
            table = sys_log
         }
         warning {
            file = typo3temp/logs/Timezones.log
            table = sys_log
         }
         info {
            file = typo3temp/logs/Timezones.log
            table = sys_log
         }
         debug {
            file = typo3temp/logs/Timezones.log
            table = sys_log
         }
      }


Changing style
--------------

.. index::
   single: Changing style

Templates
^^^^^^^^^

The templates of this extension are stored in the directory ``typo3conf/ext/timezones/Resources/Private/Templates/Timezones`` of your TYPO3 installation.
For customization just copy them - all or only the one you want to change - into another directory e.g. ``fileadmin/templates/ext/timezones/``.
Then add the following configuration in your typoscript template:

.. code-block:: typoscript

   plugin.tx_timezones.view {
      templateRootPaths {
         10 = fileadmin/templates/ext/timezones/
      }
      partialRootPaths {
         10 = fileadmin/templates/ext/timezones/
      }
      layoutRootPaths {
         10 = fileadmin/templates/ext/timezones/
      }
   }

.. caution::
   When numbering the upper entries Do NOT use zero (0)!! This is used by the extension itself. Overiding the original folder might cause unwanted behaviour. 

CSS
^^^

You may want to also override the default CSS style. 
The extension template includes the file ``typo3conf/ext/timezones/Resources/Public/Css/timezones.css`` using the following typoscript:

.. code-block:: typoscript

   page {
      includeCSS {
         timezones = EXT:timezones/Resources/Public/Css/timezones.css
      }
   }

Overriding CSS could be done completely placing this snippet in your configuration referencing another CSS file. 
Specific directives could be also overridden or extended in your own CSS file(s).  


.. _admin-faq:

FAQ
---

No FAQ so far