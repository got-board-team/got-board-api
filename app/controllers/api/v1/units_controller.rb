class Api::V1::UnitsController < ApplicationController

  #TODO spec
  def create
    unit = Unit.new(create_params)
    unit.save!
    render json: { unit: unit.attributes }
  end

  #TODO spec
  def update
    unit = Unit.find(params[:id])
    unit.update_attributes(unit_params)
    render json: { unit: unit.attributes }
  end

  private

  def unit_params
    params.require(:unit).permit(:x, :y, :territory)
  end

  def create_params
    params.require(:unit).permit(:type, :board_id, :player_id, :territory_id, :x, :y)
  end
end
