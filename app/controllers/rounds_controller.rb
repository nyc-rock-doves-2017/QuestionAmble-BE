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
    p "**********"
    p "@round"
    p @round

    round_questions = @round.quest.questions
    p "**********"
    p "round_questions"
    p round_questions

    current_question = Question.find_by(id: @round.guesses.last.question_id)
    p "**********"
    p "current_question"
    p current_question

    current_position = round_questions.index(current_question)
    p "**********"
    p "current_position"
    p current_position

    next_question_position = current_position + 1
    p "**********"
    p "next_question_position"
    p next_question_position

    @next_question = round_questions[next_question_position]
    p "**********"
    p "@next_question"
    p @next_question

    if @next_question == nil
      render json: {message: "game complete"}
    else
      render json: @next_question
    end
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
