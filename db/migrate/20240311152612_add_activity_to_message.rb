class AddActivityToMessage < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :activity, :boolean, default: false;
  end
end
