class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :quest_id, null: false
      t.text :question_text, null: false
      t.text :answer, null: false
      t.text :hint, null: false
      t.string :clue_type
      t.text :clue_text, null: false

      t.timestamps
    end
  end
end
