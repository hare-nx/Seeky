class Comment < ApplicationRecord
  belongs_to :user, primary_key: :user_id
  belongs_to :post
end
