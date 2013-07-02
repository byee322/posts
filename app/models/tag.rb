class Tag < ActiveRecord::Base
	validates :tag_name, presence: true, uniqueness: true
  has_many :posts_and_tags
  has_many :posts, through: :posts_and_tags
end
