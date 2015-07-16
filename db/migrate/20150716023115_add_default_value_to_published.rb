class AddDefaultValueToPublished < ActiveRecord::Migration
  def up
    change_column :dishes, :published, :boolean, :default => true
  end

  def down
    change_column :dishes, :published, :boolean, :default => nil
  end
end
