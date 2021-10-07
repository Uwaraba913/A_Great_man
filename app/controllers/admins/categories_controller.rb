class Admins::CategoriesController < ApplicationController

  def index
    @new_category = Category.new
    @categories = Category.all
  end

  def create
    category = Category.new(category_params)
    category.save
    redirect_to request.referer
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to request.referer
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to request.referer
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
