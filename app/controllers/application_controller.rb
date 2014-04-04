class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    return if Rails.env.test?
    
    authenticate_or_request_with_http_basic do |username, password|
      username == 'pirateship' && password == ENV['ROGUE_ADMIN_PW'] || 'localpw'
    end

  end
end
