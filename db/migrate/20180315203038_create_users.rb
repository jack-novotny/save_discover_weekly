class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :display_name, null: false, default: ""

      t.timestamps
    end
    add_column :users, :playlists, :string, null: false, default: [''], array: true
  end
end
