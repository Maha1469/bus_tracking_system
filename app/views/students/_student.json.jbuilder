json.extract! student, :id, :name, :roll_number, :batch_number, :semester, :department, :approve, :user_id, :created_at, :updated_at
json.url student_url(student, format: :json)
