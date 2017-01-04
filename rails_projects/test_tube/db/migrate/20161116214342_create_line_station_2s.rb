class CreateLineStation2s < ActiveRecord::Migration
  def change
    create_table :line_station_2s do |t|
      t.integer :line_id
      t.integer :station_id

      t.timestamps
    end
  end
end
