class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy  
  has_many :follows, foreign_key: :following_id
  has_many :followers, class_name: "Follow", foreign_key: :follower_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: '152x152#' }  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/  
  
end
