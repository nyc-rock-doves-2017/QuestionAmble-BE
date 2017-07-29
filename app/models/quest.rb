class Quest < ApplicationRecord
  validates :creator_id, :title, :key, presence: true
  validates :key, uniqueness: true

  def generate_key
    Array.new(n){[*"A".."Z", *"0".."9"].sample}.join
  end
end
