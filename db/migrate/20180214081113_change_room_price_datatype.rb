class ChangeRoomPriceDatatype < ActiveRecord::Migration[5.1]
  def change
    change_column :rooms, :price, :float
  end
end
