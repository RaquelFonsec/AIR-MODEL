class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :data_init
      t.string :data_end
      t.float :total_price

      t.timestamps
    end
  end
end
