class MatchSetupService
  class << self

    # TODO spec
    def create!(number_of_players: 6, use_tides_of_battle_cards: false)
      ActiveRecord::Base.transaction do
        match = create_match
        Board.create!(match: match)
        players = create_players(match, number_of_players)
        #world = create_world(match, players, use_tides_of_battle_cards)
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
      players << Player.create!(match: match, house: 'Baratheon')
      players << Player.create!(match: match, house: 'Lannister')
      players << Player.create!(match: match, house: 'Stark')
      players << create_greyjoy_player(match) if number_of_players >= 4
      players << Player.create!(match: match, house: 'Tyrell')  if number_of_players >= 5
      players << Player.create!(match: match, house: 'Martell') if number_of_players == 6
      players
    end

    def create_greyjoy_player(match)
      player = Player.create!(match: match, house: 'Greyjoy')
      Knight.create!(player: player, board: match.board, territory: "pyke")
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
      # TODO
    end

    # TODO spec
    def distribute_player_things(match, players)
      # TODO
    end

  end
end
