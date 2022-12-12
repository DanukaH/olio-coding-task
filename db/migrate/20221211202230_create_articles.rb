class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :article_unique_id
      t.integer :like_count, default: 0

      t.timestamps
    end
  end
end
