class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    find_or_add_user
    find_playlists
    find_current_discover_weekly
    find_songs
  end

  private
  def find_playlists
    @playlists = @spotify_user.playlists(limit: 50)
  end

  # Once we make the playlist model and table, here we will want to also save it if it doesn't exist
  # Then when the user logs on again, we'll have a page where they can look at a log of all their past discover weeklies
  # Unless I make something that will ping spotify on a weekly basis and update the db, this will only save ones on weeks
  # that you've logged in to this applicaiton 
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

  def find_or_add_user
    if (@application_user = User.find_by(email: @spotify_user.email))
      @application_user
    else
      @application_user = User.create!(email: @spotify_user.email,
                                       display_name: @spotify_user.display_name
                          )
    end
  end
end