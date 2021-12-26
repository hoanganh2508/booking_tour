class ToursController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @user_tour = UserTour.new
    @tour = Tour.find_by(id: params[:id])
    @same_tours = Tour.same_location(@tour.address)
  end
end
