class Api::V1::PlayersController < ApplicationController
  before_action :load_player, only: [:show, :update]

  def show
    render json: @player
  end

  def update
    @player.update_attributes(player_params)
    render json: @player
  end

  def player_params
    params.require(:player).permit(:user_id, :supply_position, :victory_position)
  end

  private

  def load_player
    @player = Player.find(params[:id])
  end
end
