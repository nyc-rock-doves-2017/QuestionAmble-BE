class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true

  has_many :quests_created, foreign_key: 'creator_id'
  has_many :games_played, class_name: 'Round', foreign_key: 'player_id'
  has_many :guesses, class_name: 'Result', through: :games_played
end
