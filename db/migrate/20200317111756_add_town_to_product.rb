class AddTownToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :town
  end
end
