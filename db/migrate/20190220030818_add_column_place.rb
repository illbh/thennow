class AddColumnPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :image, :string
  end
  
  def change
    add_column :comments, :image, :string
  end
end
