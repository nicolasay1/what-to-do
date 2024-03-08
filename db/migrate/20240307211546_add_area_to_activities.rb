class AddAreaToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :area, :string
  end
end
