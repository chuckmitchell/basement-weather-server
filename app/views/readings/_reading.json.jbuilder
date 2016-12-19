json.extract! reading, :id, :temperature, :humidity, :created_at, :updated_at
json.url reading_url(reading, format: :json)
json.created_at_local reading.created_at.strftime("Last reading on %a, %b %e %Y @ %I:%M %p")