class Api::V1::UsersController < ApplicationController
  def autheticate
    user = UserService.authenticate!(params[:id])
    render json: user
  end
end
