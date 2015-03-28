class FestivalDay < ActiveRecord::Base

  has_many :festival_artists
  has_many :artists, :through => :festival_artists
  belongs_to :festival

end
