class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.text :content
      t.string :firstname
      t.string :lastname
      t.string :phone

      t.timestamps
    end
  end
end
