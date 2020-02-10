<h2 align="center"><a href="https://change-life.herokuapp.com/">あなたの人生を変えた"モノ"</a></h2>

![Image from Gyazo](https://user-images.githubusercontent.com/57389471/73822346-381d4700-4839-11ea-9ac7-8a90e0a88d5b.gif)

<p align="center">
  <a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/57389471/73752345-276ec180-47a4-11ea-8fe1-caf19e125eeb.png" height="45px;" /></a>
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/57389471/73752059-9697e600-47a3-11ea-89c1-47465384c4fb.png" height="40px;" /></a>
  <a href="http://haml.info/"><img src="https://user-images.githubusercontent.com/57389471/73752833-fba00b80-47a4-11ea-96d7-54c5e6808403.png" height="55px;" /></a>
  <a href="https://sass-lang.com/"><img src="https://user-images.githubusercontent.com/57389471/73752910-1a060700-47a5-11ea-90e4-0c95d7e3e4ed.png" height="55px;" /></a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/57389471/73754740-38213680-47a8-11ea-8dc7-9a7dfa30c992.png" height="50px;" /></a>
  <a href="https://www.mysql.com/jp/"><img src="https://user-images.githubusercontent.com/57389471/73753087-6e10eb80-47a5-11ea-8a91-47f816398fcb.png" height="60px;" /></a>
  <a href="https://jp.heroku.com/home"><img src="https://user-images.githubusercontent.com/57389471/73817254-d4d9e780-482d-11ea-9a93-0ac206dabfe9.png" height="50px;" /></a>
</p>

## このアプリについて
買って良かったもの、生活を豊かにしたもの、仕事の生産性が高まったものなどを投稿し共有する写真投稿アプリです。
ユーザー同士がモノを通じて交流したり、人生が豊かになるヒントを得られたり、
ユーザー同士のQOL（Quality of Life）を向上させることができるようなアプリケーションを目指しています。

## URL
https://change-life.herokuapp.com
テスト用アカウント（Email:test@com Password:testtest）

## 主な機能
### ログイン機能
[![Image from Gyazo](https://i.gyazo.com/7e7f690d8310f7a9b9679443f2bb0786.png)](https://gyazo.com/7e7f690d8310f7a9b9679443f2bb0786)
### 投稿機能
[![Image from Gyazo](https://i.gyazo.com/790589ea76ccf6981ccd377c2d9a5d71.jpg)](https://gyazo.com/790589ea76ccf6981ccd377c2d9a5d71)
### コメント投稿機能
[![Image from Gyazo](https://i.gyazo.com/473de173e235133fb9a3cc36c2c67ec7.jpg)](https://gyazo.com/473de173e235133fb9a3cc36c2c67ec7)
### マイページ機能
[![Image from Gyazo](https://i.gyazo.com/868b738d857aba1d1fb496989be98a86.jpg)](https://gyazo.com/868b738d857aba1d1fb496989be98a86)
### 編集・削除機能
[![Image from Gyazo](https://i.gyazo.com/2f8926aac90026ec82127108238c0f20.png)](https://gyazo.com/2f8926aac90026ec82127108238c0f20)
### 投稿検索機能
[![Image from Gyazo](https://i.gyazo.com/e62fe4b7115528cf7d0220f0bbc95f49.jpg)](https://gyazo.com/e62fe4b7115528cf7d0220f0bbc95f49)

## データベース設計
<p align="center">
  <img src="https://user-images.githubusercontent.com/57389471/73816710-a7406e80-482c-11ea-8de9-ec639c265f7c.png" width=60%>
</p>

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|image|text|null: false|
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many   :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|post_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post
