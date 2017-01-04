class CreateLineStations < ActiveRecord::Migration
  def change
    create_table :line_stations do |t|
      t.string :line_id
      t.string :integer
      t.string :station_id
      t.string :integer

      t.timestamps
    end
  end
end
