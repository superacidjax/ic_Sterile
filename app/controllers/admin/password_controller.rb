class Admin::PasswordController < ApplicationController
  before_filter :redirect_unless_admin

  expose(:admin_account) { current_user.account }

  def update
    admin_account.force_password_required = true
    if admin_account.update_attributes(params[:admin])
      sign_in(:account, admin_account, bypass: true)
      redirect_to [:root], notice: 'Password changed successfully'
    else
      redirect_to [:edit, :admin, :password], alert: admin_account.errors.full_messages.to_sentence
    end
  end

  private

  def redirect_unless_admin
    redirect_to :root unless current_user.kind_of? Admin
  end
end
