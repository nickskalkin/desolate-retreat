class AddColumnCarMaxRate < ActiveRecord::Migration
  def change
    add_column :cars, :rate_max, :integer, default: 0
    add_column :cars, :trailer_rate, :float, default: 0
    add_column :osago_calculators, :cost_max, :float, default: 0.0
  end
end
