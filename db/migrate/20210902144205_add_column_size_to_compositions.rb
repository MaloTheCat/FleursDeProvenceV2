class AddColumnSizeToCompositions < ActiveRecord::Migration[6.1]
  def change
    add_column :compositions, :size, :string
  end
end
