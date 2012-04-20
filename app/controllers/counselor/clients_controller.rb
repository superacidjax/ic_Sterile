class Counselor::ClientsController < ApplicationController
  before_filter :authenticate_account!
  expose(:clients) do
    current_user.clients
  end
  expose(:client)
end
