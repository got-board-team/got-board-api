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
    token = request.headers['authorization'].gsub('Bearer ', '')
    @current_user = User.find_by(token: token)
    fail if @current_user.blank?
  rescue
    head :unauthorized
  end
end
