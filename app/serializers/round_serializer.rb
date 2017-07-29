class RoundSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :quest_title, :played_by, :completion_score, :accuracy_score, :date_of_play
end
