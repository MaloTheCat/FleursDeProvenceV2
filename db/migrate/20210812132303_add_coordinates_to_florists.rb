class AddCoordinatesToFlorists < ActiveRecord::Migration[6.1]
  def change
    add_column :florists, :latitude, :float
    add_column :florists, :longitude, :float
  end
end
