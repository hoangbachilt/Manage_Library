class RequestDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed?
  # before_save :check_quanity_update, only: [:update]

  # def new
  #   @request_borrow = @current_cart
  #   @request_detail = @request_borrow.request_details.build(request_detail_params)
  # end

  def create
    @book = Book.find(params[:book_id])
    current_cart = @current_cart
    @request_detail = current_cart.request_details.build(request_detail_params)
    @request_detail.book = @book 
    respond_to do |format|
      if @request_detail.quanity > @book.quanity
        format.html {redirect_to @book, notice: "Quanity not enough"}
        format.js
      else
        if @request_detail.save
          @book.quanity = @book.quanity - @request_detail.quanity
          @book.update_attributes(quanity: @book.quanity)
          format.html {redirect_to @book, notice: "Add book successful"}
          format.js
        else
          format.html { redirect_to @book}
          format.js
        end
      end
    end
  end

  def update
    current_cart = @current_cart
    @request_detail = RequestDetail.find(params[:id])
    respond_to do |format|
      if @request_detail.update_attributes(request_detail_params)
        format.html { redirect_to cart_path(current_cart), notice: "Successfully updated." }
      else
        format.html { redirect_to cart_path(current_cart), notice: "Unsuccess updated." }
      end
    end
    @request_details = current_cart.request_details
  end

  def destroy
    current_cart = @current_cart
    @request_detail = RequestDetail.find_by(cart_id: current_cart.id)
    @request_detail.book.quanity = @request_detail.book.quanity + @request_detail.quanity
    @request_detail.book.update_attributes(quanity: @request_detail.book.quanity)
    @request_detail.destroy
    @request_details = current_cart.request_details
    redirect_to cart_path(current_cart)
  end

  private
  def user_signed?
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def request_detail_params
    new_params = params.require(:request_detail).permit(:quanity, :book_id, :cart_id)
  end

  # def check_quanity_update
  #   current_cart = @current_cart
  #   @request_detail = RequestDetail.find(params[:id])
  #   @book_quanity = @request_detail.quanity + @request_detail.book.quanity
  #   if self.quanity > @book_quanity
  #     @request_detail.save false
  #     flash[:danger] = "BBBB"
  #   end
  # end
  # def create_request_borrow
  #   @request_borrow = current_user.request_borrows.new
  #   @request_borrow.save
  # end
end

