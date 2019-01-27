class AddImageUrlToSpecial < ActiveRecord::Migration[5.2]
  def change
    add_column :specials, :image_url, :text
  end
end
