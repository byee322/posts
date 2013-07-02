get '/post' do
	@blog = Post.find_by_title(params[:posts])
	tags = PostsAndTag.find_by_id(@blog.id)
	@tag = Tag.find_by_id(tags.tag_id)
	erb :showposts, { :layout => false }
end

get '/newblog' do
	erb :newblog
end

post '/newblog' do
	@title = params[:user][:title]
	@tags = params[:user][:tags].split(',')
	@blog = params[:user][:blog]
	if @title.empty? && @blog.empty? 
		erb :newblog
	else
		newblog = Post.create(title: @title,blog: @blog)
		newblog
		@tags.each do |t|
			new_tag = Tag.find_or_create_by_tag_name(t.downcase.strip)
			new_tag.posts << newblog
		end
		redirect '/'
	end
end

get '/edit/:id' do |id|
	@post = Post.find(id)
	# p post.tag
	# @tag = Tag.find_by_id(post)
	erb :update, { :layout => false }
end

get "/remove/:id" do |id|
	delete_blog = Post.find(id)
	delete_blog.delete
	redirect("/")
end

post "/edit_post/:id" do
	post = Post.find(params[:id])
	title = params[:update][:title]
	blog = params[:update][:blog]
	p params
	post.update_attributes({title: title, blog: blog})
end



