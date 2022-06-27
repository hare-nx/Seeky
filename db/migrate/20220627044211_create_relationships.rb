class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :user, null: false
      t.references :follow, null: false
      t.timestamps
      t.index [:user_id, :follow_id], unique: true
    end
    add_foreign_key :relationships, :users, column: :user_id , primary_key: :user_id
    add_foreign_key :relationships, :users, column: :follow_id , primary_key: :user_id
  end
end
