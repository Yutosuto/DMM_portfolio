class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  validates :name,length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :name, presence: true
  #validates :telephone_number, presence: true
  #validates :address, presence: true

end
