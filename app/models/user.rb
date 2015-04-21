class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_artists
  has_many :artists, through: :user_artists
  has_many :user_festivals
  has_many :festivals, through: :user_festivals

  # HAS MANY FOLLOWERS
  has_many :people_following, foreign_key: :target_id, class_name: "Connection" #where they're the target
  has_many :followers, :through => :people_following

  # FOLLOWS MANY USERS
  has_many :following_people, foreign_key: :follower_id, class_name: "Connection" #where they're the follower
  has_many :targets, through: :following_people

  def watching_festival?(festival)
    UserFestival.find_by(user_id: self.id, festival_id: festival.id, relationship_type: 1) || UserFestival.new
  end

  def watching_festivals
    Festival.joins(:users).where("user_id = #{self.id}").where("relationship_type = 1")
  end

  def going_to_festival?(festival)
    UserFestival.find_by(user_id: self.id, festival_id: festival.id, relationship_type: 0) || UserFestival.new
  end

  def going_to_festivals
    Festival.joins(:users).where("user_id = #{self.id}").where("relationship_type = 0")
  end

  def saved_artist?(artist)
    UserArtist.find_by(artist_id: artist.id, user_id: self.id) || UserArtist.new
  end

  # NETWORK INSTANCE METHODS

  def following?(target) #truth value
    !!targets.find_by(target_id: target)
  end

  def follow!(target)
    Connection.create_new_follow(self, target)
  end

  def unfollow!(target)
    Connection.find_by(follower_id: self.id, target_id: target.id).destroy
  end

  def reciprocal?(other_user)
    self.following?(other_user) && other_user.following?(self)
  end

end