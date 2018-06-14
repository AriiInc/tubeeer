class MakeColumnImage < ActiveRecord::Migration[5.1]
  def change 
    change_column :blogs, :image_id, :text
  end
end
