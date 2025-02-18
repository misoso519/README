class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @questions = @category.questions
  end

  def index
    @categories = Category.all
  end
end
