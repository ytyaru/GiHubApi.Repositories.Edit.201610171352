# このソフトウェアについて #

GiHubApi.Repositories.Edit.201610171352は私個人が学習目的で作成したソフトウェアである。

リモートリポジトリの説明とURLを再設定するバッチ。

# 開発環境 #

* Windows XP Pro SP3 32bit
    * cmd.exe
* curl.exe
    * 7.24.0

## WebService ##

* [GitHub](https://github.com/)

# 手順

## 準備

1. [GitHubアカウントを取得すること](https://github.com/join)
1. [AccessTokenを取得すること](https://github.com/settings/tokens)
1. AccessTokenのscopeで`repo`をチェックすること

以上でこのバッチで使うユーザ名とAccessTokenを取得できる。

## 実行

あらかじめリポジトリを作成しておいてから、このバッチを実行する。

1. 再設定したいリモートリポジトリ名のディレクトリに`GiHubApi.Repository.Edit.bat`を配置する
1. `startEdit.bat`をテキストエディタで開く
1. `GITHUB_USER`にユーザ名、`GITHUB_TOKEN`にAccessToken、`REPO_DESC`に説明文、`REPO_HOME`にURLをセットし保存する
1. `startEdit.bat`をダブルクリックして実行する
1. GitHubからリモートリポジトリが指定したとおりに再設定されていることを確認する

# ライセンス #

このソフトウェアはCC0ライセンスです。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
