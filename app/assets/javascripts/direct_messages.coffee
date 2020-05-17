# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

direct_message = direct_message.user_id
dm_user = document.getElementById('current_user')
current_user = dm_user.getAttribute('data-id')
if ('direct_message' == 'current_user')
  $('p.' + direct_message.id).css 'text-align', 'right'
else
  $('p.' + direct_message.id).css 'text-align', 'left'


# javascripts
# # メッセージのユーザーidを取ってくる
# var direct_message = <%= direct_message.user.id %>;
# # id="current_user"の内容を取得
# var dm_user = document.getElementById('current_user');
# # dm_userのdata-idを取得する
# var current_user = dm_user.getAttribute('data-id')
# # dm_userがログインユーザーであれば右に表示する
# if(direct_message == current_user){
#   $('p.' + <%= direct_message.id %>).css('text-align', 'right');
# }else{
#   $('p.' + <%= direct_message.id %>).css('text-align', 'left');
# }
