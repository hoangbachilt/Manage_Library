class CategoriesController < ApplicationController
	def index
    @categories = Category.paginate(page: params[:page])
  end

  def show
    @category = Category.find.try(params[:id])
    @books = @category.books.paginate(page: params[:page])
  end
end
