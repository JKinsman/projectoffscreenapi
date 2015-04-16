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
        format.json { render :show, status: :ok, location: @user }
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
          format.json { render :show, status: :ok, location: @user }
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
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :age, :gender, :career, :hiking, :biking, :sports, :reading, :movies, :videogames, :bio)
    end
end
