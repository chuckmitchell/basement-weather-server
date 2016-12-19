json.extract! reading, :id, :temperature, :humidity, :created_at, :updated_at
json.url reading_url(reading, format: :json)
json.created_at_local reading.created_at.to_formatted_s(:short)