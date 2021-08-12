class CreateFlorists < ActiveRecord::Migration[6.1]
  def change
    create_table :florists do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :phone
      t.integer :opening_hours
      t.string :description

      t.timestamps
    end
  end
end
