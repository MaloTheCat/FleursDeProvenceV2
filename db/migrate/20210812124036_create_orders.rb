class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      # t.integer :total_price
      t.monetize :amount, currency: { present: false }
      t.string :state
      t.references :relai, null: false, foreign_key: true
      t.references :composition, null: false, foreign_key: true
      # t.references :customer, null: false, foreign_key: true
      t.string :checkout_session_id

      t.timestamps
    end
  end
end
