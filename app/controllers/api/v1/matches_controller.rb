class Api::V1::MatchesController < ApplicationController

  def index
    matches = Match.by_players(current_user.players)
    render json: { matches: matches.serialize_with(MatchesSerializer) }
  end

  def create
    match = MatchSetupService.create!(number_of_players: match_params[:players_count])
    render json: match, include: [:players]
  end

  #TODO spec
  def show
    match = Match.find(params[:id])
    render json: match, include: [:players]
  end

  private

  def match_params
    params.require(:match).permit(:players_count)
  end
end
