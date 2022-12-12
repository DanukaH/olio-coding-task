class Article < ApplicationRecord
  has_many :likes
  validates_uniqueness_of :article_unique_id

  def liked?(user)
    !!self.likes.find {|like| like.user_id == user.id }
  end
end
