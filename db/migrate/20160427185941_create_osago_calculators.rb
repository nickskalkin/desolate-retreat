class CreateOsagoCalculators < ActiveRecord::Migration
  def change
    create_table :osago_calculators do |t|
      t.integer :city_id
      t.integer :drivers_count, default: 0
      t.integer :driver_experience, default: 0
      t.integer :car_id
      t.integer :car_horse_power_id
      t.boolean :trailer, default: false
      t.boolean :with_accidents, default: false
      t.float   :cost
      t.timestamps null: false
    end
  end
end
