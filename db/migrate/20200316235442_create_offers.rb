class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
