# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

element = document.getElementById('target')
# 移動させたい位置の要素を取得
rect = element.getBoundingClientRect()
position = rect.top
setTimeout ->
  scrollTo 0, position
  return
, 1000

# javascripts
# # //トークルーム遷移時に入力フォーム記載場所にスクロールする(最新トークは下にあるため)
# var element = document.getElementById('target'); // 移動させたい位置の要素を取得
# var rect = element.getBoundingClientRect();
# var position = rect.top;
# setTimeout( function() {
#   scrollTo(0, position);}
#     , 1000);

