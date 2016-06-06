class CreateGarrisons < ActiveInteraction::Base
  object :match

  def execute
    GARRISONS_SETUP.keys.each do |garrison|
      Garrison.create!(match: match, territory_id: load_territory(garrison).id, name: garrison, x: GARRISONS_SETUP[garrison][:x], y: GARRISONS_SETUP[garrison][:y])
    end
  end

  GARRISONS_SETUP = {
    winterfell: { x: 540, y: 655 },
    pyke: { x: 0, y: 0 },
    lannisport: { x: 0, y: 0 },
    highgarden: { x: 0, y: 0 },
    sunspear: { x: 0, y: 0 },
    dragonstone: { x: 0, y: 0 }
  }

  private

  def board
    match.board
  end

  def number_of_players
    match.players.count
  end

  def load_territory(territory_slug)
    board.territories.select{ |territory| territory.slug == territory_slug.to_s }.first
  end

end
