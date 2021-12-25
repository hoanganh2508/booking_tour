class ToursController < ApplicationController
  def index
  end

  def show
    @tour = Tour.find_by(id: params[:id])
    @same_tours = Tour.same_location(@tour.address)
  end
end
