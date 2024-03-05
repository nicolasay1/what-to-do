class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :frequency
      t.date :date
      t.time :time
      t.text :address
      t.text :tags

      t.timestamps
    end
  end
end
