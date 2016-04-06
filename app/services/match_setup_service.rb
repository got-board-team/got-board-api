class MatchSetupService
  class << self

    # TODO spec
    def create!(number_of_players: 6, use_tides_of_battle_cards: false)
      ActiveRecord::Base.transaction do
        match = create_match
        Board.create!(match: match)
        create_players(match, number_of_players)
        match
      end
    end

    private

    # TODO spec
    def create_match
      match = Match.create!
      match
    end

    # TODO spec
    def create_players(match, number_of_players)
      # 3 players: Baratheon Lannister Stark
      # 4 players: Baratheon Lannister Stark Greyjoy
      # 5 players: Baratheon Lannister Stark Greyjoy Tyrell
      # 6 players: Baratheon Lannister Stark Greyjoy Tyrell Martell
      # (Rulebook, page 28)
      players = []
      players << create_baratheon_player(match)
      players << create_lannister_player(match)
      players << create_stark_player(match)
      players << create_greyjoy_player(match) if number_of_players >= 4
      players << create_tyrell_player(match)  if number_of_players >= 5
      players << create_martell_player(match) if number_of_players == 6
      players
    end

    def create_greyjoy_player(match)
      player = Player.create!(match: match, house: 'Greyjoy')
      Boat.create!(player: player, board: match.board, territory: "ironmans_bay", x: 87, y: 1557)
      Boat.create!(player: player, board: match.board, territory: "port_of_pyke", x: 325, y: 1350)
      Knight.create!(player: player, board: match.board, territory: "pyke", x: 198, y: 1472)
      Footman.create!(player: player, board: match.board, territory: "pyke", x: 281, y: 1479)
      Footman.create!(player: player, board: match.board, territory: "greywater_watch", x: 458, y: 1164)
      player
    end

    def create_baratheon_player(match)
      player = Player.create!(match: match, house: 'Baratheon')
      Boat.create!(player: player, board: match.board, territory: "shipbreaker_bay", x: 1262, y: 1985)
      Boat.create!(player: player, board: match.board, territory: "shipbreaker_bay", x: 1372, y: 2138)
      Knight.create!(player: player, board: match.board, territory: "dragonstone", x: 1392, y: 1797)
      Footman.create!(player: player, board: match.board, territory: "dragonstone", x: 1295, y: 1804)
      Footman.create!(player: player, board: match.board, territory: "kingswood", x: 1098, y: 2000)
      player
    end

    def create_stark_player(match)
      player = Player.create!(match: match, house: 'Stark')
      Boat.create!(player: player, board: match.board, territory: "the_shivering_sea", x: 1208, y: 738)
      Knight.create!(player: player, board: match.board, territory: "winterfell", x: 625, y: 851)
      Footman.create!(player: player, board: match.board, territory: "winterfell", x: 773, y: 544)
      Footman.create!(player: player, board: match.board, territory: "white_harbor", x: 852, y: 810)
      player
    end

    def create_lannister_player(match)
      player = Player.create!(match: match, house: 'Lannister')
      Boat.create!(player: player, board: match.board, territory: "the_golden_sound", x: 133, y: 1759)
      Knight.create!(player: player, board: match.board, territory: "lannisport", x: 328, y: 1826)
      Footman.create!(player: player, board: match.board, territory: "lannisport", x: 348, y: 1690)
      Footman.create!(player: player, board: match.board, territory: "stoney_sept", x: 476, y: 1820)
      player
    end

    def create_tyrell_player(match)
      player = Player.create!(match: match, house: 'Tyrell')
      Boat.create!(player: player, board: match.board, territory: "redwyne_straights", x: 77, y: 2504)
      Knight.create!(player: player, board: match.board, territory: "highgarden", x: 389, y: 2171)
      Footman.create!(player: player, board: match.board, territory: "highgarden", x: 406, y: 2262)
      Footman.create!(player: player, board: match.board, territory: "dornish_marches", x: 498, y: 2308)
      player
    end

    def create_martell_player(match)
      player = Player.create!(match: match, house: 'Martell')
      Boat.create!(player: player, board: match.board, territory: "sea_of_dorne", x: 1121, y: 2475)
      Knight.create!(player: player, board: match.board, territory: "sunspear", x: 1010, y: 2600)
      Footman.create!(player: player, board: match.board, territory: "sunspear", x: 1107, y: 2611)
      Footman.create!(player: player, board: match.board, territory: "salt_shore", x: 814, y: 2698)
      player
    end

    # TODO spec
    def create_world(match, players, use_tides_of_battle_cards)
      create_board(match, players)
      create_decks(match, use_tides_of_battle_cards)
      create_power_pool(match)
      distribute_player_things(match, players)
    end

    # TODO spec
    def create_board(match, players)
      board = Board.create!(match: match)
      create_tracks(match, board, players)
      board
    end

    # TODO spec
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

    # TODO spec
    def create_decks(match, use_tides_of_battle_cards)
      # TODO
      # create_westeros_deck_one(match)
      # create_westeros_deck_two(match)
      # create_westeros_deck_three(match)
      # create_wildlings_deck(match)
      # create_tides_of_battle_deck(match) if use_tides_of_battle_cards
    end

    # TODO spec
    def create_power_pool(match)
      player = Player.where(match: match, house: 'Greyjoy').first!
      March.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      MarchM.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      MarchP.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      ConsolidateP.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Consolidate.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Consolidate.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Defend.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Defend.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      DefendP.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Raid.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Raid.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      RaidP.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Support.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      Support.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
      SupportP.create!(player: player, board: match.board, territory: nil, x: 0, y: 0)
    end

    # TODO spec
    def distribute_player_things(match, players)
      # TODO
    end

  end
end
