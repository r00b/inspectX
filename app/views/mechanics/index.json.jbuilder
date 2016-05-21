json.array!(@mechanics) do |mechanic|
  json.extract! mechanic, :id, :mechanic_id, :bio, :speciality
  json.url mechanic_url(mechanic, format: :json)
end
