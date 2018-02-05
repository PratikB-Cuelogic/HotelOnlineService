class AddCityTohotel < ActiveRecord::Migration[5.1]
  def change
  add_column :hotels, :city, :string, :null => false, default: ""
  end
end
