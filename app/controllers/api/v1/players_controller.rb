class Api::V1::PlayersController < ApplicationController
  def update
    player = Player.find(params[:id])
    ap params
    player.update_attributes(player_params)
    render json: player
  end

  def player_params
    params.require(:player).permit(:user_id)
  end
end
