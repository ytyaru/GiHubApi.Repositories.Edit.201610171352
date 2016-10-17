:: GitHubのリモートリポジトリを新規作成する
:: 
:: リポジトリ名はこのファイルの親ディレクトリ名になる。
:: リポジトリ名に使えるのは半角英数字と._-の記号のみ。
:: 他、以下の変数を変更すること。
:: 
:: GITHUB_USER		ユーザ名
:: GITHUB_TOKEN		AccessToken(scopeに`repo`があること)
:: REPO_DESC		リポジトリ説明文
:: REPO_HOME		リポジトリHomepage
:: 
@echo off
set GITHUB_USER=YourUsername
set GITHUB_TOKEN=YourToken

for %%I in (.) do set REPO_NAME=%%~nI%%~xI
set REPO_DESC=リポジトリの説明文を再設定します。
set REPO_HOME=https://www.yahoo.co.jp

call GiHubApi.Repository.Edit.bat %GITHUB_USER% %GITHUB_TOKEN% %REPO_NAME% %REPO_DESC% %REPO_HOME%
@echo on
