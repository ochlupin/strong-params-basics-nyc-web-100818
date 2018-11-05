class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params(:title, :description))
		@post.save
		redirect_to post_path(@post)
	end

	# def create
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	# end


	def update
		@post = Post.find(params[:id])
		@post.update(post_params(:title))
		redirect_to post_path(@post)
	end

	# def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(params.require(:post).permit(:title))
	# 	redirect_to post_path(@post)
	# end


	# The #require method is the most restrictive. It means that the params that gets passed in must contain a key called "post". If it's not included then it fails and the user gets an error. The #permit method is a bit looser. It means that the params hash may have whatever keys are in it

	private

	# 	We pass the permitted fields in as *args;
	# this keeps `post_params` pretty dry while
	# still allowing slightly different behavior
	# depending on the controller action

	def post_params(*args)
		params.require(:post).permit(*args)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
