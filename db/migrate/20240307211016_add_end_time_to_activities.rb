class AddEndTimeToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :end_time, :time
  end
end
