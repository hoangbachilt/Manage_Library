class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed?

  def create
    @book = Book.find(params[:book_id])
    @like = @book.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to book_path(@book)}
      format.js
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @book = @like.book
    respond_to do |format|
      if @like.destroy
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
