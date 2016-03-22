class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  attr_accessor :current_user

  before_action :authenticate

  private

  def authenticate
    token = request.headers['authorization'].gsub('Bearer ', '')
    current_user = User.find_by(token: token)
    current_user.present?
  end
end
