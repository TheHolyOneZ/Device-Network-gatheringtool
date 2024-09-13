@echo off
setlocal

:: Network configuration
set "network=192.168.1."
set "start_ip=1"
set "end_ip=254"

:: List of specific computers to shut down
set "computers=Computer1 Computer2 Computer3"

:: Shut down the specific computers
echo Starting shutdown of specific computers...
for %%i in (%computers%) do (
    echo Shutting down %%i...
    shutdown /s /f /t 0 /m \\%%i
)

:: Loop through all IP addresses in the range
echo Starting shutdown of computers in IP range...
for /l %%i in (%start_ip%,1,%end_ip%) do (
    set "ip=%network%%%i"
    echo Attempting to shut down %%i...
    shutdown /s /f /t 0 /m \\%ip% 2>nul
)

echo All available computers in the network have been shut down.
endlocal
