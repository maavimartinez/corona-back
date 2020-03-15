class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :body
      t.datetime :date_time

      t.timestamps
    end
  end
end
