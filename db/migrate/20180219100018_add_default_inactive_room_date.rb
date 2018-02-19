class AddDefaultInactiveRoomDate < ActiveRecord::Migration[5.1]
  def change
    change_column :rooms, :inactive, :date, :default => '1999-09-09'
  end
end
