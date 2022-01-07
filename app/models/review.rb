class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :comments

  validates :content, presence: true, length: { maximum: 5000 }

end
