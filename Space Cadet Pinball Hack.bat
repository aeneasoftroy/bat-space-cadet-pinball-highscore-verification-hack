@echo off
setlocal enabledelayedexpansion
color 0a

REM SPACE CADET PINBALL HIGHSCORE TABLE VERIFICATION CODE HACK
REM ----------------------------------------------------------
REM In order to get the highscore table to be accepted by the program,
REM we must re-calculate the verification code in the registry. This
REM code is calculated by adding up all score on the table, substracting
REM the negative values of empty highscore places. This script has the
REM negative values of 4 empty highscore entries (-999x4=-3996), therefor
REM it only affects the number 1 player on the chart. After that, we take
REM all the characters of the name of the highscore table entry, and 
REM convert those characters into decimals, add those up to what we have
REM and there is the verification code we require to validate the highscore.

echo SPACE CADET PINBALL HIGHSCORE TABLE VERIFICATION CODE HACK 
echo BY HcH
echo.

set DEBUG=1
set TOTALASCIIVALUE=0
set string=
set /p input=Enter value High score name: 
set /p input_score=Enter desired high score: 
set name=%INPUT%
REM SET INPUT WITH A ']' TERMINATION CHARACTER AT THE END FOR LATER PURPOSES
set input=%INPUT%]

:EXTRACT

REM EXTRACT THE FIRST CHARACTERS
set i=%input:~0,1%

REM GET ASCII VALUE, "%~nx0" DETERMINES THE FILENAME OF THE CURRENT ACTIVE BATCH FILE
for /F "tokens=1,2,3,4,5,6 delims=;" %%a in ('type "%~nx0"') do if "R;%%c"=="R;%i%" set ASCII=%%b&&set /a TOTALASCIIVALUE=!TOTALASCIIVALUE!+!ASCII!
if %DEBUG%==1 echo ascii=%ASCII%
if %DEBUG%==1 echo string1=%STRING%
set STRING=%STRING%%ASCII%
if %DEBUG%==1 echo string2=%STRING%

REM REMOVE FIRST CHARACTER FROM INPUT
set input=%input:~1%

REM END INPUT ON TERMINATION CHARACTER
if "%input%"=="]" goto :DONE

goto :EXTRACT

:DONE

echo Converted: %STRING%
echo Total of ASCII VALUES added up: %TOTALASCIIVALUE%

REM THE VERIFICATION NUMBER IS BASICALLY A TOTAL OF ALL 5 SCORES, ASSUMING YOU HAVE NO OTHER ENTRIES IN THE HIGH SCORE TABLE IT'S GOING TO BE 4 X -999, THEREFOR CLEAR THE HIGHSCORE TABLE BEFORE USING THIS SCRIPT
set /a verification=%input_score%+%TOTALASCIIVALUE%-3996
echo RECALCULATED VERIFICATION NUMBER=%verification%
echo OVERRIDING HIGH SCORE TABLE ...

REM YEA FOR THIS PART DELAYED EXPANSION WILL CONFLICT WITH THE EXCLAMATION MARK IN THE REGISTRY KEY NAME, DISABLE IT
setlocal disabledelayedexpansion
reg add HKCU\Software\Microsoft\Plus^!\Pinball\SpaceCadet /v 0.Name /d %name% /f
reg add HKCU\Software\Microsoft\Plus^!\Pinball\SpaceCadet /v 0.Score /d %input_score% /f
reg add HKCU\Software\Microsoft\Plus^!\Pinball\SpaceCadet /v Verification /d %verification% /f
echo Done.

pause
goto :EOF

REM ASCII VALUE CONVERSION TABLE
R;32; 
R;45;-
R;46;.
R;64;@
R;95;_
R;48;0
R;49;1
R;50;2
R;51;3
R;52;4
R;53;5
R;54;6
R;55;7
R;56;8
R;57;9
R;65;A
R;66;B
R;67;C
R;68;D
R;69;E
R;70;F
R;71;G
R;72;H
R;73;I
R;74;J
R;75;K
R;76;L
R;77;M
R;78;N
R;79;O
R;80;P
R;81;Q
R;82;R
R;83;S
R;84;T
R;85;U
R;86;V
R;87;W
R;88;X
R;89;Y
R;90;Z
R;97;a
R;98;b
R;99;c
R;100;d
R;101;e
R;102;f
R;103;g
R;104;h
R;105;i
R;106;j
R;107;k
R;108;l
R;109;m
R;110;n
R;111;o
R;112;p
R;113;q
R;114;r
R;115;s
R;116;t
R;117;u
R;118;v
R;119;w
R;120;x
R;121;y
R;122;z
:EOF
