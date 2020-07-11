class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_many :tweets

  validates :email, :password, presence: true

  def my_followers
  	follower_ids = Follower.where(following_to_id: self.id).pluck(:followed_by_id)
  	User.find_all_by_id(follower_ids)
  end
end
