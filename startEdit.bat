:: GitHub�̃����[�g���|�W�g����V�K�쐬����
:: 
:: ���|�W�g�����͂��̃t�@�C���̐e�f�B���N�g�����ɂȂ�B
:: ���|�W�g�����Ɏg����͔̂��p�p������._-�̋L���̂݁B
:: ���A�ȉ��̕ϐ���ύX���邱�ƁB
:: 
:: GITHUB_USER		���[�U��
:: GITHUB_TOKEN		AccessToken(scope��`repo`�����邱��)
:: REPO_DESC		���|�W�g��������
:: REPO_HOME		���|�W�g��Homepage
:: 
@echo off
set GITHUB_USER=YourUsername
set GITHUB_TOKEN=YourToken

for %%I in (.) do set REPO_NAME=%%~nI%%~xI
set REPO_DESC=���|�W�g���̐��������Đݒ肵�܂��B
set REPO_HOME=https://www.yahoo.co.jp

call GiHubApi.Repository.Edit.bat %GITHUB_USER% %GITHUB_TOKEN% %REPO_NAME% %REPO_DESC% %REPO_HOME%
@echo on
