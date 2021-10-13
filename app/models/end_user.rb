class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quotes, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :content

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  attachment :image

  def following?(other_end_user)
    following_relationships.find_by(following_id: other_end_user.id)
  end

  def follow(other_end_user)
    following_relationships.create(following_id: other_end_user.id)
  end

  def unfollow(other_end_user)
    following_relationships.find_by(following_id: other_end_user.id).destroy
  end
  
  def active_for_authentication?
    super && (self.is_withdrawal == true)
  end

end
