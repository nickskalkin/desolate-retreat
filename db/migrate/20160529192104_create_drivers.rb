class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :age
      t.integer :experience
      t.integer :gender
      t.boolean :childrens
      t.boolean :marriage
      t.integer :osago_calculator_id
      t.integer :kasko_calculator_id

      t.timestamps null: false
    end
  end
end
