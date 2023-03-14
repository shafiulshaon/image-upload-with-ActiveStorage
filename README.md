# 写真管理アプリ

写真管理アプリはRuby on Railsアプリケーションで、ユーザーが自分の写真をアップロードし、管理することができます。ユーザーはログインして、アカウントに写真をアップロードできます。アップロードした写真を一覧で表示したり、OAuthを使用して外部のTwitterアプリとアカウントを接続したりすることもできます。

## スタートガイド

### 必要条件

このアプリを実行するには、以下が必要です。

- Ruby 2.7.4以上
- Ruby on Rails 6.1.4以上
- SQLite 3または互換性のあるデータベース

### インストール

アプリをインストールするには、以下の手順に従ってください。

1. リポジトリをクローンします。

`git clone https://github.com/shafiulshaon/photo-management-app.git`

2. 依存関係をインストールします。

`cd photo-management-app`

`bundle install`

3. データベースをセットアップします。

`rails db:migrate`

4. （オプション）いくつかのサンプルデータを使用してデータベースをシードします。

`rails db:seed`

その後、Webブラウザを開き、http://localhost:3000/ にアクセスします。

## 使い方

### ログイン

アカウントにログインするには、ログインページでユーザー名とパスワードを入力し、「ログイン」ボタンをクリックします。認証情報が有効な場合、画像一覧ページにリダイレクトされます。

### 画像のアップロード

画像をアップロードするには、画像一覧ページの「画像をアップロード」ボタンをクリックします。画像アップロードフォームにリダイレクトされ、画像のタイトルを入力し、アップロードするファイルを選択できます。フォームを送信すると、画像がアカウントに保存され、画像一覧ページにリダイレクトされます。

### 画像の表示

画像一覧ページでは、アップロードしたすべての画像の一覧を表示できます。各画像は、タイトルとサムネイルプレビューが表示されます。

### MyTweetAppとの連携

外部のテストTwitterアプリをOAuthを使ってあなたのアカウントに接続するには、画像リストページの"MyTweetAppと連携"ボタンをクリックしてください。すると、外部アプリの承認ページにリダイレクトされ、テストTwitterアカウントへのアクセス許可を許可することができます。許可を与えた後、フォトマネジメントアプリにリダイレクトされ、テストTwitterアカウントがあなたのアカウントにリンクされます。これにより、フォトマネジメントアプリから直接画像のタイトルとURLを含むツイートを投稿することができます。
