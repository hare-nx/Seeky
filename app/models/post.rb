class Post < ApplicationRecord
  belongs_to :user, primary_key: :user_id
  has_many :comments
  has_many :favorites
  has_one_attached :post_image


  def get_post_image(width, height)
    unless post_image.attatched?
      file_path = Rails.root.join('app/assets/images/default.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
end
