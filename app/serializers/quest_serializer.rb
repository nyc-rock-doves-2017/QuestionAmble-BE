class QuestSerializer < ActiveModel::Serializer
  attributes :id, :title, :key, :description, :quest_creator, :times_played, :times_completed, :completion_score, :avg_accuracy_score, :played_by
  has_many :questions
end
