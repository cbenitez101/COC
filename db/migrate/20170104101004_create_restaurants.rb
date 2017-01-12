class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :phone
      t.string :address
      t.string :provincia
      t.string :localidad
      t.timestamps
    end
  end
end
