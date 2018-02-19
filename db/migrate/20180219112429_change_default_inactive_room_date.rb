class ChangeDefaultInactiveRoomDate < ActiveRecord::Migration[5.1]
  def change
    change_column :rooms, :inactive, :date, :default => 'null'
  end
end
