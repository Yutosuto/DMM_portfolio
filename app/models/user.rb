class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :post_comments
  has_many :favorites
  has_many :post_images
  attachment :profile_image, destroy: false

  validates :name,length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :name, presence: true
  #validates :telephone_number, presence: true
  #validates :address, presence: true

end
