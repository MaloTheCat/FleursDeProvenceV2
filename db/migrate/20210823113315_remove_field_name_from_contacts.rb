class RemoveFieldNameFromContacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :name, :string
  end
end
