class HerokuFixStringColumns < ActiveRecord::Migration
  def change
    drop_table :user_artists
    create_table :user_artists do |t|
      t.integer :user_id
      t.integer :artist_id
    end
    drop_table :user_festivals
    create_table :user_festivals do |t|
      t.integer :user_id
      t.integer :festival_id
      t.integer :relationship_type
    end
  end
end