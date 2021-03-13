class BooksController < ApplicationController
  def index
    @users =  User.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_new = Book.new
  end

  def new
  　@book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_new = Book.new
    @book = Book.new
  end

  def create
    @book_new = Book.new
    @books = Book.all
    @user = current_user
    @book = Book.new(list_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:success] = "You have created book successfully."
    redirect_to book_path(@book.id)
  else
    render:new
  end
  end


  def delete
    @book = Book.find(params[:id])
  if  @book.destroy
    redirect_to books_path
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
  if  @book.update(list_params)
    redirect_to book_path(@book.id)
  else
    render:edit
  end
  end

  private

  def list_params
    params.require(:book).permit(:title, :body,:user_id)
  end
end
