class AddpostNoToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :postId, :integer
  end
end
