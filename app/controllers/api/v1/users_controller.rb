class Api::V1::UsersController < ApplicationController
  def authenticate
    render json: { access_token: "foo", expires_in: 123456 }
  end
end
