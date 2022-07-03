class CreateFaceQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :face_questions do |t|
      t.string :title, null: false, unique: true
      t.string :answer_1, null: false
      t.string :answer_2, null: false
      t.timestamps
    end
  end
end
