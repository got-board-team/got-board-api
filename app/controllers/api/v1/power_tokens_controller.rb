class Api::V1::PowerTokensController < ApplicationController
  #TODO spec
  def create
    power_token = PowerToken.new(create_params)
    power_token.save!
    render json: { power_token: power_token.attributes }
  end

  #TODO spec
  def show
    power_token = PowerToken.find(params[:id])
    render json: { power_token: power_token.attributes }
  end

  #TODO spec
  def update
    power_token = PowerToken.find(params[:id])
    power_token.update_attributes(update_params)
    render json: { power_token: power_token.attributes }
  end

  #TODO spec
  def destroy
    power_token = PowerToken.find(params[:id])
    power_token.destroy
    render json: { power_token: power_token.attributes }
  end

  private

  def update_params
    params.require(:power_token).permit(:territory_id, :x, :y)
  end

  def create_params
    params.require(:power_token).permit(:board_id, :player_id, :territory_id, :x, :y)
  end
end
