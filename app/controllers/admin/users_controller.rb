class Admin::UsersController < Admin::AdminController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]


  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show

  end

  def edit

  end

  def update
    if @user.update[user_params]
      flash[:success] = "Cập nhật thành công"
      redirect_to admin_user_path
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Đã xóa người dùng"
    redirect_to admin_user_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :bank_balance, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
