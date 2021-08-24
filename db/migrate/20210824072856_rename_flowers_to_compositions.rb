class RenameFlowersToCompositions < ActiveRecord::Migration[6.1]
  def change
    rename_table :flowers, :compositions
  end
end
