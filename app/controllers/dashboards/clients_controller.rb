class Dashboards::ClientsController < DashboardsController

  expose(:client) {current_user}
  expose(:recommended_counselors) do
    if client.issues.any?
      Counselor.active.speaks(client.languages).sort{|a, b| b.issues.map{|i| client.issues.include? i}.size <=> a.issues.map{|i| client.issues.include? i}.size }
    end
  end
  expose(:session_credits) { client.session_credits || 0 }

  def show
    render 'dashboards/client'
  end
end
