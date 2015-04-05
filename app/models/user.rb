class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_artists
  has_many :artists, through: :user_artists
  has_many :user_festivals
  has_many :festivals, through: :user_festivals

  def watching_festival?(festival)
    UserFestival.find_by(user_id: self.id, festival_id: festival.id, relationship_type: 1)
  end

  def going_to_festival?(festival)
    UserFestival.find_by(user_id: self.id, festival_id: festival.id, relationship_type: 0)
  end

end