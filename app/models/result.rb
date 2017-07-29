class Result < ApplicationRecord
  validates :round_id, :question_id, :win, presence: true

  belongs_to :game, class_name: 'Round', foreign_key: 'round_id'
  belongs_to :question
end
