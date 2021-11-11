class CreateRelais < ActiveRecord::Migration[6.1]
  def change
    create_table :relais do |t|
      t.string :address, null: false
      t.string :name, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
