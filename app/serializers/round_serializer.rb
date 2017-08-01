class RoundSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :quest_title, :played_by, :completion_score, :accuracy_score, :date_of_play, :first_question
  belongs_to :player, class_name: 'User'
end
