class AddColumnComments2 < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :image_date, :date
  end
end
