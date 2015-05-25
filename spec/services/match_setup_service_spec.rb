require 'rails_helper'

describe Api::V1::MatchSetupService, type: :services do

  subject { MatchSetupService.create! }

  it "creates players for all houses" do
    expect(subject.players.pluck :house).
      to match_array %w(Baratheon Lannister Stark Greyjoy Tyrell Martell)
  end

  it "creates 1 Greyjoy's knight on Pyke" do
    player = subject.players.find_by_house("Greyjoy")
    knight = player.units.find do |unit|
      unit.type == "Knight" && unit.territory == "pyke"
    end
    expect(knight).to be_present
  end

  it "create a board" do
    expect(subject.board).to be_a Board
  end

  it "create starting units associated to board" do
    expect(subject.board.reload.units).to eq Unit.all
  end

  context "with 5 players" do
    subject { MatchSetupService.create!(number_of_players: 5) }

    it "creates players for some specific houses" do
      expect(subject.players.pluck :house).
        to match_array %w(Baratheon Lannister Stark Greyjoy Tyrell)
    end
  end

  context "with 4 players" do
    subject { MatchSetupService.create!(number_of_players: 4) }

    it "creates players for some specific houses" do
      expect(subject.players.pluck :house).
        to match_array %w(Baratheon Lannister Stark Greyjoy)
    end
  end

  context "with 3 players" do
    subject { MatchSetupService.create!( number_of_players: 3) }

    it "creates players for some specific houses" do
      expect(subject.players.pluck :house).
        to match_array %w(Baratheon Lannister Stark)
    end
  end

end
