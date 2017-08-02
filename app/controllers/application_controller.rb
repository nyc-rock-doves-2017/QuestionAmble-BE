class ApplicationController < ActionController::API
  require 'json_web_token'
  include Response
  include ExceptionHandler

protected

  def authenticate!(object)
    invalid_request unless logged_in? && authorized?(object)
  end

  def invalid_request
    json_response( {error: 'Invalid Request'}, :unauthorized)
  end

  def current_user
    if auth_present?
      User.find_by(id: auth['user_id'])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized?(user)
    current_user == user
  end

  private

  def auth
    JsonWebToken.decode(token)
  end

  def token
    request.headers['Authorization']
  end

  def auth_present?
    !!auth
  end

end
