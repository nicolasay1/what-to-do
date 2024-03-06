class AddInviteTokenToGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :invite_token, :string
  end
end
