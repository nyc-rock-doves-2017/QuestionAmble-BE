class Result < ApplicationRecord
  validates :round_id, :question_id, :win, presence: true
end
