class ChangeLatToFloatInActivities < ActiveRecord::Migration[7.1]
  def change
    change_column :activities, :lat, :float
  end
end
