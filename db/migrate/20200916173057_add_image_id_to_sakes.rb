class AddImageIdToSakes < ActiveRecord::Migration[5.2]
  def change
    add_column :sakes, :image_id, :text
  end
end
