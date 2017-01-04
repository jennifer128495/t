class Line < ActiveRecord::Base
	has_many :line_station_news
	has_many :stations, through: :line_station_news
end
