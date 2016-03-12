class Api::V1::MatchesController < ApplicationController
  def create
    match = MatchSetupService.create!
    render json: match, include: [:players]
  end

  #TODO spec
  def show
    match = Match.find(params[:id])
    render json: match, include: [:players]
  end
end
