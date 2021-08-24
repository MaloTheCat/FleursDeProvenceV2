class RenameOrderFlowersToOrderCompositions < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_flowers, :order_compositions
  end
end
