class AddAgeAndGenderAndCareersAndHikingAndBikingAndSportsAndReadingAndMoviesAndVideogamesAndBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :career, :string
    add_column :users, :hiking, :boolean
    add_column :users, :biking, :boolean
    add_column :users, :sports, :boolean
    add_column :users, :reading, :boolean
    add_column :users, :movies, :boolean
    add_column :users, :videogames, :boolean
    add_column :users, :bio, :string
  end
end
