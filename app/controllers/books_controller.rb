class BooksController < ApplicationController
  before_action :validates_new, only: :create# 本の登録のバリデーション

  def index
    @books = Book.includes(:user).page(params[:page]).per(4).order("created_at DESC")
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
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

  def check
    book = Book.find(params[:id])
  end

  def destroy
    if @book.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :check
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      @book.update(book_params)
    else
      render :edit
  end

def validates_new
  @book = Book.new(
    title: book_params[:title], 
    user_id: current_user.id)
  render '/books/new' unless @book.valid?
end
  
  private
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
      .merge(book_id: params[:book_id])
  end

