class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # respond_to do |format|
    #   format.html { redirect_to root_url(spotify_user) }
    # end

  end
end