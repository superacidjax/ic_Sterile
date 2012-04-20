class Client::PersonalInformationsController < ApplicationController

  before_filter :authenticate_account!, only: [:edit,:update]

  expose(:client) { current_user }
  expose(:new_user?) { flash[:new_account] }

  def update
    if client.update_attributes(params[:client])
      redirect_to edit_client_account_additional_information_path, notice: "Successfully updated your information."
    else
      render :edit
    end
  end

end
