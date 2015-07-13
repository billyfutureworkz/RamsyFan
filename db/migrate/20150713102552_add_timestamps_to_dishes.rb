class AddTimestampsToDishes < ActiveRecord::Migration
  def change
    add_timestamps(:dishes)
  end
end
