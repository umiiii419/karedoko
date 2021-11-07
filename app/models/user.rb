class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :authentication_keys => [:email]

  def active_for_authentication?
    super && (is_deleted == false)
  end

  attachment :profile_image

  has_many :reviews, dependent: :destroy

end
