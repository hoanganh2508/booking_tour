class Admin::ToursController < Admin::AdminController
  before_action :find_tour , only: [:edit, :update, :destroy]

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new tour_params
    @tour.image.attach(params[:tour][:image])
    if @tour.save
      flash[:success] = "Tạo thành công"
      redirect_to admin_tours_path
    else
      render 'new'
    end
  end

  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @tour.update(tour_params)
      flash[:success] = "Category updated"
      redirect_to admin_tours_path
    else
      render 'edit'
    end
  end

  def destroy
    @tour.destroy
    flash[:success] = "Tour deleted"
    redirect_to admin_tours_path
  end

  private
  def find_tour
    @tour = Tour.find_by(id: params[:id])
    redirect_to admin_tours_path unless @tour
  end

  def tour_params
    params.require(:tour).permit(:name,:address,:phone_number,:price,:content,:image)
  end
end
