class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy remove_mood ]

  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
    @moods = @song.moods
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs or /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        params[:song][:moods].each do |id|
          @song.song_moods.find_or_create_by(mood_id: id)
        end
        format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        params[:song][:moods].each do |id|
          @song.song_moods.find_or_create_by(mood_id: id)
        end
        @song.song_moods.where.not(mood_id: params[:song][:moods]).delete_all
        format.html { redirect_to song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_mood
    SongMood.find_by(song_id: @song.id, mood_id: params[:mood_id])&.delete
    redirect_to @song
  end
  
  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :artist, :genre)
    end
end
