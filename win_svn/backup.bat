@echo off
echo バックアップを開始します。

set BACKUP_DIR=F:\BackUp\svnrep\

rem ---------------------------------
rem GenkoSystem_App のバックアップ
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
rem GenkoSystem_Web のバックアップ
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
rem GenkoSystem_Tools のバックアップ
rem ---------------------------------
set REPNAME=GenkoSystem_Tools
IF EXIST %BACKUP_DIR%%REPNAME%.dmp (
  ren %BACKUP_DIR%%REPNAME%.dmp %REPNAME%.dmp.bak
)
svnadmin dump C:\svnrep\GenkoSystem\%REPNAME% > %BACKUP_DIR%\%REPNAME%.dmp

IF EXIST %BACKUP_DIR%%REPNAME%.dmp.bak (
  del %BACKUP_DIR%%REPNAME%.dmp.bak
)

echo バックアップが完了しました。