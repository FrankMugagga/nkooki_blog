class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :comments_counter, default: 0
      t.string :likes
      t.integer :counter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
