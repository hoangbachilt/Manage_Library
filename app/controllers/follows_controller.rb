class FollowsController < ApplicationController
before_action :authenticate_user!
  before_action :user_signed?

  def create
    @book = Book.find(params[:book_id])
    @follow = @book.follows.create(user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to book_path(@book)}
      format.js
    end
  end

  def destroy
    @folow = Follow.find(params[:id])
    @book = @follow.book
    respond_to do |format|
      if @follow.destroy
        format.html {redirect_to book_path(@book)}
        format.js
      end
    end
  end

  private
  def user_signed?
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
