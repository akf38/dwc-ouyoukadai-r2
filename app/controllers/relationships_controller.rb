class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    Relationship.create(follower_id: current_user.id, followed_id: @user.id)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: @user.id)
    @relationship.destroy
  end
  
end
