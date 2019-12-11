class PagesController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
  end
end
