class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.references :user, foreign_key: true
      t.string :adress
      t.date :image_date
      t.string :content

      t.timestamps
    end
  end
end
