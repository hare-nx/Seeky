class Favorite < ApplicationRecord
  belongs_to :user, primary_key: :user_id
  belongs_to :post

  validates :user_id, :post_id, presence: true

end
