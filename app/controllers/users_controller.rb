class UsersController < ApplicationController
	before_action :authenticate_user!

  def show
		  @user = User.find(params[:id])
      @post = Post.new
      @posts = @user.posts.page(params[:page]).per(3)
end


  def mypage
      @post = Post.new
      @posts = current_user.posts.page(params[:page]).per(3)

  end

	def edit
      @user = User.find(params[:id])
      if @user.id != current_user.id
      redirect_to user_path(current_user)
      end
end

	def index
    @users = User.all
end

	def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "変更されました。"
    redirect_to user_path(@user.id)
  else
    render 'edit'
  end
end

def destroy
  end

  def following
        @user  = User.find(params[:id])
        @users = @user.following
        render 'follow_show'
end

  def followers
        @user  = User.find(params[:id])
        @users = @user.followers
        render 'follower_show'
end

#   def rank
#       @users = User.
#         left_joins(:rating).
#         distinct.
#         sort_by do |user|
#            = user.ratings
#           if hoges.present?
#             hoges.map(&:ratet).sum
#           else
#             0
#           end
#         end.
#         reverse
# end

  private
  	def user_params
    	params.require(:user).permit(:name, :introduction)
  	end

  	def ensure_correct_user
    		user = User.find(params[:id])
    	if user != current_user
     		redirect_to user_path(current_user)
   		end
  	end
end