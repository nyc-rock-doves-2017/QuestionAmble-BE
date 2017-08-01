class UsersController < ApplicationController

  before_action :authenticate!, only: [:show, :my_quests, :my_stats]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = @user
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: {auth_token: auth_token, userID: @user.id}, status: :ok
    else
      render json: {
        error: "Invalid input - please try again."
      }, status: 422
    end
  end

  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: {auth_token: auth_token, userID: user.id}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def my_quests
    @user = User.find_by(id: params[:id])
    @user_quests = @user.quests_created
    render json: @user_quests
  end

  def my_stats
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
