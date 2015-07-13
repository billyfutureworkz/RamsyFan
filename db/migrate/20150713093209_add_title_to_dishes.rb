class AddTitleToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :title, :string
  end
end
