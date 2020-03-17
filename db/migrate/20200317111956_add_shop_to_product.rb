class AddShopToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :shop
  end
end
