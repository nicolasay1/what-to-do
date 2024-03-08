class ChangePriceToStringInActivities < ActiveRecord::Migration[7.1]
  def change
    change_column :activities, :price, :string
  end
end
