json.extract! discover_flight, :id, :first_name, :last_name, :email, :phone, :aircraft, :preferred_date, :preferred_availability, :alternate_date, :preferred_availability, :comments, :created_at, :updated_at
json.url discover_flight_url(discover_flight, format: :json)
