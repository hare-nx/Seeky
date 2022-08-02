class CreateFrameQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :frame_questions do |t|
      t.string :title, null: false, unique: true
      t.string :straight, null: false
      t.string :wave, null: false
      t.string :natural, null: false
      t.timestamps
    end
  end
end
