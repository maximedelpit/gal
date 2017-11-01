class Zone < ApplicationRecord
  belongs_to :user
  belongs_to :prospect_area

  delegate :to_s, to: :prospect_area, prefix: false, allow_nil: true
end
