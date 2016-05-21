json.array!(@inspections) do |inspection|
  json.extract! inspection, :id, :mechanic_id, :user_id, :location, :vehicle_year, :vehicle_make, :vehicle_model, :date, :time, :created_at, :updated_at
  json.url inspection_url(inspection, format: :json)
end
