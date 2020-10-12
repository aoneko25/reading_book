class InformationController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @books = current_user.books.page(params[:page]).per(3).order("created_at DESC")
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy if book.user_id == current_user.id
        book.destroy
  end

  def destroyed
  end
  
end
