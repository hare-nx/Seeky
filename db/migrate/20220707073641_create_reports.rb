class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user, null: false, type: :string
      t.references :reported, null: false, type: :string
      t.integer :post_id
      t.integer :comment_id
      t.timestamps
    end
    add_foreign_key :reports, :users, column: :user_id , primary_key: :user_id
    add_foreign_key :reports, :users, column: :reported_id , primary_key: :user_id
  end
end
