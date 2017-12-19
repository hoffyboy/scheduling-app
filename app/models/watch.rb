class Watch < ApplicationRecord
  belongs_to :client

  validates :primary, presence: true
  validates :secondary, presence: true

end
