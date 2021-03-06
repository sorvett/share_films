class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true,length: { in: 2..20 }
         validates :introduction, length: { maximum: 50 }
         attachment :profile_image
         has_many :blogs, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :blog_comments, dependent: :destroy
end
