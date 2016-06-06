class CreateMatch < ActiveInteraction::Base
  integer :number_of_players, default: 6

  validates_numericality_of :number_of_players,
                            greater_than_or_equal_to: 3,
                            less_than_or_equal_to: 6

  def execute
    ActiveRecord::Base.transaction do
      match = Match.create!
      match.create_board!
      create_players(match, number_of_players)
      # create_decks(match, use_tides_of_battle_cards)
      create_garrisons(match)
      match
    end
  end

  private

  def create_garrisons(match)
    compose(CreateGarrisons, match: match)
  end

  # 3 players: Baratheon Lannister Stark
  # 4 players: Baratheon Lannister Stark Greyjoy
  # 5 players: Baratheon Lannister Stark Greyjoy Tyrell
  # 6 players: Baratheon Lannister Stark Greyjoy Tyrell Martell
  # (Rulebook, page 28)
  def create_players(match, number_of_players)
    house_names = Player::HOUSES.first(number_of_players)
    house_names.each do |house_name|
      player = match.players.build(match: match, house: house_name)
      setup_tracks(player)
      player.save!
      distribute_player_things(player)
    end
  end

  def distribute_player_things(player)
    create_power_tokens(player)
    compose(CreateOrders, player: player)
    compose(CreateUnits, player: player)
    compose(CreateHouseCards, player: player)
  end

  def setup_tracks(player)
    house = player.house.downcase
    houses_setup.with_indifferent_access[house][:tracks_positions].map do |marker, position|
      player.send("#{marker}_position=", position)
    end
  end

  def houses_setup
    @houses_setup ||= load_houses_setup
  end

  def load_houses_setup
    file_path = "config/game_data/houses_setup.yml"
    YAML.load_file(File.join(Rails.root, file_path))
  end

  def create_decks(match, use_tides_of_battle_cards)
    # TODO
    # create_westeros_deck_one(match)
    # create_westeros_deck_two(match)
    # create_westeros_deck_three(match)
    # create_wildlings_deck(match)
    # create_tides_of_battle_deck(match) if use_tides_of_battle_cards
  end

  def create_power_tokens(player)
    5.times { player.power_tokens.create! }
  end
end
