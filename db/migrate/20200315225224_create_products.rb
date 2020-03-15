class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :available
      t.datetime :return_date

      t.timestamps
    end
  end
end
