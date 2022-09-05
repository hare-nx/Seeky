class CreateAvatars < ActiveRecord::Migration[6.1]
  def change
    create_table :avatars do |t|
      t.references :user, null: false, type: :string, unique: true
      t.timestamps
    end
  end
end
