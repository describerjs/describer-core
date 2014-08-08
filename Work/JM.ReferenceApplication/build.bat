@ECHO OFF

ECHO.Start Build Basis-Solution

build\nuget.exe restore "JM.ReferenceApplication.sln"

set exefile=%WinDir%\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe
%exefile% "JM.ReferenceApplication.sln"

ECHO.**********************************
ECHO.Fertig mit builden.
ECHO.Alles ok, keine Fehler?
CHOICE /C:YN

IF errorlevel ==2 GOTO SOEINMISTEINFEHLER
IF errorlevel ==1 GOTO ALLESOKMEINFREUND


:ALLESOKMEINFREUND
ECHO.**********************************
ECHO.Keine Fehler
ECHO.**********************************

PAUSE
CLS
EXIT

:SOEINMISTEINFEHLER
ECHO.
ECHO.**********************************
ECHO.DLLs werden nicht kopiert.
ECHO.**********************************
PAUSE
CLS
EXIT
