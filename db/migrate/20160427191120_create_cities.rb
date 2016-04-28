class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.float :car_rate
      t.float :tractor_rate

      t.timestamps null: false
    end
  end
end
