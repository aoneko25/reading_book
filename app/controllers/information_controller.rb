class InformationController < ApplicationController

  def show
    @nickname = current_user.nickname
    @book = Book.where(user_id: current_user.id).order("created_at DESC")
  end
end
