json.extract! booking, :id, :user_id, :flat_id, :start_date, :end_date, :total_price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
