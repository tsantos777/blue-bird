json.extract! checkout, :id, :first_name, :last_name, :email, :phone, :certifications, :interested_aircraft, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :comments, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
