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

  #TODO spec
  def reveal
    params.require(:player_id)
    OrderToken.where(player_id: params[:player_id]).update_all(faceup: true)
    Pusher.trigger('order_token', 'reveal', { player_id: params[:player_id]})
    render json: {}
  end

  private

  def update_params
    params.require(:order_token).permit(:territory_id, :x, :y, :faceup)
  end

  def create_params
    params.require(:order_token).permit(:type, :board_id, :player_id, :territory_id, :x, :y)
  end
end
