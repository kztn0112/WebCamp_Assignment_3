class BooksController < ApplicationController

  def create
   @book =Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "You have created book successfully."
   else
    @books  = Book.page(params[:page]).reverse_order
    @user=current_user
    render:index
   end
  end

  def index
   @books  = Book.page(params[:page]).reverse_order
   @book =Book.new
   @user=current_user
  end

  def show
   @book = Book.find(params[:id])
   @newbook=Book.new
   @user = @book.user
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book)
    flash[:notice] = "You have updated book successfully."
   else
    render:edit
   end
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end

