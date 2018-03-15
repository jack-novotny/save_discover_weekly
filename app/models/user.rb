class User < ApplicationRecord
	validates :email, uniqueness: true
	validates :email, :display_name, :playlists, presence: true
end
