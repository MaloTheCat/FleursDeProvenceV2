class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.boolean :state_order
      t.references :customer, null: false, foreign_key: true
      t.references :relai, null: false, foreign_key: true
      # t.references :florist, null: false, foreign_key: true
      # t.references :composition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
