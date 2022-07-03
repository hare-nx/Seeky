class AddGenerationOrShapeToFaceQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :face_questions, :generation_or_shape, :boolean, null: false
  end
end
