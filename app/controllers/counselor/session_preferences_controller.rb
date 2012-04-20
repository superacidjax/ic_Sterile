class Counselor::SessionPreferencesController < ApplicationController
  before_filter :authenticate_account!

  expose(:counselor) do
    current_user.tap { |u| u.attributes = params[:counselor] }
  end
  expose(:issues) { Issue.all }
  expose(:issues_ids) { counselor.issues.map(&:id) }

  def create
    counselor.submit! if counselor.save
    respond_with counselor, location: join_thanks_counselor_account_path
  end

  def update
    counselor.save
    flash[:notice] = "Session preferences updated"
    respond_with counselor, location: edit_counselor_account_session_preference_path
  end

  def update_schedule
    counselor.save
    flash[:notice] = "Session preferences updated"
    respond_with counselor, location: root_path
  end
end
