class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:show]
  def show
    @category = Category.find_by(id: params[:id])
    redirect_to tours_path unless @category
  end
end
