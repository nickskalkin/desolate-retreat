class CreateAutomobiles < ActiveRecord::Migration
  def change
    create_table :automobiles do |t|
      t.string :brand
      t.string :model
      t.integer :cost
      t.integer :year
      t.float :engine
      t.boolean :parking_spot
      t.boolean :autostart
      t.integer :osago_calculator_id
      t.integer :kasko_calculator_id
      t.timestamps null: false
    end
  end
end
