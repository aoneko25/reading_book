class BooksController < ApplicationController
  def index
    @books = Book.new
  end

  def create
    Book.create(books_params)
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
     :impression,)
end
