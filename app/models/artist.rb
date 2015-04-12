class Artist < ActiveRecord::Base

  has_many :festival_artists
  has_many :festivals, :through => :festival_artists

  has_many :user_artists
  has_many :users, through: :user_artists
  
  def self.by_letter(letter)
    if letter == "All"
      Artist.order("sort_name")
    else
      Artist.where("sort_name LIKE ?", "#{letter}%").order("sort_name ASC")
    end
  end

  def self.first_letters
    all.collect {|artist| artist.name.capitalize[0,1] unless artist.name.capitalize[0,1] == "."}.compact.uniq.sort
  end

end
