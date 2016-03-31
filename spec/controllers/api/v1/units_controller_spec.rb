require 'rails_helper'

describe Api::V1::UnitsController, type: :controller do
  let(:board) { create(:board) }
  let(:player) { create(:player) }

  let(:user) { create(:user) }
  before(:each) { api_sign_in(user) }

  let(:valid_params) do
    { unit: { board_id: board.id, player_id: player.id, type: "Footman", house: "martell", x: 10, y: 20 } }
  end

  describe "POST 'create' " do
    context "with valid attributes" do
      it "returns success" do
        post :create, valid_params
        expect(response).to be_success
      end
    end

    context "with invalid attributes" do
      it "returns an error" do
        post :create, unit: { type: "Soldier", house: "karstark", x: 10, y: 20 }
        expect(response).to be_bad_request
      end
    end
  end
end
