class AuthenticateUser < ActiveInteraction::Base
  string :email
  string :first_name
  string :last_name
  string :token

  def execute
    user = User.find_or_initialize_by(email: email)
    user.update(inputs)
    user
  end
end
