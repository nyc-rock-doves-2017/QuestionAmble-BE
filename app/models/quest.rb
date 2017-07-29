class Quest < ApplicationRecord
  validates :creator_id, :title, :key, presence: true
  validates :key, uniqueness: true
  before_validation :generate_key

  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :questions
  has_many :played_quests, class_name: 'Round'
  has_many :played_quest_results, through: :played_quests, source: :guesses

  private
  def generate_key
    self.key = Array.new(8){[*"A".."Z", *"0".."9"].sample}.join
  end
end
