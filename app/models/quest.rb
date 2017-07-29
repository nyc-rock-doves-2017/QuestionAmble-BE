class Quest < ApplicationRecord
  validates :creator_id, :title, :key, presence: true
  validates :key, uniqueness: true
  before_validation :generate_key

  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :questions
  has_many :played_quests, class_name: 'Round'
  has_many :played_quest_results, through: :played_quests, source: :guesses

  def quest_creator
    self.creator.username
  end

  def times_played
    self.played_quests.length
  end

  def times_completed
    (self.played_quests.select {|q| q.completion_score_raw == 100 }).length
  end

  def completion_score
    denomenator = self.times_played
    numerator = self.times_completed
    score = ((numerator / denomenator) * 100).floor
    result = "#{score}%"
  end

  def all_results
    completed_quests = self.played_quests.select {|q| q.completion_score_raw == 100 }
    all_results = completed_quests.map do |quest|
      quest.accuracy_score_raw
    end
  end

  def avg_accuracy_score
    # denomenator = self.times_completed
    # numerator = self.all_results.reduce(0, :+)
    # score = numerator/denomenator
    # result = "#{score}%"
    "To be implemented"
  end

  def played_by
    all_attempts = self.played_quests.map do |quest|
      quest.played_by
    end
    all_players = all_attempts.uniq
  end

  private
  def generate_key
    self.key = Array.new(8){[*"A".."Z", *"0".."9"].sample}.join
  end
end
