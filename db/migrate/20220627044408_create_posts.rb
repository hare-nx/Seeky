class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, type: :string
      t.string :outer
      t.string :tops
      t.string :bottoms
      t.string :shoes
      t.string :bag
      t.string :body
      t.boolean :status, null: false, default: true
      t.timestamps
    end
    add_foreign_key :posts, :users, column: :user_id , primary_key: :user_id
  end
end
