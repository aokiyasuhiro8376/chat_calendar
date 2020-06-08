# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_room, only: [:index, :new, :show, :edit]
  before_action :set_event, only: [:show, :edit, :update, :destroy] #パラメータのidからレコードを特定するメソッド
  before_action :move_to_index, except: [:index]


  def index
    @users = User.where.not(id: current_user)
  end

  def show
    # RoomsController
    # @room = Room.find(params[:id])
    # ルームが作成されているかどうか
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @direct_messages = @room.direct_messages #このルームのメッセージを全て取得
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end

    # EventsController
    @events = Event.where(room_id: @room.id)
  end

  def new
    @event = Event.new
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
      respond_to do |format|
      if @event.save
      #   redirect_to template: 'rooms/show' and return
      # else
      #   redirect_to action: :show 
          format.html { redirect_to template: 'rooms/show', location: @event }
          format.json { render :show, status: :created, location: @event }
      else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
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
  def set_room
    @room = Room.find_by(params[:id])
  end

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
