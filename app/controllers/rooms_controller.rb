# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_room, only: [:show, ]
  before_action :move_to_index, except: [:index]


  def index
    @users = User.all
    # @user = current_user
    # @currentEntries = current_user.entries
    # # @currentEntriesのルームを配列にする
    # myRoomIds = []
    # @currentEntries.each do |entry|
    #   myRoomIds << entry.room.id
    # end
    # # @currentEntriesのルーム且つcurrent_userでないEntryを新着順で取ってくる
    # @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: @user.id).order(created_at: :desc)
    # @direct_messages = @room.direct_messages
    # @anotherEntries = DirectMessage.where(room_id: myRoomIds)
    # @direct_messages = DirectMessage.where(room_id: myRoomIds)
    render template: "users/index"
    # @room = Room.find(params[:id]) #ルーム情報の取得
  end

  def show
    @room = Room.find_by(params[:id])
    # ルームが作成されているかどうか
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @direct_messages = @room.direct_messages #このルームのメッセージを全て取得
      @entries = @room.entries
      # @room = Room.find(params[:id])
      # @direct_message = DirectMessage.new #新規メッセージ投稿
      # @direct_messages = @room.direct_messages #このルームのメッセージを全て取得
    else
      redirect_back(fallback_location: root_path)
    end

    @events = Event.where(room_id: @room.id)
    # render template: "events/index"

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml { render xml: @events }
    #   format.json { render json: @events }
    # end
    # render template: 'shared/_header'
    # render template: 'events/_index'
    # render template: 'events/index'
    # redirect_to action: :show 

  end

  def create
    @room = Room.create(name: "Chat room")
    # entryにログインユーザーを作成
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    # entryにparamsユーザーを作成
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    # redirect_to room_path(@room.id)

    # render template: 'events/index'
    # redirect_to action: :show 
  end

  def destroy
    # @room.destroy
    room = Room.find_by(params[:id])
    room.destroy
    redirect_to users_rooms_path
  end


  private
  def set_room
    @room = Room.find_by(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
