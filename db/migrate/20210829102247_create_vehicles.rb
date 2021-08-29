class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :brand, null: false
      t.string :model, null: false
      t.string :trim
      t.integer :year, null: false
      t.integer :vin, null: false
      t.string :external_color, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.text :info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
