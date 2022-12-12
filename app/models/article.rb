class Article < ApplicationRecord
  has_many :likes

  validates :article_unique_id, presence: true,
                                uniqueness: true

  # Preventing from users to like an article more than once
  def liked?(user)
    !!self.likes.find {|like| like.user_id == user.id }
  end
end
