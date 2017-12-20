class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :primary
      t.string :secondary

      t.timestamps

    end
  end
end
