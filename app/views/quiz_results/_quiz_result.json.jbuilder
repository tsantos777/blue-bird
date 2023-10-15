json.extract! quiz_result, :id, :first_name, :last_name, :email, :in_us, :program, :why_pilot, :previous_training, :wings_lift, :want_cfi, :goals, :schedule_visit, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :comments, :created_at, :updated_at
json.url quiz_result_url(quiz_result, format: :json)
