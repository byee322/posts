class Post < ActiveRecord::Base
	validates :title, :presence => true
	validates :blog, :presence => true
	has_many :posts_and_tags
	has_many :tags, through: :posts_and_tags
end
