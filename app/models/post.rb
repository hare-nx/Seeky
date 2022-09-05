class Post < ApplicationRecord
  belongs_to :user, primary_key: :user_id
  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :post_image


  validates :outer, :tops, :bottoms, :shoes, :bag, length: {maximum: 20}
  validates :body, length: {maximum: 200}
  validates :post_image, presence: true
  validate if: :post_image do
    if post_image.respond_to?(:content_type)
      unless post_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:post_image, :invalid_image_type)
      end
    end
  end




  def get_post_image(width, height)
    print(333333333333)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    print(44444444444444444)
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.user_id)
  end

  def reported_by?(user, post)
    reports.exists?(user_id: user.user_id, post_id: post.id)
  end
end
