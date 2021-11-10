class CreateCompositions < ActiveRecord::Migration[6.1]
  def change
    create_table :compositions do |t|
      t.string :name

      t.integer :base_price
      t.integer :quantity
      t.boolean :disponibility
      t.string :photo_title
      t.references :florist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
