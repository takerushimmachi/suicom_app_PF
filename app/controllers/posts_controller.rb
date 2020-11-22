class PostsController < ApplicationController

	def index
		 @post = Post.new
		 @posts = Post.all
		 @user = current_user
	end


	def show
		@post = Post.find(params[:id])
		@answers = @post.answers
		@answer = current_user.answers.new
		@user = @post.user

	end


	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
        @post.title = params[:post][:title]
        @post.content = params[:post][:content]
        @post.save
        redirect_to mypage_users_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to mypage_users_path
	end

	private

  def post_params
  	params.require(:post).permit(:title, :content, :image, :answer, :ratet)
  end
end
