class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :answers, dependent: :destroy

         has_many :likes, dependent: :destroy
  		 has_many :like_posts, through: :likes, source: :post

       has_many :ratings, dependent: :destroy

  		 has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
   		 has_many :following, through: :following_relationships
   		 has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
   		 has_many :followers, through: :follower_relationships

   		 validates :name, length: {maximum: 20}
   		 validates :name, presence: true

   		 def following?(user)
    		following_relationships.find_by(following_id: user.id)
  		 end

		 def follow(user)
    		following_relationships.create!(following_id: user.id)
  		 end

  		 def unfollow(user)
    		following_relationships.find_by(following_id: user.id).destroy
  		 end

end
