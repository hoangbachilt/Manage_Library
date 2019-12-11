class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page])
    @q = Book.ransack(params[:q])
  end

  def show
    @categories = Category.paginate(page: params[:page])
    @category = Category.find(params[:id])
    @books = @category.books.paginate(page: params[:page])
  end
end
