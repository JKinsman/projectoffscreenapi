class FriendsMigration < ActiveRecord::Migration
  def change
    add_column :users, :friends_enabled, :boolean
    add_column :users, :male_friends, :boolean
    add_column :users, :female_friends, :boolean
    add_column :users, :friends_sports, :boolean
    add_column :users, :friends_biking, :boolean
    add_column :users, :friends_hiking, :boolean
    add_column :users, :friends_reading, :boolean
    add_column :users, :friends_movies, :boolean
    add_column :users, :friends_videogames, :boolean
    add_column :users, :friends_min_age, :integer
    add_column :users, :friends_max_age, :integer
  end
end
