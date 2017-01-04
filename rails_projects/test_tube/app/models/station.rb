class Station < ActiveRecord::Base
	include HTTParty
	has_many :line_station_news
	has_many :lines, through: :line_station_news
end
