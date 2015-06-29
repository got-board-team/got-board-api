class Api::V1::UnitsController < ApplicationController
  def create
    unit = Footman.new
    render json: unit
  end
end
