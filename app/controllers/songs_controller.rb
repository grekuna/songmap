class SongsController < ApplicationController

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
    @song = Song.new

  end




  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    RSpotify.authenticate(ENV['SPOTIFYCLIENTID'], ENV['SPOTIFYSECRET'])
    tracks =  RSpotify::Track.search(@song.name+" "+@song.artist)
    unless tracks.empty?
      @song.spotifyurl = tracks.first.uri.split(":")[2]
    end

    respond_to do |format|
      if @song.save
        format.html { redirect_to songs_path, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        flash[:error] = "We were unable to save your song. Please see below for details"
        format.html { render :index, notice: 'Widget was successfully created.' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end




  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :artist, :street, :city, :country, :spotifyurl)
    end
end
