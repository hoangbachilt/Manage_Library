class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed?
  before_action :find_book, only: [:create, :destroy]
  before_action :find_like, only: [:destroy]
  def create
    @like = @book.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to book_path(@book)}
      format.js
    end
  end

  def destroy
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

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_like
   @like = @book.likes.find(params[:id])
  end
end
