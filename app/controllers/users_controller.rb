class UsersController < ApplicationController
  def index
   @users  = User.page(params[:page]).reverse_order
   @user =current_user
   @book=Book.new
  end

  def show
    @user= User.find(params[:id])
    @book=Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user!=current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
     flash[:notice] = "You have updated user successfully."
    else
     render:edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
