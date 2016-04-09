require 'rails_helper'

describe CreateMatch, type: :interactions do

  describe ".run" do

    subject { described_class.run! }

    it "returns the created match as result" do
      expect(subject).to be_a(Match)
    end

    it "creates a match with all 6 houses" do
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

    context "with more than 6 players" do
      subject { described_class.run(players_count: 7) }

      it "sets invalid players count error" do
        expect(subject.errors.messages).
          to eq players_count: ["must be less than or equal to 6"]
      end
    end

    context "with less than 3 players" do
      subject { described_class.run(players_count: 2) }

      it "sets invalid players count error" do
        expect(subject.errors.messages).
          to eq players_count: ["must be greater than or equal to 3"]
      end
    end

    context "with 5 players" do
      subject { described_class.run(players_count: 5).result }

      it "creates a match with 5 houses" do
        expect(subject.players.pluck :house).
          to match_array %w(Baratheon Lannister Stark Greyjoy Tyrell)
      end
    end

    context "with 4 players" do
      subject { described_class.run(players_count: 4).result }

      it "creates players for some specific houses" do
        expect(subject.players.pluck :house).
          to match_array %w(Baratheon Lannister Stark Greyjoy)
      end
    end

    context "with 3 players" do
      subject { described_class.run(players_count: 3).result }

      it "creates players for some specific houses" do
        expect(subject.players.pluck :house).
          to match_array %w(Baratheon Lannister Stark)
      end
    end
  end

end
