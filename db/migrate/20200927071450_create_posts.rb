class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps
      t.text :post
      t.references :user_id, foreign_key: true
  
    end
  end
end
