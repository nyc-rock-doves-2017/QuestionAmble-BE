class ResultsController < ApplicationController

  def create
    user_guess = params[:user_guess]
    answer = Question.find_by(id: params[:question_id]).answer
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
