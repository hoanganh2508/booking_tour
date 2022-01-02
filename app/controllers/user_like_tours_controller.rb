class UserLikeToursController < ApplicationController
  before_action :set_tour, only: [:create, :destroy]

  def create
    @userliketour = current_user.user_like_tours.new
    @userliketour.tour_id = @tour.id
    @userliketour.save
    redirect_to category_path(@tour.category)
  end

  def destroy
    @userliketour = UserLikeTour.find_by(id: params[:id]).destroy
    redirect_to category_path(@tour.category)
  end

  private

  def set_tour
    @tour = Tour.find_by(id: params[:tour_id])
    redirect_to tours_path unless @tour
  end
end
