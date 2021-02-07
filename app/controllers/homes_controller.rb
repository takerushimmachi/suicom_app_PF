class HomesController < ApplicationController
 before_action :authenticate_user!
	def top
		@followings = current_user.following
		@posts = Post.where(user_id: @followings.ids).page(params[:page]).per(5)
		@user = currrent_user
	end
end
