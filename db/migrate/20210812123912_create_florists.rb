class CreateFlorists < ActiveRecord::Migration[6.1]
  def change
    create_table :florists do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.integer :phone, null: false
      t.integer :opening_hours
      t.string :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
