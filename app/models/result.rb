class Result < ApplicationRecord
  validates :round_id, :question_id, :win, presence: true

  belongs_to :game, class_name: 'Round'
  belongs_to :question
  belongs_to :player, through: :game
  belongs_to :quest, through: :game
end
