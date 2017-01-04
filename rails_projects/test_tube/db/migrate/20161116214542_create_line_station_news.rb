class CreateLineStationNews < ActiveRecord::Migration
  def change
    create_table :line_station_news do |t|
      t.integer :line_id
      t.integer :station_id

      t.timestamps
    end
  end
end
