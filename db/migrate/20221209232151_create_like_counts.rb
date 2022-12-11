class CreateLikeCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :like_counts do |t|
      t.integer :article_id
      t.integer :like_count

      t.timestamps
    end
  end
end
