class Client < ApplicationRecord
  acts_as_booker

  before_save { self.email = email.downcase if email.present? }

  validates :email,
  presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 254 }
end
