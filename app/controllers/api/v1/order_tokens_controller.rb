class Api::V1::OrderTokensController < ApplicationController
  #TODO spec
  def create
    order_token = OrderToken.new(create_params)
    order_token.save!
    render json: { order_token: order_token.attributes }
  end

  #TODO spec
  def show
    order_token = OrderToken.find(params[:id])
    render json: { order_token: order_token.attributes }
  end

  #TODO spec
  def update
    order_token = OrderToken.find(params[:id])
    order_token.update_attributes(update_params)
    render json: { order_token: order_token.attributes }
  end

  #TODO spec
  def destroy
    order_token = OrderToken.find(params[:id])
    order_token.destroy
    render json: { order_token: order_token.attributes }
  end

  private

  def update_params
    params.require(:order_token).permit(:x, :y, :territory_id)
  end

  def create_params
    params.require(:order_token).permit(:type, :board_id, :player_id, :territory_id, :x, :y)
  end
end
