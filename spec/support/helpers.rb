def api_sign_in(user)
  request.env['HTTP_AUTHORIZATION'] = user.token
  # request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user.token,'')
end