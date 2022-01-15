class UserTour < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  scope :by_dates, ->(start_date, end_date) { UserTour.where(created_at: start_date..end_date) }

  enum status: {wait:0, confirm:1}
end
