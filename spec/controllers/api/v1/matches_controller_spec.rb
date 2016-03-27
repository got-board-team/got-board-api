require 'rails_helper'

describe Api::V1::MatchesController, type: :controller do
  let(:user) { create(:user) }
  before(:each) { api_sign_in(user) }

  let(:json) { JSON.parse(response.body) }

  describe "#create" do
    it "creates a match" do
      expect { post :create }.to change(Match, :count).by(1)
    end

    it "returns created match" do
      post :create
      expect(json['match']['id']).to eql(Match.last.id)
    end
  end

end
