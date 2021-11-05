class AddFirstnameAndLastnameToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :firstname, :string
    add_column :customers, :lastname, :string
  end
end
