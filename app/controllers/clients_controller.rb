class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    clients = Client.all
    render json: clients
  end

  def show
    if find_client
      render json: find_client
    end
  end

  def update
    find_client.update!(client_params)
    render json: find_client
  end

  private

  def find_client
    Client.find(params[:id])
  end

  def client_params
    params.permit(:name, :age)
  end

  def render_not_found_response
    render json: { error: "Client not found" }, status: :not_found
  end
end
