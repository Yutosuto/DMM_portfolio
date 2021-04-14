class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments
  has_many :favorites

  validates :title, presence: true
  validates :body, presence: true, length: {maxmum: 200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
