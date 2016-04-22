require "rails_helper"

describe CreateOrders, type: :interactions do

  let(:player) { create(:player, :stark) }
  subject { described_class.run!(player: player) }

  it "creates all 15 order tokens" do
    expect(subject.count).to eq 15
  end
end
