class RequireBookingOwner < ActiveRecord::Migration[8.1]
  def change
    change_column_null :bookings, :user_id, false
  end
end