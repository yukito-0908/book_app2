class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_new = Book.new
  end

  def new
  end

  def create
    @book = Book.new(list_params)
    @book.user_id = current_user.id
  if @book.save
    redirect_to book_path(@book.id)
  else
    redirect_to books_path
  end
  end


  def delete
    @book = Book.find(params[:id])
  if  @book.destroy
    redirect_to books_index_path
  end
  end

  def edit
  end

  private

  def list_params
    params.require(:book).permit(:title, :body,:user_id)
  end
end
