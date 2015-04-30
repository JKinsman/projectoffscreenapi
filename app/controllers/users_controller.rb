class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    puts "\n\n\n\n\n"
    puts @user.inspect
    puts "\n\n\n\n\n"
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users-find.json
  def findByUsername
    username = params[:username]
    @users = User.all
    @user = nil
    @users.each do |user|
      if user.username.downcase == username.downcase
        @user = user
      end
    end
    puts @users
    respond_to do |format|
      unless @user.nil?
        params[:id] = @user.id
        format.json { render json: @user, status: :ok, location: @user }
      else
        format.json { render json: "An Error occurred", status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /user-settings.json
  def set_settings
    puts "\n\n\n\n\n\n\n\n\n\nWAT\n\n\n\n\n\n\n\n\n\n"
    #@users = User.all
    username = params[:username]
    @user = nil
    User.find_each do |user|
      if user.username.downcase == username.downcase
        @user = user
      end
    end
    respond_to do |format|
      unless @user.nil?
        @user.age = params[:age]
        @user.gender = params[:gender]
        @user.career = params[:career]
        @user.hiking = params[:hiking]
        @user.biking = params[:biking]
        @user.sports = params[:sports]
        @user.reading = params[:reading]
        @user.movies = params[:movies]
        @user.videogames = params[:videogames]
        @user.bio = params[:bio]
        puts "start" 
        puts @user.inspect
        puts "end"
        if @user.save
          puts "\n\n\n\n\nsaved\n\n\n\n\n"
          params[:id] = @user.id
          format.json { render json: @user, status: :ok, location: @user }
        else
          respond_to do |format|
            format.json { render json: "An Error occurred", status: :unprocessable_entity }
          end
        end
      else 
        format.json { render json: "An Error occurred", status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /friends_settings.json
  def set_friend_settings
    puts "WATWATWATWAT\n\n\n\n\n\n\n"
    username = params[:username]
    @user = nil
    User.find_each do |user|
      if user.username.downcase == username.downcase
        @user = user
      end
    end
    respond_to do |format|
      unless @user.nil?
        @user.male_friends = params[:male_friends]
        @user.female_friends = params[:female_friends]
        @user.friends_sports = params[:friends_sports]
        @user.friends_hiking = params[:friends_hiking]
        @user.friends_biking = params[:friends_biking]
        @user.friends_reading = params[:friends_reading]
        @user.friends_videogames = params[:friends_videogames]
        @user.friends_movies = params[:friends_movies]
        @user.friends_min_age = params[:friends_min_age]
        @user.friends_max_age = params[:friends_max_age]
        @user.friends_enabled = params[:friends_enabled]
        if @user.save
          format.json { render json: @user, status: :ok, location: @user }
        else
          format.json { render json: "An Error occurred", status: :unprocessable_entity }
        end
      else 
        format.json { render json: "An Error occurred", status: :unprocessable_entity }
      end
    end
  end
    # PATCH/PUT /date_settings.json
  def set_date_settings
    puts "WATWATWATWAT\n\n\n\n\n\n\n"
    username = params[:username]
    @user = nil
    User.find_each do |user|
      if user.username.downcase == username.downcase
        @user = user
      end
    end
    respond_to do |format|
      unless @user.nil?
        @user.male_dates = params[:male_dates]
        @user.female_dates = params[:female_dates]
        @user.dates_sports = params[:dates_sports]
        @user.dates_hiking = params[:dates_hiking]
        @user.dates_biking = params[:dates_biking]
        @user.dates_reading = params[:dates_reading]
        @user.dates_videogames = params[:dates_videogames]
        @user.dates_movies = params[:dates_movies]
        @user.dates_min_age = params[:dates_min_age]
        @user.dates_max_age = params[:dates_max_age]
        @user.dates_enabled = params[:dates_enabled]
        if @user.save
          format.json { render json: @user, status: :ok, location: @user }
        else
          format.json { render json: "An Error occurred", status: :unprocessable_entity }
        end
      else 
        format.json { render json: "An Error occurred", status: :unprocessable_entity }
      end
    end
  end
  def set_colleague_settings
    username = params[:username]
    @user = nil
    User.find_each do |user|
      if user.username.downcase == username.downcase
        @user = user
      end
    end
    respond_to do |format|
      unless @user.nil?
        @user.colleagues_enabled = params[:colleagues_enabled]
        @user.colleagues_journalist = params[:colleagues_journalist]
        @user.colleagues_pharmacist = params[:colleagues_pharmacist]
        @user.colleagues_office_assistant = params[:colleagues_office_assistant]
        @user.colleagues_ceo = params[:colleagues_ceo]
        @user.colleagues_accountant = params[:colleagues_accountant]
        @user.colleagues_professor = params[:colleagues_professor]
        @user.colleagues_software_engineer = params[:colleagues_software_engineer]
        if @user.save
          format.json { render json: @user, status: :ok, location: @user }
        else
          format.json { render json: "An Error occurred", status: :unprocessable_entity }
        end
      else
        format.json { render json: "An Error occurred", status: :unprocessable_entity }
      end
    end
  end
  
  def set_profile_picture
    username = params[:username]
    @user = nil
    User.find_each do |user|
      if user.username.downcase == username.downcase
        @user = user
      end
    end
    respond_to do |format|
      unless @user.nil?
        @user.image = params[:image]
        if @user.save
          format.json {render json: @user, status: :ok, location: @user }
        else
          format.json { render json: "An Error occurred", status: :unprocessable_entity }
        end
      else
        format.json { render json: "An Error occurred", status: :unprocessable_entity }
      end
    end
  end
  def set_location
    username = params[:username]
    @user = nil
    User.find_each do |user|
      if user.username.downcase == username.downcase
        @user = user
      end
    end
    respond_to do |format|
      unless @user.nil?
        @user.latitude = params[:latitude]
        @user.longitude = params[:longitude]
        if @user.save
          format.json {render json: @user, status: :ok, location: @user }
        else
          format.json { render json: "An Error occurred", status: :unprocessable_entity }
        end
      else
        format.json { render json: "An Error occurred", status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :age, :gender, :career, :hiking, :biking, :sports, :reading, :movies, :videogames, :bio, :friends_enabled, :male_friends, :female_friends, :friends_sports, :friends_hiking, :friends_biking, :friends_reading, :friends_videogames, :friends_movies, :friends_min_age, :friends_max_age, :dates_enabled, :male_dates, :female_dates, :dates_sports, :dates_hiking, :dates_biking, :dates_reading, :dates_videogames, :dates_movies, :dates_min_age, :dates_max_age, :colleagues_enabled, :colleagues_journalist, :colleagues_pharmacist, :colleagues_office_assistant, :colleagues_ceo, :colleagues_accountant, :colleagues_professor, :colleagues_software_engineer, :image, :latitude, :longitude)
    end
end
