class ApplicationController < ActionController::Base
  before_filter :ensure_domain

  APP_DOMAIN = 'secure.icouch.me'

  def ensure_domain
    if Rails.env.production? && request.env['HTTP_HOST'] != APP_DOMAIN
     # HTTP 301 is a "permanent" redirect
      redirect_to "https://#{APP_DOMAIN}", :status => 301
    end
  end

  # sets sitewide default page title
  before_filter :set_title
  def set_title
    @title = "Your therapy. Your couch. iCouch."
  end

  protect_from_forgery
  respond_to :html

  expose :current_user do
    current_account.try(:role) || Guest.new
  end

  expose(:next_week) { Date.today.next_week }
  expose(:week) {Date.today.at_beginning_of_week}
  #expose(:day)

  expose :q do
    Counselor.search
  end

  def deny_access
    flash[:failure] = "Access denied."
    redirect_to root_path
  end
  hide_action :deny_access

  def require_admin
    deny_access unless current_user.kind_of?(Admin)
  end
  hide_action :require_admin

  def pick_layout
    current_user.kind_of?(Admin) ? 'admin' : 'application'
  end
  layout :pick_layout
  hide_action :pick_layout

end
