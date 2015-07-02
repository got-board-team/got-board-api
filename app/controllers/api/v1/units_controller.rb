class Api::V1::UnitsController < ApplicationController

  #TODO spec
  def create
    unit = Footman.new
    render json: unit
  end

  #TODO spec
  def update
    unit = Unit.find(params[:id])
    unit.update_attributes(unit_params)
    render json: unit
  end

  private

  def unit_params
    params.require(:unit).permit(:x, :y, :territory)
  end
end
