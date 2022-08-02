class FrameQuestion < ApplicationRecord
  validates :title, :straight, :wave, :natural, presence: true
end
