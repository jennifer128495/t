class AddNextStationIdToLineStationNews < ActiveRecord::Migration
  def change
    add_column :line_station_news, :next_station_id, :string
  end
end
