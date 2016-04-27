class Api::V1::MatchesController < ApplicationController

  def index
    # matches = Match.by_players(current_user.players)
    matches = Match.all
    render json: { matches: matches.serialize_with(MatchesSerializer) }
  end

  def create
    payload = params.require(:match).permit(:number_of_players)
    outcome = CreateMatch.run(payload)
    render json: outcome.result, include: [:players]
  end

  def update
    payload = params.require(:match).permit(:round)
    match = Match.find(params[:id])
    match.update_attributes(payload)
    render json: match
  end

  # TODO spec
  def show
    match = Match.find(params[:id])
    render json: match, include: [:players]
  end

end
