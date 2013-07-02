get '/tags' do 
	tag = Tag.find_by_tag_name(params[:tags])
	@posts = tag.posts
	erb :posts, { :layout => false }
end

