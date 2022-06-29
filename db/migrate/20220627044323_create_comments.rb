class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, type: :string
      t.integer :post_id, null: false
      t.string :comment, null: false
      t.boolean :status, null: false, default: true
      t.timestamps
    end
    add_foreign_key :comments, :users, column: :user_id , primary_key: :user_id
  end
end
