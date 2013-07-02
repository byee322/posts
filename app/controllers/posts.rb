# TODO: RESTful routing 101
# 1. Resource names are *plural*.
# 2. HTTP method varies depending on which CRUD operation
#     - Create == POST
#     - Read == GET
#     - Update == PUT
#     - Delete == DELETE


# get '/posts' do; end # get all posts
# get '/posts/:id' do; end # get a single post
# post '/posts' do; end # create a new post
# put '/posts/:id' do; end # update an existing post
# delete '/posts/:id' do; end # delete an existing post

# get '/posts/:id/edit' do; end # render the edit template
# get '/posts/new' do; end # render the "new post" template


#------------------




get '/post' do
	@post = Post.find_by_title(params[:posts])
	# tags = PostsAndTag.find_by_id(@blog.id)
	# @tag = Tag.find_by_id(tags.tag_id)
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
			newblog.tags << Tag.find_or_create_by_tag_name(t.downcase.strip)
			# new_tag = 
			# new_tag.posts << newblog
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

delete "/posts/:id" do
	# this is the "right" RESTful route for deleting
end

get "/remove/:id" do |id|
	delete_blog = Post.find(id)
	delete_blog.destroy
	redirect("/")
end

post "/edit_post/:id" do
	post = Post.find(params[:id])
	title = params[:update][:title]
	blog = params[:update][:blog]
	post.update_attributes({title: title, blog: blog})
end



