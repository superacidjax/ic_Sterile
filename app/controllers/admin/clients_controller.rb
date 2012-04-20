class Admin::ClientsController < Admin::Abstract
  expose(:clients) { Client.order(:last_name, :first_name) }
  expose(:client)

  def update
    if client.update_attributes(params[:client])
      redirect_to admin_clients_path
    else
      render :notes
    end
  end
end
