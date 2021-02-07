class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    current_user.favorites.create(book_id: @book.id)
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    @favorite.destroy
  end
end
