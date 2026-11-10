@echo off
setlocal
cd /d "%~dp0"
if exist "%SystemRoot%\System32\RDAS1089M.DLL" goto unregister64
if exist "%SystemRoot%\SysWOW64\RDAW1089M.DLL" goto unregister32
exit /b 0
:unregister64
set "REGSVR32=%SystemRoot%\System32\regsvr32.exe"
if exist "%SystemRoot%\Sysnative\regsvr32.exe" set "REGSVR32=%SystemRoot%\Sysnative\regsvr32.exe"
"%REGSVR32%" /u "%SystemRoot%\System32\RDAS1089M.DLL"
del %SystemRoot%\System32\RDAS1089M.DLL
if errorlevel 1 exit /b %errorlevel%
:unregister32
if exist "%SystemRoot%\SysWOW64\RDAW1089M.DLL" "%SystemRoot%\SysWOW64\regsvr32.exe" /u "%SystemRoot%\SysWOW64\RDAW1089M.DLL"
del %SystemRoot%\SysWOW64\RDAW1089M.DLL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\ASIO\VS-700" /v "CLSID" /t REG_SZ /d "{72C341ED-8F31-4bab-9523-5FCE9C67310A}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\ASIO\VS-700" /v "Description" /t REG_SZ /d "VS-700" /f
exit /b %errorlevel%
