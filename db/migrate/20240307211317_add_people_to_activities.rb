class AddPeopleToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :people, :integer
  end
end
