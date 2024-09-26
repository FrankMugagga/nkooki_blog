class AddLikesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :likes, :integer
  end
end
