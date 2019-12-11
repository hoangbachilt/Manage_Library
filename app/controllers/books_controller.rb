class BooksController < ApplicationController
  before_action :set_ransack
  
  def index
    @books = Book.paginate(page: params[:page])
    @book_ids = Like.group(:book_id).count.sort_by{|x| x[1].to_i}.reverse.collect{|x| x[0]}

    # @request_detail = current_request_borrow.request_details.new
  end

  def show
    @book = Book.find(params[:id])
    @request_detail = @book.request_details.build(cart_id: @current_cart.try(:id))
    @comments = @book.comments.root_comments.order(created_at: :desc)
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
