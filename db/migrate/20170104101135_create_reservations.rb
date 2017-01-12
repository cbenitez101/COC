class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :diners
      t.integer :restaurant_id
      t.date :time
      t.integer :history_id
      t.timestamps
    end
  end
end
