@echo off
setlocal
cd /d "%~dp0"
if not exist "RDAW1089M.DLL" exit /b 2
if not exist "RDAS1089M.DLL" exit /b 2
copy RDAW1089M.DLL %SystemRoot%\SysWow64\
copy RDAS1089M.DLL %SystemRoot%\System32\
"%SystemRoot%\SysWOW64\regsvr32.exe" "%SystemRoot%\SysWow64\RDAW1089M.DLL"
if errorlevel 1 exit /b %errorlevel%
set "REGSVR32=%SystemRoot%\System32\regsvr32.exe"
if exist "%SystemRoot%\Sysnative\regsvr32.exe" set "REGSVR32=%SystemRoot%\Sysnative\regsvr32.exe"
"%REGSVR32%" "%SystemRoot%\System32\RDAS1089M.DLL"
if errorlevel 1 exit /b %errorlevel%
echo Registered kgtmaven's VS-700 ASIO driver and worker DLLs.
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\ASIO\VS-700" /f
endlocal
