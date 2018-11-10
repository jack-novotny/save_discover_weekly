class RemovePlaylistsFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :playlists
  end
end
