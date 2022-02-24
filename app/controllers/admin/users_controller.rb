class Admin::UsersController < Admin::AdminController
  before_action :find_user, only: [:edit, :update, :destroy, :show]

  def new
    @user = User.new
  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    redirect_to admin_users_path and return unless @user.activated?
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Tạo tài khoản thành công"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "User updated"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Đã xóa người dùng"
    redirect_to admin_users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :bank_balance, :password, :password_confirmation)
    end

    def find_user
      @user = User.find_by(id: params[:id])
      redirect_to admin_users_path unless @user
    end
end
