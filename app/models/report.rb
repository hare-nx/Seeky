class Report < ApplicationRecord
  belongs_to :user, primary_key: :user_id
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :reported, class_name: 'User'
  validate :required_either_post_id_or_comment_id


  def number_of_hidden_data(user)
    post_count=Post.where(user_id: user.user_id, status: false).count
    comment_count=Comment.where(user_id: user.user_id, status: false).count
    post_count+comment_count
  end


  private

  def required_either_post_id_or_comment_id
    return if post_id.present? ^ comment_id.present?
  end
  
end
