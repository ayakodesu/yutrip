class Favorite < ApplicationRecord

  has_one_attached :image

  belongs_to :user, optional: true
  belongs_to :spot, optional: true
end
