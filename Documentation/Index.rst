.. ==================================================
.. FOR YOUR INFORMATION
.. --------------------------------------------------
.. -*- coding: utf-8 -*- with BOM.

.. include:: Includes.txt

.. _start:

==============
EXT: Timezones
==============

.. only:: html

    :Classification:
        timezones

    :Version:
        |release|

    :Language:
        en

    :Description:
        Manages timezones in your website

    :Keywords:
        extbase timezone datetime l18n

    :Author:
        Thomas Hucke

    :Email:
        thucke@web.de

    :License:
        Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
        (`CC BY-NC-SA 4.0 <https://creativecommons.org/licenses/by-nc-sa/4.0/>`_)

    :Rendered:
        |today|


*Thanks to Ralph Schuster who initially created this extension and finally agreed transferring it to me.*


-----------------
Important changes
-----------------
Starting with support for TYPOIII v11 plugin actions have been separated into
their own plugins. Before there was only one plugin *pi1* defined which
incorporated all actions (index, show, select). In the backend those actions
could have been chosen via flexform after the plugin was selected.

Starting with Timezones v3.1.0 this behaviour is only supported but deprecated.
The current plugin in the backend has been renamed to:

    .. figure:: Images/EditorBESelectDeprecatedTimezones.png
        :alt: Deprecated element type "Insert plugin"

        Deprecated content element type *Insert plugin*

All users are encouraged to switch their content elements to the new plugins:

#. Replacement for former *Index* plugin action

    .. figure:: Images/EditorBESelectNewIndexPlugin.png
        :alt: Replacement for former "Index" plugin action

        Replacement for former *Index* plugin action

#. Replacement for former *Show* plugin action

    .. figure:: Images/EditorBESelectNewShowPlugin.png
        :alt: Replacement for former "Show" plugin action

        Replacement for former *Show* plugin action

#. Replacement for former *Select* plugin action

    .. figure:: Images/EditorBESelectNewSelectPlugin.png
        :alt: Replacement for former "Select" plugin action

        Replacement for former *Select* plugin action

---------------
Support welcome
---------------
Please support this extension by doing some translations.

Just check `Crowdin <https://crowdin.com/project/typo3-extension-timezones>`_ if you're interested.
If it happens that your favorite language is missing, please don't hesitate to contact the extension author
asking to activate it.


.. toctree::
    :hidden:
    :caption: BASICS

    Introduction/Index
    User/Index

.. toctree::
    :hidden:
    :caption: EXPERT

    Administrator/Index
    Developer/Index

.. toctree::
    :hidden:
    :caption: OTHER

    ResourcesForEditors
    Sitemap/Index


