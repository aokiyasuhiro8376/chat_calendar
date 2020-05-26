# README

## Chat_Calendar

## このアプリについて
このアプリは、チャット機能付きのカレンダー共有アプリです。 
![Chat_Calendar](/materials/toppage.png)
![Chat_Calendar](/materials/toppage.gif)

## 企画背景　
カレンダー共有アプリを家庭内で使用している中で、予定を入れたにも関わらず「言った言っていない」「見てない、見てよ」の些細な揉め事が時折発生しておりました。
そんな時、チャット機能付きのカレンダー共有アプリを思いつき作成致しました。

### 実装した機能
・ユーザー登録機能　「devise」  
・チャット機能　「ActionCable」   
・カレンダー機能　「Fullcalendar」  

### 使用手順
```
$ git clone https://github.com/aokiyasuhiro8376/chat_calendar.git
```
  ①user登録を行う。  
  ②user同士でroom（部屋）を作る。  
  ③カレンダーにeventを追加する。    
  ④チャットでカレンダーにeventを追加した旨を連絡。  
  →　「言った言っていない」「見てない、見てよ」　は、無くなるはず。  

### 開発環境
・mac OS 10.14.6 Mojave  
・主な言語: Ruby(2.5.1), Rails(5.2.3), jquery, html.erb, scss  
・エディター: VSCode  
・ブラウザ: chrome  

## 改善予定
### 機能、見た目  
・usabilityに優れた構成のviewにする。  
・レスポンシブ対応にする。  

## DB設計

## 本番環境
<http://18.178.61.46>
