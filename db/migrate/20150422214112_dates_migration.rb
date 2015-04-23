class DatesMigration < ActiveRecord::Migration
  def change
    add_column :users, :dates_enabled, :boolean
    add_column :users, :male_dates, :boolean
    add_column :users, :female_dates, :boolean
    add_column :users, :dates_sports, :boolean
    add_column :users, :dates_biking, :boolean
    add_column :users, :dates_hiking, :boolean
    add_column :users, :dates_reading, :boolean
    add_column :users, :dates_movies, :boolean
    add_column :users, :dates_videogames, :boolean
    add_column :users, :dates_min_age, :integer
    add_column :users, :dates_max_age, :integer
  end
end
