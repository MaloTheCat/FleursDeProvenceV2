class AddPhototitleToComposition < ActiveRecord::Migration[6.1]
  def change
    add_column :compositions, :photo_title, :string
  end
end
