# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :set_room, only: [:show]
  before_action :set_event, only: [:show, :edit, :update, :destroy] #パラメータのidからレコードを特定するメソッド
  before_action :move_to_index, except: [:index]


  def index
    @users = User.where.not(id: current_user)
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
    # render template: "users/index"
    # @room = Room.find(params[:id]) #ルーム情報の取得
  end

  def show
    # RoomsController
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

    # # UsersController
    # @user = User.find(params[:id])
    # # チャット
    # # if user_signed_in?
    # # Entry内のuser_idがcurrent_userと同じEntry
    # @currentUserEntry = Entry.where(user_id: current_user.id)
    # # Entry内のuser_idがMYPAGEのparams.idと同じEntry
    # @userEntry = Entry.where(user_id: @user.id)
    # # @user.idとcurrent_user.idが同じでなければ
    # unless @user.id == current_user.id
    #   @currentUserEntry.each do |cu|
    #     @userEntry.each do |u|
    #       # もしcurrent_user側のルームidと＠user側のルームidが同じであれば存在するルームに飛ぶ
    #       if cu.room_id == u.room_id
    #         @isRoom = true
    #         @roomId = cu.room_id
    #       end
    #     end
    #   end
    #   # ルームが存在していなければルームとエントリーを作成する
    #   unless @isRoom
    #     @room = Room.new
    #     @entry = Entry.new
    #   end
    # end

    # EventsController
    @events = @room.events #このルームのメッセージを全て取得
    # @events = Event.where(room_id: @room.id)
    # render template: 'events/index'

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

    # EventsController
    @event = Event.new(event_params)
    if @event.save
      # redirect_to template: 'events/index'
      # redirect_to template: 'rooms/show' and return
      redirect_to room_path(@room.id)
      # redirect_to action: :show 
      # redirect_to '/rooms/:id'

    else
      redirect_to action: :show 



    # respond_to do |format|
    #   if @event.save
        # redirect_to action: :show 
        # redirect_to '/rooms/:id'
        # redirect_to room_path(@room.id)

        # redirect_to template: 'rooms/show' and return 



      #   format.html { redirect_to template: 'rooms/show', location: @event }
      #   format.json { render :show, status: :created, location: @event }
      # else
      #   format.html { render :new }
      #   format.json { render json: @event.errors, status: :unprocessable_entity }
      # end
    # end
    end
  
    # render template: 'events/index'
    # redirect_to action: :show 
  end

  def destroy
    # @room.destroy
    room = Room.find_by(params[:id])
    room.destroy
    redirect_to users_rooms_path

    # EventsController
    @event.destroy
    respond_to do |format|
      format.html { redirect_to room_path(@room.id), location: @event }
      # events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # def set_room
  #   @room = Room.find_by(params[:id])
  # end

  def set_event
    @event = Event.find_by(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :color, :allday, :user_id, :room_id).merge(user_id: current_user.id, room_id: @room.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
