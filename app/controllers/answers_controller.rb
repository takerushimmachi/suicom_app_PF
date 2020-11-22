class AnswersController < ApplicationController
	def create
		#byebug
	post = Post.find(params[:post_id])
    answer = current_user.answers.new(answer_params)
    answer.post_id = post.id
    answer.save!
    redirect_to post_path(post)
  end

  def destroy
  	redirect_to mypage_users_path(current_user)
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end
end
