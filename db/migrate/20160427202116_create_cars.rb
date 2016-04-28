class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :title
      t.integer :rate
      t.boolean :tractor
      t.integer :trailer_category, default: 0

      t.timestamps null: false
    end
  end
end
