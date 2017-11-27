class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :venue_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
