class Spot < ApplicationRecord

has_one_attached :image

has_many :reviews, dependent: :destroy

belongs_to :category, optional: true



end
