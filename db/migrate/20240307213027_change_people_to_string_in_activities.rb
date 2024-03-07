class ChangePeopleToStringInActivities < ActiveRecord::Migration[7.1]
  def change
    change_column :activities, :people, :string
  end
end
