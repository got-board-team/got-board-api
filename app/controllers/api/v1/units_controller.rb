class Api::V1::UnitsController < ApplicationController

  #TODO spec
  def create
    unit = Unit.new(create_params)
    unit.save!
    render json: { unit: unit.attributes }
  end

  #TODO spec
  def show
    unit = Unit.find(params[:id])
    render json: { unit: unit.attributes }
  end

  #TODO spec
  def update
    unit = Unit.find(params[:id])
    unit.update_attributes(update_params)
    render json: { unit: unit.attributes }
  end

  #TODO spec
  def destroy
    unit = Unit.find(params[:id])
    unit.destroy
    render json: { unit: unit.attributes }
  end

  private

  def unit_params
    params.require(:unit).permit(:x, :y, :territory)
  end

  def update_params
    params.require(:unit).permit(:x, :y, :territory_id)
  end

  def create_params
    params.require(:unit).permit(:type, :board_id, :player_id, :territory_id, :x, :y)
  end
end
