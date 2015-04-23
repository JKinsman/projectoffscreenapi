class DatesMig2 < ActiveRecord::Migration
  def change
   
    add_column :users, :dates_reading, :boolean
    remove_column :users, :datess_reading, :boolean
  end
end
