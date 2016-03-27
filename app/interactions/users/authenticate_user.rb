class AuthenticateUser < ActiveInteraction::Base
  string :email
  string :first_name
  string :last_name
  string :token

  def execute
    User.find_by(email: email) || User.create(inputs)
  end
end
