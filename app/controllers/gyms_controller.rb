class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    gyms = Gym.all
    render json: gyms
  end

  def show
    if find_gym
      render json: find_gym
    end
  end

  def update
    find_gym.update!(gym_params)
    render json: find_gym
  end

  def destroy
    find_gym.destroy
    head :no_content
  end

  private

  def find_gym
    Gym.find(params[:id])
  end

  def gym_params
    params.permit(:name, :address)
  end

  def render_not_found_response
    render json: { error: "Gym not found" }, status: :not_found
  end
end
