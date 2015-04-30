class AddImagefieldToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :image, :text, :limit => nil
  end
end
