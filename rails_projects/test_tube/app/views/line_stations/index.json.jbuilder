json.array!(@line_stations) do |line_station|
  json.extract! line_station, :id, :line_id, :integer, :station_id, :integer
  json.url line_station_url(line_station, format: :json)
end
