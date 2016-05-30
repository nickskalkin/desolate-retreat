class CreateKaskoCalculators < ActiveRecord::Migration
  def change
    create_table :kasko_calculators do |t|
      t.integer :city_id
      t.float :cost_min
      t.float :cost_max
      t.timestamps null: false
    end
  end
end
