class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate

  def current_user
    @current_user
  end

  private

  def authenticate
    @current_user = User.find_by(token: request_token)
    fail "Invalid Token" if @current_user.blank?
  rescue => e
    render json: { error: e.message }, status: :unauthorized
  end

  def request_token
    authorization_header = request.headers["Authorization"]
    fail "Missing Authorization Header" if authorization_header.blank?
    authorization_header.gsub("Bearer ", "")
  end
end
