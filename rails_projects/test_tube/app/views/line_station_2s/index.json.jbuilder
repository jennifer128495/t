json.array!(@line_station_2s) do |line_station_2|
  json.extract! line_station_2, :id, :line_id, :station_id
  json.url line_station_2_url(line_station_2, format: :json)
end
