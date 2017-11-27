class Watch < ApplicationRecord
  belongs_to :client

  validates :brand, presence: true
  validates :model, presence: true
  validates :condition, presence: true
  validates :price, presence: true
end
