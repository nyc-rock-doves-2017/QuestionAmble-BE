class Round < ApplicationRecord
  validates :quest_id, :player_id, presence: true

  belongs_to :player, class_name: 'User'
  belongs_to :quest
  has_many :guesses, class_name: 'Result'

  def played_by
    self.player.username
  end

  def completion_score_raw
    denomenator = self.quest.questions.length
    numerator = (self.guesses.select {|g| g.win == true}).length
    score = ((numerator / denomenator) * 100).floor
  end

  def completion_score
    result = "#{self.completion_score_raw}%"
  end

  def accuracy_score_raw
    "To be implemented"
  end

  def accuracy_score
    # result = "#{self.accuracy_score_raw}%"
    "To be implemented"
  end
end
