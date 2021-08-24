class AddFidelityPointToContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :fidelity_point, :integer
  end
end
