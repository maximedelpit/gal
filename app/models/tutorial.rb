class Tutorial < ApplicationRecord
  validates :youtube_id, :title, presence: true, uniqueness: true
end
