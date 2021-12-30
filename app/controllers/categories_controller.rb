class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    redirect_to tours_path unless @category
  end
end
