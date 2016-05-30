class AddAutomobileIdToKaskoCalculators < ActiveRecord::Migration
  def change
    add_column :kasko_calculators, :automobile_id, :integer
  end
end
