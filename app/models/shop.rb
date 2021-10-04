class Shop < ApplicationRecord

  belongs_to :genre
  has_many :reviews, dependent: :destroy

  attachment :image

end
