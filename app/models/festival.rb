class Festival < ActiveRecord::Base

  has_many :festival_artists
  has_many :artists, :through => :festival_artists

  has_many :user_festivals
  has_many :users, through: :user_festivals
  
end
