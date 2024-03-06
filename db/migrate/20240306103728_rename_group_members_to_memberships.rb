class RenameGroupMembersToMemberships < ActiveRecord::Migration[7.1]
  def change
    rename_table :group_members, :memberships
  end
end
