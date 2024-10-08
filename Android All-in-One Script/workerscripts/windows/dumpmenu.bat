@echo off
cls
color 3
echo Android All-in-One Script
echo *** DUMP MENU ***
echo.
echo = ADB Devices =================================
echo.
adb devices
echo.
echo = FASTBOOT DEVICES ============================
echo.
fastboot devices
echo.
echo ===============================================
echo.
echo *** MENU ***
echo.
echo * MEDIATEK STUFF *
echo (1)  brom           =   Dump the SoC's BootROM
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    cd ..
    cd mtkclient
    if not exist "mtkclient\" (
        echo mtkclient not found.
	echo.
    cd ..
	echo Hint: Put the second mtkclient folder (if zip) inside the first
	echo for the script to read it.
	echo.
	echo or if you git cloned mtkclient, just put the mtkclient folder
	echo in the mtkclient folder in workerscripts for the script to read it.
        pause
        exit /b
    )
    cd mtkclient
    color 4
    cls
    echo WARNING! THERE IS A POTENTIAL FOR A BSOD CAUSED BY MTKCLIENT DURING THIS PROCESS.
    echo USE AT YOUR OWN RISK.
    echo.
    echo PRESS ENTER TO CONTINUE.
    pause
    color 7
    cls
    python3 mtk.py dumpbrom --filename=mediatek_brom_dump_android_script.bin
)
