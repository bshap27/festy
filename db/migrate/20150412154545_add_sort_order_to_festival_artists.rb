class AddSortOrderToFestivalArtists < ActiveRecord::Migration
  def change
    add_column :festival_artists, :sort_order, :integer
  end
end
