@echo off

echo -----------------------------------------------------
echo リポジトリの作成を行います
echo リポジトリを新規ディレクトリの配下に起きたい場合
echo 新規ディレクトリを作成してからリポジトリの作成を行ってください。
echo;
echo 例）.\test\rep (test ディレクトリの下に rep リポジトリを作成)
echo     test ディレクトリが存在しない場合は、事前に test を作成
echo     リポジトリ名に「test/rep」を入力
echo -----------------------------------------------------
echo;
set /P REPNAME="リポジトリ名を入力してください: "

if exist %REPNAME% (
  echo すでにリポジトリが存在しています。
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
echo リポジトリ公開の手順が完了していません
echo C:\Apache2.2\conf\httpd.conf に設定を行ってください。
echo;
echo また backup.bat にバックアップの記述を行ってください。
echo -----------------------------------------------------

pause