class ResultsController < ApplicationController

  def create
    user_guess = (params[:user_guess]).gsub(/[^0-9a-z]/i, '').downcase
    round_id = (params[:round_id]).to_i
    question_id = (params[:question_id]).to_i
    current_question = (Question.find_by(id: question_id))
    answer = (current_question.answer).gsub(/[^0-9a-z]/i, '').downcase

    @result = Result.new(result_params)

    if answer == user_guess
      @result.win = true
      round = Round.find_by(round_id)
      round_questions = round.quest.questions
      current_position = round_questions.index(current_question)
      next_question_position = current_position + 1
      @next_question = round_questions[next_question_position]
    else
      @result.win = false
    end

    if (@result.save && @result.win == true) && @next_question == nil
      render json: {result: "correct", game_status: "game complete"}
    elsif @result.save && @result.win == true
      render json: {result: "correct", next_question: @next_question, game_status: "game incomplete"}
    elsif @result.save && @result.win == false
      render json: {result: "incorrect", game_status: "game incomplete"}
    else
      render json: {
        error: "Invalid input - please try again."
      }, status: 422
    end
  end

  private
  def result_params
    params.require(:result).permit(:round_id, :question_id)
  end
end
