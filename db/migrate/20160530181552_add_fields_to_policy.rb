class AddFieldsToPolicy < ActiveRecord::Migration
  def change
    add_column :policies, :fullname, :string
    add_column :policies, :owner, :string
    add_column :policies, :auto_id, :integer
    add_column :policies, :gos_znak, :string
    add_column :policies, :auto_passport_type, :string
    add_column :policies, :auto_passport_serial_number, :string
    add_column :policies, :auto_passport_number, :string
  end
end
