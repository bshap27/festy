class AddInfoToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :official_site, :string
    add_column :festivals, :facebook, :string
    add_column :festivals, :twitter, :string
    add_column :festivals, :youtube, :string
    add_column :festivals, :instagram, :string
    add_column :festivals, :city, :string
    add_column :festivals, :state, :string
    add_column :festivals, :zipcode, :string
  end
end
