@echo off
cls
title Wiimmfi WiiWare Patcher. Network Installer.
set last_build=2017/08/25
set at=11:00

set mode=120,30
mode %mode%

set FilesHostedOn=http://KcrPL.github.io/Patchers_Auto_Update/Mail-Patcher
set MainFolder=%appdata%\WiiWare-Patcher
set TempStorage=%appdata%\WiiWare-Patcher\internet\temp

if not exist %MainFolder% md %MainFolder%
if not exist %TempStorage% md %TempStorage%
goto 1
:1
cls
echo RiiConnect24 Mail Patcher. Network Installer. - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Hi %username%, thanks for checking out RiiConnect24.
echo In order to download RiiConnect24 Mail Patcher, press any button.
echo.
echo (WiiWare Patcher will be saved on Desktop)
echo Press any button to continue.
pause>NUL
goto 2
:2
cls
echo RiiConnect24 Mail Patcher.. Network Installer. - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Please wait... (Checking version)
echo.
echo RiiConnect24 Mail Patcher.
echo Version: (Checking version)
if exist %TempStorage%/version.txt del /q %TempStorage%/version.txt
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/version.txt', '%TempStorage%/version.txt')"  
	set /a temperrorlev=%errorlevel%
	
	::Bind error codes to errors here
	if not %errorlevel%==0 goto error_update_not_available
	
if exist %TempStorage%\version.txt set /p updateversion=<%TempStorage%\version.txt
goto 3
:error_update_not_available
cls
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo -----------------------------------------------------------------------------------------------------------------------
echo    /---\   Error.              
echo   /     \  An Update server is not available.
echo  /   !   \ 
echo  ---------  
echo.            
echo            Press any button to continue.
echo-----------------------------------------------------------------------------------------------------------------------
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`
pause>NUL
goto 1
:3
cls
echo RiiConnect24 Mail Patcher. Network Installer. - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Please wait... (Downloading files)
echo.
echo Mail Patcher..
echo Version: %updateversion%

if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher" md "C:\Users\%username%\Desktop\Mail-Patcher.\"
if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher" goto 3

if exist "C:\Users\%username%\Desktop\Mail-Patcher\patcher.bat`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\patch.bat`" /q 2> nul
if exist "C:\Users\%username%\Desktop\Mail-Patcher\patcher.bat`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\mailparse.rb`" /q 2> nul

powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/patch.bat', '"C:\Users\%username%\Desktop\Mail-Patcher\patch.bat`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/mailparse.rb', '"C:\Users\%username%\Desktop\Mail-Patcher\mailparse.rb`"')"

if not exist "C:\Users\%username%\Desktop\Mail-Patcher\patch.bat`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\Mail-patcher\mailparse.rb`" goto error_update_not_available

if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat" del "C:\Users\%username%\Desktop\Mail-Patcher\patch.bat" /q
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat" del "C:\Users\%username%\Desktop\Mail-Patcher\mailparse.rb" /q

ren "C:\Users\%username%\Desktop\Mail-Patcher\patch.bat`" "patch.bat
ren "C:\Users\%username%\Desktop\Mail-Patcher\mailparse.rb`" "mailparse.rb

:: Running the script and exiting
start explorer.exe "C:\Users\%username%\Desktop\Mail-Patcher\"
exit