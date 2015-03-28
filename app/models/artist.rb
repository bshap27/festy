class Artist < ActiveRecord::Base

  has_many :festival_artists
  has_many :festival_days, :through => :festival_artists
  has_many :festivals, :through => :festival_days

end
