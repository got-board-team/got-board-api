require 'rails_helper'

describe Territory, type: :model do
  let(:board) { create(:board) }

  subject { Territory.new(board) }

  describe "#units" do
    it "fetch territory units from board" do
      create(:boat, board: board, territory: "port_of_pyke")
      unit1 = create(:footman, board: board, territory: "pyke")
      unit2 = create(:footman, board: board, territory: "pyke")
      subject.slug = "pyke"
      expect(subject.units.all).to eq [unit1, unit2]
    end
  end
end
