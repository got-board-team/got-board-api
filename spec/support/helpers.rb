def api_sign_in(user)
  request.env['HTTP_AUTHORIZATION'] = user.token
end