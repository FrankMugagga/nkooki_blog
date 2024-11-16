class RemoveLikesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :likes, :integer
  end
end
