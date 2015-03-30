class Festival < ActiveRecord::Base

  has_many :festival_artists
  has_many :artists, :through => :festival_artists
  
end
