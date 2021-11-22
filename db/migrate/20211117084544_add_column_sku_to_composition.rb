class AddColumnSkuToComposition < ActiveRecord::Migration[6.1]
  def change
    add_column :compositions, :sku, :string
  end
end
