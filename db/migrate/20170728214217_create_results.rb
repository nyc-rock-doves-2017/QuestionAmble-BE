class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :round_id, null: false
      t.integer :question_id, null: false
      t.boolean :win

      t.timestamps
    end
  end
end
