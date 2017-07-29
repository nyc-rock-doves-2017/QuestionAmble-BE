class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
      t.integer :creator_id, null: false
      t.string :title, null: false
      t.string :key, null: false
      t.text :description
      
      t.timestamps
    end
  end
end
