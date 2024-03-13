class RenameLngToLon < ActiveRecord::Migration[7.1]
  def change
    rename_column :activities, :lng, :longitude
    rename_column :activities, :lat, :latitude
  end
end
