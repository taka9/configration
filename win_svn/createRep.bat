@echo off

echo -----------------------------------------------------
echo ���|�W�g���̍쐬���s���܂�
echo ���|�W�g����V�K�f�B���N�g���̔z���ɋN�������ꍇ
echo �V�K�f�B���N�g�����쐬���Ă��烊�|�W�g���̍쐬���s���Ă��������B
echo;
echo ��j.\test\rep (test �f�B���N�g���̉��� rep ���|�W�g�����쐬)
echo     test �f�B���N�g�������݂��Ȃ��ꍇ�́A���O�� test ���쐬
echo     ���|�W�g�����Ɂutest/rep�v�����
echo -----------------------------------------------------
echo;
set /P REPNAME="���|�W�g��������͂��Ă�������: "

if exist %REPNAME% (
  echo ���łɃ��|�W�g�������݂��Ă��܂��B
  pause
  exit
)

svnadmin create %REPNAME%
cd %REPNAME%

svn mkdir file://localhost/c:/svnrep/%REPNAME%/trunk -m "mkdir trunk"
svn mkdir file://localhost/c:/svnrep/%REPNAME%/tags -m "mkdir tags"
svn mkdir file://localhost/c:/svnrep/%REPNAME%/branches -m "mkdir branches"

echo;
echo -----------------------------------------------------
echo ���|�W�g�����J�̎菇���������Ă��܂���
echo C:\Apache2.2\conf\httpd.conf �ɐݒ���s���Ă��������B
echo;
echo �܂� backup.bat �Ƀo�b�N�A�b�v�̋L�q���s���Ă��������B
echo -----------------------------------------------------

pause