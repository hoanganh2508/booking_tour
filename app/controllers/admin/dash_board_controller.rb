class Admin::DashBoardController < Admin::AdminController
  def index
    if params[:option]
      date = "01" + "/" + params[:option] + "/" + Date.today.strftime("%Y")
      date = date.to_time
      @user_tours = UserTour.by_dates(date.beginning_of_month, date.end_of_month)
    else
      @user_tours = UserTour.by_dates(Time.zone.now.beginning_of_month, Time.zone.now.end_of_month)
    end
  end
end
