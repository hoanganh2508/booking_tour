class Tour < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :phone_number, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1000 }
  has_one_attached :image
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
