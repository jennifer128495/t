json.array!(@line_station_news) do |line_station_news|
  json.extract! line_station_news, :id, :line_id, :station_id
  json.url line_station_news_url(line_station_news, format: :json)
end
