class Dashboards::CounselorsController < DashboardsController

  expose(:counselor) { current_user }
  expose(:upcoming_sessions) { counselor.upcoming_sessions }
  expose(:previous_sessions) { counselor.previous_sessions }

  def show
    render 'dashboards/counselor'
  end

end
