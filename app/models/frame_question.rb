class FrameQuestion < ApplicationRecord
  validates :title, :strate, :wave, :natural, presence: true
end
