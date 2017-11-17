class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.text :schedule
      t.integer :capacity

      t.timestamps
    end
  end
end
