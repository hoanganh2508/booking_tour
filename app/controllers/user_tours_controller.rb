class UserToursController < ApplicationController
  def create
    @user_tour = UserTour.new(user_tour_params)
    @tour = Tour.find_by(id: user_tour_params[:tour_id])
    redirect_to tours_path unless  @tour
    @user_tour.price = @tour.price
    @user_tour.user_id = current_user.id
    if @user_tour.save
      flash[:success] = "Gửi yêu cầu thành công"
      redirect_to tours_path
    else
      render 'show'
    end
  end

  private
    def user_tour_params
      params.require(:user_tour).permit(:name, :phone_number, :email, :other_requirement, :tour_id)
    end
end
