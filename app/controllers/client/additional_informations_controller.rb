class Client::AdditionalInformationsController < ApplicationController
  before_filter :authenticate_account!, only: [:edit,:update]

  expose(:client) { current_user }
  expose(:issues) { Counselor.active.map{|counselor| counselor.issues}.flatten.uniq }
  expose(:issues_ids) { client.issues.map(&:id) }

  def update
    if client.update_attributes(params[:client])
      redirect_to root_path, notice: "Successfully updated your information."
    else
      render :edit
    end
  end

end
