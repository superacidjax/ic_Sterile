class Counselor::AccountsController < ApplicationController
  before_filter :authenticate_account!, only: [:edit, :update]
  expose(:counselor) { current_account.try(:role) || Counselor.new(params[:counselor]) }

  def show
    render 'counselors/show'
  end

  def create
    if counselor.save
      sign_in(:account, counselor.account)
      redirect_to new_counselor_account_professional_information_path
    else
      render :new
    end
  end

  def update
    if current_user.update_attributes(params[:counselor])
      flash[:notice] = "Account updated"
      respond_with(current_user, location: edit_counselor_account_path)
    else
      flash.now[:alert] = current_user.errors.full_messages.to_sentence
      render :edit
    end
  end
end
