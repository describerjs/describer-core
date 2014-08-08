@ECHO OFF

CLS

CD %CD%\core
CLS

ECHO.
ECHO.%CD%
ECHO.


IF errorlevel ==2 GOTO ENDE
IF errorlevel ==1 GOTO BUILD

:BUILD
grunt

ECHO. m
PAUSE

:ENDE
ECHO.Versionierung abgebrochen
ECHO.
PAUSE