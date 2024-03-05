class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :proposal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :liked

      t.timestamps
    end
  end
end
