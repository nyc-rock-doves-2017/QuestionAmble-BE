class ResultsController < ApplicationController

  def create
    user_guess = (params[:user_guess]).gsub(/[^0-9a-z]/i, '').downcase
    answer = (Question.find_by(id: params[:question_id]).answer).gsub(/[^0-9a-z]/i, '').downcase
    @result = Result.new(result_params)

    if answer == user_guess
      @result.win = true
    else
      @result.win = false
    end

    if @result.save && @result.win == true
      render json: {"result" = "correct"}
    elsif @result.save && @result.win == false
      render json: {"result" = "incorrect"}
    else
      render json:
        error: "Invalid input - please try again."
      }, status: 422
    end
  end

  private
  def result_params
    params.require(:result).permit(:quest_id, :player_id)
  end
end
