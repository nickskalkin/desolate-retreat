class CreateCarHorsePowers < ActiveRecord::Migration
  def change
    create_table :car_horse_powers do |t|
      t.string :description
      t.float :rate

      t.timestamps null: false
    end
  end
end
