class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :quest_id, :question_text, :answer, :hint, :clue_type, :clue_text
end
