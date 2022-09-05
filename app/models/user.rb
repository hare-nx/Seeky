class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum face_type: {cute: 0, active_cute: 1, flesh: 2, cool_casual: 3, feminin: 4, cool: 5, elegant: 6, soft_elegant: 7}
  enum frame_type: {straight: 0, wave: 1, natural: 2}
  enum status: {active: 0, suspension: 1, withdrawal: 2}



  validates :user_id, :username, presence: true


  has_many :posts
  has_many :reports
  has_many :report_users, through: :reports, source: :user
  has_many :reported_users, through: :reverse_of_reports, source: :reported
  has_many :reverse_of_reports, class_name: 'Report', foreign_key: 'reported_id'
  has_many :favorites
  has_many :comments
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_one :avatar


  self.primary_key = :user_id



  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_id = "guest_id"
      user.username="ゲスト"
    end
  end



  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.user_id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.user_id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def number_of_reported_posts(user)
    Report.where(reported_id: user.user_id).pluck(:post_id).compact.count
  end

  def number_of_reported_comments(user)
    Report.where(reported_id: user.user_id).pluck(:comment_id).compact.count
  end


end
