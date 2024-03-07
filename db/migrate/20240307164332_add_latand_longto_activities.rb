class AddLatandLongtoActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :lat, :integer
    add_column :activities, :lng, :integer
  end
end
