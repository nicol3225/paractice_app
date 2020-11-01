class RenamePostColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :post, :content
  end
end
