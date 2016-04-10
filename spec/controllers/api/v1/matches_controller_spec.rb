require "rails_helper"

describe Api::V1::MatchesController, type: :controller do
  let(:user) { create(:user) }

  before(:each) { api_sign_in(user) }

  describe "#create" do
    let(:params) { { match: { number_of_players: 3 } } }

    it "creates a match" do
      expect { post :create, params}.to change(Match, :count).by(1)
    end

    it "returns created match" do
      post :create, params
      json = JSON.parse(response.body)
      expect(json["match"]["id"]).to eql(Match.last.id)
    end
  end

end
