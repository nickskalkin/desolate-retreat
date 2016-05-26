class ChangeTralerDafaultRate < ActiveRecord::Migration
  def change
    change_column :cars, :trailer_rate, :integer, default: 1.0
  end
end
