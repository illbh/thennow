class RemoveColumnFromPlaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :image
    remove_column :places, :image_date
    remove_column :places, :content
  end
end
