class RoundsController < ApplicationController
  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      render json: @round
    else
      render json: {
        error: "Invalid input - please try again."
      }, status: 422
    end
  end

  def next_question
    @round = Round.find_by(id: params[:id])
    round_questions = @round.quest.questions
    current_question = Question.find_by(id: @round.guesses.last.question_id)
    current_position = round_questions.index(current_question)
    next_question_position = current_position + 1
    @next_question = round_questions[next_question_position]

    if @next_question  == nil
      render json: {message: "game complete"}
    else
      render json: @next_question
    end
  end

  def compare_location

  end

  def show
    @round = Round.find_by(id: params[:id])
    render json: @round
  end

  private
  def round_params
    params.require(:round).permit(:quest_id, :player_id)
  end
end
