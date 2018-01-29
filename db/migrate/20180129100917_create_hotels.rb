class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :location
      t.text :description
      t.float :rating

      t.timestamps
    end
  end
end
