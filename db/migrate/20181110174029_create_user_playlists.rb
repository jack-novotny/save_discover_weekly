class CreateUserPlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :user_playlists do |t|
    	t.references :user, foreign_key: true, null: false

    	t.timestamps
    end
  end
end
