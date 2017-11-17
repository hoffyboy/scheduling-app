class Watch < ApplicationRecord
  belongs_to :client

  monetize :price_cents

  validates :brand, presence: true
  validates :model, presence: true
  validates :condition, presence: true
  validates :price, presence: true
end
