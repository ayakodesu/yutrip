class Spot < ApplicationRecord

has_one_attached :image

has_many :reviews, dependent: :destroy
has_many :favorites, dependent: :destroy
belongs_to :category, optional: true

def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end


end
