class Festival < ActiveRecord::Base

  has_many :festival_days
  has_many :artists, :through => :festival_days
  
end
