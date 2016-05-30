class AddFranchiseToKaskoCalculator < ActiveRecord::Migration
  def change
    add_column :kasko_calculators, :franchise, :float
  end
end
