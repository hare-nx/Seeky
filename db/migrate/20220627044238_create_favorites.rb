class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
    add_foreign_key :favorites, :users, column: :user_id , primary_key: :user_id
  end
end
