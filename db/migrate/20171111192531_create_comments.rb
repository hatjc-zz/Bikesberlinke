class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :rating
      t.string :message
      t.datetime :created_at
    end
  end
end
