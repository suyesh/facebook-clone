class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
		@comment = @post.comment.build
	end

	def create
		@post = Post.new(post_params)
		@post.comments.build
		@post.user = current_user
		if @post.save
			redirect_to root_path
		else
			render new
		end
	end


	private

		def post_params
			params.require(:post).permit(:content, :user_id, comment_attributes: [:id, :body, :user_id])
		end

end
