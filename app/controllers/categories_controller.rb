class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find_by_slug(params[:id])
  end
end
