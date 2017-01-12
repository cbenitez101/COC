class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :allergens
      t.text :description
      t.string :category
      t.float :price
      t.string :image
      t.integer :active
      t.timestamps
    end
  end
end
