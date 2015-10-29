require 'rails_helper'

RSpec.describe Api::V1::OrderTokensController, type: :controller do

  let(:valid_params) do
    { id: 1, order_token: { territory: "winterfell", x: 10, y: 20 } }
  end

  let(:invalid_params) do
    { id: 1, order_token: { x: 10} }
  end

  describe "PUT 'update'" do
    let!(:order_token) { create(:order_token, id: 1) }

    context "with valid attributes" do
      it "returns success" do
        put :update, valid_params
        expect(response).to be_success
      end
    end

    xcontext "with invalid attributes" do
      it "returns an error" do
        put :update, invalid_params
        expect(response).to be_bad_request
      end
    end
  end

end
