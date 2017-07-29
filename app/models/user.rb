class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true

  has_many :quests_created, class_name: 'Quest', foreign_key: 'creator_id'
  has_many :games_played, class_name: 'Round', foreign_key: 'player_id'
  has_many :guesses, class_name: 'Result', through: :games_played

  def ind_average_score
    denominator = self.num_games_completed.to_f
    numerator = (self.all_scores.reduce(0, :+)).to_f
    score = (numerator/denominator).floor
    result = "#{score}%"
  end

  def num_games_started
    self.games_played.length
  end

  def num_games_completed
    num = self.games_played.select {|q| q.completion_score_raw == 100 }
    num = num.length
  end

  def completeness_percentage
    denominator = (self.num_games_started).to_f
    numerator = (self.num_games_completed).to_f
    score = ((numerator / denominator) * 100).floor
    result = "#{score}%"
  end

  def all_scores
    completed_quests = self.games_played.select {|q| q.completion_score_raw == 100 }
    all_results = completed_quests.map do |quest|
      quest.accuracy_score_raw
    end
  end

end
