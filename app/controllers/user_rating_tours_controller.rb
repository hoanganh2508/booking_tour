class UserRatingToursController < ApplicationController
  before_action :set_tour, only: [:create, :destroy]

  def create
    @userratingtour = current_user.user_rating_tours.new(rating_params)
    @userratingtour.tour_id = @tour.id
    @userratingtour.save
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  private

  def set_tour
    @tour = Tour.find_by(id: params[:tour_id])
    redirect_to tours_path unless @tour
  end

  def rating_params
    params.require(:user_rating_tour).permit(:rate)
  end
end
