class RequestBorrowsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed?

  def index
    @request_borrows = current_user.request_borrows.page(params[:page]).order(created_at: :desc)
  end

  def show
    @request_borrow = RequestBorrow.find(params[:id])
  end

  def new
    @request_borrow = RequestBorrow.new    
  end

  def create
    @request_borrow = current_user.request_borrows.build(request_borrow_params)
    @current_cart.request_details.each do |request_detail|
      @request_borrow.request_details << request_detail
      request_detail.cart_id = nil
    end
    @request_borrow.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
    flash[:success] = "Successfully create"
  end

  # def edit
  #   @request_borrow = @current_cart
  # end

  # def update
  #   @request_borrow = @current_cart
  #   @request_borrow.update_attributes(request_borrow_params)
  #   if @request_borrow.status == 1
  #     session[:request_borrow_id] = nil
  #   end
  # end

  private
  def user_signed?
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def request_borrow_params
    params.require(:request_borrow).permit(:day_borrow, :day_return)
  end
end
