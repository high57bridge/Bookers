class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books/index'
  end
  
  def create
    @book = Book.index(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created." 
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book was posting failed."
      render :index
    end
  end

  def index
    @book = Book.index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
  
    def back
      book = Book.new(book_params)
      book.back
      redirect_to '/books/index'
    end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
