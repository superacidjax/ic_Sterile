class Client::PurchasesController < ApplicationController

  before_filter :authenticate_account!, except: [:payment_notification]

  expose(:client) { current_user }
  expose(:payment_notification) { client.payment_notifications.new(token: client.purchase_token) }

  def thank_you
    flash[:notice] = "Thank you for your purchase."
    redirect_to root_path
  end

end
