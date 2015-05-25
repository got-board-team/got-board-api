require 'rails_helper'

describe Board, type: :model do
  describe "#territories" do
    it "returns 58 territories" do
      expect(subject.territories.count).to eq 58
      expect(subject.territories.map(&:class).uniq.first).to eq Territory
    end
  end
end
