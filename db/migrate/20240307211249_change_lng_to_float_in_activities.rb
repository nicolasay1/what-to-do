class ChangeLngToFloatInActivities < ActiveRecord::Migration[7.1]
  def change
    change_column :activities, :lng, :float
  end
end
