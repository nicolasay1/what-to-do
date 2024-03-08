class AddLinkToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :link, :string
  end
end
