class AddPublishedToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :published, :boolean
  end
end
