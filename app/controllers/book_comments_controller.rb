class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    BookComment.create(user_id: current_user.id, book_id: @book.id, content: params[:book_comment][:content])
    @book_comment = BookComment.new
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
    @book_comment = BookComment.new
  end
end
