class Counselor::Accounts::ProfessionalInformationController < ApplicationController
  before_filter :authenticate_account!

  expose(:counselor) do
    current_user.tap { |u| u.attributes = params[:counselor] }
  end

  def create
    if counselor.valid?
      respond_with counselor.tap(&:save), :location => new_counselor_account_session_preference_path
    else
      flash.now[:alert] = counselor.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if counselor.valid?
      flash[:notice] = "Professional information updated"
      respond_with counselor.tap(&:save), :location => edit_counselor_account_professional_information_path
    else
      flash.now[:alert] = counselor.errors.full_messages.to_sentence
      render :edit
    end
  end

end
