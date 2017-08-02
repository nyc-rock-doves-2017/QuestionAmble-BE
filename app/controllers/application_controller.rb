class ApplicationController < ActionController::API
  require 'json_web_token'

protected

#   def authenticate_request!
#     if !payload
#       puts "AAAAAAAAAA"
#       return invalid_authentication
#     end
#       puts "BBBBBBBBBB"
#     load_current_user!
#     invalid_authentication unless @current_user
#   end

#   def invalid_authentication
#     render json: {error: 'Invalid Request'}, status: :unauthorized
#   end

# private

#   def payload
#     auth_header = headers['Authorization']
#     token = auth_header.split(' ').last
#     JsonWebToken.decode(token)
#   rescue
#     nil
#   end

#   def load_current_user!
#     @current_user = User.find_by(id: payload[0]['user_id'])
#   end
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
