class AddColumnToContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :firstname, :string
    add_column :contacts, :lastname, :string
    add_column :contacts, :phone, :integer
    # add_column :contacts, :email, :string
  end
end
