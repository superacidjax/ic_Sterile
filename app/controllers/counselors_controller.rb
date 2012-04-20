class CounselorsController < ApplicationController
  before_filter :set_title
  def set_title
      @title = "iCouch Therapists | #{counselor.name}"
  end
  before_filter :authenticate_account!, only: [:edit,:update]
  before_filter only: [:edit,:update] do
    deny_access unless current_user == counselor
  end


  expose(:query) { params[:q] }
  expose(:my_counselors) { current_user.counselors.order(:last_name, :first_name) }
  expose(:searched_counselors) { params[:q].present? ? Counselor.active.has_entered_availability.search_result(params[:q]) : [] }
  expose(:counselor)
  expose(:counselors) { Counselor.order(:last_name, :first_name) }
  expose(:active_counselors) { Counselor.order(:last_name, :first_name).active }
  expose(:session_credits_available?) { current_user.session_credits.to_i > 0 }
  expose(:show_skype_id?) do
    if current_user.kind_of? Client
      true if current_user.counselors.include? counselor
    elsif current_user.kind_of? Counselor
      true if current_user == counselor
    else
      false
    end
  end

end
