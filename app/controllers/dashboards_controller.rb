class DashboardsController < ApplicationController

  def show
    if current_user.class.name == 'Guest'
      render current_user.class.name.underscore
    else
      flash.keep
      if session[:start_datetime]
        redirect_to new_counseling_session_path
      else
        redirect_to ("#{current_user.class.name.downcase}" + "_dashboard").to_sym
      end
    end
  end

end
