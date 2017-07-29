class Round < ApplicationRecord
  validates :quest_id, :player_id, presence: true

  belongs_to :player, class_name: 'User'
  belongs_to :quest
  has_many :guesses, class_name: 'Result'

  def played_by
    self.player.username
  end

  def completion_score_raw
    denominator = (self.quest.questions.length).to_f
    numerator = ((self.guesses.select {|g| g.win == true}).length).to_f
    score = ((numerator / denominator) * 100).floor
  end

  def completion_score
    result = "#{self.completion_score_raw}%"
  end

  def accuracy_score_raw
    question_count_pairs = self.guesses.group(:question_id).count
    answered_right_first = question_count_pairs.select { |id, count| count == 1 }
    score = (((answered_right_first.length).to_f)/((self.quest.questions.length).to_f)*100).floor
  end

  def accuracy_score
    result = "#{self.accuracy_score_raw}%"
  end

  def created_by
    self.quest.creator.username
  end

  def quest_title
    self.quest.title
  end

  def date_of_play
    self.created_at.strftime('%B %d, %Y')
  end
end
