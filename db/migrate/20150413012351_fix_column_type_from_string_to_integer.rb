class FixColumnTypeFromStringToInteger < ActiveRecord::Migration
  def change
    change_column :user_artists, :user_id, :integer
    change_column :user_artists, :artist_id, :integer
    change_column :user_festivals, :user_id, :integer
    change_column :user_festivals, :festival_id, :integer
  end
end
