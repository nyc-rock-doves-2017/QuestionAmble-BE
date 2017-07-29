class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :ind_average_score, :num_games_completed, :num_games_started, :completeness_percentage

  has_many :quests_created, class_name: 'Quest', foreign_key: 'creator_id'
  has_many :games_played, class_name: 'Round', foreign_key: 'player_id'
end
