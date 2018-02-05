class AddStateToHotel < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :state, :string, :null => false, default: ""
  end
end
