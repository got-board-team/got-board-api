require "pusher"

Pusher.app_id = "got-board-api"
Pusher.url = "http://#{ENV["PUSHER_KEY"]}:#{ENV["PUSHER_SECRET"]}@api.pusherapp.com/apps/113669"
Pusher.logger = Rails.logger

