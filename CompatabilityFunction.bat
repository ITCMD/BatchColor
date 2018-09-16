@echo off
set type=none
FOR /F "tokens=4-7 delims=[]. " %%i in ('ver') DO (
  SET /A _MajorMinor = %%i * 100 + %%j
  set /A _Build      = %%k0 /10
  set /A _Revision   = %%l0 /10
)
set "_AE="        AE like Ansi Escape
IF %_MajorMinor% GEQ 1000 if %_Build% GTR 10586 ( set "_AE=Yes" ) else ( 
      if %_Build% EQU 10586 if %_Revision% GEQ 11 set "_AE=Yes" )
rem use the _AE flag
if defined _AE (set type=:Color10) ELSE (set type=:Color8m)

if %type%==:Color10 goto StartOfFile
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
rem Prepare a file "X" with only one dot
<nul > X set /p ".=."
goto StartOfFile

:Color10
setlocal EnableDelayedExpansion
set "text=%~2"
set color=%1
set FG=%color:~-1%
set BG=%color:~0,1%
set Sameline=False
set Underline=False
if /i "%~3"=="/n" set Sameline=True
if /i "%~3"=="/u" set Underline=True
if /i "%~4"=="/n" set Sameline=True
if /i "%~4"=="/u" set Underline=True


if /i "%FG%"=="0" set c1=30
if /i "%FG%"=="1" set c1=34
if /i "%FG%"=="2" set c1=32
if /i "%FG%"=="3" set c1=36
if /i "%FG%"=="4" set c1=31
if /i "%FG%"=="5" set c1=35
if /i "%FG%"=="6" set c1=33
if /i "%FG%"=="7" set c1=37
if /i "%FG%"=="8" set c1=90
if /i "%FG%"=="9" set c1=94
if /i "%FG%"=="a" set c1=92
if /i "%FG%"=="b" set c1=96
if /i "%FG%"=="c" set c1=91
if /i "%FG%"=="d" set c1=95
if /i "%FG%"=="e" set c1=93
if /i "%FG%"=="f" set c1=97

if /i "%BG%"=="0" set c2=40
if /i "%BG%"=="1" set c2=44
if /i "%BG%"=="2" set c2=42
if /i "%BG%"=="3" set c2=46
if /i "%BG%"=="4" set c2=41
if /i "%BG%"=="5" set c2=45
if /i "%BG%"=="6" set c2=43
if /i "%BG%"=="7" set c2=47
if /i "%BG%"=="8" set c2=100
if /i "%BG%"=="9" set c2=104
if /i "%BG%"=="a" set c2=102
if /i "%BG%"=="b" set c2=106
if /i "%BG%"=="c" set c2=101
if /i "%BG%"=="d" set c2=105
if /i "%BG%"=="e" set c2=103
if /i "%BG%"=="f" set c2=107

if %SameLine%==True call :NoNewLine & endlocal & exit /b

if %Underline%==False echo [%c1%m[%c2%m%Text%[0m
if %Underline%==True echo [4m[%c1%m[%c2%m%Text%[0m
endlocal
exit /b

:NoNewLine
if %Underline%==False echo|set /p="[%c1%m[%c2%m%Text%[0m"
if %Underline%==True echo|set /p="[4m[%c1%m[%c2%m%Text%[0m"
endlocal
exit /b
:color8m
:color
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
if not "%~3"=="/n" echo.
exit /b
:StartOfFile
::===============================================================================================
call %type% 0a "Look " /n
call %type% 0b "at " /n
call %type% 0c "this " /n
call %type% 0d "beautiful " /n
call %type% 0e "colored " /n
call %type% 0f "text" 
call %type% 0a "And look at " /n
call %type% 0f "THIS" /n /u
call %type% 0a " Underlined text."
pause
