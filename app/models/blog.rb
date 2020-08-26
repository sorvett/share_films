class Blog < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :favorites, dependent: :destroy
	 has_many :blog_comments, dependent: :destroy

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end
end
