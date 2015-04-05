class Artist < ActiveRecord::Base

  has_many :festival_artists
  has_many :festivals, :through => :festival_artists

  has_many :user_artists
  has_many :users, through: :user_artists
  
  def self.by_letter(letter)
    if letter == "All"
      Artist.order("name")
    else
      Artist.where("name LIKE ?", "#{letter}%")
    end
  end

end
