class AuthenticateUser < ActiveInteraction::Base
  string :email
  string :first_name
  string :last_name
  string :token

  def execute
    user = User.find_or_initialize_by(email: email)
    user.first_name = first_name
    user.last_name = last_name
    user.token = token
    user.save
    user
  end
end
