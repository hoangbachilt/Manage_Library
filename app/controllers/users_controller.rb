class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
    @q = Book.ransack(params[:q])
  end
end
