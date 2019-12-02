class RequestBorrowsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed?

  def show
    @request_borrow = RequestBorrow.find(params[:id])
    @request_details = @request_borrow.request_details.all
  end

  def new
    
  end

  def create

  end

  def edit
    @request_borrow = RequestBorrow.find(params[:id])
  end

  def update
    
  end

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
