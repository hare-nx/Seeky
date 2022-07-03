class FaceQuestion < ApplicationRecord
  validates :title, :answer_1, :answer_2, presence: true
end
