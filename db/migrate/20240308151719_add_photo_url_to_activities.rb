class AddPhotoUrlToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :image_url, :string
  end
end
