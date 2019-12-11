class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ransack
  before_action :current_cart
  
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end

  protected
 
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_ransack
    @q = Book.ransack(params[:q])
  end

  # def user_signed?
  #   unless user_signed_in?
  #     redirect_to root_path
  #   end
  # end
  # def set_cart
  #   @cart = RequestBorrow.find(session[:request_borrow_id])
  #   rescue ActiveRecord::RecordNotFound
  #     @cart = RequestBorrow.create
  #     session[:request_borrow_id] = @cart.id
  # end
end
