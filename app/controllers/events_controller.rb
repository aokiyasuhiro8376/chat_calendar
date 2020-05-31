# frozen_string_literal: true

# class EventsController < ApplicationController
#   def create
#     event = Event.new(event_params)
#     event.save!
#     @events = Event.where(user_id: current_user.id)
#   end

#   def update
#     event = Event.find(params[:id])
#     @events = Event.where(user_id: current_user.id)
#     event.update(event_params)
#   end

#   def destroy
#     @user = User.find(params[:id])
#     event = Event.find(params[:id])
#     event.destroy
#     redirect_to user_path(@user)
#   end

#   private
#   def event_params
#     params.require(:event).permit(:title, :start, :end, :user_id, :body)
#   end
# end

# class EventsController < ApplicationController
#   before_action :authenticate_user!, except: [:index]
#   before_action :set_event, only: %i[update destroy] # パラメータのidからレコードを特定するメソッド
#   # before_action :set_room, only: %i[index update destroy] # パラメータのidからレコードを特定するメソッド


#   def index
#     # @user = User.find_by(params[:id])
#     # @room = Room.find_by(params[:id]) #ルーム情報の取得

#     # @events = Event.find(room_id: @room.id == current_user.@room.id)

#     respond_to do |format|
#       format.html # index.html.erb
#       format.xml { render xml: @events }
#       format.json { render json: @events }
#     end

#     render template: 'events/_index'
#     # render template: './rooms/show'

#   end

#   def show
#     @event = Event.find(params[:id])
#   end

#   def new
#     @event = Event.new
#     @user = User.find_by(params[:id])
#     @room = Room.find_by(params[:id]) #ルーム情報の取得
#     # render template: 'events/_new'

#   end

#   def edit
#     @event = Event.find_by(params[:id])
#   end

#   def create
#     @event = Event.new(event_params)
#     @event.save!
#     @events = Event.where(user_id: current_user.id)

#     @user = User.find_by(params[:id])
#     @room = Room.find(params[:id]) #ルーム情報の取得
#     respond_to do |format|
#       if @event.save
#         format.html { redirect_to room_path(@room.id) }
#           # redirect_to @event, notice: 'Event was successfully created.' }
#         format.json { render :show, status: :created, location: @event }
#       else
#         format.html { render :new }
#         format.json { render json: @event.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def update
#     respond_to do |format|
#       if @event.update(event_params)
#         format.html { redirect_to @event, notice: 'Event was successfully updated.' }
#         format.json { render :show, status: :ok, location: @event }
#       else
#         format.html { render :edit }
#         format.json { render json: @event.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def destroy
#     @event.destroy
#     respond_to do |format|
#       format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#   def set_event
#     @event = Event.find(params[:id])
#   end

#   # def set_room
#   #   @room = Room.find(params[:id])
#   # end

#   # def set_current_user
#   #   @current_user = User.find(params[:id])
#   # end

#   def event_params
#     params.require(:event).permit(:title, :start_date, :end_date, :user_id, :room_id).meage(user_id: current_user.id, room_id: @room.id)
#   end
# end






class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy] #パラメータのidからレコードを特定するメソッド
  before_action :set_room, only: [:index, :create, :update] #パラメータのidからレコードを特定するメソッド

  def index
    # @events = Event.all

    @events = Event.where(room_id: @room.id)


    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml { render :xml => @events }
    #   format.json { render :json => @events }
    # end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        # redirect_to action: :show 
        redirect_to room_path(@room.id)
        # redirect_to template: 'rooms/show' and return 



      #   format.html { redirect_to template: 'rooms/show', location: @event }
      #   format.json { render :show, status: :created, location: @event }
      # else
      #   format.html { render :new }
      #   format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to template: 'rooms/show', location: @event }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def set_room
    @room = Room.find_by(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :color, :allday, :user_id, :room_id).merge(user_id: current_user.id, room_id: @room.id)
  end
end
