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

    shared_examples :setup_default_positions do
      let(:match) { ap 0; described_class.run!(number_of_players: 6) }

      subject do
        match.players.find_by_house(house)
      end

      describe "positions" do
        it "sets defaults" do
          expect(subject.throne_position).to eq throne
          expect(subject.blade_position).to eq blade
          expect(subject.raven_position).to eq raven
          expect(subject.supply_position).to eq supply
          expect(subject.victory_position).to eq victory
        end
      end
    end

    context "with Baratheon house" do
      let(:house) { "Baratheon" }
      let(:throne) { 1 }
      let(:blade) { 5 }
      let(:raven) { 4 }
      let(:supply) { 2 }
      let(:victory) { 1 }

      it_behaves_like :setup_default_positions
    end

    context "with Lannister house" do
      let(:house) { "Lannister" }
      let(:throne) { 2 }
      let(:blade) { 6 }
      let(:raven) { 1 }
      let(:supply) { 2 }
      let(:victory) { 1 }

      it_behaves_like :setup_default_positions
    end

    context "with Stark house" do
      let(:house) { "Stark" }
      let(:throne) { 3 }
      let(:blade) { 4 }
      let(:raven) { 2 }
      let(:supply) { 1 }
      let(:victory) { 2 }

      it_behaves_like :setup_default_positions
    end

    context "with Greyjoy house" do
      let(:house) { "Greyjoy" }
      let(:throne) { 5 }
      let(:blade) { 1 }
      let(:raven) { 6 }
      let(:supply) { 2 }
      let(:victory) { 1 }

      it_behaves_like :setup_default_positions
    end

    context "with Tyrell house" do
      let(:house) { "Tyrell" }
      let(:throne) { 6 }
      let(:blade) { 2 }
      let(:raven) { 5 }
      let(:supply) { 2 }
      let(:victory) { 1 }

      it_behaves_like :setup_default_positions
    end

    context "with Martell house" do
      let(:house) { "Martell" }
      let(:throne) { 4 }
      let(:blade) { 3 }
      let(:raven) { 3 }
      let(:supply) { 2 }
      let(:victory) { 1 }

      it_behaves_like :setup_default_positions
    end
  end
end
