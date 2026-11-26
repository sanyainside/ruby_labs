json.extract! booking, :id, :building, :floor, :room, :booked_by, :starts_at, :ends_at, :created_at, :updated_at
json.url booking_url(booking, format: :json)
