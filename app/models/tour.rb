class Tour < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :duration, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :phone_number, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 5000 }

  belongs_to :category
  has_many :reviews
  has_many :user_like_tours
  has_one_attached :image

  scope :same_location, -> (location) {where("address LIKE ?", "%#{location}%")}
  def display_image
    image.variant(resize_to_limit: [80, 90])
  end
end
