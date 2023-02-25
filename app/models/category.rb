class Category < ApplicationRecord

  has_one_attached :image

  has_many :spots, dependent: :destroy

end
