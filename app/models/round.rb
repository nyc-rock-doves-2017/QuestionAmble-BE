class Round < ApplicationRecord
  validates :quest_id, :player_id, presence: true

  belongs_to :player, class_name: 'User'
  belongs_to :quest
  has_many :guesses, class_name: 'Result'
end
