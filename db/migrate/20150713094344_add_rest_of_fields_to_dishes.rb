class AddRestOfFieldsToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :cost, :decimal
    add_column :dishes, :pax, :integer
    add_column :dishes, :vegetarian, :boolean
  end
end
