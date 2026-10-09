@echo off
rem Usage:  run.bat          play a scripted conversation
rem         run.bat chat     talk to the assistant in the terminal
rem         run.bat web      chat in the browser at http://127.0.0.1:8000
rem         run.bat test     run the unit tests
setlocal
cd /d "%~dp0"
chcp 65001 >nul
set PYTHONIOENCODING=utf-8

set PY=python
where python >nul 2>nul || set PY=py -3
%PY% --version >nul 2>nul
if errorlevel 1 (
  echo Python 3.9 or newer is required. Install it from https://www.python.org/downloads/
  exit /b 1
)

if "%1"=="chat" (
  %PY% -m jewel_assistant chat
  exit /b %errorlevel%
)
if "%1"=="web" (
  %PY% -m jewel_assistant web
  exit /b %errorlevel%
)
if "%1"=="test" (
  %PY% -m unittest discover -s tests -v
  exit /b %errorlevel%
)
%PY% -m jewel_assistant demo
exit /b %errorlevel%
