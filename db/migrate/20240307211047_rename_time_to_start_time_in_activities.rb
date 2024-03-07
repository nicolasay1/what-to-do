class RenameTimeToStartTimeInActivities < ActiveRecord::Migration[7.1]
  def change
    rename_column :activities, :time, :start_time
  end
end
