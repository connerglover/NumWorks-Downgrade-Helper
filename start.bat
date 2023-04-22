@echo off

:: Winget Reminder
echo You will need to have Winget installed to use this
pause
cls

:: Downloading neccesary files to run script
powershell -Command "Invoke-WebRequest https://ipfs.io/ipfs/QmUgMEVK2nAAMPyEKxN3CVLiSoNaTJem7Vn1G12QxgYV3o -OutFile 18-2-0.dfu"
powershell -Command "Invoke-WebRequest https://cdn.numworks.com/81cc6426/numworks-driver-win64.msi -OutFile numworks-driver-win64.msi"
powershell -Command "Invoke-WebRequest https://cdn.discordapp.com/attachments/1071403053179219998/1071413767872729128/unpack_windows.py -OutFile unpack_windows.py"

:: Installing Numworks Driver
start .\numworks-driver-win64.msi
pause
cls

:: Installing Python using Winget
winget install -e --id Python.Python.3.9

:: Run unpack_windows.py to unpack 18-2-0.dfu into external.bin and internal.bin
python .\unpack_windows.py

:: Deleting Unneccsary Files
del .\numworks-driver-win64.msi
del .\unpack_windows.py
del .\18-2-0.dfu

:: Move Output Files to an Output Folder
mkdir Output
move internal.bin Output\
move external.bin Output\

echo Process has completed.