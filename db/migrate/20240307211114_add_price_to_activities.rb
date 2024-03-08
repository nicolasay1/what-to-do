class AddPriceToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :price, :float
  end
end
