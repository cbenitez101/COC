class CreateDishesOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes_orders do |t|
      t.references :dish
      t.references :order
      t.timestamps
    end
  end
end
