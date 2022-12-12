class RemoveLikeCountTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :like_count_id, :integer

    drop_table :like_counts do |t|
      t.integer :article_id
      t.integer :like_count

      t.timestamps
    end
  end
end
