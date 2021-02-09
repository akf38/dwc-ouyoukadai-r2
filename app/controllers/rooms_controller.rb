class RoomsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @room = Room.create
    @joinCurrentUser = Entry.create(user_id: current_user.id, room_id: @room.id)
    @joinUser = Entry.create(user_id: @user.id, room_id: @room.id)
    redirect_to room_path(@room.id)
  end
  
  def show
    @message = Message.new
    @room = Room.find(params[:id])
    @room.users.each do |u|
      unless u == current_user
        @user = u
      end
    end
  end
  
end
