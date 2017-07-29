class Round < ApplicationRecord
  validates :quest_id, :player_id, presence: true
  
end
