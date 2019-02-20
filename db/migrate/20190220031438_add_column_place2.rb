class AddColumnPlace2 < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :image, :string
  end
end
