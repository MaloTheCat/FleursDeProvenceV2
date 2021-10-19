class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :fidelity_point
      t.references :florist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
