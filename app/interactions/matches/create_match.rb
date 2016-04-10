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
      # create_power_pool(match)
      # create_decks(match, use_tides_of_battle_cards)
      match
    end
  end

  private

  # 3 players: Baratheon Lannister Stark
  # 4 players: Baratheon Lannister Stark Greyjoy
  # 5 players: Baratheon Lannister Stark Greyjoy Tyrell
  # 6 players: Baratheon Lannister Stark Greyjoy Tyrell Martell
  # (Rulebook, page 28)
  def create_players(match, number_of_players)
    house_names = Player::HOUSES.first(number_of_players)
    house_names.each do |house_name|
      player = match.players.create!(match: match, house: house_name)
      distribute_player_things(player, match.board)
    end
  end

  def distribute_player_things(player, board)
    create_orders(player, board)
    create_power_tokens(player)
    compose(CreateStartingUnits, player: player, board: board)
    send("create_#{player.house.downcase}_cards", player)
  end

  def create_tracks(match, board, players)
    [
      WildlingsTrack,
      VictoryTrack,
      # SupplyTrack,               # TODO
      # RoundTrack,                # TODO
      # KingsCourtInfluenceTrack,  # TODO
      # IronThroneInfluenceTrack,  # TODO
      # FiefdomsInfluenceTrack     # TODO
    ].each do |track|
      track.setup!(match, board, players)
    end
  end

  def create_decks(match, use_tides_of_battle_cards)
    # TODO
    # create_westeros_deck_one(match)
    # create_westeros_deck_two(match)
    # create_westeros_deck_three(match)
    # create_wildlings_deck(match)
    # create_tides_of_battle_deck(match) if use_tides_of_battle_cards
  end

  def create_power_pool(match)
  end

  def create_orders(player, board)
    March.create!(player: player, board: board)
    MarchM.create!(player: player, board: board)
    MarchP.create!(player: player, board: board)
    ConsolidateP.create!(player: player, board: board)
    Consolidate.create!(player: player, board: board)
    Consolidate.create!(player: player, board: board)
    Defend.create!(player: player, board: board)
    Defend.create!(player: player, board: board)
    DefendP.create!(player: player, board: board)
    Raid.create!(player: player, board: board)
    Raid.create!(player: player, board: board)
    RaidP.create!(player: player, board: board)
    Support.create!(player: player, board: board)
    Support.create!(player: player, board: board)
    SupportP.create!(player: player, board: board)
  end

  def create_power_tokens(player)
    5.times do
      PowerToken.create!(player: player)
    end
  end

  def create_baratheon_cards(player)
  end

  def create_lannister_cards(player)
  end

  def create_stark_cards(player)
    HouseCard.create!(name: "Eddard Stark", player: player)
    HouseCard.create!(name: "Robb Stark", player: player)
    HouseCard.create!(name: "Roose Bolton", player: player)
    HouseCard.create!(name: "Greatjon Umber", player: player)
    HouseCard.create!(name: "The Blackfish", player: player)
    HouseCard.create!(name: "Ser Rodrick Cassel", player: player)
    HouseCard.create!(name: "Catelyn Stark", player: player)
  end

  def create_greyjoy_cards(player)
  end

  def create_tyrell_cards(player)
  end

  def create_martell_cards(player)
  end
end
