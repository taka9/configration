@echo off
echo �o�b�N�A�b�v���J�n���܂��B

set BACKUP_DIR=F:\BackUp\svnrep\

rem ---------------------------------
rem GenkoSystem_App �̃o�b�N�A�b�v
rem ---------------------------------
set REPNAME=GenkoSystem_App
IF EXIST %BACKUP_DIR%%REPNAME%.dmp (
  ren %BACKUP_DIR%%REPNAME%.dmp %REPNAME%.dmp.bak
)
svnadmin dump C:\svnrep\GenkoSystem\%REPNAME% > %BACKUP_DIR%\%REPNAME%.dmp

IF EXIST %BACKUP_DIR%%REPNAME%.dmp.bak (
  del %BACKUP_DIR%%REPNAME%.dmp.bak
)

rem ---------------------------------
rem GenkoSystem_Web �̃o�b�N�A�b�v
rem ---------------------------------
set REPNAME=GenkoSystem_Web
IF EXIST %BACKUP_DIR%%REPNAME%.dmp (
  ren %BACKUP_DIR%%REPNAME%.dmp %REPNAME%.dmp.bak
)
svnadmin dump C:\svnrep\GenkoSystem\%REPNAME% > %BACKUP_DIR%\%REPNAME%.dmp

IF EXIST %BACKUP_DIR%%REPNAME%.dmp.bak (
  del %BACKUP_DIR%%REPNAME%.dmp.bak
)

rem ---------------------------------
rem GenkoSystem_Tools �̃o�b�N�A�b�v
rem ---------------------------------
set REPNAME=GenkoSystem_Tools
IF EXIST %BACKUP_DIR%%REPNAME%.dmp (
  ren %BACKUP_DIR%%REPNAME%.dmp %REPNAME%.dmp.bak
)
svnadmin dump C:\svnrep\GenkoSystem\%REPNAME% > %BACKUP_DIR%\%REPNAME%.dmp

IF EXIST %BACKUP_DIR%%REPNAME%.dmp.bak (
  del %BACKUP_DIR%%REPNAME%.dmp.bak
)

echo �o�b�N�A�b�v���������܂����B