class AddLngToQuestions < ActiveRecord::Migration[5.1]
  def change
    change_table :questions do |t|
      t.decimal :lng, precision: 10, scale: 6, null: false
    end
  end
end
