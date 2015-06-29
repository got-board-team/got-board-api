require 'rails_helper'

describe Api::V1::UnitsController, type: :controller do

  describe "POST 'create' " do
    context "with valid attributes" do
      it "returns success" do
        post :create, { type: "footman", house: "martell", x: 10, y: 20 }
        expect(response).to be_success
      end
    end

    context "with invalid attributes" do
      it "returns an error" do
        post :create, { type: "soldier", house: "karstark", x: 10, y: 20 }
        expect(response).to be_bad_request
      end
    end
  end
end
