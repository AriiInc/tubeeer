class AddImageIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :image_id, :string
  end
end
