class ChangeDatatype < ActiveRecord::Migration[5.0]
  def change
    change_column_null :places, :adress, null: false
    change_column_null :places, :image_date, null: false
    change_column_null :places, :image, null: false
    change_column_null :comments, :image_date, null: false
    change_column_null :comments, :image, null: false
  end
end
