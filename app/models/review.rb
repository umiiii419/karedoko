class Review < ApplicationRecord

  belongs_to :user
  belongs_to :shop

  attachment :image

end
