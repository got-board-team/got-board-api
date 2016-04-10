require "rails_helper"

describe CreateMatch, type: :interactions do
  describe ".run" do
    let(:house_names) { subject.players.pluck(:house) }

    subject { described_class.run! }

    it "returns the created match as result" do
      expect(subject).to be_a(Match)
    end

    it "create a board" do
      expect(subject.board).to be_a(Board)
    end

    it "creates a match with all 6 houses" do
      expect(house_names).
        to match_array %w(Baratheon Lannister Stark Greyjoy Tyrell Martell)
    end

    context "with more than 6 players" do
      subject { described_class.run(number_of_players: 7) }

      it "sets invalid players count error" do
        expect(subject.errors.messages).
          to eq number_of_players: ["must be less than or equal to 6"]
      end
    end

    context "with less than 3 players" do
      subject { described_class.run(number_of_players: 2) }

      it "sets invalid players count error" do
        expect(subject.errors.messages).
          to eq number_of_players: ["must be greater than or equal to 3"]
      end
    end

    context "with 5 players" do
      subject { described_class.run(number_of_players: 5).result }

      it "creates a match with 5 houses" do
        expect(house_names).
          to match_array %w(Baratheon Lannister Stark Greyjoy Tyrell)
      end
    end

    context "with 4 players" do
      subject { described_class.run(number_of_players: 4).result }

      it "creates players for some specific houses" do
        expect(house_names).to eq %w(Baratheon Lannister Stark Greyjoy)
      end
    end

    context "with 3 players" do
      subject { described_class.run!(number_of_players: 3) }

      it "creates players for some specific houses" do
        expect(house_names).to eq %w(Baratheon Lannister Stark)
      end
    end
  end
end
