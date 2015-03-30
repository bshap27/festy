class FestivalArtist < ActiveRecord::Base

  belongs_to :artist
  belongs_to :festival

end
