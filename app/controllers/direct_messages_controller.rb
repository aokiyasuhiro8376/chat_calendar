# frozen_string_literal: true

# class DirectMessagesController < ApplicationController
#   before_action :authenticate_user!, only: [:create]

#   def create
#     if Entry.where(user_id: current_user.id, room_id: params[:content][:room_id]).present?
#       @direct_message = DirectMessage.create(params.require(:direct_message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
#       redirect_to "/rooms/#{@direct_message.room_id}"
#     else
#       redirect_back(fallback_location: root_path)
#     end
#   end
# end
