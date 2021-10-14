class ChangeOrderCompositionsToOrdersCompositions < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_compositions, :orders_compositions
  end
end
