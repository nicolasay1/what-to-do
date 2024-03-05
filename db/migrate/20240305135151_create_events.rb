class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.boolean :booked
      t.date :date
      t.time :time
      t.references :group, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
