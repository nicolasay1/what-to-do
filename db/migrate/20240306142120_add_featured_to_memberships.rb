class AddFeaturedToMemberships < ActiveRecord::Migration[7.1]
  def change
    add_column :memberships, :admin, :boolean, :default => false
  end
end
