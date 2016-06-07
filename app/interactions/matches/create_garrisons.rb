class CreateGarrisons < ActiveInteraction::Base
  object :match

  def execute
    GARRISONS_SETUP.keys.each do |garrison_name|
      Garrison.create!(match: match, territory: garrison_name, name: garrison_name, x: GARRISONS_SETUP[garrison_name][:x], y: GARRISONS_SETUP[garrison_name][:y])
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
