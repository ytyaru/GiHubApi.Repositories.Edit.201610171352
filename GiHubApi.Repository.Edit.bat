:: ���������[�g���|�W�g���̐�����HomepageURL��ύX����
:: 
:: �����ꗗ
:: %1 GITHUB_USER	���[�U��
:: %2 GITHUB_TOKEN	AccessToken(scope��`repo`�����邱��)
:: %3 REPO_NAME		���|�W�g����
:: %4 REPO_DESC		���|�W�g��������
:: %5 REPO_HOME		���|�W�g��Homepage
:: 
:: �o�̓t�@�C���ꗗ
:: GitHub.%GITHUB_USER%.%REPO_NAME%.json	GitHubAPI�̉���
set GITHUB_USER=%1
set GITHUB_TOKEN=%2
set REPO_NAME=%3
set REPO_DESC=%4
set REPO_HOME=%5

:question
echo �ΏہF%GITHUB_USER%/%REPO_NAME%
echo �����F%REPO_DESC%
echo URL �F%REPO_HOME%
SET /P ANSWER="��L�̒ʂ�A���|�W�g���̐�����URL���Đݒ肵�܂��B��낵���ł����H(Y/N)"
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

:: POST����p�����[�^��UTF-8�ɂ��邽�߂ɊO���t�@�C��������
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
echo �Đݒ肵�܂����B
pause
exit

:no
echo �Đݒ肹���I�����܂��B
pause
exit
