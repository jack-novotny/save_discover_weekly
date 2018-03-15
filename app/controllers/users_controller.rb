class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    find_or_add_user(is_in_db)
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

  def find_or_add_user(in_db)
    if in_db
      @past_discover_weeklies = user.playlists
    else
      @user = User.new(email: @spotify_user.email, display_name: @spotify_user.display_name)
      @user.save
    end

  end

  def is_in_db
    user = User.where(email: @spotify_user.email)
    return user.present?
  end
end