class AddAttachmentClueImageToQuestions < ActiveRecord::Migration[5.1]
  def self.up
    change_table :questions do |t|
      t.attachment :clue_image
    end
  end

  def self.down
    remove_attachment :questions, :clue_image
  end
end
