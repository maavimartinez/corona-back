class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :rate
      t.bigint :reviewer_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
