class AddMonetizeToComposition < ActiveRecord::Migration[6.1]
  def change
    add_monetize :compositions, :price, currency: { present: false }
  end
end
