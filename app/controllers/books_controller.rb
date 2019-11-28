class BooksController < ApplicationController
  before_action :set_ransack
  
  def index
    @books = @q.result.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @request_detail = @book.request_details.new
    @comments = @book.comments.root_comments
    @comment = @book.comments.build(user_id: current_user.try(:id))
  end

  private
  def set_ransack
    @q = Book.ransack(params[:q])
  end

  def user_signed?
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
