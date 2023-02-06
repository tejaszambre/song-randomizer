class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy add_to_playlist remove_from_playlist add_mood remove_mood mood_wise_song_randomizer ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @songs = @user.songs
    @moods = @user.moods
    @all_other_songs = Song.where.not(id: @songs.ids)
    @all_other_moods = Mood.where.not(id: @moods.ids)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_playlist
    UserSong.find_or_create_by(user_id: @user.id, song_id: params[:song_id])
    redirect_to @user
  end

  def remove_from_playlist
    UserSong.find_by(user_id: @user.id, song_id: params[:song_id])&.delete
    redirect_to @user
  end

  def add_mood
    UserMood.find_or_create_by(user_id: @user.id, mood_id: params[:mood_id])
    redirect_to @user
  end

  def remove_mood
    UserMood.find_by(user_id: @user.id, mood_id: params[:mood_id])&.delete
    redirect_to @user
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
