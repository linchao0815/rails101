class Account::PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post_and_check_permission, only:[:edit, :update, :destroy]

	def index
		@posts=current_user.posts
	end
	def new
	end	
	def edit

	end	
	def update
		if @post.update(post_params)
			redirect_to posts_path, notice: "Update Success!"
		else
			render :edit
		end
	end	
	private
	def find_post_and_check_permission
		@post=current_user.posts.find(params[:format]) #Post.find(params[:id])
		# if current_user != @post.user
		# 	redirect_to root_path, alert: "You have no permission"
		# end
	end		
	def post_params
		params.require(:post).permit(:title, :content)
	end	
end
