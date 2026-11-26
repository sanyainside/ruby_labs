class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.string :building
      t.integer :floor
      t.string :room
      t.string :booked_by
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
