class AddCoordinatesToRelais < ActiveRecord::Migration[6.1]
  def change
    add_column :relais, :latitude, :float
    add_column :relais, :longitude, :float
  end
end
