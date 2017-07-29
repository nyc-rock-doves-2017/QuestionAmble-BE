class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username

  has_many :quests_created, class_name: 'Quest', foreign_key: 'creator_id'
end
