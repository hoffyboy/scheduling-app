class CreateWatches < ActiveRecord::Migration[5.0]
  def change
    create_table :watches do |t|
      t.string :primary
      t.string :secondary
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
