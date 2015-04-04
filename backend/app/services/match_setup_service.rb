class MatchSetupService
  class << self

    def create!(number_of_players: 6, use_tides_of_battle_cards: false)
      ActiveRecord::Base.transaction do
        match = create_match
        players = create_players(match, number_of_players)
        world = create_world(match, players, use_tides_of_battle_cards)
        match
      end
    end

    private

    def create_match
      match = Match.create!
      match
    end

    def create_players(match, number_of_players)
      players = []
      # 3 players: Baratheon Lannister Stark
      players << Player.create!(match: match, house: 'Baratheon')
      players << Player.create!(match: match, house: 'Lannister')
      players << Player.create!(match: match, house: 'Stark')
      # 4 players: Baratheon Lannister Stark Greyjoy
      players << Player.create!(match: match, house: 'Greyjoy') if number_of_players >= 4
      # 5 players: Baratheon Lannister Stark Greyjoy Tyrell
      players << Player.create!(match: match, house: 'Tyrell')  if number_of_players >= 5
      # 6 players: Baratheon Lannister Stark Greyjoy Tyrell Martell
      players << Player.create!(match: match, house: 'Martell') if number_of_players == 6
      players
    end

    def create_world(match, players, use_tides_of_battle_cards)
      create_board(match, players)
      create_decks(match, use_tides_of_battle_cards)
      create_power_pool(match)
      distribute_player_things(match, players)
    end

    def create_board(match, players)
      board = Board.create!(match: match)
      create_map(board)
      create_tracks(board, players)
      board
    end

    def create_decks(match, use_tides_of_battle_cards)
      # TODO
      # create_westeros_deck_one(match)
      # create_westeros_deck_two(match)
      # create_westeros_deck_three(match)
      # create_wildlings_deck(match)
      # create_tides_of_battle_deck(match) if use_tides_of_battle_cards
    end

    def create_tracks(board, players)
      # TODO
    end

    def create_map(board)
      # TODO
    end

    def create_power_pool(match)
      # TODO
    end

    def distribute_player_things(match, players)
      # TODO
    end

  end
end
