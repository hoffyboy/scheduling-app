class Client < ApplicationRecord

  acts_as_booker

  before_save { self.email = email.downcase if email.present? }

  validates :email,
  presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 254 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :primary, presence: true
  validates :secondary, presence: true

  # validates_format_of :phone,
  #   with: /\d{3}-\d{3}-\d{4}/,
  #   message: "number must be in XXX-XXX-XXXX format."
end
