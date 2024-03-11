class DropProposals < ActiveRecord::Migration[7.1]
  def change
    drop_table :proposals
  end
end
