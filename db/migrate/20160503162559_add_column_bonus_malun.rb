class AddColumnBonusMalun < ActiveRecord::Migration
  def change
    add_column :osago_calculators,  :bonus_malun,  :string, limit: 3, default: "M"
  end
end
