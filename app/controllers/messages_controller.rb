class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    Message.create(user_id: current_user.id, room_id: @room.id, message: params[:message][:message])
    @message = Message.new
    @user = User.find(params[:user_id])
  end
end
