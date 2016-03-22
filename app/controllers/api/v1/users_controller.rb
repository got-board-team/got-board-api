class Api::V1::UsersController < ApplicationController
  GOOGLE_KEY = '866943291177-90h4ribrqase40q5udthhceobgntkhlv.apps.googleusercontent.com'
  GOOGLE_SECRET = 'TNY5c1NyWvGf432VoYspOa8u'

  def authenticate
    data = {
      client_id: GOOGLE_KEY,
      client_secret: GOOGLE_SECRET,
      grant_type: "authorization_code",
      code: params[:authorizationCode],
      scope: 'email profile',
      redirect_uri: 'http://localhost:4200/oauth2callback'
    }

    google_token_endpoint = URI('https://accounts.google.com/o/oauth2/token')
    @response = Net::HTTP.post_form(google_token_endpoint, data)

    auth_hash = JSON.parse(@response.body)

    google_user_info_endpoint = URI("https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=#{auth_hash['access_token']}")

    user_info = JSON.parse(Net::HTTP.get(google_user_info_endpoint)).with_indifferent_access

    outcome = AuthenticateUser.run( email: user_info[:email],
                                    first_name: user_info[:given_name],
                                    last_name: user_info[:family_name],
                                    token: auth_hash['access_token'] )

    render json: auth_hash.slice('access_token', 'expires_in')
  end
end
