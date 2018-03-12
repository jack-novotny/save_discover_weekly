class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @playlists = find_playlists
    find_current_discover_weekly
    find_songs
  end

  private
  def find_playlists
    @spotify_user.playlists(limit: 50)
  end

  def find_current_discover_weekly
    @playlists.each do |playlist|
      if playlist.name == "Discover Weekly"
        @current_discover_weekly = playlist
      end
    end
  end

  def find_songs
    @songs = @current_discover_weekly.tracks
  end
end