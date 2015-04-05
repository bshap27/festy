class CreateUserArtists < ActiveRecord::Migration
  def change
    create_table :user_artists do |t|
      t.string :user_id
      t.string :artist_id

      t.timestamps null: false
    end
  end
end
