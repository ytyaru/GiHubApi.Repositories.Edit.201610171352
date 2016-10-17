:: 既存リモートリポジトリの説明やHomepageURLを変更する
:: 
:: 引数一覧
:: %1 GITHUB_USER	ユーザ名
:: %2 GITHUB_TOKEN	AccessToken(scopeに`repo`があること)
:: %3 REPO_NAME		リポジトリ名
:: %4 REPO_DESC		リポジトリ説明文
:: %5 REPO_HOME		リポジトリHomepage
:: 
:: 出力ファイル一覧
:: GitHub.%GITHUB_USER%.%REPO_NAME%.json	GitHubAPIの応答
set GITHUB_USER=%1
set GITHUB_TOKEN=%2
set REPO_NAME=%3
set REPO_DESC=%4
set REPO_HOME=%5

:question
echo 対象：%GITHUB_USER%/%REPO_NAME%
echo 説明：%REPO_DESC%
echo URL ：%REPO_HOME%
SET /P ANSWER="上記の通り、リポジトリの説明とURLを再設定します。よろしいですか？(Y/N)"
if "%answer%"=="y" (
  call :yes
) else if "%answer%"=="Y" ( 
  call :yes
) else if "%answer%"=="n" ( 
  call :no
) else if "%answer%"=="N" ( 
  call :no
)else (
  call :question
)
exit

:yes
set HDR_TIMEZONE="Time-Zone: Asia/Tokyo"
set HDR_AUTHOR="Authorization: token %GITHUB_TOKEN%"
set HDR_CONTENT_TYPE="Content-Type: application/json; charset=utf-8"
set RESPONSE="GitHub.%GITHUB_USER%.%REPO_NAME%.Edit.json"
set CURL_PEM="C:\Program Files\Git\ssl\certs\cacert.pem"

:: POSTするパラメータをUTF-8にするために外部ファイル化する
set POST_PARAM={"name":"%REPO_NAME%","description":"%REPO_DESC%","homepage":"%REPO_HOME%"}
set POST_PARAM_CP932=post.cp932.json
set POST_PARAM_UTF8=post.utf8.json
echo %POST_PARAM% > %POST_PARAM_CP932%
if exist %POST_PARAM_UTF8% del %POST_PARAM_UTF8%
copy %POST_PARAM_CP932% %POST_PARAM_UTF8%
nkf -w --overwrite %POST_PARAM_UTF8%

curl --cacert %CURL_PEM% -o %RESPONSE% -H %HDR_CONTENT_TYPE% -H %HDR_TIMEZONE% -H %HDR_AUTHOR% -X PATCH https://api.github.com/repos/%GITHUB_USER%/%REPO_NAME% --data-binary @%POST_PARAM_UTF8%

::del %POST_PARAM_CP932%
::del %POST_PARAM_UTF8%
echo 再設定しました。
pause
exit

:no
echo 再設定せず終了します。
pause
exit
