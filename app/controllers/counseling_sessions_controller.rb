class CounselingSessionsController < ApplicationController

  expose(:start_datetime) do
    if session[:start_datetime]
      Time.parse(session[:start_datetime])
    end
  end

  expose(:counseling_session) do
    if params[:id]
      if current_user.is_a?(Client) || current_user.is_a?(Counselor)
        current_user.counseling_sessions.find_by_id(params[:id])
      end
    elsif params[:counseling_session]
      CounselingSession.new(params[:counseling_session])
    else
      current_user.counseling_sessions.build(counselor_id: session[:counselor_id], start_datetime: start_datetime)
    end
  end

  expose(:counselor) { counseling_session.counselor }
  expose(:client) { current_user }

  expose(:opentok) do
    api_key = "12439492"
    api_secret = "fce5c237a57831bfc3943a4d9b0ed1a1fca6dbaa"

    opentok = OpenTok::OpenTokSDK.new api_key, api_secret
  end

  expose(:opentok_session_properties) do
    session_properties = { OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "enabled", OpenTok::SessionPropertyConstants::ECHOSUPPRESSION_ENABLED => true }
  end

  expose(:opentok_token) { opentok.generate_token(session_id: counseling_session.video_session_id) }

  def cancel
    session[:counselor_id] = nil
    session[:start_datetime] = nil
    redirect_to root_path
  end

  def create
    client.create_initial_payment_info!(params["stripeToken"], counselor)
    counseling_session.video_session_id = opentok.create_session(request.remote_addr, opentok_session_properties).session_id
    client.save
    session[:counselor_id] = nil
    session[:start_datetime] = nil
    redirect_to client_dashboard_path
  rescue Stripe::InvalidRequestError
    flash.now[:payment_error] = "There was a problem processing your credit card"
    render :new
  end

  def new
    unless start_datetime && client.is_a?(Client)
      redirect_to root_path
    end
  end

  def schedule
    session[:counselor_id] = counselor.id
    session[:start_datetime] = counseling_session.start_datetime.to_s
    if current_user.is_a?(Client)
      redirect_to new_counseling_session_path
    else
      redirect_to new_client_account_path
    end
  end

  def show
    render :layout => 'video'
  end

end
