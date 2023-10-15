json.extract! enrollment, :id, :first_name, :last_name, :phone, :email, :goals, :previous_training, :comments, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
