class User < ApplicationRecord
  has_many :user_playlists

	validates :email, uniqueness: true
	validates :email, :display_name, presence: true
end
