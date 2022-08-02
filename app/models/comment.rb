class Comment < ApplicationRecord
  belongs_to :user, primary_key: :user_id
  belongs_to :post
  has_many :reports, dependent: :destroy



  def reported_by?(user, comment)
    reports.exists?(user_id: user.user_id, comment_id: comment.id)
  end
end
