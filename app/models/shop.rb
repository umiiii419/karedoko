class Shop < ApplicationRecord

  belongs_to :genre

  attachment :image

end
