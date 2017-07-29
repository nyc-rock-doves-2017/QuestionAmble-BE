class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {
        error: "The email you have entered does not match an existing account."
      }, status: 400
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

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
