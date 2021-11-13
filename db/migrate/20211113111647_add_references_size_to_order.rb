class AddReferencesSizeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :size, foreign_key: true
  end
end
