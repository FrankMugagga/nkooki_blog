class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :photo
      t.text :bio
      t.integer :posts_counter
      t.string :phone
      t.string :twitter

      t.timestamps
    end
  end
end
