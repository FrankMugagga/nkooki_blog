class RemoveLikesFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :likes, :string
    remove_column :posts, :counter, :integer
  end
end
