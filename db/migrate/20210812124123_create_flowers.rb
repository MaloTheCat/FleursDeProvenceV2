class CreateFlowers < ActiveRecord::Migration[6.1]
  def change
    create_table :flowers do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.boolean :disponibility
      t.references :florist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
