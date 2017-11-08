class Schedule < ApplicationRecord
  belongs_to :user

  acts_as_bookable time_type: :fixed, capacity_type: :closed
end
