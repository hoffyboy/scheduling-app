class Location < ApplicationRecord
  belongs_to :client

  validates :venue_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end