json.array!(@mechanic_searches) do |mechanic_search|
  json.extract! mechanic_search, :id, :user_id, :zip, :vehicle_make
  json.url mechanic_search_url(mechanic_search, format: :json)
end
