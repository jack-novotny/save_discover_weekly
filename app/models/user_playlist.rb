class UserPlaylist < ApplicationRecord
	belongs_to :user

	validates :date, :user, :tracks, presence: true
	# I don't know if date is needed here, but the rspotify playlist object has a 
	# tracks_added_at hash that I can use to pull the date of the playlist for my purposes
end
