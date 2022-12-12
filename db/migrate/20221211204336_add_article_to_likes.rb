class AddArticleToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :article, null: false, foreign_key: true
  end
end
