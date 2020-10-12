class BooksController < ApplicationController

  def home
    @books = Book.includes(:user).page(params[:page]).per(4).order("created_at DESC")
  end
  
  def show
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
  end

  def record
    @books = Book.new
  end

  def create
    @book = Book.create(
      visibility: books_params[:visibility], 
      genre: books_params[:genre], 
      title: books_params[:title], 
      subtitle: books_params[:subtitle], 
      language: books_params[:language], 
      author: books_params[:author], 
      the_publisher: books_params[:the_publisher], 
      issue_date: books_params[:issue_date], 
      page_number: books_params[:page_number], 
      format: books_params[:format], 
      overview: books_params[:overview], 
      chapter: books_params[:chapter],
      volume: books_params[:volume],
      episode: books_params[:episode],
      read_day: books_params[:read_day],
      impression: books_params[:impression],
      user_id: current_user.id)
      
  end
end

  def seach
  end

  def details
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
  end
 
  def destroy
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
    book.destroy if book.user_id == current_user.id
        book.destroy
    end

  def edit
    @user = User.find(params[:user_id])
    @books = Book.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    book = Book.find(params[:id])
      if book.user_id == current_user.id
        book.update(book_params)
      end
  end

def books_params
  params.require(:book).permit(
    :visibility,
    :genre,
    :title, 
    :subtitle, 
    :language,
    :author,
    :the_publisher,
    :issue_date,
    :page_number,
    :format,
    :overview,
    :chapter,
    :volume,
    :episode ,
    :read_day,
    :impression,
    )
end
