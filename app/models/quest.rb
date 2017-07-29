class Quest < ApplicationRecord
  validates :creator_id, :title, :key, presence: true
  validates :key, uniqueness: true
  before_save :generate_key

  def generate_key
    self.key = Array.new(n){[*"A".."Z", *"0".."9"].sample}.join
  end

  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :questions
  has_many :played_quests, class_name: 'Round'
  has_many :played_quest_results, class_name: 'Result', through: :played_quests
end
