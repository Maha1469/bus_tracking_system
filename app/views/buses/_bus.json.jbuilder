json.extract! bus, :id, :current_lat, :current_lan, :description, :evening_start_time, :evening_end_time, :morning_start_time, :morning, :status, :user_id, :created_at, :updated_at
json.url bus_url(bus, format: :json)
