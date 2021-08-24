class AddReferencesToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :contact, null: false, foreign_key: true
  end
end
