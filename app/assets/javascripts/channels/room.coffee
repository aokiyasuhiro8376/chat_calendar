# App.room = App.cable.subscriptions.create "RoomChannel",
#   connected: ->
#     # Called when the subscription is ready for use on the server

#   disconnected: ->
#     # Called when the subscription has been terminated by the server

#   received: (data) ->
#     # Called when there's incoming data on the websocket for this channel

#   speak: ->
#     @perform 'speak'



# 5/8
$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()



document.addEventListener 'turbolinks:load', ->
  if App.room
    App.cable.subscriptions.remove App.room
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#direct_messages').data('room_id') },
    #通信が確立された時
    connected: ->
    #通信が切断された時
    disconnected: ->
    #値を受け取った時

    received: (data) ->
      #投稿を追加
      $('#direct_messages').append data['direct_message']

    #サーバーサイドのspeakアクションにdirect_messageパラメータを渡す
    speak: (direct_message) ->
      @perform 'speak', direct_message: direct_message


  # 5/8
  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()



  $('#chat-input').on 'keypress', (event) ->
    #return キーのキーコードが13
    if event.keyCode is 13
      #speakメソッド,event.target.valueを引数に.
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
      
