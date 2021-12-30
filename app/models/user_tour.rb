class UserTour < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  enum status: {wait:0, confirm:1}
end
