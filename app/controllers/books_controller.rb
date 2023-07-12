class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(currnet_user.id)
  end

  def index
    @user = User.find(params[:id])
    
    @books = @user.books
  end

  def show
  end
  
  private
  
  def books
    params.require(:book).permit(:title, :body)
  end
end
