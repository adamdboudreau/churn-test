class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::InvalidAuthenticityToken, :with => :invalid_auth_token

  def invalid_auth_token
    puts "params have invalid auth token: #{params.inspect}"
  end
end
