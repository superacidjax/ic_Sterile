class Client::AccountsController < ApplicationController
  before_filter :authenticate_account!, only: [:edit, :update]

  expose(:client)
  expose(:counselor) { Counselor.find(session[:counselor_id]) }
  expose(:start_datetime) { Time.parse session[:start_datetime] }

  def create
    if client.valid?
      client.create_initial_payment_info!(params["stripeToken"], counselor)
    end

    if client.save
      sign_in(:account, client.account)
      flash[:new_account] = true

      counseling_session = client.counseling_sessions.create(counselor: counselor, start_datetime: start_datetime)

      redirect_to client_dashboard_path
    else
      render :new
    end
  rescue Stripe::InvalidRequestError
    flash.now[:payment_error] = "There was a problem processing your credit card"
    render :new
  end

  def update
    if current_user.update_attributes(params[:client])
      sign_in(:account, current_user.account, :bypass => true)
      redirect_to root_path, :notice => "Successfully updated your account."
    else
      render :edit
    end
  end

end
