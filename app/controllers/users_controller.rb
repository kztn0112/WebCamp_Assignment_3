class UsersController < ApplicationController
  def show
    @book= Book.find(params[:id])
  end

  def edit
  end
end
