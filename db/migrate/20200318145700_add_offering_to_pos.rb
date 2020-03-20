class AddOfferingToPos < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :offering, :boolean
  end
end
