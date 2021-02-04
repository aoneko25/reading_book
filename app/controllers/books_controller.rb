class BooksController < ApplicationController
  before_action :validates_new, only: :create# 本の登録のバリデーション

  def index
    @books = Book.includes(:user).page(params[:page]).per(4).order("created_at DESC")
  end

  def seach
  end

  def show
    @book = Book.find(params[:id])
  end
  

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(
      title: book_params[:title], 
      subtitle: book_params[:subtitle], 
      genre: book_params[:genre], 
      author: book_params[:author], 
      the_publisher: book_params[:the_publisher], 
      issue_date: book_params[:issue_date], 
      language: book_params[:language], 
      page_number: book_params[:page_number], 
      visibility: book_params[:visibility], 
      read_day: book_params[:read_day],
      overview: book_params[:overview], 
      impression: book_params[:impression],
      user_id: current_user.id)
      @book.save
  end
end

  def validates_new
    @book = Book.new(
      title: book_params[:title], 
      author: book_params[:author], 
      the_publisher: book_params[:the_publisher], 
      user_id: current_user.id)
    render '/books/new' unless @book.valid?
  end

  def update
    if @book.update(book_params)
      
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  def destroyed
    @book = Book.find(prams[:id])
    if @book.destroy
      render :edit
    else
      redirect_to destroy(@book)
    end
  end
 

def book_params
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
    :overview,
    :read_day,
    :impression,
    )
end
