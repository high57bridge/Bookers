class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created." 
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book was posting failed."
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
    def back
      book = Book.find(params[:id])
      book.back
      redirect_to '/books'
    end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated." 
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book was updating failed."
      render :index
    end
  end
  
  def start
    redirect_to '/books'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end