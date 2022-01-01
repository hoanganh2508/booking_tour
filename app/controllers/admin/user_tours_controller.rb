class Admin::UserToursController < Admin::AdminController
  before_action :find_user_tour, only: [:update, :destroy]

  def index
    @user_tours = UserTour.all.paginate(page: params[:page])
  end

  def destroy
    @user_tour.destroy
    flash[:success] = "Đã xóa người dùng"
    redirect_to admin_user_tours_path
  end

  def update
    if @user_tour.status == "wait"
      @user_tour.update(status: 1)
    else
      @user_tour.update(status: 0)
    end
      redirect_to admin_user_tours_path
  end

  private

    def find_user_tour
       @user_tour = UserTour.find_by(id: params[:id])
      redirect_to admin_user_tours_path unless @user_tour
    end
end
