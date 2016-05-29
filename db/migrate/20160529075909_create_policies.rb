class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.integer :policy_object_id
      t.string :policy_object_type
      t.integer :user_id
      t.string :address
      t.timestamps null: false
    end
  end
end
