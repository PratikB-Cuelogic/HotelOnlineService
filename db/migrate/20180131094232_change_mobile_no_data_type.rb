class ChangeMobileNoDataType < ActiveRecord::Migration[5.1]
  def change
    change_column :members, :mobile_no, :string, :limit => 10
  end
end
