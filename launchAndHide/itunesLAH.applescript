-- itunesLAH - Launch and Hide iPhoto. To be run by cron daily to ensure iTunes is running when services are requested.
--
--   Script written by Mike Cramer on Mike Cramer.
--
--   If released to the public, assume this is under a BSD/GPL style license.
--
--   Questions about this script? Send a message to kiodane {at} Google's email service.

tell application "iTunes" to launch
delay 20
tell application "System Events" to set visible of process "iTunes" to false