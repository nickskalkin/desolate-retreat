class AddUserIdToOsagoCalculator < ActiveRecord::Migration
  def change
    add_column :osago_calculators, :user_id, :integer
    add_index :osago_calculators, :user_id
  end
end
