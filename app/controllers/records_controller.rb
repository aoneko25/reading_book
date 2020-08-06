class RecordsController < ApplicationController
  def index
    @books = Book.new
  end

  def create
    Book.create(books_params)
  end
end
